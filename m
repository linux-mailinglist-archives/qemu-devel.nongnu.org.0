Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B423373E7C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:26:23 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJPq-00043z-HF
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1leJLN-0000gT-CJ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:21:45 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1leJLK-000081-T2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:21:45 -0400
Received: by mail-vs1-xe32.google.com with SMTP id b4so1259502vst.13
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z35LRBIAu9/+wT0ufNZBWbwRE672jFZePrykKlHI4A8=;
 b=gw/qFA445uB+mplp64GcLhaa6ClqqXQEJP3dWoaBZl8/yOZaElLiY13j4dtT6Snf03
 gR/DSHM60SvKwxcyGEv2XwbhKGpn379Vtihc9dgqjd84PnVX5D2Bk+DfG6/THZO4DYTi
 OraUUDssk40CTb2UGy62xrdQ6uVkuFXq916CyqPxKa/aFV/lTq7zhO44qpnrG2ayeG+l
 I6KOC3nPJ2NT+wlzZNisgGrX+teoVf721EDWhjoRrg/g4wUkxlhuOS6lsYujb8PkTM70
 yjUT346aQtuXt7RiwLnl8rcupm0HJa6L2drzPcrLWrqHoHuvUWxuDIdKsCr26j2vwOHo
 wB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z35LRBIAu9/+wT0ufNZBWbwRE672jFZePrykKlHI4A8=;
 b=NNz9hkkQLDdobWRUm2O7lGdE86LW5l0nd9APDWRDznM642qLftkxvdz+AifXZKfDw/
 A4W30sNdZk3SSKRoXnpSuFW+XghZcrQ/RNoBSAjB0G/AApo9xO7o5I6tejmtt1tbIDcn
 Dil0V/WaOeBtBkS8uRUxYJfu6/sQPdbAbi5tJCRfisWEP9TIitT1Fru2wWWJ9lKiNSNp
 8mcuQKyzOHIN6LEQsBkhX/2/NbMqLd0PvL7DpW4uDdfQE3F3MiGUdkWw/vXxiNBiEzCS
 CdVfxP9lPHBgGxUGf1+3h0bW20sYkJRMS+qoVHKhZB/u6K3hSUpzWC9kXJ2T19pPJOYs
 oS4g==
X-Gm-Message-State: AOAM530KGlCBrU22l0LHXrGuvqZ8p1EdSIcSrAQ/dAon7HDAn4is/aQo
 KTqo2D+JMkAuzY9+8e/2p6PCe+y77+ro+5m3Uy4bheBIvnLlhg==
X-Google-Smtp-Source: ABdhPJwnG6O1oWd44iwKGwglhnKME8i1gYYpy0cvaVhjHcf6wucTkuvbHvg6Vx/OJtufnTeo6+ejVObVNhvUxFMLJKM=
X-Received: by 2002:a67:db91:: with SMTP id f17mr28006492vsk.47.1620228097837; 
 Wed, 05 May 2021 08:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <CADPb22SBzeHj75aaNnJKN2Ov--=MExh5CuZCYRZO7gK8A-A-Lw@mail.gmail.com>
In-Reply-To: <CADPb22SBzeHj75aaNnJKN2Ov--=MExh5CuZCYRZO7gK8A-A-Lw@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Wed, 5 May 2021 08:21:00 -0700
Message-ID: <CADPb22RJJHOdSqc4veQU-Gzuf4gDGsCdC6=BpL_eeprtFw-vDw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Add support for ipv6 host forwarding
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003a7b5e05c196c04b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=dje@google.com; helo=mail-vs1-xe32.google.com
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

--0000000000003a7b5e05c196c04b
Content-Type: text/plain; charset="UTF-8"

Ping.

On Wed, Apr 28, 2021 at 8:37 PM Doug Evans <dje@google.com> wrote:

