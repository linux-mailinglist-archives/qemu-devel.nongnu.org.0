Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38107393AE6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 03:12:35 +0200 (CEST)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmR3B-0002L3-Rl
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 21:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lmR2E-0001dA-QP
 for qemu-devel@nongnu.org; Thu, 27 May 2021 21:11:34 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lmR2B-0006LR-Cm
 for qemu-devel@nongnu.org; Thu, 27 May 2021 21:11:34 -0400
Received: by mail-ua1-x932.google.com with SMTP id j2so1251973uak.7
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 18:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vrduKctLJNw+Zk6tVzfKRyJu75JreyySM6NkT4L39RI=;
 b=hqG9x2rpa5Vv1KejEINcebY+hzED5ej46yxoA8oEzCG+LST18bYw6wp1OydRck6kU2
 DdVwEox7587bY3WzDUhtOBN3FeyoW48TEG27eWXiXvNA6EWTXaepOK+2P5hlGsf2pFvX
 KBcoGeAV6XpYelJ1XpULX6C+Kd6pK2YvvizbEHkPjIRef4tmD+hVSZb9lbXT+mSFoCfI
 Yzd6nv+Z8h/15WCx3mCOxGvwWC+cq89VbUR0zxFCbH21HReVDvmC1W61ljX5WNmdNeH0
 bpJjMeJHOFXJnhL8hWVzgh+i9JQnRlfmqW/kWBMW+rTtFyZqpnfrmADfEBOOrHiNnoID
 CWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vrduKctLJNw+Zk6tVzfKRyJu75JreyySM6NkT4L39RI=;
 b=MTdrW26ET739Pv3vtUq1rCzySgmArn2RAcdQTPYSn1v8v/M+S4TsQUMQgFiBw53z+S
 e5YPDG2UAniJm/FQL/7sR5QBf7gJ17Zb3ITmomqMz7l+yf8LuklQo4QaNtllVTFTGJpD
 n1ABWPE7cbAxyLGZyVMRWJEeDwpqCwjV1SthynKqtTqQ4d8/ezgVaKWgHsBsjFWFm9Cv
 2iy9J72ApXd3rc4wP6Iny0KOkpFOvScfbxPtYI3tU6pNDc3SAM6odLt2nAnk7ndC470T
 Ng+hWh195YP9raQTUtrq4GznpI969YSkDnt2HadfOQNJz0bytY4aWoKB5G8CvwcyZ7lP
 l7vg==
X-Gm-Message-State: AOAM530TzzvSF0Q8ycsIHKTBzbKytk79bpKM05vOboEMjzWP5SOzR4vZ
 e9VU+rxuXWLKADHuHBFGgnIFU37fndfTGN1/XVJkow==
X-Google-Smtp-Source: ABdhPJyEqgMikVywAQ52mvc88OKbTHD/QEj2t4W5igNe13Jh1Bq5mwaxqT9vKiR8BjjwnpA6xNBW3oezKAAUqPLccZ0=
X-Received: by 2002:ab0:338f:: with SMTP id y15mr766109uap.91.1622164288902;
 Thu, 27 May 2021 18:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210519151755.2761542-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210519151755.2761542-1-marcandre.lureau@redhat.com>
From: Doug Evans <dje@google.com>
Date: Thu, 27 May 2021 18:10:52 -0700
Message-ID: <CADPb22TqCOx1Pw9d56ry188QpwCaBkArOeN4qiOcLstE+xr2sw@mail.gmail.com>
Subject: Re: [PATCH v2] Update libslirp to v4.5.0
To: marcandre.lureau@redhat.com
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="000000000000358b9105c3598e94"
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=dje@google.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000358b9105c3598e94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 8:18 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Switch from stable-4.2 branch to upstream v4.5.0 release.
>
> ## [4.5.0] - 2021-05-18
>
> ### Added
>
>  - IPv6 forwarding. !62 !75 !77
>  - slirp_neighbor_info() to dump the ARP/NDP tables. !71
>
> ### Changed
>
>  - Lazy guest address resolution for IPv6. !81
>  - Improve signal handling when spawning a child. !61
>  - Set macOS deployment target to macOS 10.4. !72
>  - slirp_add_hostfwd: Ensure all error paths set errno. !80
>  - More API documentation.
>
> ### Fixed
>
>  - Assertion failure on unspecified IPv6 address. !86
>  - Disable polling for PRI on MacOS, fixing some closing streams issues.
> !73
>  - Various memory leak fixes on fastq/batchq. !68
>  - Memory leak on IPv6 fast-send. !67
>  - Slow socket response on Windows. !64
>  - Misc build and code cleanups. !60 !63 !76 !79 !84
>
> ## [4.4.0] - 2020-12-02
>
> ### Added
>
>  - udp, udp6, icmp: handle TTL value. !48
>  - Enable forwarding ICMP errors. !49
>  - Add DNS resolving for iOS. !54
>
> ### Changed
>
>  - Improve meson subproject() support. !53
>  - Removed Makefile-based build system. !56
>
> ### Fixed
>
>  - socket: consume empty packets. !55
>  - check pkt_len before reading protocol header (CVE-2020-29129). !57
>  - ip_stripoptions use memmove (fixes undefined behaviour). !47
>  - various Coverity-related changes/fixes.
>
> ## [4.3.1] - 2020-07-08
>
> ### Changed
>
>  - A silent truncation could occur in `slirp_fmt()`, which will now print=
 a
