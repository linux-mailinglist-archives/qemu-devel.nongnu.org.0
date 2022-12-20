Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD46528BF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 23:09:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7knc-0000nK-D3; Tue, 20 Dec 2022 17:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1p7knZ-0000kW-A4
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:09:21 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1p7knW-0006zm-Lp
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:09:21 -0500
Received: by mail-ej1-x62d.google.com with SMTP id x22so32510130ejs.11
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 14:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g8Qpk04kH2Ek6xFu8oNYQxLcGwRT3PYSJiO5F4wJfWE=;
 b=Nu1ebGXBmBiofM+iYu+Cn/ByW5CVjV76yZA9ihonShqvDzZ1A3rESim/HQk+HCx9Lm
 hwh0O0w456sloJpusb5IvYtC5kUCqsI0EImE7am2Yo0TFboxaoSWGRctb/H8t/MshNJ6
 u1m4gXz/zmcWDepkL4pXtJPq99FrpLaycDn+P6WGw2UI/lBK8eyYBpv6fLvXjvz/SmC7
 99MuuqB7UAWy7jkm5laNyK56qih9k1OjWADWCMifRCFWmT2Uwwpz9Zb+/ta8kC/V8mJk
 wgDT7pO9uP92LCILgyeesQy5mlsl/Qm7ESqrosRSBd3iBHjA6dMsjTJiKkXXPHqBaNEN
 BvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8Qpk04kH2Ek6xFu8oNYQxLcGwRT3PYSJiO5F4wJfWE=;
 b=qubiltmjSNjeV9VfAIPi9LtCXMSrUhm5zf7CaGT7YrfTmxnktkkSZivSvEvlZUgxmU
 52w3+X/WIkWBsEKg3nsEfuXdAQ+nV7yCbTwt2auFjqBL7XMXCYVCeazAVUtZyY5bcbgL
 rG4Umlv4BdkjeQf/f/XpLyxbJfA+jHrs20oIhJXNmNdiqt3CWDsiZ9rVkSFD+MMCPD0v
 LvzZMOK55WBUJLlvMGsN8iHqdPUw/Avc0/Ba+VtzSsdUl9tMTN6IPwajTjt3nSHYPOr9
 eh72+Q9Q6pDPUdHTeJybW+F3WRvDVXK1girDJlFb9KoRfTkXdkIfC9WmBJsQn7DBKbBA
 X9Gg==
X-Gm-Message-State: ANoB5pkM3S4+sRHzdb0jEcAUSPalAvca6BzdZhZUdsXFmTp/CEhxZHkK
 y+4XLvcnJs8aUtrzYvSHUqew8zi9TdNAP/OeO/iuvA==
X-Google-Smtp-Source: AA0mqf5up0NEUxFSznQHFXgOgcUyvx7jg7hJjXpKtbQzsDCGXJsnvWKxs87r0VU6aqceG8ynYs+CW9NXJpj2a+G7PrQ=
X-Received: by 2002:a17:907:98ed:b0:7c0:e7a6:cd2d with SMTP id
 ke13-20020a17090798ed00b007c0e7a6cd2dmr17690292ejc.317.1671574156187; Tue, 20
 Dec 2022 14:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20221217184823.3606676-1-richard.henderson@linaro.org>
In-Reply-To: <20221217184823.3606676-1-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 20 Dec 2022 15:09:05 -0700
Message-ID: <CANCZdfpVabse8tnRaAE7f=E62e07ErqvuneDpg5V9UKDYOdoLQ@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Content-Type: multipart/alternative; boundary="000000000000cbb35805f049af4b"
Received-SPF: none client-ip=2a00:1450:4864:20::62d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000cbb35805f049af4b
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 17, 2022 at 11:48 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Make bsd-user match linux-user in not marking host pages
> as reserved.  This isn't especially effective anyway, as
> it doesn't take into account any heap memory that qemu
> may allocate after startup.
>
> Cc: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> I started to simply fix up this code to match my user-only interval-tree
> patch set, as L1_MAP_ADDR_SPACE_BITS gets removed from translate-all.c,
> but then I decided to remove it all.
>

I think this is fine. We already do a translation for addresses so marking
this as 'reserved'
doesn't help that much. We need to map memory into a contiguous
guess-address-space,
but the underlying host memory needn't be contiguous at all.

I've not yet tested this, but would like to. What's your timeline on
getting this done?

Warner


