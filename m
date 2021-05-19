Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7C389227
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:04:00 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNjq-0005y1-Ph
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ljNii-00058x-D2
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:02:48 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ljNic-0003Hx-8L
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:02:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id r11so15699250edt.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wkggSj8DxSgduDiOtiRF9EIYJT7Bc2efZYwme83d3Tg=;
 b=Pus22OvZ86bubccDyZJ2cq+qE0BONOm1Qo7N+eUIB/RV9cBwVKwSZ9KycZ0NIXTQVg
 RCg3xUXndFaBB7Udm+8uw4VoczCRyteWUhnOx90A+pX1A/BIvgoA91cJQYcRrqtElfbX
 2N1XdDo2RxPBVWqOz3Q2a1Dk857/ilgoqmpZjnsEF24zQgR3H+nczyHL9FCzKOuL+iQF
 dxzK9USvubmWVx8pCvU97ZdJ/UzqVsyxwm+N4obD6aYcXeL/uLBD19fHEp2KIjW9Wexh
 SpPjdpqfXstUg35Kem8JIjPbGOfDU9KLHnjobgRB//zxgq9XVlWdx/T+RBjFvb+sKgRN
 /I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wkggSj8DxSgduDiOtiRF9EIYJT7Bc2efZYwme83d3Tg=;
 b=JVIO23xQ15ZOPpNYlodBb3VzaTu/mi8AavTJSfD6QWRK2D6PkIhO4VvI2aLhNIFcwr
 kvsc3u06xPf9hvElEjcIlB+Y8eEVyReMrafM7+qt9wdoh2eaw7fJOA8pqVrlVQkHSOwa
 gmu4nfOS/0xDgOoI4YBhJUnzdPNR+AB9VdNTLmpQbQs9SU++3TRadBpMm9z4FWNFhFh6
 2x28ZXEInPh1LyRRnKAEg9EnTHHdpI8oke8T37xWhLL5sCe5zTrmQAS/7vCWRORBIiIW
 NxH1HLWshjka5jxZpuE7SbJo1ijE8fM6MHwtqnjoezs7qz32fjEO9Y5LGdCz7I65VPla
 XZJA==
X-Gm-Message-State: AOAM531FukET7HnujvuwFy/ARRd8v5HBE8Lxs/IM5AOMkRFS06sUZU+7
 OXCdVV8U0H/fe9AonWLR5PltTiQMw3SJ7HyStDr36tJmTh0W8w==
X-Google-Smtp-Source: ABdhPJzuE2IqRfssblp01caFvW+a6VGYneQAUD6GltXJkDyfAsRlyAwX1W33LV462qHVsFCdbKeD/ylHQ8kE4nhH5pY=
X-Received: by 2002:a05:6402:34c5:: with SMTP id
 w5mr15274035edc.237.1621436559227; 
 Wed, 19 May 2021 08:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210519104659.2724448-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210519104659.2724448-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 19 May 2021 19:02:26 +0400
Message-ID: <CAJ+F1CJ1aSkdDA2Wpn+ajMtYtBeNTM62h0L2MJr0Bn1Fo7Bqcg@mail.gmail.com>
Subject: Re: [PATCH] Update libslirp to v4.5.0
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000023809a05c2b01e01"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000023809a05c2b01e01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 19, 2021 at 2:51 PM <marcandre.lureau@redhat.com> wrote:

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
> ---
>  slirp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/slirp b/slirp
> index 8f43a99191..ed74458a19 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit ed74458a19d1af177b5814b671754c55c7b8d2db
>

Nack, this should be a62890e71126795ca593affa747f669bed88e89c

I am sending v2

--=20
> 2.29.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000023809a05c2b01e01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, May 19, 2021 at 2:51 PM &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ma=
rc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" tar=
get=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
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
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0slirp | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/slirp b/slirp<br>
index 8f43a99191..ed74458a19 160000<br>
--- a/slirp<br>
+++ b/slirp<br>
@@ -1 +1 @@<br>
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
+Subproject commit ed74458a19d1af177b5814b671754c55c7b8d2db<br></blockquote=
><div><br></div><div>Nack, this should be a62890e71126795ca593affa747f669be=
d88e89c</div><div><br></div><div>I am sending v2<br></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.29.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000023809a05c2b01e01--