> Ping.
>
> On Wed, Apr 14, 2021 at 8:39 PM Doug Evans <dje@google.com> wrote:
>
>> This patchset takes the original patch from Maxim,
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
>> and updates it.
>>
>> Option hostfwd is extended to support ipv6 addresses.
>> Commands hostfwd_add, hostfwd_remove are extended as well.
>>
>> The libslirp part of the patch has been committed upstream,
>> and is now in qemu. See patch 1/4.
>>
>> Changes from v5:
>>
>> 1/4 slirp: Advance libslirp submodule to current master
>> NOTE TO REVIEWERS: It may be a better use of everyone's time if a
>> maintainer takes on advancing QEMU's libslirp to libslirp's master.
>> Beyond that, I really don't know what to do except submit this patch as
>> is currently provided.
>>
>> 2/4: util/qemu-sockets.c: Split host:port parsing out of inet_parse
>>
>> Also split out parsing of ipv4=on|off, ipv6=on|off
>>
>> 3/4: net/slirp.c: Refactor address parsing
>>
>> Use InetSocketAddress and getaddrinfo().
>> Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.
>>
>> 4/4: net: Extend host forwarding to support IPv6
>>
>> Recognize ipv4=,ipv6= options.
>>
>> Note: v5's 3/5 "Recognize []:port (empty ipv6 address)" has been deleted:
>> the churn on this patch series needs to be reduced.
>> This change is not required, and can easily be done in a later patch.
>>
>> Changes from v4:
>>
>> 1/5 slirp: Advance libslirp submodule to add ipv6 host-forward support
>> NOTE TO REVIEWERS: I need some hand-holding to know what The Right
>> way to submit this particular patch is.
>>
>> - no change
>>
>> 2/5 util/qemu-sockets.c: Split host:port parsing out of inet_parse
>>
>> - move recognition of "[]:port" to separate patch
>> - allow passing NULL for ip_v6
>> - fix some formatting issues
>>
>> 3/5 inet_parse_host_and_addr: Recognize []:port (empty ipv6 address)
>>
>> - new in this patchset revision
>>
>> 4/5 net/slirp.c: Refactor address parsing
>>
>> - was 3/4 in v4
>> - fix some formatting issues
>>
>> 5/5 net: Extend host forwarding to support IPv6
>>
>> - was 4/4 in v4
>> - fix some formatting issues
>>
>> Changes from v3:
>>
>> 1/4 slirp: Advance libslirp submodule to add ipv6 host-forward support
>>
>> - pick up latest libslirp patch to reject ipv6 addr-any for guest address
>>   - libslirp currently only provides a stateless DHCPv6 server, which
>> means
>>     it can't know in advance what the guest's IP address is, and thus
>>     cannot do the "addr-any -> guest ip address" translation that is done
>>     for ipv4
>>
>> 2/4 util/qemu-sockets.c: Split host:port parsing out of inet_parse
>>
>> - this patch is new in v4
>>   - provides new utility: inet_parse_host_and_port, updates inet_parse
>>     to use it
>>
>> 3/4 net/slirp.c: Refactor address parsing
>>
>> - this patch renamed from 2/3 to 3/4
>> - call inet_parse_host_and_port from util/qemu-sockets.c
>> - added tests/acceptance/hostfwd.py
>>
>> 4/4 net: Extend host forwarding to support IPv6
>>
>> - this patch renamed from 3/3 to 4/4
>> - ipv6 support added to existing hostfwd option, commands
>>   - instead of creating new ipv6 option, commands
>> - added tests to tests/acceptance/hostfwd.py
>>
>> Changes from v2:
>> - split out libslirp commit
>> - clarify spelling of ipv6 addresses in docs
>> - tighten parsing of ipv6 addresses
>>
>> Change from v1:
>> - libslirp part is now upstream
>> - net/slirp.c changes split into two pieces (refactor, add ipv6)
>> - added docs
>>
>> Doug Evans (4):
>>   slirp: Advance libslirp submodule to add ipv6 host-forward support
>>   util/qemu-sockets.c: Split host:port parsing out of inet_parse
>>   net/slirp.c: Refactor address parsing
>>   net: Extend host forwarding to support IPv6
>>
>>  hmp-commands.hx             |  18 ++-
>>  include/qemu/sockets.h      |   5 +
>>  net/slirp.c                 | 236 ++++++++++++++++++++++++++----------
>>  slirp                       |   2 +-
>>  tests/acceptance/hostfwd.py | 185 ++++++++++++++++++++++++++++
>>  util/qemu-sockets.c         |  82 +++++++++----
>>  6 files changed, 436 insertions(+), 92 deletions(-)
>>  create mode 100644 tests/acceptance/hostfwd.py
>>
>> --
>> 2.31.1.295.g9ea45b61b8-goog
>>
>>