> r~
>
> ---
>  accel/tcg/translate-all.c | 65 ---------------------------------------
>  1 file changed, 65 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index b964ea44d7..48e9d70b4e 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -354,71 +354,6 @@ void page_init(void)
>  {
>      page_size_init();
>      page_table_config_init();
> -
> -#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
> -    {
> -#ifdef HAVE_KINFO_GETVMMAP
> -        struct kinfo_vmentry *freep;
> -        int i, cnt;
> -
> -        freep = kinfo_getvmmap(getpid(), &cnt);
> -        if (freep) {
> -            mmap_lock();
> -            for (i = 0; i < cnt; i++) {
> -                unsigned long startaddr, endaddr;
> -
> -                startaddr = freep[i].kve_start;
> -                endaddr = freep[i].kve_end;
> -                if (h2g_valid(startaddr)) {
> -                    startaddr = h2g(startaddr) & TARGET_PAGE_MASK;
> -
> -                    if (h2g_valid(endaddr)) {
> -                        endaddr = h2g(endaddr);
> -                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
> -                    } else {
> -#if TARGET_ABI_BITS <= L1_MAP_ADDR_SPACE_BITS
> -                        endaddr = ~0ul;
> -                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
> -#endif
> -                    }
> -                }
> -            }
> -            free(freep);
> -            mmap_unlock();
> -        }
> -#else
> -        FILE *f;
> -
> -        last_brk = (unsigned long)sbrk(0);
> -
> -        f = fopen("/compat/linux/proc/self/maps", "r");
> -        if (f) {
> -            mmap_lock();
> -
> -            do {
> -                unsigned long startaddr, endaddr;
> -                int n;
> -
> -                n = fscanf(f, "%lx-%lx %*[^\n]\n", &startaddr, &endaddr);
> -
> -                if (n == 2 && h2g_valid(startaddr)) {
> -                    startaddr = h2g(startaddr) & TARGET_PAGE_MASK;
> -
> -                    if (h2g_valid(endaddr)) {
> -                        endaddr = h2g(endaddr);
> -                    } else {
> -                        endaddr = ~0ul;
> -                    }
> -                    page_set_flags(startaddr, endaddr, PAGE_RESERVED);
> -                }
> -            } while (!feof(f));
> -
> -            fclose(f);
> -            mmap_unlock();
> -        }
> -#endif
> -    }
> -#endif
>  }
>
>  PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
> --
> 2.34.1
>
>

--000000000000cbb35805f049af4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 17, 2022 at 11:48 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Make bsd-user match linux-user in not marking host pages=
<br>
as reserved.=C2=A0 This isn&#39;t especially effective anyway, as<br>
it doesn&#39;t take into account any heap memory that qemu<br>
may allocate after startup.<br>
<br>
Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp=
@bsdimp.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
<br>
I started to simply fix up this code to match my user-only interval-tree<br=
>
patch set, as L1_MAP_ADDR_SPACE_BITS gets removed from translate-all.c,<br>
but then I decided to remove it all.<br></blockquote><div><br></div><div>I =
think this is fine. We already do a translation for addresses so marking th=
is as &#39;reserved&#39;</div><div>doesn&#39;t help that much. We need to m=
ap memory into a contiguous guess-address-space,</div><div>but the underlyi=
ng host memory needn&#39;t be contiguous at all.</div><div><br></div><div>I=
&#39;ve not yet tested this, but would like to. What&#39;s your timeline on=
 getting this done?<br></div><div><br></div><div>Warner<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
<br>
---<br>
=C2=A0accel/tcg/translate-all.c | 65 --------------------------------------=
-<br>
=C2=A01 file changed, 65 deletions(-)<br>
<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index b964ea44d7..48e9d70b4e 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -354,71 +354,6 @@ void page_init(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0page_size_init();<br>
=C2=A0 =C2=A0 =C2=A0page_table_config_init();<br>
-<br>
-#if defined(CONFIG_BSD) &amp;&amp; defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 {<br>
-#ifdef HAVE_KINFO_GETVMMAP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct kinfo_vmentry *freep;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, cnt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 freep =3D kinfo_getvmmap(getpid(), &amp;cnt);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (freep) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_lock();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; cnt; i++) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long star=
taddr, endaddr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 startaddr =3D free=
p[i].kve_start;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endaddr =3D freep[=
i].kve_end;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (h2g_valid(star=
taddr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 star=
taddr =3D h2g(startaddr) &amp; TARGET_PAGE_MASK;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
h2g_valid(endaddr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 endaddr =3D h2g(endaddr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 page_set_flags(startaddr, endaddr, PAGE_RESERVED);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se {<br>
-#if TARGET_ABI_BITS &lt;=3D L1_MAP_ADDR_SPACE_BITS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 endaddr =3D ~0ul;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 page_set_flags(startaddr, endaddr, PAGE_RESERVED);<br>
-#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(freep);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_unlock();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *f;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 last_brk =3D (unsigned long)sbrk(0);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D fopen(&quot;/compat/linux/proc/self/maps=
&quot;, &quot;r&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_lock();<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long star=
taddr, endaddr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D fscanf(f, &q=
uot;%lx-%lx %*[^\n]\n&quot;, &amp;startaddr, &amp;endaddr);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n =3D=3D 2 &am=
p;&amp; h2g_valid(startaddr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 star=
taddr =3D h2g(startaddr) &amp; TARGET_PAGE_MASK;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
h2g_valid(endaddr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 endaddr =3D h2g(endaddr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 endaddr =3D ~0ul;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page=
_set_flags(startaddr, endaddr, PAGE_RESERVED);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (!feof(f));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(f);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_unlock();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-#endif<br>
-=C2=A0 =C2=A0 }<br>
-#endif<br>
=C2=A0}<br>
<br>
=C2=A0PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000cbb35805f049af4b--

