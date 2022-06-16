Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772954E75B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:32:44 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1sQF-0002qt-DR
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o1sO7-0001zG-NK
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:30:31 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:37742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o1sO5-00042A-Hn
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:30:31 -0400
Received: by mail-ua1-x92c.google.com with SMTP id l9so654205uac.4
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WHtBFSgdtt0doNPT8CHdj4PVJOZ3ysghRgaJuzy2x9I=;
 b=X7YT5d/M8HFTvUSMskJefF/aBIz4lxFY803YFlJiiAFkLWZdCNWClgt15rsZ0Z1fze
 lz90xMPPToJXGXWpicSV281SWUdIwBD2LngZk7pTz4paQrbOinQ6d6Kcm521miqLPDhu
 MZnCOMhAYaswRbk71CUk6vfIPvtRvr5chMFdntopno9ddTRXAaK6WsBz9r+nnCan29F5
 Soy1dIaCH4Zsive7tStpcrb6uBnA7YD9OKhO8ve+lICzOitUxuaJeJ4uMYsn2zBLsE5Q
 K/4aVXQ6DTaZZEjEqIX5neUnM3f/NzaMgH8qtRqhONFtRifmFSVjmgOnqC/7vuUjMa4O
 LlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WHtBFSgdtt0doNPT8CHdj4PVJOZ3ysghRgaJuzy2x9I=;
 b=IaY2sxxY2HnGmyxgxfT0a2qUphBhjn5/niDrrx5SEwLfba3Q4eduzgIa1ptWkxQLeN
 gSbSm0UaUxwYho+OaERIRK2pu4N/1RsxrL4EqQH/MGnJ9jskyU0ef3cIH4FFru/17h1R
 dm8HWnMuA7PGENmNqB69GU2dyx9KbyM48kVwvIngzDHFPK7SCgwERgfkMJ8pCqitwpKX
 SGqxlBjTgwa3dlHazE+yj8rXRuLHw4MbiIRVUI1vDH1H/cvaWdpbc/GDsFW0Sa70R+Hh
 ZXk+Cdt5l0PZryqIBnUCFIRPGAmq/bcnFfq2gHLHMM/Yyh/40SjzXPFrfthoNN2bVXhB
 QB7Q==
X-Gm-Message-State: AJIora9a77qw3SfaQaY0j1bfMTjcXQUBQxqeAWjFIwjKi/dFFjbIrpTP
 tXUbKVXM5mncdsfjEIMVKkUZdefSM4I1UMTNndaxCQlq+VY=
X-Google-Smtp-Source: AGRyM1uSoHBPCHu5vCz5d1ww4n09j5/XjI+XvibHbjSisPOStUsE8Swa+frx/6tSmuVD+tYHyH7Kn0VkgQkWoHe5V1E=
X-Received: by 2002:ab0:6cee:0:b0:375:aa6e:66d4 with SMTP id
 l14-20020ab06cee000000b00375aa6e66d4mr2574952uai.39.1655397028328; Thu, 16
 Jun 2022 09:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhNUkps9_aLKmy=oDKYC8xsUjErrEMAycwJHjUvkWHRA@mail.gmail.com>
 <20220616133057.bq4m5rzc2tjpeqdn@mozz.bu.edu>
In-Reply-To: <20220616133057.bq4m5rzc2tjpeqdn@mozz.bu.edu>
From: Patrick Venture <venture@google.com>
Date: Thu, 16 Jun 2022 09:30:17 -0700
Message-ID: <CAO=notzeN6OrcfjKNVJ9Q6ttbLv6s-zgiW3dGQTbn4eP6WHcsQ@mail.gmail.com>
Subject: Re: misaligned-pointer-use libslirp/src/tcp_input.c
To: Alexander Bulekov <alxndr@bu.edu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="000000000000d65c4405e19327f1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=venture@google.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5, USER_IN_DEF_SPF_WL=-7.5,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d65c4405e19327f1
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 16, 2022 at 6:31 AM Alexander Bulekov <alxndr@bu.edu> wrote:

> Is this an --enable-sanitizers build? The virtual-device fuzzer catches
>

Yeah - it should be reproducible with a sanitizers build from HEAD -- I can
try to get a manual instance going again without automation to try and
reproduce it.  We're testing on v7.0.0 which is when we started seeing
this, I don't think we saw it in 6.2.0.


