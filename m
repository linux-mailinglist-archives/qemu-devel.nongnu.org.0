Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F63B5D15
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:19:41 +0200 (CEST)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpIi-00011Z-Pj
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lxpHj-0000KE-Et
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:18:39 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lxpHh-00035l-GX
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:18:39 -0400
Received: by mail-oi1-x22b.google.com with SMTP id o6so6988014oic.9
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 04:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FQNDpSSlwwV4B/vu7797RqrPv/YAuT1bvP/u1aipXZ4=;
 b=bSIMbNI8LpXjvTUCyync1jaGUZARiYE2BVUKpja3HGfQowottkvnsCjMPdDzMeakgA
 uCyMbeGdc8nKF/vYfvKxGhUXqLpoCZQz/fVcRwwXIslt+ai1HixvCdCus/MXM7FGe2o/
 j4gmRve49qrvGavWmAIZNCN2oTkASQvo4kANSIPhhNktIfh6k5+Qx/qm11CqctwYFMSG
 2Jm4jm8wwxhHvOX2BJrfQ5QtwyeG0wN+aQ6odjUeJCQ1l2gyWROem7JAfIfcPwuoXQ+Z
 ZAnpGFUqWRXrXeh2yqi6SFaIKwwiEu9wsD9tEc2jPSsJiZ4PXKAIpsBc/svvhWI6jOnF
 Thiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FQNDpSSlwwV4B/vu7797RqrPv/YAuT1bvP/u1aipXZ4=;
 b=QvZhZ1+PCjP0bvAeBsJEb6sx0cbeI16oChqcVQ0Nwg63AGtr3n79mAJ5EnwOThVy30
 9Qxu/xwHzPnTIPgTet7a6cF27FSAZMX/0+ev1rU1owWPZDdDwQ5WVxhBzk2bLhUNXSKk
 VtPImM4kJAOlAeoVO/54FQt2HG4icj7zofQ8tX8EJTiZoXHP6KhpyOQKVw6wHQ4w1AJe
 FXeSwmHrQ3mkncLpPgf5DIr6PCPqX9udjQ7fAay6Fhl0wURJPH/pMOmrADP2MBLnKPvu
 Wx4C7DQK0B14RPqh0YeAW9Me2/iKUSrWa8WBCYlhEpH2WSiTmVgX2c/4HsbyLmgYkReS
 fe5A==
X-Gm-Message-State: AOAM532aSrOMJUcs2U7MyqYXApkUm+cqtUuqUA3ercm+aQIh1vUq8YSe
 bYRNdKwCEyrUeFebl7fR2iTlEB42EaVjcp2GTE5QAg==
X-Google-Smtp-Source: ABdhPJzHtwX7UzMEPgfAK0rJd18/9GE4uNWMNvMCEtinIzwp5vq/Wr57n/E7K9AqsuG5PUm4uZMg/eY4iB9C6jceQKQ=
X-Received: by 2002:a54:4703:: with SMTP id k3mr15053935oik.91.1624879115408; 
 Mon, 28 Jun 2021 04:18:35 -0700 (PDT)
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
In-Reply-To: <965bb2c1-64c5-eeb2-6f35-52dd2652d1be@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 28 Jun 2021 14:18:23 +0300
Message-ID: <CAOEp5OfgkpRhw-dDB+X-XAPsrTushFWVEiMfee5pAwdNQS-xCA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::22b;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 3:47 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/22 =E4=B8=8B=E5=8D=885:09, Toke H=C3=B8iland-J=C3=B8rgen=
sen =E5=86=99=E9=81=93:
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >
> >> On Tue, Jun 22, 2021 at 10:25:19AM +0200, Toke H=C3=B8iland-J=C3=B8rge=
nsen wrote:
> >>> Jason Wang <jasowang@redhat.com> writes:
> >>>
> >>>> =E5=9C=A8 2021/6/22 =E4=B8=8A=E5=8D=8811:29, Yuri Benditovich =E5=86=
=99=E9=81=93:
> >>>>> On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com> w=
rote:
> >>>>>> =E5=9C=A8 2021/6/19 =E4=B8=8A=E5=8D=884:03, Andrew Melnichenko =E5=
=86=99=E9=81=93:
> >>>>>>> Hi Jason,
> >>>>>>> I've checked "kernel.unprivileged_bpf_disabled=3D0" on Fedora,  U=
buntu,
> >>>>>>> and Debian - no need permissions to update BPF maps.
> >>>>>> How about RHEL :) ?
> >>>>> If I'm not mistaken, the RHEL releases do not use modern kernels ye=
t
> >>>>> (for BPF we need 5.8+).
> >>>>> So this will be (probably) relevant for RHEL 9. Please correct me i=
f I'm wrong.
> >>>> Adding Toke for more ideas on this.
> >>> Ignore the kernel version number; we backport all of BPF to RHEL,
> >>> basically. RHEL8.4 is up to upstream kernel 5.10, feature-wise.
> >>>
> >>> However, we completely disable unprivileged BPF on RHEL kernels. Also=
,
> >>> there's upstream commit:
> >>> 08389d888287 ("bpf: Add kconfig knob for disabling unpriv bpf by defa=
ult")
> >>>
> >>> which adds a new value of '2' to the unprivileged_bpf_disable sysctl.=
 I
> >>> believe this may end up being the default on Fedora as well.
> >>>
> >>> So any design relying on unprivileged BPF is likely to break; I'd
> >>> suggest you look into how you can get this to work with CAP_BPF :)
> >> QEMU will never have any capabilities. Any resources that required
> >> privileges have to be opened by a separate privileged helper, and the
> >> open FD then passed across to the QEMU process. This relies on the
> >> capabilities checks only being performed at time of initial opening,
> >> and *not* on operations performed on the already open FD.
> > That won't work for regular map updates either, unfortunately: you stil=
l
> > have to perform a bpf() syscall to update an element, and that is a
> > privileged operation.
> >
> > You may be able to get around this by using an array map type and
> > mmap()'ing the map contents, but I'm not sure how well that will work
> > across process boundaries.
> >
> > If it doesn't, I only see two possibilities: populate the map
> > ahead-of-time and leave it in place, or keep the privileged helper
> > process around to perform map updates on behalf of QEMU...
>
>
> Right, and this could be probably done by extending and tracking the RSS
> update via rx filter event.

Jason,
Can you please get a little into details - what you mean by 'extending
and tracking the RSS
> update via rx filter event'?

Thanks,
Yuri

>
> Thanks
>
>
> >
> > -Toke
> >
>

