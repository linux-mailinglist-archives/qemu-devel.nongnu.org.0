Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CBD3FCDBA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:41:32 +0200 (CEST)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9dJ-0007gg-9R
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mL9a2-0003dY-Uu
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:37:58 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mL9a0-0008FC-P5
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:37:58 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 y47-20020a4a9832000000b00290fb9f6d3fso94966ooi.3
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H0tU/y9/j09/hyYmNZiveYjYN7sJfhDHgXlzEnFKnnE=;
 b=gTqpyQezSuQ+9HzdZ61lSQ2PLt6xKzIYSUSdABGURfFZ0Yi7ilorc5csMPS6xQO3rs
 XPEavtbkLe432Xkc8dbMd6KhbMgNE2k9d370Rr9YQzgQvM2VMxtGBUGG8Bo9rLC4qS1X
 ixMiYSmoAnJpxL/we+30Sgen09AHpFGt0L4gH6NglIMU6fbaytaVE6U4Z05vZySf5BXk
 aCvx2eTANwWVN44R5Z/4CsFZ9TebP7UCHeR0BuHX2udoRXjKFDR4NGhf7MA7//0Ciz3T
 Dm4K/mh2qgcds2nKREx8rhTK/gHycTd55Yx+wtFMsG3BvGE4vvPr0z53qnaez9ccMA+m
 ThXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0tU/y9/j09/hyYmNZiveYjYN7sJfhDHgXlzEnFKnnE=;
 b=dhZegf7xUhoQbjEjXlQ/Habt/NT4s2shyHuvNFhXUugH3RMYPtUrkSdeEAWEZ1Hp3R
 fv6Qn3zdT90wT93R9+7gGJR1iWM0HcO7XEN4IGkQBQasrQR/piNvpVkfJclbPcEvpE5d
 vzx7Og+cedblN+48138cTibvogDQCuDVGCPyFPXpIqutREuF72MZcUjVSfv+bcHN787e
 AHj0KC+g5Py6TYBI8OSgwKpCJk2dZHAednZhao27rSF6KVHHG1btKzmEDJ0/aHPHQHqz
 XJQqzz89A7So2nogLtw2xtXL1D/MJqJh/df3cEPwffjH2p3feZVVo+m25/FIZHwngsIC
 txlg==
X-Gm-Message-State: AOAM531yP8ae+pQ61gOfnmawMti9Ow3xShkbh/UiufxjP67F9lshQLOI
 PSCTdZ0ZKiB8zRYhupxSvbQZUIwUu9RTtmTj72hvbw==
X-Google-Smtp-Source: ABdhPJxEja5/mZkO9Tc4qR2Tj6qsJ+X9M7v02+csDH4au6wSMw+NfBOZFXvFaPZLKLjdmuxo9xkSa98jXKUk+yjZuKw=
X-Received: by 2002:a4a:3e58:: with SMTP id t85mr15745785oot.81.1630438674987; 
 Tue, 31 Aug 2021 12:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
 <CAOEp5OcyvQ9Y2onyHuJnwjtWK+Tx9QxYXUePd1kJ=V9+H9wraw@mail.gmail.com>
 <87v93n8nu3.fsf@dusky.pond.sub.org>
 <CAOEp5Of0C4yUhwbgFmu4roiEmNXZ8qiNMUA3CCBE8Zwu=OWhtQ@mail.gmail.com>
 <87a6kz8i4g.fsf@dusky.pond.sub.org>
 <CAOEp5OfxM+YyZFMUxDrcOw6eKRhyhouJ3q+UnAx3x7sXhQQvHQ@mail.gmail.com>
 <87k0k1wtfc.fsf@dusky.pond.sub.org>
In-Reply-To: <87k0k1wtfc.fsf@dusky.pond.sub.org>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Tue, 31 Aug 2021 22:37:44 +0300
Message-ID: <CABcq3pEvHUB1K_+gkwP1NpOSxFYs563WSOmAOh4qvvGczCpytA@mail.gmail.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000d0d1a05cae01690"
Received-SPF: none client-ip=2607:f8b0:4864:20::c31;
 envelope-from=andrew@daynix.com; helo=mail-oo1-xc31.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000d0d1a05cae01690
Content-Type: text/plain; charset="UTF-8"

Hi,

