Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA23767DE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:25:45 +0200 (CEST)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2MK-0006jc-BI
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lf2K4-00062Q-ED
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:23:24 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lf2K1-0008FC-T8
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:23:24 -0400
Received: by mail-ej1-x635.google.com with SMTP id l4so14191826ejc.10
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mKmcYNKi2df4KBVfdjk64vv96c/MRVRjiOTRDEe4e6o=;
 b=NlkL9E6QdFWYCEoWG4X71YQFDyByMJW5eoG6eZg4kqqhY0U/M0D5H4aaFVDoNoDRsr
 LiIszPi7zcbrXEfKFuZgvNB4ja6LglPEsg+YwHw+qOsNNxCjmDBE/Drn9ZKrB3doYHcC
 yWk9pI5y5U2zXgN4yIWBWu3VAXXDkLuVek1DZr5v6Ll6bRbbwyGc0ZA/AYWeJcSv4XWS
 xZbBgLYHbd5bUFgXAPFl3knrBD/XJztyrvBgaT5Ez5zPe9+hM7ko069uiitvHHOZnbxz
 8qYnQwbEvh9vf2SDdrxlFbK/Qf4Vp6Zzyr3iGPZlEO8yqSBmKxnJUJR4KufhrvjF0iYo
 V0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKmcYNKi2df4KBVfdjk64vv96c/MRVRjiOTRDEe4e6o=;
 b=kpjKzi70/qhWYcnbwud/fJTUGdBmt7zhU6ZOtyPO4VBAbq3H0aYWQg34diToJjWmfk
 TQ0Fq494StjZJiUed+dDs7iCio8bV/m5SeJp03IC8fWQ1wWNKxWwlh7ySdZ876iNYDAk
 F5EQLQiG7PP1w+ASLIEviIF4RLFweHXYcMl8iHEJu1M5EpvmN5SprSLCHcTqEDUkydPl
 85HrClFVWA8Qbb9344hegIudZ0U6F9TxoWwPSTtDyZKZduCGNtg0ZhnykI9IGPwmr3qg
 x3tIs/ZaRQM0w3MJCMGXHMvMBXQlGFCJ98Ln9apddXGlOTUr7IYW6jsqXEDmU3M3UFFW
 w3Jw==
X-Gm-Message-State: AOAM532y/QG5bQSdjBnXWUokDGyZbLwSoajcPVo4kr9fzP/QyosYEltS
 KiB2MTc63nQxNILX9ApdgqxSlL2tKilE7e6CoAg=
X-Google-Smtp-Source: ABdhPJyiCY+pmeZ45dRyysVIqwnytXWSGRywcgmtYBUy2pXfDOndkITATGX1F3ocKTqPsd21eMylC2jRB21FxM1m7/4=
X-Received: by 2002:a17:906:80cd:: with SMTP id
 a13mr10521484ejx.109.1620400999688; 
 Fri, 07 May 2021 08:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-2-dje@google.com>
In-Reply-To: <20210415033925.1290401-2-dje@google.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 7 May 2021 19:23:07 +0400
Message-ID: <CAJ+F1CJZSbH-QsaAYFWc6kU++vQXcTdmaLsno8dXX5uVrhrLCA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="000000000000faed6705c1bf0151"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000faed6705c1bf0151
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Apr 15, 2021 at 7:41 AM Doug Evans <dje@google.com> wrote:

> 5eraph (2):
>       disable_dns option
>       limit vnameserver_addr to port 53
>
> Akihiro Suda (1):
>       libslirp.h: fix SlirpConfig v3 documentation
>
> Doug Evans (11):
>       Add ipv6 host forward support
>       tcpx_listen: Pass sizeof(addr) to memset
>       Reject host forwarding to ipv6 "addr-any"
>       Add /build/ to .gitignore
>       New utility slirp_ether_ntoa
>       m_cleanup_list: make static
>       New API routine slirp_neighbor_info
>       Move DEBUG_CALL("if_start") to DEBUG_VERBOSE_CALL
>       tcpx_listen: tcp_newtcpcb doesn't fail
>       slirp_add_host*fwd: Ensure all error paths set errno
>       Perform lazy guest address resolution for IPv6
>
> Dr. David Alan Gilbert (1):
>       ip_stripoptions use memmove
>
> Giuseppe Scrivano (1):
>       socket: consume empty packets
>
> Hafiz Abid Qadeer (1):
>       Fix a typo that can cause slow socket response on Windows.
>
> Jindrich Novy (4):
>       Fix possible infinite loops and use-after-free
>       Use secure string copy to avoid overflow
>       Be sure to initialize sockaddr structure
>       Check lseek() for failure
>
> Marc-Andr=C3=A9 Lureau (26):
>       Merge branch 'master' into 'master'
>       Merge branch 'fix-slirpconfig-3-doc' into 'master'
>       Fix use-afte-free in ip_reass() (CVE-2020-1983)
>       Update CHANGELOG
>       Merge branch 'cve-2020-1983' into 'master'
>       Release v4.3.0
>       Merge branch 'release-v4.3.0' into 'master'
>       changelog: post-release
>       util: do not silently truncate
>       Merge branch 'slirp-fmt-truncate' into 'master'
>       Release v4.3.1
>       Merge branch 'release-v4.3.1' into 'master'
>       changelog: post-release
>       .gitlab-ci: add a Coverity stage
>       Merge branch 'coverity' into 'master'
>       Merge branch 'ios-support' into 'master'
>       Merge branch 'master' into 'master'
>       Remove the QEMU-special make build-system
>       Merge branch 'qemu' into 'master'
>       Release v4.4.0
>       Merge branch '4.4.0-release' into 'master'
>       changelog: post-release
>       Remove some needless (void)casts
>       Fix unused variables
>       Merge branch 'gitignore-build' into 'master'
>       Merge branch 'macos-deployment-target' into 'master'
>
> Nathaniel Wesley Filardo (1):
>       fork_exec_child_setup: improve signal handling
>
> Paolo Bonzini (2):
>       meson: remove meson-dist script
>       meson: support compiling as subproject
>
> Philippe Mathieu-Daud=C3=A9 (3):
>       Fix win32 builds by using the SLIRP_PACKED definition
>       Fix constness warnings
>       Remove unnecessary break
>
> Prasad J Pandit (1):
>       slirp: check pkt_len before reading protocol header
>
> Ralf Haferkamp (2):
>       Drop bogus IPv6 messages
>       Fix MTU check
>
> Samuel Thibault (45):
>       Merge branch 'ip6_payload_len' into 'master'
>       Merge branch 'lp1878043' into 'master'
>       udp, udp6, icmp: handle TTL value
>       icmp, icmp6: Add icmp_forward_error and icmp6_forward_error
>       udp, udp6, icmp, icmp6: Enable forwarding errors on Linux
>       TCPIPHDR_DELTA: Fix potential negative value
>       sosendoob: better document what urgc is used for
>       Merge branch 'G_GNUC_PRINTF' into 'master'
>       Merge branch 'CVE-2020-29129' into 'master'
>       Merge branch 'ttl' into 'master'
>       Merge branch 'errors' into 'master'
>       Merge branch 'consume-empty-packet' into 'master'
>       Merge branch 'void' into 'master'
>       Merge branch 'master' into 'master'
>       Merge branch 'unused' into 'master'
>       Merge branch 'socket_delay' into 'master'
>       tcp_subr: simplify code
>       Merge branch 'ipv6-host-fwd-9-patch' into 'master'
>       Document the slirp API
>       Complete timeout documentation
>       Merge branch 'memset-sizeof' into 'master'
>       Merge branch 'reject-ipv6-addr-any' into 'master'
>       ip6_output: fix memory leak on fast-send
>       Merge branch 'ndp-leak' into 'master'
>       Merge branch 'memory_leaks' into 'master'
>       TODO for generalizing the hostfwd calls
>       socket.h: add missing sbuf.h inclusion
>       Expose udpx_listen and tcpx_listen as taking sockaddr
>       Disable polling for PRI on MacOS
>       Merge branch 'macos-pri' into 'master'
>       Merge branch 'x_listen' into 'master'
>       udpx/tcpx_listen: Add missing const qualifier
>       sockaddr_*: add missing const qualifiers
>       Merge branch 'm-cleanup-list-prototype' into 'master'
>       Merge branch 'neighbor-info' into 'master'
>       udpx/tcpx_listen: Use struct sockaddr * types
>       Add ipv4/ipv6-agnostic host forwarding functions
>       hostfwd: Add SLIRP_HOSTFWD_V6ONLY flag
>       Merge branch 'hostxfwd' into 'master'
>       Merge branch 'verbose-if-start' into 'master'
>       Remove slirp_add/remove_ipv6_hostfwd
>       Merge branch 'listen-errno' into 'master'
>       Merge branch 'newtcpcb-no-fail' into 'master'
>       Merge branch 'listen_v6only' into 'master'
>       Merge branch 'lazy-ipv6-resolution' into 'master'
>
> Stefan Weil (1):
>       Add G_GNUC_PRINTF to local function slirp_vsnprintf
>
> WaluigiWare64 (1):
>       Set macOS deployment target to macOS 10.4 Without a macOS deploymen=
t
> target, the resulting library does not work on macOS versions lower than =
it
> was currently built on. For example, if libslirp was built on macOS 10.15=
,
> it would not work on macOS 10.14.
>
> jeremy marchand (4):
>       m_free: remove the M_EXT flag after freeing the mbuf extended buffe=
r
>       refactor m_cleanup as requested in slirp/libslirp!68
>       m_cleanup: fix memory leaks
>       m_cleanup: set qh_link and qh_rlink to the list head
>
> osy (1):
>       Add DNS resolving for iOS
>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>
> Changes from v5:
>
> 1/4 slirp: Advance libslirp submodule to current master
> NOTE TO REVIEWERS: It may be a better use of everyone's time if a
> maintainer takes on advancing QEMU's libslirp to libslirp's master.
> Beyond that, I really don't know what to do except submit this patch as
> is currently provided.
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

