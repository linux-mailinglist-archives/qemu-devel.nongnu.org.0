Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354EB3B8734
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:42:08 +0200 (CEST)
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydHr-0006iE-8f
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lydGB-0005AF-Lm
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:40:23 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:35695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lydG8-0004av-90
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:40:23 -0400
Received: by mail-oi1-x231.google.com with SMTP id k206so3768140oif.2
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZfgXNDKbvTAh4Uo90gi5876RJBA8TzTKuQUPn6Cthdk=;
 b=RiubATkUqbkfOErA226iq5dHKWWC1bRSfGL/6ncMhLbZsoOpWMhztwbm6vcK3UKR4Z
 /LB1Nbz5oCfAWB8rMwBnKUI/igtQl2qr1k0dQFSdNAdpiuJKoJivtzbtdWkcd6aSi/HI
 Q2g3OKmbM/HdB5SeJllxdWIBsYdvPCHxzxrYicgB4274FIPrF+l3+9wh+nxHi2izNFyv
 P4wjGMfqHdwdGUyOsvxizbAo+klxqiaeOyrA/aqNgxTDQaKDrQyft4V53AasrF/XvHTz
 m0eSUyHI0dg56MAzIObf2kSQe2NIJhXMIl+V6ZTIsyyj9TE8lcaslcFdMRKIztjjvWM9
 pReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZfgXNDKbvTAh4Uo90gi5876RJBA8TzTKuQUPn6Cthdk=;
 b=ngIYmozZWqKVWH/KOC05+CnepqJZWEsgboc9rdhPggwzIbOMk5aDt0LUiOpHxqqeUV
 E8IXoMGI7F5TFISCPP0LETwcv6OLjESaIm7/OF40aHzLtcpEzYomIY08N9ZTZgDMPFA1
 ZX/9N9XtFWhuhlC5anODHXgSOSzAtTJFoJtP2Fp7Ol1wZu703+/F3MYrICNOTsGF8ML/
 sw/6GwDJS2x/zQ0Hwz/jiFhDXXFmON7Va05cWlqkUviH9dm8gPvFOlUvzRsvAC4+pDXJ
 REQubgzOyPmV9PcNqXzHifyv/bhchDEsKJcfOFkYoIM9MCqbz0MiZrhmz0+4iKlXLWua
 egEQ==
X-Gm-Message-State: AOAM531uxY6sUxYHB3XSJviGqVMQolu9RsQf0oNQIrxhzhOaU/Urn7GS
 0TIMQElt3epFTMNuKSbybBP1SEK2GSZkNxKk98vBaQ==
X-Google-Smtp-Source: ABdhPJw2ubPz9gqpOhPVWbZS2nK9bIGHOz21jfvUeDQcKWpm6spphwy23lDsvGmKqmQCm96uHApFaynBDtnA0kvOK0o=
X-Received: by 2002:aca:d406:: with SMTP id l6mr3775888oig.18.1625071218747;
 Wed, 30 Jun 2021 09:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
 <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
 <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com> <87o8byqpao.fsf@toke.dk>
 <YNGe3iiZ103ps36n@redhat.com> <87im26qn9q.fsf@toke.dk>
 <965bb2c1-64c5-eeb2-6f35-52dd2652d1be@redhat.com>
 <CAOEp5OfgkpRhw-dDB+X-XAPsrTushFWVEiMfee5pAwdNQS-xCA@mail.gmail.com>
 <3a058e95-e45a-db5a-ef2f-4491e8c40d79@redhat.com>
In-Reply-To: <3a058e95-e45a-db5a-ef2f-4491e8c40d79@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 30 Jun 2021 19:40:07 +0300
Message-ID: <CABcq3pHoEU-r6AJaUsmzS+zULJMyoqRFXE1zTspiE4K2wo68Cw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ba7dd905c5fe6078"
Received-SPF: none client-ip=2607:f8b0:4864:20::231;
 envelope-from=andrew@daynix.com; helo=mail-oi1-x231.google.com
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ba7dd905c5fe6078
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all.
Thank you for ur comments.
I've tested few possible solutions and I'll prepare new patches for RFC
with mmap() based eBPF in the near future.

On Tue, Jun 29, 2021 at 6:39 AM Jason Wang <jasowang@redhat.com> wrote:

>
> =E5=9C=A8 2021/6/28 =E4=B8=8B=E5=8D=887:18, Yuri Benditovich =E5=86=99=E9=
=81=93:
> > On Wed, Jun 23, 2021 at 3:47 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/6/22 =E4=B8=8B=E5=8D=885:09, Toke H=C3=B8iland-J=C3=B8r=
gensen =E5=86=99=E9=81=93:
> >>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >>>
> >>>> On Tue, Jun 22, 2021 at 10:25:19AM +0200, Toke H=C3=B8iland-J=C3=B8r=
gensen
> wrote:
> >>>>> Jason Wang <jasowang@redhat.com> writes:
> >>>>>
> >>>>>> =E5=9C=A8 2021/6/22 =E4=B8=8A=E5=8D=8811:29, Yuri Benditovich =E5=
=86=99=E9=81=93:
> >>>>>>> On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com>
> wrote:
> >>>>>>>> =E5=9C=A8 2021/6/19 =E4=B8=8A=E5=8D=884:03, Andrew Melnichenko =
=E5=86=99=E9=81=93:
> >>>>>>>>> Hi Jason,
> >>>>>>>>> I've checked "kernel.unprivileged_bpf_disabled=3D0" on Fedora,
> Ubuntu,
> >>>>>>>>> and Debian - no need permissions to update BPF maps.
> >>>>>>>> How about RHEL :) ?
> >>>>>>> If I'm not mistaken, the RHEL releases do not use modern kernels
> yet
> >>>>>>> (for BPF we need 5.8+).
> >>>>>>> So this will be (probably) relevant for RHEL 9. Please correct me
> if I'm wrong.
> >>>>>> Adding Toke for more ideas on this.
> >>>>> Ignore the kernel version number; we backport all of BPF to RHEL,
> >>>>> basically. RHEL8.4 is up to upstream kernel 5.10, feature-wise.
> >>>>>
> >>>>> However, we completely disable unprivileged BPF on RHEL kernels.
> Also,
> >>>>> there's upstream commit:
> >>>>> 08389d888287 ("bpf: Add kconfig knob for disabling unpriv bpf by
> default")
> >>>>>
> >>>>> which adds a new value of '2' to the unprivileged_bpf_disable
> sysctl. I
> >>>>> believe this may end up being the default on Fedora as well.
> >>>>>
> >>>>> So any design relying on unprivileged BPF is likely to break; I'd
> >>>>> suggest you look into how you can get this to work with CAP_BPF :)
> >>>> QEMU will never have any capabilities. Any resources that required
> >>>> privileges have to be opened by a separate privileged helper, and th=
e
> >>>> open FD then passed across to the QEMU process. This relies on the
> >>>> capabilities checks only being performed at time of initial opening,
> >>>> and *not* on operations performed on the already open FD.
> >>> That won't work for regular map updates either, unfortunately: you
> still
> >>> have to perform a bpf() syscall to update an element, and that is a
> >>> privileged operation.
> >>>
> >>> You may be able to get around this by using an array map type and
> >>> mmap()'ing the map contents, but I'm not sure how well that will work
> >>> across process boundaries.
> >>>
> >>> If it doesn't, I only see two possibilities: populate the map
> >>> ahead-of-time and leave it in place, or keep the privileged helper
> >>> process around to perform map updates on behalf of QEMU...
> >>
> >> Right, and this could be probably done by extending and tracking the R=
SS
> >> update via rx filter event.
> > Jason,
> > Can you please get a little into details - what you mean by 'extending
> > and tracking the RSS
>
>
> There's a monitor event which could be used for qemu to notify the
> privileged application (e.g the one has CAP_NET_ADMIN) to update the rx
> filter attributes of the host networking device.
>
> It works like, when the rx filters is updated by guest, qemu will
> generate an rx filter update event (see rxfilter_notify()) which could
> be captured by the privileged application.
>
> Then the privileged application query rx filter information via
> query-rx-filter command and do the proper setups.
>
> This is designed for macvtap but I think it might be used by RSS as well.
>
> The helper can monitor the rx-filter event and update the eBPF maps. But
> I'm not sure if it needs some coordination with libvirt in this case.
>
> Thanks
>
>
> >> update via rx filter event'?
> > Thanks,
> > Yuri
> >
> >> Thanks
> >>
> >>
> >>> -Toke
> >>>
>
>

--000000000000ba7dd905c5fe6078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, all.</div><div>Thank you for ur comments.</div><d=
iv>I&#39;ve tested few possible solutions and I&#39;ll prepare new patches =
for RFC with mmap() based eBPF in the near future.<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 29,=
 2021 at 6:39 AM Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jaso=
