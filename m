Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC173ACFD1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:06:27 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luH0k-0008B3-8I
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1luGwz-00043Q-5T
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:02:33 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:45825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1luGww-00052B-2V
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:02:32 -0400
Received: by mail-ua1-x92f.google.com with SMTP id v17so3540307uar.12
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gqyez8wd0LcYx2GgUpXYthsMzgYssd9EDnzuB8WiDlQ=;
 b=MfuNyvA3evcN1sEx+veeWi7T43zVCPkTRU+MIP3696DnVyRtNdylUXn5dFm8YvWC94
 X0hgkFEhCtzX777BvwlXHdsKBra2ukNQTJTE2vMEa4VNBr8MP2EQzEiFWqfux3HhyMhk
 9EBCWNABSeV+8K8wdTx2gYwtCEf1W1ipTn0Lr0fXewQQUGx7uWO3VY5OHgmCJu8RcNS8
 sQ93C1pTNeK7WCBHw6HqWad2cvt0SHkrQDv8q1RJd5XOSFjPCY+BJL87THuTPqF4Ijqg
 pxydm0AnnfvME2xLmyR0IgoJSInSrs0E1y8Czw4SalYvY5Q2WXVzeBXzLtclseaJqiqE
 kFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gqyez8wd0LcYx2GgUpXYthsMzgYssd9EDnzuB8WiDlQ=;
 b=DvBrUBupGeIHG6Ry2H+0EeG+kU3Cl7o+txF4V6/ywEnYQr9J7NWYHMg804AMt2dpwl
 eWP6AToh6ApQv+l/2F/fCU/Da4oHBGOMBxwbOEML5yo3KapWlU/THXc5EEhDlk/Q2rn3
 khsqmy6IXq74RFEelwzhG9nfHQamLmjfLTclbERRdyKEF6OnqMI3bsLiQ6SWesAQVgxU
 wOj6v+ehF6/Im1Q0dDhKZEkceP5bVx6bwPAEoVdxw8XtYY6XZTWWJHuKBYTlb2TeRDZL
 BsWRR1fgBpUOo9+YTpPBL1NbgJnwVmDh7/yDclacAtwgBM2AKiBeM/6xeEWMBkSOc2hH
 sAIg==
X-Gm-Message-State: AOAM532vbo16osxznfw8+S2Fmfxf3nQq7ReVA3kN5xpNpA56PVpLteDw
 vY3f1sAnP+57hyFJzLYSgfznHyVh0k7m8WeRrzEFZw==
X-Google-Smtp-Source: ABdhPJxcGqNoCDNKeQhBME3rd6vYqiSgXOapyhZ5cq6iFRHMVoVNeoJkrhccMbODQN8YcB0lecX1rBztT9655OW7wNw=
X-Received: by 2002:a9f:374c:: with SMTP id a12mr13006416uae.91.1624032146889; 
 Fri, 18 Jun 2021 09:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <20210529185522.78816-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210529185522.78816-2-marcandre.lureau@redhat.com>
From: Doug Evans <dje@google.com>
Date: Fri, 18 Jun 2021 09:01:50 -0700
Message-ID: <CADPb22TTc5dQ8c3N80tHjBdF36h2zJ5OxkN1DzCPpgnNpANmmw@mail.gmail.com>
Subject: Re: [PULL 1/2] Update libslirp to v4.5.0
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="000000000000389f7805c50c739a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=dje@google.com; helo=mail-ua1-x92f.google.com
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

--000000000000389f7805c50c739a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi. Does anything more need to be done here?
I just checked and I don't see this patch in the tree yet but it could have
been due to pilot error.

On Sat, May 29, 2021 at 11:55 AM <marcandre.lureau@redhat.com> wrote:

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
> Reviewed-by: Doug Evans <dje@google.com>
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
>

--000000000000389f7805c50c739a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi.=
 Does anything more need to be done here?</div><div class=3D"gmail_default"=
 style=3D"font-size:small">I just checked and I don&#39;t see this patch in=
 the tree yet but it could have been due to pilot error.</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 2=
9, 2021 at 11:55 AM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marc=
andre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</=
a>&gt;<br>
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
Reviewed-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_bl=
ank">dje@google.com</a>&gt;<br>
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
<br>
</blockquote></div>

--000000000000389f7805c50c739a--

