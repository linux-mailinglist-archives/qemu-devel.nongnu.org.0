Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909B53426BB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:17:44 +0100 (CET)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLZ1-0003L2-31
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lNLYA-0002ux-D1
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 16:16:50 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:40747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lNLY8-0005mu-1R
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 16:16:50 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id d10so5678045qve.7
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 13:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BUQY0ah4qAat6OHL2Xgpsln++UyYd/knSlMNcktjl5Q=;
 b=MmtH9Z4DqHbZTrQBgShctQPEYHW+fWP3V1YCT35puEtJ7WR2e5nTm1Q4BUId1eNnu2
 F04pCsma7rvjvhY3ZYG8x06tm3h5UCGjr015xbfFASyFKzFjinNzHm6jpSL6wHrfb6OT
 xJ068Lx8YHpNZypbl1Ths318cAV/IJAr3VLEH1IGT7o47tpVsYy+R8jcV/Cl0KJcpvRP
 UlGBc3WX/sVOFR/uG2V5DIHNetr0hfs8worEVpbEtBTmIxDuOuoikKsuMXFEo7D9BZoc
 DCaNepO2tPEse2vN8xDE3V8C0jzSVfSICP8B3i2YOtiQkyq0A5s4Gm64qxA5C9+bkTEd
 9QeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BUQY0ah4qAat6OHL2Xgpsln++UyYd/knSlMNcktjl5Q=;
 b=nZ57EDWmHJ8LzoSbY9yHaLCcEq2xKEYxp2n59mwUEKkeUZW9w8tHbSad23T9wSk0qv
 Zb/KZ4ImM2RkcnWdIfl33hq+b+5KiCX20gKlRQzymY3226kmoE0A/3A6opL5W75yS2bm
 2YTvme4aVhM8EJXGmIion4MAorlgugem/mswiE7UsQVokOgrlf2p58vYlkMBzPfEaRGj
 UNRPvbhJxkodLaNE8UxF07U7OFmfjJSBD5jxynI/18G2QuVdZfD1vMhYJQXf9S4FzulT
 wuCuQGzpGy2i4akQaG8INSwYNPxBTs+5RQjHqeB0P7LXutFmUCFgvgw4nfcrm+iK3lBB
 wZMQ==
X-Gm-Message-State: AOAM531dAQpV4VHKsxZ61S311/ckCbkeOtzIt/VmTsNMv0xu/g41lXkd
 D4Vz2insnKfsVErgPJ00ejeWOsO6aDCViB5zxrZ8aA==
X-Google-Smtp-Source: ABdhPJyGmsZB39lGfEBuDEpN6zSOKryX3bwCxebVXn6c3aFFHf7VboRrxwBdBoWWXm8Z9iFV6v7LtWslxI2Njc0ir48=
X-Received: by 2002:a0c:8623:: with SMTP id p32mr11023558qva.23.1616185005895; 
 Fri, 19 Mar 2021 13:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210319165138.117225-1-thuth@redhat.com>
In-Reply-To: <20210319165138.117225-1-thuth@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 19 Mar 2021 14:16:35 -0600
Message-ID: <CANCZdfpvRpr0GffidYsbOacMAz+ttb+pY0pQDNBGC=WT9sZP-A@mail.gmail.com>
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.2 release
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002b0adb05bde96519"
Received-SPF: none client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=wlosh@bsdimp.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ed Maste <emaste@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002b0adb05bde96519
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 10:52 AM Thomas Huth <thuth@redhat.com> wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
> project's packages will work.  Update which timezone to pick. Work around
> a QEMU
> bug that incorrectly raises an exception on a CRC32 instruction with the
> FPU
> disabled.  The qemu bug is described here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Message-Id: <20210307155654.993-2-imp@bsdimp.com>
> [thuth: Disable gnutls to work-around a problem with libtasn1]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
>

Works for me, though the flakey console 'expect' stuff is just as flakey
before/after this patch... The --disable-gnutls fixes the failure I saw.

Warner


> ---
>  tests/vm/freebsd | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 09f3ee6cb8..6e20e84322 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -20,12 +20,16 @@ import socket
>  import subprocess
>  import basevm
>
> +FREEBSD_CONFIG = {
> +    'cpu'      : "max,sse4.2=off",
> +}
> +
>  class FreeBSDVM(basevm.BaseVM):
>      name = "freebsd"
>      arch = "x86_64"
>
> -    link = "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.1/FreeBSD-12.1-RELEASE-amd64-disc1.iso.xz
> "
> -    csum =
> "7394c3f60a1e236e7bd3a05809cf43ae39a3b8e5d42d782004cf2f26b1cfcd88"
> +    link = "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz
> "
> +    csum =
> "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
>      size = "20G"
>      pkgs = [
>          # build tools
> @@ -61,6 +65,8 @@ class FreeBSDVM(basevm.BaseVM):
>          "zstd",
>      ]
>
> +    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> +    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
>      BUILD_SCRIPT = """
>          set -e;
>          rm -rf /home/qemu/qemu-test.*
> @@ -68,7 +74,7 @@ class FreeBSDVM(basevm.BaseVM):
>          mkdir src build; cd src;
>          tar -xf /dev/vtbd1;
>          cd ../build
> -        ../src/configure --python=python3.7 {configure_opts};
> +        ../src/configure --python=python3.7 --disable-gnutls
> {configure_opts};
>          gmake --output-sync -j{jobs} {target} {verbose};
>      """
>
> @@ -125,7 +131,7 @@ class FreeBSDVM(basevm.BaseVM):
>          self.console_wait_send("IPv6",                  "n")
>          self.console_wait_send("Resolver",              "\n")
>
> -        self.console_wait_send("Time Zone Selector",    "a\n")
> +        self.console_wait_send("Time Zone Selector",    "0\n")
>          self.console_wait_send("Confirmation",          "y")
>          self.console_wait_send("Time & Date",           "\n")
>          self.console_wait_send("Time & Date",           "\n")
> @@ -206,4 +212,4 @@ class FreeBSDVM(basevm.BaseVM):
>          self.print_step("All done")
>
>  if __name__ == "__main__":
> -    sys.exit(basevm.main(FreeBSDVM))
> +    sys.exit(basevm.main(FreeBSDVM, config=FREEBSD_CONFIG))
> --
> 2.27.0
>
>