wang@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
=E5=9C=A8 2021/6/28 =E4=B8=8B=E5=8D=887:18, Yuri Benditovich =E5=86=99=E9=
=81=93:<br>
&gt; On Wed, Jun 23, 2021 at 3:47 AM Jason Wang &lt;<a href=3D"mailto:jasow=
ang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =E5=9C=A8 2021/6/22 =E4=B8=8B=E5=8D=885:09, Toke H=C3=B8iland-J=C3=
=B8rgensen =E5=86=99=E9=81=93:<br>
&gt;&gt;&gt; Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank">berrange@redhat.com</a>&gt; writes:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, Jun 22, 2021 at 10:25:19AM +0200, Toke H=C3=B8ilan=
d-J=C3=B8rgensen wrote:<br>
&gt;&gt;&gt;&gt;&gt; Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" =
target=3D"_blank">jasowang@redhat.com</a>&gt; writes:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; =E5=9C=A8 2021/6/22 =E4=B8=8A=E5=8D=8811:29, Yuri =
Benditovich =E5=86=99=E9=81=93:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Jun 21, 2021 at 12:20 PM Jason Wang &l=
t;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@redhat.=
com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; =E5=9C=A8 2021/6/19 =E4=B8=8A=E5=8D=884:03=
, Andrew Melnichenko =E5=86=99=E9=81=93:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi Jason,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;ve checked &quot;kernel.unprivil=
eged_bpf_disabled=3D0&quot; on Fedora,=C2=A0 Ubuntu,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and Debian - no need permissions to up=
date BPF maps.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; How about RHEL :) ?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; If I&#39;m not mistaken, the RHEL releases do =
not use modern kernels yet<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; (for BPF we need 5.8+).<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; So this will be (probably) relevant for RHEL 9=
. Please correct me if I&#39;m wrong.<br>
&gt;&gt;&gt;&gt;&gt;&gt; Adding Toke for more ideas on this.<br>
&gt;&gt;&gt;&gt;&gt; Ignore the kernel version number; we backport all of B=
PF to RHEL,<br>
&gt;&gt;&gt;&gt;&gt; basically. RHEL8.4 is up to upstream kernel 5.10, feat=
ure-wise.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; However, we completely disable unprivileged BPF on RHE=
L kernels. Also,<br>
&gt;&gt;&gt;&gt;&gt; there&#39;s upstream commit:<br>
&gt;&gt;&gt;&gt;&gt; 08389d888287 (&quot;bpf: Add kconfig knob for disablin=
g unpriv bpf by default&quot;)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; which adds a new value of &#39;2&#39; to the unprivile=
ged_bpf_disable sysctl. I<br>
&gt;&gt;&gt;&gt;&gt; believe this may end up being the default on Fedora as=
 well.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; So any design relying on unprivileged BPF is likely to=
 break; I&#39;d<br>
&gt;&gt;&gt;&gt;&gt; suggest you look into how you can get this to work wit=
h CAP_BPF :)<br>
&gt;&gt;&gt;&gt; QEMU will never have any capabilities. Any resources that =
required<br>
&gt;&gt;&gt;&gt; privileges have to be opened by a separate privileged help=
er, and the<br>
&gt;&gt;&gt;&gt; open FD then passed across to the QEMU process. This relie=
s on the<br>
&gt;&gt;&gt;&gt; capabilities checks only being performed at time of initia=
l opening,<br>
&gt;&gt;&gt;&gt; and *not* on operations performed on the already open FD.<=
br>
&gt;&gt;&gt; That won&#39;t work for regular map updates either, unfortunat=
ely: you still<br>
&gt;&gt;&gt; have to perform a bpf() syscall to update an element, and that=
 is a<br>
&gt;&gt;&gt; privileged operation.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; You may be able to get around this by using an array map type =
and<br>
&gt;&gt;&gt; mmap()&#39;ing the map contents, but I&#39;m not sure how well=
 that will work<br>
&gt;&gt;&gt; across process boundaries.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If it doesn&#39;t, I only see two possibilities: populate the =
map<br>
&gt;&gt;&gt; ahead-of-time and leave it in place, or keep the privileged he=
lper<br>
&gt;&gt;&gt; process around to perform map updates on behalf of QEMU...<br>
&gt;&gt;<br>
&gt;&gt; Right, and this could be probably done by extending and tracking t=
he RSS<br>
&gt;&gt; update via rx filter event.<br>
&gt; Jason,<br>
&gt; Can you please get a little into details - what you mean by &#39;exten=
ding<br>
&gt; and tracking the RSS<br>
<br>
<br>
There&#39;s a monitor event which could be used for qemu to notify the <br>
privileged application (e.g the one has CAP_NET_ADMIN) to update the rx <br=
>
filter attributes of the host networking device.<br>
<br>
It works like, when the rx filters is updated by guest, qemu will <br>
generate an rx filter update event (see rxfilter_notify()) which could <br>
be captured by the privileged application.<br>
<br>
Then the privileged application query rx filter information via <br>
query-rx-filter command and do the proper setups.<br>
<br>
This is designed for macvtap but I think it might be used by RSS as well.<b=
r>
<br>
The helper can monitor the rx-filter event and update the eBPF maps. But <b=
r>
I&#39;m not sure if it needs some coordination with libvirt in this case.<b=
r>
<br>
Thanks<br>
<br>
<br>
&gt;&gt; update via rx filter event&#39;?<br>
&gt; Thanks,<br>
&gt; Yuri<br>
&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; -Toke<br>
&gt;&gt;&gt;<br>
<br>
</blockquote></div>

--000000000000ba7dd905c5fe6078--

