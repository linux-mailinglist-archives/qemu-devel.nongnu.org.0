Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169534A3B8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:10:15 +0100 (CET)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPiTu-0002Ld-EF
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lPiT0-0001vb-50
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:09:18 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:39900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lPiSy-0000Z5-1W
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:09:17 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso1145479ooq.6
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AMKaetSB+UaAGWecK+6nSkMORGJOZbFbmTWQ7uVrXWU=;
 b=FLEWRu56v6lpudrDB65n5nU6/wy/SOdg8FUBZpK+2BeQWCvuKw7co6hjDABbUljSg7
 /EWIBKb0t5YkwRWnzXi3VzkEobLjQr/cjRJkrSG+yVyhV8BWDj56RkGmz4xqDIO0uCRj
 bTALizl9aHi9UNqV4634Y+KehXTN1fCCk64R5YxDBlYes/u52CfIXrchQLnT8rqLEbrI
 a/pq+SCgtl1qvjrHPLY+JoPWJfF/wFFkSz2qrHx6982GKDTUcwr2NmIOH7VWh4kW2mH0
 DeskT0igPubedcf7fxvxEMuzB8OYqWK1u0rX8S1Jyer8gSBFJRbm6PQXdwHinRyfj9BT
 lTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AMKaetSB+UaAGWecK+6nSkMORGJOZbFbmTWQ7uVrXWU=;
 b=Sgn0fz4IRYhE4tnIUsaeNcrBYAbSQGxOzbMBJLeHGjUeM106c1goiyQsGbM5ZjVTQf
 dEIxQgDpSnPt+f4y3mDg5nEX9RPkCNvUfDEpLLMRGwptBOZn/Y1fUIBpu4CtUPQk7dRg
 X1HwjcnmLvv6ncYx3hF4ce7vd7tqJ0U9WxlAHI470M/KV4WC9Eq0FXLX4OvbhUv+AnXv
 2aQ227hi5+kCC1wUcj3/EWGJdwwaY9LponMgatO180geL4FC9BU8X8K6CDBqRQBDgip7
 lue26kVALyS1BNCcYcGmhqADaCl+nrBUEvh+TU1Imz8iWKzCt/5BGtTgEoXkzWsyjzc4
 4IBw==
X-Gm-Message-State: AOAM530GGnZAlo1W61Og+ObyHy2W5g8jrW9+yZVDqF/X6oiT9xxmm4Nz
 uneVJGuhUeZyJ10LfgjTfndHnK8kgX1gacVdelvtmg==
X-Google-Smtp-Source: ABdhPJwEPZ/YYWDK7UFR9KhrqoMikhZcTVTipsnLYFl/CX4xylh13GPHvNh/qBBNl0Pu66WQZjyoEdef75sGIJYSPig=
X-Received: by 2002:a05:6820:58:: with SMTP id
 v24mr10438875oob.55.1616749754228; 
 Fri, 26 Mar 2021 02:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210322122452.369750-1-yuri.benditovich@daynix.com>
 <aa33a355-5980-5ff5-7264-02d6fc7f5f9d@redhat.com>
 <CAOEp5Od+jPYdmFdD3z3hVjs5t6QXgmEoOTPHO5cLVyifjmjgRQ@mail.gmail.com>
 <e3971d80-6b7c-2e47-9ee9-41f08d0a9df9@redhat.com>