>    critical message. See also #22.
>
> ### Fixed
>
>  - CVE-2020-10756 - Drop bogus IPv6 messages that could lead to data
> leakage.
>    See !44 and !42.
>  - Fix win32 builds by using the SLIRP_PACKED definition.
>  - Various coverity scan errors fixed. !41
>  - Fix new GCC warnings. !43
>
> ## [4.3.0] - 2020-04-22
>
> ### Added
>
>  - `SLIRP_VERSION_STRING` macro, with the git sha suffix when building
> from git
>  - `SlirpConfig.disable_dns`, to disable DNS redirection #16
>
> ### Changed
>
>  - `slirp_version_string()` now has the git sha suffix when building form
> git
>  - Limit DNS redirection to port 53 #16
>
> ### Fixed
>
>  - Fix build regression with mingw & NetBSD
>  - Fix use-afte-free in `ip_reass()` (CVE-2020-1983)
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>


Reviewed-by: Doug Evans < <marcandre.lureau@redhat.com>dje@google.com>



> ---
>  slirp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/slirp b/slirp
> index 8f43a99191..a62890e711 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit a62890e71126795ca593affa747f669bed88e89c
> --
> 2.29.0
>
>

--000000000000358b9105c3598e94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, May 19, 2021 at 8:18 AM &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Switch from stable-4.2 branch to upstream v4.5.0 release.<br>
<br>
## [4.5.0] - 2021-05-18<br>
<br>
### Added<br>
<br>
=C2=A0- IPv6 forwarding. !62 !75 !77<br>
=C2=A0- slirp_neighbor_info() to dump the ARP/NDP tables. !71<br>
<br>
### Changed<br>
<br>
=C2=A0- Lazy guest address resolution for IPv6. !81<br>
=C2=A0- Improve signal handling when spawning a child. !61<br>
=C2=A0- Set macOS deployment target to macOS 10.4. !72<br>
=C2=A0- slirp_add_hostfwd: Ensure all error paths set errno. !80<br>
=C2=A0- More API documentation.<br>
<br>
### Fixed<br>
<br>
=C2=A0- Assertion failure on unspecified IPv6 address. !86<br>
=C2=A0- Disable polling for PRI on MacOS, fixing some closing streams issue=
s. !73<br>
=C2=A0- Various memory leak fixes on fastq/batchq. !68<br>
=C2=A0- Memory leak on IPv6 fast-send. !67<br>
=C2=A0- Slow socket response on Windows. !64<br>
=C2=A0- Misc build and code cleanups. !60 !63 !76 !79 !84<br>
<br>
## [4.4.0] - 2020-12-02<br>
<br>
### Added<br>
<br>
=C2=A0- udp, udp6, icmp: handle TTL value. !48<br>
=C2=A0- Enable forwarding ICMP errors. !49<br>
=C2=A0- Add DNS resolving for iOS. !54<br>
<br>
### Changed<br>
<br>
=C2=A0- Improve meson subproject() support. !53<br>
=C2=A0- Removed Makefile-based build system. !56<br>
<br>
### Fixed<br>
<br>
=C2=A0- socket: consume empty packets. !55<br>
=C2=A0- check pkt_len before reading protocol header (CVE-2020-29129). !57<=
br>
=C2=A0- ip_stripoptions use memmove (fixes undefined behaviour). !47<br>
=C2=A0- various Coverity-related changes/fixes.<br>
<br>
## [4.3.1] - 2020-07-08<br>
<br>
### Changed<br>
<br>
=C2=A0- A silent truncation could occur in `slirp_fmt()`, which will now pr=
int a<br>
=C2=A0 =C2=A0critical message. See also #22.<br>
<br>
### Fixed<br>
<br>
=C2=A0- CVE-2020-10756 - Drop bogus IPv6 messages that could lead to data l=
eakage.<br>
=C2=A0 =C2=A0See !44 and !42.<br>
=C2=A0- Fix win32 builds by using the SLIRP_PACKED definition.<br>
=C2=A0- Various coverity scan errors fixed. !41<br>
=C2=A0- Fix new GCC warnings. !43<br>
<br>
## [4.3.0] - 2020-04-22<br>
<br>
### Added<br>
<br>
=C2=A0- `SLIRP_VERSION_STRING` macro, with the git sha suffix when building=
 from git<br>
=C2=A0- `SlirpConfig.disable_dns`, to disable DNS redirection #16<br>
<br>
### Changed<br>
<br>
=C2=A0- `slirp_version_string()` now has the git sha suffix when building f=
orm git<br>
=C2=A0- Limit DNS redirection to port 53 #16<br>
<br>
### Fixed<br>
<br>
=C2=A0- Fix build regression with mingw &amp; NetBSD<br>
=C2=A0- Fix use-afte-free in `ip_reass()` (CVE-2020-1983)<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></bl=
ockquote><div><br></div><div><br></div><div>Reviewed-by: <span class=3D"gma=
il_default" style=3D"font-size:small">Doug Evans</span>=C2=A0&lt;<a href=3D=
"mailto:marcandre.lureau@redhat.com" target=3D"_blank"><span class=3D"gmail=
_default" style=3D"font-size:small"></span></a>d<span class=3D"gmail_defaul=
t" style=3D"font-size:small"><a href=3D"mailto:je@google.com">je@google.com=
</a></span>&gt;<br></div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
=C2=A0slirp | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/slirp b/slirp<br>
index 8f43a99191..a62890e711 160000<br>
--- a/slirp<br>
+++ b/slirp<br>
@@ -1 +1 @@<br>
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
+Subproject commit a62890e71126795ca593affa747f669bed88e89c<br>
-- <br>
2.29.0<br>
<br>
</blockquote></div></div>

--000000000000358b9105c3598e94--