> Got something I could git-pull?
>
I can share some links for tests:
https://github.com/daynix/qemu/tree/HelperEBPFv3 - qemu with helper
https://github.com/daynix/libvirt/tree/RSS_RFC_v1 - libvirt with RSS

On Tue, Aug 31, 2021 at 6:00 PM Markus Armbruster <armbru@redhat.com> wrote:

> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>
> > On Mon, Aug 30, 2021 at 11:14 AM Markus Armbruster <armbru@redhat.com>
> wrote:
> >>
> >> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
> >>
> >> > On Mon, Aug 30, 2021 at 9:10 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
> [...]
>
> >> >> So let's try again: if libvirt does use the wrong RSS helper, how
> does
> >> >> the system behave?
> >> >
> >> > The receive-side scaling may work incorrectly, i.e. finally may move
> >> > incoming packets to a virtqueue different than expected one.
> >>
> >> Then I'm confused about the purpose of "the stamp" mentioned below.  Can
> >> you enlighten me?
> >
> > The stamp is a string (common for qemu executable and RSS helper
> > executable during build) that qemu can later retrieve from the helper
> > in run-time and ensure this helper is fully compatible with this build
> > of qemu (in terms of eBPF operation). The helper is built with the
> > same C headers (related to ebpf operation) as the qemu, the qemu is
> > able to receive file descriptors created by the helper (of ebpf
> > program and ebpf data structure's maps) from libvirt and deal with
> > them as if it has created them.
>
> Thanks.
>
> I tried to apply your series to check a few of my assumptions, but I'm
> getting conflicts.  Got something I could git-pull?
>
> [...]
>
>

--0000000000000d0d1a05cae01690
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>Got something I could git-pull?</div></blockquote><div>I can sha=
re some links for tests:</div><div><a href=3D"https://github.com/daynix/qem=
u/tree/HelperEBPFv3">https://github.com/daynix/qemu/tree/HelperEBPFv3</a> -=
 qemu with helper</div><div><a href=3D"https://github.com/daynix/libvirt/tr=
ee/RSS_RFC_v1">https://github.com/daynix/libvirt/tree/RSS_RFC_v1</a> - libv=
irt with RSS </div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Aug 31, 2021 at 6:00 PM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Yuri Benditovich &lt;<a=
 href=3D"mailto:yuri.benditovich@daynix.com" target=3D"_blank">yuri.bendito=
vich@daynix.com</a>&gt; writes:<br>
<br>
&gt; On Mon, Aug 30, 2021 at 11:14 AM Markus Armbruster &lt;<a href=3D"mail=
to:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com=
" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Mon, Aug 30, 2021 at 9:10 AM Markus Armbruster &lt;<a href=
=3D"mailto:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; w=
rote:<br>
<br>
[...]<br>
<br>
&gt;&gt; &gt;&gt; So let&#39;s try again: if libvirt does use the wrong RSS=
 helper, how does<br>
&gt;&gt; &gt;&gt; the system behave?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The receive-side scaling may work incorrectly, i.e. finally m=
ay move<br>
&gt;&gt; &gt; incoming packets to a virtqueue different than expected one.<=
br>
&gt;&gt;<br>
&gt;&gt; Then I&#39;m confused about the purpose of &quot;the stamp&quot; m=
entioned below.=C2=A0 Can<br>
&gt;&gt; you enlighten me?<br>
&gt;<br>
&gt; The stamp is a string (common for qemu executable and RSS helper<br>
&gt; executable during build) that qemu can later retrieve from the helper<=
br>
&gt; in run-time and ensure this helper is fully compatible with this build=
<br>
&gt; of qemu (in terms of eBPF operation). The helper is built with the<br>
&gt; same C headers (related to ebpf operation) as the qemu, the qemu is<br=
>
&gt; able to receive file descriptors created by the helper (of ebpf<br>
&gt; program and ebpf data structure&#39;s maps) from libvirt and deal with=
<br>
&gt; them as if it has created them.<br>
<br>
Thanks.<br>
<br>
I tried to apply your series to check a few of my assumptions, but I&#39;m<=
br>
getting conflicts.=C2=A0 Got something I could git-pull?<br>
<br>
[...]<br>
<br>
</blockquote></div>

--0000000000000d0d1a05cae01690--