> these periodically while fuzzing network-devices. However I don't think
> OSS-Fuzz creates reports for them for some reason. I can create qtest
> reproducers, if that is useful.
> -Alex
>
> On 220615 0942, Patrick Venture wrote:
> > Hey - I wanted to ask if someone else has seen this or has suggestions on
> > how to fix it in libslirp / qemu.
> >
> > libslirp version: 3ad1710a96678fe79066b1469cead4058713a1d9
> >
> > The blow is line:
> >
> https://gitlab.freedesktop.org/slirp/libslirp/-/blob/master/src/tcp_input.c#L310
> >
> > I0614 13:44:44.304087    2040 bytestream.cc:22] QEMU:
> > third_party/libslirp/src/tcp_input.c:310:56: runtime error: member access
> > within misaligned address 0xffff9a4000f4 for type 'struct qlink', which
> > requires 8 byte alignment
> > I0614 13:44:44.304156    2040 bytestream.cc:22] QEMU: 0xffff9a4000f4:
> note:
> > pointer points here
> > I0614 13:44:44.304184    2040 bytestream.cc:22] QEMU:   00 00 00 00 00 00
> > 00 02  20 02 0a 00 00 01 42 01  0a 00 02 02 42 01 0a 00  00 01 86 dd 60
> 02
> > dd 79
> > I0614 13:44:44.304204    2040 bytestream.cc:22] QEMU:               ^
> > I0614 13:44:44.641173    2040 bytestream.cc:22] QEMU:     #0
> 0xaaaacbe34bd8
> > in tcp_input third_party/libslirp/src/tcp_input.c:310:56
> > I0614 13:44:44.641239    2040 bytestream.cc:22] QEMU:     #1
> 0xaaaacbe22a94
> > in ip6_input third_party/libslirp/src/ip6_input.c:74:9
> > I0614 13:44:44.641262    2040 bytestream.cc:22] QEMU:     #2
> 0xaaaacbe0bbbc
> > in slirp_input third_party/libslirp/src/slirp.c:1169:13
> > I0614 13:44:44.641280    2040 bytestream.cc:22] QEMU:     #3
> 0xaaaacbd55f6c
> > in net_slirp_receive third_party/qemu/net/slirp.c:136:5
> > I0614 13:44:44.641296    2040 bytestream.cc:22] QEMU:     #4
> 0xaaaacbd4e77c
> > in nc_sendv_compat third_party/qemu/net/net.c
> > I0614 13:44:44.641323    2040 bytestream.cc:22] QEMU:     #5
> 0xaaaacbd4e77c
> > in qemu_deliver_packet_iov third_party/qemu/net/net.c:850:15
> > I0614 13:44:44.641342    2040 bytestream.cc:22] QEMU:     #6
> 0xaaaacbd50bfc
> > in qemu_net_queue_deliver_iov third_party/qemu/net/queue.c:179:11
> > I0614 13:44:44.641359    2040 bytestream.cc:22] QEMU:     #7
> 0xaaaacbd50bfc
> > in qemu_net_queue_send_iov third_party/qemu/net/queue.c:246:11
> > I0614 13:44:44.641382    2040 bytestream.cc:22] QEMU:     #8
> 0xaaaacbd4a88c
> > in qemu_sendv_packet_async third_party/qemu/net/net.c:891:12
> > I0614 13:44:44.641396    2040 bytestream.cc:22] QEMU:     #9
> 0xaaaacacb1de0
> > in virtio_net_flush_tx third_party/qemu/hw/net/virtio-net.c:2586:15
> > I0614 13:44:44.641416    2040 bytestream.cc:22] QEMU:     #10
> > 0xaaaacacb1580 in virtio_net_tx_bh
> > third_party/qemu/hw/net/virtio-net.c:2703:11
> > I0614 13:44:44.641438    2040 bytestream.cc:22] QEMU:     #11
> > 0xaaaacc2bcf64 in aio_bh_call third_party/qemu/util/async.c:142:5
> > I0614 13:44:44.641463    2040 bytestream.cc:22] QEMU:     #12
> > 0xaaaacc2bcf64 in aio_bh_poll third_party/qemu/util/async.c:170:13
> > I0614 13:44:44.641477    2040 bytestream.cc:22] QEMU:     #13
> > 0xaaaacc2b8f70 in aio_dispatch third_party/qemu/util/aio-posix.c:420:5
> > I0614 13:44:44.641495    2040 bytestream.cc:22] QEMU:     #14
> > 0xaaaacc2bf120 in aio_ctx_dispatch third_party/qemu/util/async.c:312:5
> > I0614 13:44:44.641510    2040 bytestream.cc:22] QEMU:     #15
> > 0xaaaacc3a7690 in g_main_dispatch third_party/glib/glib/gmain.c:3417:27
> > I0614 13:44:44.641525    2040 bytestream.cc:22] QEMU:     #16
> > 0xaaaacc3a7690 in g_main_context_dispatch
> > third_party/glib/glib/gmain.c:4135:7
> > I0614 13:44:44.641546    2040 bytestream.cc:22] QEMU:     #17
> > 0xaaaacc2de3ec in glib_pollfds_poll
> third_party/qemu/util/main-loop.c:232:9
> > I0614 13:44:44.641562    2040 bytestream.cc:22] QEMU:     #18
> > 0xaaaacc2de3ec in os_host_main_loop_wait
> > third_party/qemu/util/main-loop.c:255:5
> > I0614 13:44:44.641580    2040 bytestream.cc:22] QEMU:     #19
> > 0xaaaacc2de3ec in main_loop_wait third_party/qemu/util/main-loop.c:531:11
> > I0614 13:44:44.641598    2040 bytestream.cc:22] QEMU:     #20
> > 0xaaaacbd82798 in qemu_main_loop
> third_party/qemu/softmmu/runstate.c:727:9
> > I0614 13:44:44.641612    2040 bytestream.cc:22] QEMU:     #21
> > 0xaaaacadacb5c in main
> >
> > Patrick
>