--0000000000003a7b5e05c196c04b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Ping.<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Apr 28, 2021 at 8:37 PM Doug Evans &l=
t;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div sty=
le=3D"font-size:small">Ping.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 14, 2021 at 8:39 PM Doug Evan=
s &lt;<a href=3D"mailto:dje@google.com" target=3D"_blank">dje@google.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thi=
s patchset takes the original patch from Maxim,<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg569573.html</a><br>
and updates it.<br>
<br>
Option hostfwd is extended to support ipv6 addresses.<br>
Commands hostfwd_add, hostfwd_remove are extended as well.<br>
<br>
The libslirp part of the patch has been committed upstream,<br>
and is now in qemu. See patch 1/4.<br>
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
<br>
2/4: util/qemu-sockets.c: Split host:port parsing out of inet_parse<br>
<br>
Also split out parsing of ipv4=3Don|off, ipv6=3Don|off<br>
<br>
3/4: net/slirp.c: Refactor address parsing<br>
<br>
Use InetSocketAddress and getaddrinfo().<br>
Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.<br>
<br>
4/4: net: Extend host forwarding to support IPv6<br>
<br>
Recognize ipv4=3D,ipv6=3D options.<br>
<br>
Note: v5&#39;s 3/5 &quot;Recognize []:port (empty ipv6 address)&quot; has b=
een deleted:<br>
the churn on this patch series needs to be reduced.<br>
This change is not required, and can easily be done in a later patch.<br>
<br>
Changes from v4:<br>
<br>
1/5 slirp: Advance libslirp submodule to add ipv6 host-forward support<br>
NOTE TO REVIEWERS: I need some hand-holding to know what The Right<br>
way to submit this particular patch is.<br>
<br>
- no change<br>
<br>
2/5 util/qemu-sockets.c: Split host:port parsing out of inet_parse<br>
<br>
- move recognition of &quot;[]:port&quot; to separate patch<br>
- allow passing NULL for ip_v6<br>
- fix some formatting issues<br>
<br>
3/5 inet_parse_host_and_addr: Recognize []:port (empty ipv6 address)<br>
<br>
- new in this patchset revision<br>
<br>
4/5 net/slirp.c: Refactor address parsing<br>
<br>
- was 3/4 in v4<br>
- fix some formatting issues<br>
<br>
5/5 net: Extend host forwarding to support IPv6<br>
<br>
- was 4/4 in v4<br>
- fix some formatting issues<br>
<br>
Changes from v3:<br>
<br>
1/4 slirp: Advance libslirp submodule to add ipv6 host-forward support<br>
<br>
- pick up latest libslirp patch to reject ipv6 addr-any for guest address<b=
r>
=C2=A0 - libslirp currently only provides a stateless DHCPv6 server, which =
means<br>
=C2=A0 =C2=A0 it can&#39;t know in advance what the guest&#39;s IP address =
is, and thus<br>
=C2=A0 =C2=A0 cannot do the &quot;addr-any -&gt; guest ip address&quot; tra=
nslation that is done<br>
=C2=A0 =C2=A0 for ipv4<br>
<br>
2/4 util/qemu-sockets.c: Split host:port parsing out of inet_parse<br>
<br>
- this patch is new in v4<br>
=C2=A0 - provides new utility: inet_parse_host_and_port, updates inet_parse=
<br>
=C2=A0 =C2=A0 to use it<br>
<br>
3/4 net/slirp.c: Refactor address parsing<br>
<br>
- this patch renamed from 2/3 to 3/4<br>
- call inet_parse_host_and_port from util/qemu-sockets.c<br>
- added tests/acceptance/hostfwd.py<br>
<br>
4/4 net: Extend host forwarding to support IPv6<br>
<br>
- this patch renamed from 3/3 to 4/4<br>
- ipv6 support added to existing hostfwd option, commands<br>
=C2=A0 - instead of creating new ipv6 option, commands<br>
- added tests to tests/acceptance/hostfwd.py<br>
<br>
Changes from v2:<br>
- split out libslirp commit<br>
- clarify spelling of ipv6 addresses in docs<br>
- tighten parsing of ipv6 addresses<br>
<br>
Change from v1:<br>
- libslirp part is now upstream<br>
- net/slirp.c changes split into two pieces (refactor, add ipv6)<br>
- added docs<br>
<br>
Doug Evans (4):<br>
=C2=A0 slirp: Advance libslirp submodule to add ipv6 host-forward support<b=
r>
=C2=A0 util/qemu-sockets.c: Split host:port parsing out of inet_parse<br>
=C2=A0 net/slirp.c: Refactor address parsing<br>
=C2=A0 net: Extend host forwarding to support IPv6<br>
<br>
=C2=A0hmp-commands.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 18 ++-<br>
=C2=A0include/qemu/sockets.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 236 ++++++++++++++++++++++++++----------<br>
=C2=A0slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0tests/acceptance/hostfwd.py | 185 ++++++++++++++++++++++++++++<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 82 +++++=
++++----<br>
=C2=A06 files changed, 436 insertions(+), 92 deletions(-)<br>
=C2=A0create mode 100644 tests/acceptance/hostfwd.py<br>
<br>
-- <br>
2.31.1.295.g9ea45b61b8-goog<br>
<br>
</blockquote></div>
</blockquote></div></div>

--0000000000003a7b5e05c196c04b--