In-Reply-To: <e3971d80-6b7c-2e47-9ee9-41f08d0a9df9@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Fri, 26 Mar 2021 12:09:02 +0300
Message-ID: <CAOEp5OfBpq_DjD4k_enGCuDkV9d738wyW9ye6Uk9vsnD+jS7eA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] virtio-net: graceful drop of vhost for TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::c36;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oo1-xc36.google.com
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 10:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/25 =E4=B8=8B=E5=8D=885:00, Yuri Benditovich =E5=86=99=E9=
=81=93:
> > Hi Jason,
> >
> > This was discussed earlier on the previous series of patches.
> > https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01829.html
> > There were strong objections from both Daniel and Michael and I feel
> > that the series was rejected.
> > There was Michael's claim:
> > "We did what this patch is trying to change for years now, in
> > particular KVM also seems to happily disable CPU features not supported
> > by kernel so I wonder why we can't keep doing it, with tweaks for some
> > corner cases."
>
>
> So for cpu feautres, it works since the management have other tool to
> the cpuid. Then management will make sure the migration happens amongs
> the hosts that is compatibile with the same cpuid sets.
>
> For vhost, we don't have such capabilities, that's why I think we need
> to have fallback.
>
Hi Jason,
What, from your POV was the result of v1 discussion?
IMO, there was one critical comment that the patch does not address
'forcevhost' properly (indeed).
IMO, there are many comments from Daniel and Michael that in the sum
say that this change is not what they would like.
If I'm mistaken please let me know.

I have no problem to send v3 =3D v1 + handling of ''forcevhost'
If this is what you want, please let me know also.

>
> > https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03187.html
> > And it was Michael's question:
> > "Can we limit the change to when a VM is migrated in?"
> > https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03163.html
> > So I'm trying to suggest another approach:
> > - In case of conflicting features (for example RSS and vhost) we in
> > qemu we do not have enough information to prefer one or another.
> > - If we drop to userspace in the first set_features we say: "vhost is
> > less important than other requested features"
> > - This series keeps backward compatibility, i.e. if you start with
> > vhost and some features are not available - they are silently cleared.
> > - But in case the features are available on source machine - they are u=
sed
> > - In case of migration this series says: "We prefer successful
> > migration even if for that we need to drop to userspace"
> > - On the migration back to the 1st system we again work with all the
> > features and with vhost as all the features are available.
>
>
> One issue for this approach is that. Consider we had two drivers:
>
> 1) Driver A that supports split only
> 2) Driver B that supports packed
>
> Consider src support packed but dest doesn't
>
> So switching driver A to driver B works without migration. But if we
> switch driver from A to B after migration it won't work?

I assume that  both src and dest started with vhost=3Don.

As driver B supports both packed and split, you can switch from driver
A to driver B after migration
and driver B will work with split. Exactly as it does today.

The key question is what is more important - vhost or features that
vhost does not support?
current code says: vhost is more important always
v1 patch says: features are more important always.
v2 patch says: vhost is more important at init time, features are more
important at migration time.
Because we are able to drop vhost but we can't drop features when we
have a running driver.
Do you agree?

>
> Thanks
>
>
> >
> > Thanks,
> > Yuri
> >
> >
> >
> > On Thu, Mar 25, 2021 at 8:59 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/3/22 =E4=B8=8B=E5=8D=888:24, Yuri Benditovich =E5=86=99=
=E9=81=93:
> >>> Allow fallback to userspace only upon migration, only for specific fe=
atures
> >>> and only if 'vhostforce' is not requested.
> >>>
> >>> Changes from v1:
> >>> Patch 1 dropeed (will be submitted in another series)
> >>> Added device callback in case the migration should fail due to missin=
g features
> >>
> >> Hi Yuri:
> >>
> >> Have a quick glance at the series. A questions is why we need to do th=
e
> >> fallback only during load?
> >>
> >> I think we should do it in the device initializating. E.g when the vho=
st
> >> features can not satisfy, we should disable vhost since there.
> >>
> >> Thanks
> >>
> >>
> >>> Yuri Benditovich (3):
> >>>     net: add ability to hide (disable) vhost_net
> >>>     virtio: introduce 'missing_features_migrated' device callback
> >>>     virtio-net: implement missing_features_migrated callback
> >>>
> >>>    hw/net/vhost_net.c         |  4 ++-
> >>>    hw/net/virtio-net.c        | 51 ++++++++++++++++++++++++++++++++++=
++++
> >>>    hw/virtio/virtio.c         |  8 ++++++
> >>>    include/hw/virtio/virtio.h |  8 ++++++
> >>>    include/net/net.h          |  1 +
> >>>    5 files changed, 71 insertions(+), 1 deletion(-)
> >>>
>

