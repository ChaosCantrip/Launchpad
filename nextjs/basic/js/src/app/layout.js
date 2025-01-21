import Header from "@/components/Header";
import Footer from "@/components/Footer";
import "@/styles/master.css";

export default function RootLayout({ children }) {
    return (
        <html>
            <body>
                <Header />
                <main>
                    { children }
                </main>
                <Footer />         
            </body>
        </html>
    )
}