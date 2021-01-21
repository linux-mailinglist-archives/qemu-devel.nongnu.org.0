Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB032FF693
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:57:35 +0100 (CET)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2h1J-0002T5-O8
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l2gzN-0001lU-Si
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l2gzH-0003CT-G7
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611262526;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ouuINGgZVUfNRHgze7BWNbcQFVs0Yf7zkGyglpslQSI=;
 b=aCfo6HHVumfQpYvCFeOPLctGh9s4y3J4GTd3iVsrUBl3hiqkX2KREPrK3MuMdq+KdursHa
 iJn0y/fzrxPSm0SHAyw+DMhS4ma0e4x0u2QxtlZXg/HTpQYoiQ4BgDDpCCiy2MGvwAziOF
 SBM8ErkWJlRyiCjtFFrK2AvaJiAIuOA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-3L_P_ZHaMuSDB9enTlKLfw-1; Thu, 21 Jan 2021 15:55:23 -0500
X-MC-Unique: 3L_P_ZHaMuSDB9enTlKLfw-1
Received: by mail-wr1-f71.google.com with SMTP id x12so1833726wrw.21
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ouuINGgZVUfNRHgze7BWNbcQFVs0Yf7zkGyglpslQSI=;
 b=WcPkh1N+GMU7DDJTQUISFxsWtRn+/IF2OFQ2FepZB4HgzrWc9RzsY4QfsnJ3+ToyWJ
 MgCH6gOB2bAl7TIz+2uwq58ZM5n9Y5++4DYdoUCDUliSTkNSKbNmc9jH7k+ZKI0pQxgS
 tk3m5RnFuwlhKEeMMNV+BC5js78J2a7rn51bfO97LZGg+XlSw4KlX0dO7/fGB0B34VmC
 ZaVaRhggYuMNKuWKWHGEe2LNcQ6wQS9mbRTFBohUbHiFLWq8aI/WDoly29O9Yyyv1gP1
 UUgMDoXEorKpDnXl4dwVU5wLOwRf0SFeVQ+t8h5gwlQrFDhNcL+jhzibPOJewbWvMgpI
 uNYQ==
X-Gm-Message-State: AOAM532zofBzzXV2JzdrdtW/U2bTF/+otgc3+1mxluSntQM5yLiGUUvk
 i2aOjDV3vBRIstMa/rE6SN0BVRwxkL/cuABsOHdyvR0S8GtkdbZIY9CYC9OpQuritd0UAN84Oki
 ZniNyCJyM+3bJWDTeluD70UpxbuEggXE=
X-Received: by 2002:adf:e541:: with SMTP id z1mr1219088wrm.143.1611262522255; 
 Thu, 21 Jan 2021 12:55:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrU54K7gimpyH5U9KTkU3aFAghlRz5rCiIfMKNh+Xf1rph5IImkn/K24nMRr7+YYO1/+8eCtJu2L6Pudqx09g=
X-Received: by 2002:adf:e541:: with SMTP id z1mr1219068wrm.143.1611262521927; 
 Thu, 21 Jan 2021 12:55:21 -0800 (PST)
MIME-Version: 1.0
References: <0A9D3682-CE03-4984-AC06-83DA0ABF7BDF@kamp.de>
 <CA+aFP1BvV8YsLqmO7nefO4u3cdVGY4DJsD95WbGrgbYKmRnGoQ@mail.gmail.com>
 <bae91481-ab1a-c255-5762-188e8eccc414@kamp.de>