--0000000000002b0adb05bde96519
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 19, 2021 at 10:52 AM Thom=
as Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_b=
lank">imp@bsdimp.com</a>&gt;<br>
<br>
FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD&#39;=
s<br>
project&#39;s packages will work.=C2=A0 Update which timezone to pick. Work=
 around a QEMU<br>
bug that incorrectly raises an exception on a CRC32 instruction with the FP=
U<br>
disabled.=C2=A0 The qemu bug is described here:<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg784158.html</a><br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210307155654.993-2-imp@bsdimp.com" targ=
et=3D"_blank">20210307155654.993-2-imp@bsdimp.com</a>&gt;<br>
[thuth: Disable gnutls to work-around a problem with libtasn1]<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Wo=
rks for me, though the flakey console &#39;expect&#39; stuff is just as fla=
key before/after this patch... The --disable-gnutls fixes the failure I saw=
.</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/vm/freebsd | 16 +++++++++++-----<br>
=C2=A01 file changed, 11 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/tests/vm/freebsd b/tests/vm/freebsd<br>
index 09f3ee6cb8..6e20e84322 100755<br>
--- a/tests/vm/freebsd<br>
+++ b/tests/vm/freebsd<br>
@@ -20,12 +20,16 @@ import socket<br>
=C2=A0import subprocess<br>
=C2=A0import basevm<br>
<br>
+FREEBSD_CONFIG =3D {<br>
+=C2=A0 =C2=A0 &#39;cpu&#39;=C2=A0 =C2=A0 =C2=A0 : &quot;max,sse4.2=3Doff&q=
uot;,<br>
+}<br>
+<br>
=C2=A0class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0name =3D &quot;freebsd&quot;<br>
=C2=A0 =C2=A0 =C2=A0arch =3D &quot;x86_64&quot;<br>
<br>
-=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/ftp/r=
eleases/ISO-IMAGES/12.1/FreeBSD-12.1-RELEASE-amd64-disc1.iso.xz" rel=3D"nor=
eferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases/ISO-IM=
AGES/12.1/FreeBSD-12.1-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
-=C2=A0 =C2=A0 csum =3D &quot;7394c3f60a1e236e7bd3a05809cf43ae39a3b8e5d42d7=
82004cf2f26b1cfcd88&quot;<br>
+=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/ftp/r=
eleases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz" rel=3D"nor=
eferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases/ISO-IM=
AGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
+=C2=A0 =C2=A0 csum =3D &quot;a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd07027=
8cbdf63f3a6f803ecae&quot;<br>
=C2=A0 =C2=A0 =C2=A0size =3D &quot;20G&quot;<br>
=C2=A0 =C2=A0 =C2=A0pkgs =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build tools<br>
@@ -61,6 +65,8 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;zstd&quot;,<br>
=C2=A0 =C2=A0 =C2=A0]<br>
<br>
+=C2=A0 =C2=A0 # TODO: Enable gnutls again once FreeBSD&#39;s libtasn1 got =
fixed<br>
+=C2=A0 =C2=A0 # See: <a href=3D"https://gitlab.com/gnutls/libtasn1/-/merge=
_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/gnutl=
s/libtasn1/-/merge_requests/71</a><br>
=C2=A0 =C2=A0 =C2=A0BUILD_SCRIPT =3D &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set -e;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf /home/qemu/qemu-test.*<br>
@@ -68,7 +74,7 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir src build; cd src;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -xf /dev/vtbd1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ../build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../src/configure --python=3Dpython3.7 {configu=
re_opts};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../src/configure --python=3Dpython3.7 --disabl=
e-gnutls {configure_opts};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmake --output-sync -j{jobs} {target} {ve=
rbose};<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
@@ -125,7 +131,7 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait_send(&quot;IPv6&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;n&quot=
;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait_send(&quot;Resolver&quo=
t;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\n&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Time Zone Selecto=
r&quot;,=C2=A0 =C2=A0 &quot;a\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Time Zone Selecto=
r&quot;,=C2=A0 =C2=A0 &quot;0\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait_send(&quot;Confirmation=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;y&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait_send(&quot;Time &amp; D=
ate&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.console_wait_send(&quot;Time &amp; D=
ate&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\n&quot;)<br>
@@ -206,4 +212,4 @@ class FreeBSDVM(basevm.BaseVM):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.print_step(&quot;All done&quot;)<br>
<br>
=C2=A0if __name__ =3D=3D &quot;__main__&quot;:<br>
-=C2=A0 =C2=A0 sys.exit(basevm.main(FreeBSDVM))<br>
+=C2=A0 =C2=A0 sys.exit(basevm.main(FreeBSDVM, config=3DFREEBSD_CONFIG))<br=
>
-- <br>
2.27.0<br>
<br>
</blockquote></div></div>

--0000000000002b0adb05bde96519--