--000000000000d65c4405e19327f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 16, 2022 at 6:31 AM Alexa=
nder Bulekov &lt;<a href=3D"mailto:alxndr@bu.edu">alxndr@bu.edu</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Is this an -=
-enable-sanitizers build? The virtual-device fuzzer catches<br></blockquote=
><div><br></div><div>Yeah - it should be reproducible with a sanitizers bui=
ld from HEAD -- I can try to get a manual instance going again without auto=
mation to try and reproduce it.=C2=A0 We&#39;re testing on v7.0.0 which is =
when we started seeing this, I don&#39;t think we saw it in 6.2.0.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
these periodically while fuzzing network-devices. However I don&#39;t think=
<br>
OSS-Fuzz creates reports for them for some reason. I can create qtest<br>
reproducers, if that is useful. <br>
-Alex<br>
<br>
On 220615 0942, Patrick Venture wrote:<br>
&gt; Hey - I wanted to ask if someone else has seen this or has suggestions=
 on<br>
&gt; how to fix it in libslirp / qemu.<br>
&gt; <br>
&gt; libslirp version: 3ad1710a96678fe79066b1469cead4058713a1d9<br>
&gt; <br>
&gt; The blow is line:<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/blob/master=
/src/tcp_input.c#L310" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/slirp/libslirp/-/blob/master/src/tcp_input.c#L310</a><br>
&gt; <br>
&gt; I0614 13:44:44.304087=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:<br>
&gt; third_party/libslirp/src/tcp_input.c:310:56: runtime error: member acc=
ess<br>
&gt; within misaligned address 0xffff9a4000f4 for type &#39;struct qlink&#3=
9;, which<br>
&gt; requires 8 byte alignment<br>
&gt; I0614 13:44:44.304156=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU: 0xffff=
9a4000f4: note:<br>
&gt; pointer points here<br>
&gt; I0614 13:44:44.304184=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A000 00 00 00 00 00<br>
&gt; 00 02=C2=A0 20 02 0a 00 00 01 42 01=C2=A0 0a 00 02 02 42 01 0a 00=C2=
=A0 00 01 86 dd 60 02<br>
&gt; dd 79<br>
&gt; I0614 13:44:44.304204=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; I0614 13:44:44.641173=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#0 0xaaaacbe34bd8<br>
&gt; in tcp_input third_party/libslirp/src/tcp_input.c:310:56<br>
&gt; I0614 13:44:44.641239=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#1 0xaaaacbe22a94<br>
&gt; in ip6_input third_party/libslirp/src/ip6_input.c:74:9<br>
&gt; I0614 13:44:44.641262=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#2 0xaaaacbe0bbbc<br>
&gt; in slirp_input third_party/libslirp/src/slirp.c:1169:13<br>
&gt; I0614 13:44:44.641280=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#3 0xaaaacbd55f6c<br>
&gt; in net_slirp_receive third_party/qemu/net/slirp.c:136:5<br>
&gt; I0614 13:44:44.641296=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#4 0xaaaacbd4e77c<br>
&gt; in nc_sendv_compat third_party/qemu/net/net.c<br>
&gt; I0614 13:44:44.641323=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#5 0xaaaacbd4e77c<br>
&gt; in qemu_deliver_packet_iov third_party/qemu/net/net.c:850:15<br>
&gt; I0614 13:44:44.641342=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#6 0xaaaacbd50bfc<br>
&gt; in qemu_net_queue_deliver_iov third_party/qemu/net/queue.c:179:11<br>
&gt; I0614 13:44:44.641359=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#7 0xaaaacbd50bfc<br>
&gt; in qemu_net_queue_send_iov third_party/qemu/net/queue.c:246:11<br>
&gt; I0614 13:44:44.641382=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#8 0xaaaacbd4a88c<br>
&gt; in qemu_sendv_packet_async third_party/qemu/net/net.c:891:12<br>
&gt; I0614 13:44:44.641396=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#9 0xaaaacacb1de0<br>
&gt; in virtio_net_flush_tx third_party/qemu/hw/net/virtio-net.c:2586:15<br=
>
&gt; I0614 13:44:44.641416=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#10<br>
&gt; 0xaaaacacb1580 in virtio_net_tx_bh<br>
&gt; third_party/qemu/hw/net/virtio-net.c:2703:11<br>
&gt; I0614 13:44:44.641438=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#11<br>
&gt; 0xaaaacc2bcf64 in aio_bh_call third_party/qemu/util/async.c:142:5<br>
&gt; I0614 13:44:44.641463=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#12<br>
&gt; 0xaaaacc2bcf64 in aio_bh_poll third_party/qemu/util/async.c:170:13<br>
&gt; I0614 13:44:44.641477=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#13<br>
&gt; 0xaaaacc2b8f70 in aio_dispatch third_party/qemu/util/aio-posix.c:420:5=
<br>
&gt; I0614 13:44:44.641495=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#14<br>
&gt; 0xaaaacc2bf120 in aio_ctx_dispatch third_party/qemu/util/async.c:312:5=
<br>
&gt; I0614 13:44:44.641510=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#15<br>
&gt; 0xaaaacc3a7690 in g_main_dispatch third_party/glib/glib/gmain.c:3417:2=
7<br>
&gt; I0614 13:44:44.641525=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#16<br>
&gt; 0xaaaacc3a7690 in g_main_context_dispatch<br>
&gt; third_party/glib/glib/gmain.c:4135:7<br>
&gt; I0614 13:44:44.641546=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#17<br>
&gt; 0xaaaacc2de3ec in glib_pollfds_poll third_party/qemu/util/main-loop.c:=
232:9<br>
&gt; I0614 13:44:44.641562=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#18<br>
&gt; 0xaaaacc2de3ec in os_host_main_loop_wait<br>
&gt; third_party/qemu/util/main-loop.c:255:5<br>
&gt; I0614 13:44:44.641580=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#19<br>
&gt; 0xaaaacc2de3ec in main_loop_wait third_party/qemu/util/main-loop.c:531=
:11<br>
&gt; I0614 13:44:44.641598=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#20<br>
&gt; 0xaaaacbd82798 in qemu_main_loop third_party/qemu/softmmu/runstate.c:7=
27:9<br>
&gt; I0614 13:44:44.641612=C2=A0 =C2=A0 2040 bytestream.cc:22] QEMU:=C2=A0 =
=C2=A0 =C2=A0#21<br>
&gt; 0xaaaacadacb5c in main<br>
&gt; <br>
&gt; Patrick<br>
</blockquote></div></div>

--000000000000d65c4405e19327f1--