In-Reply-To: <bae91481-ab1a-c255-5762-188e8eccc414@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Thu, 21 Jan 2021 15:55:10 -0500
Message-ID: <CA+aFP1DzdeHu2Q15Brn2g3gPVcNP+=Pz0iuc8cAoK8QrHA6eFQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] block/rbd: change request alignment to 1 byte
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: dillaman@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 3:29 PM Peter Lieven <pl@kamp.de> wrote:
>
> Am 21.01.21 um 20:42 schrieb Jason Dillaman:
> > On Wed, Jan 20, 2021 at 6:01 PM Peter Lieven <pl@kamp.de> wrote:
> >>
> >>> Am 19.01.2021 um 15:20 schrieb Jason Dillaman <jdillama@redhat.com>:
> >>>
> >>> =EF=BB=BFOn Tue, Jan 19, 2021 at 4:36 AM Peter Lieven <pl@kamp.de> wr=
ote:
> >>>>> Am 18.01.21 um 23:33 schrieb Jason Dillaman:
> >>>>> On Fri, Jan 15, 2021 at 10:39 AM Peter Lieven <pl@kamp.de> wrote:
> >>>>>> Am 15.01.21 um 16:27 schrieb Jason Dillaman:
> >>>>>>> On Thu, Jan 14, 2021 at 2:59 PM Peter Lieven <pl@kamp.de> wrote:
> >>>>>>>> Am 14.01.21 um 20:19 schrieb Jason Dillaman:
> >>>>>>>>> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrot=
e:
> >>>>>>>>>> since we implement byte interfaces and librbd supports aio on =
byte granularity we can lift
> >>>>>>>>>> the 512 byte alignment.
> >>>>>>>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
> >>>>>>>>>> ---
> >>>>>>>>>> block/rbd.c | 2 --
> >>>>>>>>>> 1 file changed, 2 deletions(-)
> >>>>>>>>>> diff --git a/block/rbd.c b/block/rbd.c
> >>>>>>>>>> index 27b4404adf..8673e8f553 100644
> >>>>>>>>>> --- a/block/rbd.c
> >>>>>>>>>> +++ b/block/rbd.c
> >>>>>>>>>> @@ -223,8 +223,6 @@ done:
> >>>>>>>>>> static void qemu_rbd_refresh_limits(BlockDriverState *bs, Erro=
r **errp)
> >>>>>>>>>> {
> >>>>>>>>>>    BDRVRBDState *s =3D bs->opaque;
> >>>>>>>>>> -    /* XXX Does RBD support AIO on less than 512-byte alignme=
nt? */
> >>>>>>>>>> -    bs->bl.request_alignment =3D 512;
> >>>>>>>>> Just a suggestion, but perhaps improve discard alignment, max d=
iscard,
> >>>>>>>>> optimal alignment (if that's something QEMU handles internally)=
 if not
> >>>>>>>>> overridden by the user.
> >>>>>>>> Qemu supports max_discard and discard_alignment. Is there a call=
 to get these limits
> >>>>>>>> from librbd?
> >>>>>>>> What do you mean by optimal_alignment? The object size?
> >>>>>>> krbd does a good job of initializing defaults [1] where optimal a=
nd
> >>>>>>> discard alignment is 64KiB (can actually be 4KiB now), max IO siz=
e for
> >>>>>>> writes, discards, and write-zeroes is the object size * the strip=
e
> >>>>>>> count.
> >>>>>> Okay, I will have a look at it. If qemu issues a write, discard, w=
rite_zero greater than
> >>>>>> obj_size  * stripe count will librbd split it internally or will t=
he request fail?
> >>>>> librbd will handle it as needed. My goal is really just to get the
> >>>>> hints down the guest OS.
> >>>>>> Regarding the alignment it seems that rbd_dev->opts->alloc_size is=
 something that comes from the device
> >>>>>> configuration and not from rbd? I don't have that information insi=
de the Qemu RBD driver.
> >>>>> librbd doesn't really have the information either. The 64KiB guess
> >>>>> that krbd uses was a compromise since that was the default OSD
> >>>>> allocation size for HDDs since Luminous. Starting with Pacific that
> >>>>> default is going down to 4KiB.
> >>>> I will try to adjust these values as far as it is possible and makes=
 sense.
> >>>> Is there a way to check the minimum supported OSD release in the bac=
kend from librbd / librados?
> >>> It's not a minimum -- RADOS will gladly access 1 byte writes as well.
> >>> It's really just the optimal (performance and space-wise). Sadly,
> >>> there is no realistic way to query this data from the backend.
> >> So you would suggest to advertise an optimal transfer length of 64k an=
d max transfer length of obj size * stripe count to the guest unless we hav=
e an API in the future to query these limits from the backend?
> > I'll open a Ceph tracker ticket to expose these via the API in a future=
 release.
>
>
> That would be good to have!
>
>
> >
> >> I would leave request alignment at 1 byte as otherwise Qemu will issue=
 RMWs for all write requests that do not align. Everything that comes from =
a guest OS is very likely 4k aligned anyway.
> > My goal is definitely not to have QEMU do any extra work for splitting
> > or aligning IOs. I am really only trying to get hints passed down the
> > guest via the virtio drivers. If there isn't the plumbing in QEMU for
> > that yet, disregard.
>
>
> From what I read from the code Qemu emulates the Block Limits VPD Page fo=
r virtio-scsi, but the limits there are not taken from the backend driver. =
They can be passed as config to the virtio-scsi device.
>
> However, Qemu uses all the Block Limit that can be found in include/block=
/block_int.h in the BlockLimits struct to generate optimal requests if it c=
omes to block operations like mirroring, or zeroing of a whole
>
> device etc. Some of the alignments (e.g. the request alignment) have dire=
ct influence and make Qemu split requests from the guest or even make RMW c=
ycles.
>
> If my understanding is incorrect please anyone correct me.
>
>
> It would indeed be nice to have an option to propagate the settings from =
the backend driver into the Guest. But from my understanding this is not th=
ere yet.
>
>
> So I would leave it as it. Drop the request_alignment =3D 512 (like in th=
e patch) and just advertise the cluster_size at obj_size. This is already i=
n the rbd driver today.
>
> The cluster_size e.g. is used in any qemu-img convert operation to align =
read / write requests and size them apropiately.

+1 to leave as-is until we can pass those hints down.

> Peter
>
>

Thanks!

--=20
Jason