It can do, but it should rather be a diff of the commits that are new,
those that were not in the stable branch.



>  slirp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/slirp b/slirp
> index 8f43a99191..4e6444e842 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit 4e6444e842695a6bfb00e15a8d0edfceb5c4628d
> --
> 2.31.1.295.g9ea45b61b8-goog
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000faed6705c1bf0151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 15, 2021 at 7:41 AM Dou=
g Evans &lt;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">5eraph (2):<br>
=C2=A0 =C2=A0 =C2=A0 disable_dns option<br>
=C2=A0 =C2=A0 =C2=A0 limit vnameserver_addr to port 53<br>
<br>
Akihiro Suda (1):<br>
=C2=A0 =C2=A0 =C2=A0 libslirp.h: fix SlirpConfig v3 documentation<br>
<br>
Doug Evans (11):<br>
=C2=A0 =C2=A0 =C2=A0 Add ipv6 host forward support<br>
=C2=A0 =C2=A0 =C2=A0 tcpx_listen: Pass sizeof(addr) to memset<br>
=C2=A0 =C2=A0 =C2=A0 Reject host forwarding to ipv6 &quot;addr-any&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 Add /build/ to .gitignore<br>
=C2=A0 =C2=A0 =C2=A0 New utility slirp_ether_ntoa<br>
=C2=A0 =C2=A0 =C2=A0 m_cleanup_list: make static<br>
=C2=A0 =C2=A0 =C2=A0 New API routine slirp_neighbor_info<br>
=C2=A0 =C2=A0 =C2=A0 Move DEBUG_CALL(&quot;if_start&quot;) to DEBUG_VERBOSE=
_CALL<br>
=C2=A0 =C2=A0 =C2=A0 tcpx_listen: tcp_newtcpcb doesn&#39;t fail<br>
=C2=A0 =C2=A0 =C2=A0 slirp_add_host*fwd: Ensure all error paths set errno<b=
r>
=C2=A0 =C2=A0 =C2=A0 Perform lazy guest address resolution for IPv6<br>
<br>
Dr. David Alan Gilbert (1):<br>
=C2=A0 =C2=A0 =C2=A0 ip_stripoptions use memmove<br>
<br>
Giuseppe Scrivano (1):<br>
=C2=A0 =C2=A0 =C2=A0 socket: consume empty packets<br>
<br>
Hafiz Abid Qadeer (1):<br>
=C2=A0 =C2=A0 =C2=A0 Fix a typo that can cause slow socket response on Wind=
ows.<br>
<br>
Jindrich Novy (4):<br>
=C2=A0 =C2=A0 =C2=A0 Fix possible infinite loops and use-after-free<br>
=C2=A0 =C2=A0 =C2=A0 Use secure string copy to avoid overflow<br>
=C2=A0 =C2=A0 =C2=A0 Be sure to initialize sockaddr structure<br>
=C2=A0 =C2=A0 =C2=A0 Check lseek() for failure<br>
<br>
Marc-Andr=C3=A9 Lureau (26):<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;master&#39; into &#39;master&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;fix-slirpconfig-3-doc&#39; into &#39=
;master&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Fix use-afte-free in ip_reass() (CVE-2020-1983)<br>
=C2=A0 =C2=A0 =C2=A0 Update CHANGELOG<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;cve-2020-1983&#39; into &#39;master&=
#39;<br>
=C2=A0 =C2=A0 =C2=A0 Release v4.3.0<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;release-v4.3.0&#39; into &#39;master=
&#39;<br>
=C2=A0 =C2=A0 =C2=A0 changelog: post-release<br>
=C2=A0 =C2=A0 =C2=A0 util: do not silently truncate<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;slirp-fmt-truncate&#39; into &#39;ma=
ster&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Release v4.3.1<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;release-v4.3.1&#39; into &#39;master=
&#39;<br>
=C2=A0 =C2=A0 =C2=A0 changelog: post-release<br>
=C2=A0 =C2=A0 =C2=A0 .gitlab-ci: add a Coverity stage<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;coverity&#39; into &#39;master&#39;<=
br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;ios-support&#39; into &#39;master&#3=
9;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;master&#39; into &#39;master&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 Remove the QEMU-special make build-system<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;qemu&#39; into &#39;master&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Release v4.4.0<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;4.4.0-release&#39; into &#39;master&=
#39;<br>
=C2=A0 =C2=A0 =C2=A0 changelog: post-release<br>
=C2=A0 =C2=A0 =C2=A0 Remove some needless (void)casts<br>
=C2=A0 =C2=A0 =C2=A0 Fix unused variables<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;gitignore-build&#39; into &#39;maste=
r&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;macos-deployment-target&#39; into &#=
39;master&#39;<br>
<br>
Nathaniel Wesley Filardo (1):<br>
=C2=A0 =C2=A0 =C2=A0 fork_exec_child_setup: improve signal handling<br>
<br>
Paolo Bonzini (2):<br>
=C2=A0 =C2=A0 =C2=A0 meson: remove meson-dist script<br>
=C2=A0 =C2=A0 =C2=A0 meson: support compiling as subproject<br>
<br>
Philippe Mathieu-Daud=C3=A9 (3):<br>
=C2=A0 =C2=A0 =C2=A0 Fix win32 builds by using the SLIRP_PACKED definition<=
br>
=C2=A0 =C2=A0 =C2=A0 Fix constness warnings<br>
=C2=A0 =C2=A0 =C2=A0 Remove unnecessary break<br>
<br>
Prasad J Pandit (1):<br>
=C2=A0 =C2=A0 =C2=A0 slirp: check pkt_len before reading protocol header<br=
>
<br>
Ralf Haferkamp (2):<br>
=C2=A0 =C2=A0 =C2=A0 Drop bogus IPv6 messages<br>
=C2=A0 =C2=A0 =C2=A0 Fix MTU check<br>
<br>
Samuel Thibault (45):<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;ip6_payload_len&#39; into &#39;maste=
r&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;lp1878043&#39; into &#39;master&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0 udp, udp6, icmp: handle TTL value<br>
=C2=A0 =C2=A0 =C2=A0 icmp, icmp6: Add icmp_forward_error and icmp6_forward_=
error<br>
=C2=A0 =C2=A0 =C2=A0 udp, udp6, icmp, icmp6: Enable forwarding errors on Li=
nux<br>
=C2=A0 =C2=A0 =C2=A0 TCPIPHDR_DELTA: Fix potential negative value<br>
=C2=A0 =C2=A0 =C2=A0 sosendoob: better document what urgc is used for<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;G_GNUC_PRINTF&#39; into &#39;master&=
#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;CVE-2020-29129&#39; into &#39;master=
&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;ttl&#39; into &#39;master&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;errors&#39; into &#39;master&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;consume-empty-packet&#39; into &#39;=
master&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;void&#39; into &#39;master&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;master&#39; into &#39;master&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;unused&#39; into &#39;master&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;socket_delay&#39; into &#39;master&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0 tcp_subr: simplify code<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;ipv6-host-fwd-9-patch&#39; into &#39=
;master&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Document the slirp API<br>
=C2=A0 =C2=A0 =C2=A0 Complete timeout documentation<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;memset-sizeof&#39; into &#39;master&=
#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;reject-ipv6-addr-any&#39; into &#39;=
master&#39;<br>
=C2=A0 =C2=A0 =C2=A0 ip6_output: fix memory leak on fast-send<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;ndp-leak&#39; into &#39;master&#39;<=
br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;memory_leaks&#39; into &#39;master&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0 TODO for generalizing the hostfwd calls<br>
=C2=A0 =C2=A0 =C2=A0 socket.h: add missing sbuf.h inclusion<br>
=C2=A0 =C2=A0 =C2=A0 Expose udpx_listen and tcpx_listen as taking sockaddr<=
br>
=C2=A0 =C2=A0 =C2=A0 Disable polling for PRI on MacOS<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;macos-pri&#39; into &#39;master&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;x_listen&#39; into &#39;master&#39;<=
br>
=C2=A0 =C2=A0 =C2=A0 udpx/tcpx_listen: Add missing const qualifier<br>
=C2=A0 =C2=A0 =C2=A0 sockaddr_*: add missing const qualifiers<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;m-cleanup-list-prototype&#39; into &=
#39;master&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;neighbor-info&#39; into &#39;master&=
#39;<br>
=C2=A0 =C2=A0 =C2=A0 udpx/tcpx_listen: Use struct sockaddr * types<br>
=C2=A0 =C2=A0 =C2=A0 Add ipv4/ipv6-agnostic host forwarding functions<br>
=C2=A0 =C2=A0 =C2=A0 hostfwd: Add SLIRP_HOSTFWD_V6ONLY flag<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;hostxfwd&#39; into &#39;master&#39;<=
br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;verbose-if-start&#39; into &#39;mast=
er&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Remove slirp_add/remove_ipv6_hostfwd<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;listen-errno&#39; into &#39;master&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;newtcpcb-no-fail&#39; into &#39;mast=
er&#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;listen_v6only&#39; into &#39;master&=
#39;<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;lazy-ipv6-resolution&#39; into &#39;=
master&#39;<br>
<br>
Stefan Weil (1):<br>
=C2=A0 =C2=A0 =C2=A0 Add G_GNUC_PRINTF to local function slirp_vsnprintf<br=
>
<br>
WaluigiWare64 (1):<br>
=C2=A0 =C2=A0 =C2=A0 Set macOS deployment target to macOS 10.4 Without a ma=
cOS deployment target, the resulting library does not work on macOS version=
s lower than it was currently built on. For example, if libslirp was built =
on macOS 10.15, it would not work on macOS 10.14.<br>
<br>
jeremy marchand (4):<br>
=C2=A0 =C2=A0 =C2=A0 m_free: remove the M_EXT flag after freeing the mbuf e=
xtended buffer<br>
=C2=A0 =C2=A0 =C2=A0 refactor m_cleanup as requested in slirp/libslirp!68<b=
r>
=C2=A0 =C2=A0 =C2=A0 m_cleanup: fix memory leaks<br>
=C2=A0 =C2=A0 =C2=A0 m_cleanup: set qh_link and qh_rlink to the list head<b=
r>
<br>
osy (1):<br>
=C2=A0 =C2=A0 =C2=A0 Add DNS resolving for iOS<br>
<br>
Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_=
blank">dje@google.com</a>&gt;<br>
---<br>
<br>
Changes from v5:<br>
<br>
1/4 slirp: Advance libslirp submodule to current master<br>
NOTE TO REVIEWERS: It may be a better use of everyone&#39;s time if a<br>
maintainer takes on advancing QEMU&#39;s libslirp to libslirp&#39;s master.=
<br>
Beyond that, I really don&#39;t know what to do except submit this patch as=
<br>
is currently provided.<br>
<br></blockquote><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lure=
au &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redh=
at.com</a>&gt;<br></div></div><br></div><div class=3D"gmail_quote">It can d=
o, but it should rather be a diff of the commits that are new, those that w=
ere not in the stable branch.<br><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
=C2=A0slirp | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/slirp b/slirp<br>
index 8f43a99191..4e6444e842 160000<br>
--- a/slirp<br>
+++ b/slirp<br>
@@ -1 +1 @@<br>
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
+Subproject commit 4e6444e842695a6bfb00e15a8d0edfceb5c4628d<br>
-- <br>
2.31.1.295.g9ea45b61b8-goog<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000faed6705c1bf0151--

