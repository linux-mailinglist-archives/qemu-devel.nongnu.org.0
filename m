Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C62C6857
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:00:10 +0100 (CET)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifEH-0001Hj-6L
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kif4G-00051c-4W
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:49:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kif4C-0004NF-Tm
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606488584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjOraE76O1+wHLrqlE/trIBrkDhMJfdWvsWOZU9nPjY=;
 b=Yb7whXGFxMuLbug/wOT/CL1BMyeSZG3oygLJ7j+t6wDx/txZ/UeCagoknM/A/qh/5l3dLG
 NxdKkhMLx66Wi0NYO8vnO3cKnrxGud935YTmN8cp/MjYJZAio9ZUIG/q6IVqEXrbRiXt1f
 hv5Gn3CDqeSW96mxHO6isVwmsrEATL8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-ME0WLtqYOX2Z0g0sgYP0Xg-1; Fri, 27 Nov 2020 09:49:41 -0500
X-MC-Unique: ME0WLtqYOX2Z0g0sgYP0Xg-1
Received: by mail-ed1-f70.google.com with SMTP id i89so2493328edd.15
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 06:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tjOraE76O1+wHLrqlE/trIBrkDhMJfdWvsWOZU9nPjY=;
 b=mOvho8gl1z8JiDg0SsRxhA3EmMPJ359u96ZnnuYHRRmk5CnpQVug8XIVUK4x58gl1j
 HnK00/XNUDGLKEEnWMrccDWUrGNhyuCv41In3ryvdTatiDAF/NXNdkvfaXSzQzhABI1w
 kWnAOQw9MDdny8j4VHIwDLnV9FMq2caLIfeXoLz9UTz2hT3CNU6VoYdkfm2aIdRdqzdT
 lHNEvpt4LANvFD4pYq2vBtU4hscX5EQhog34YgEjCwuGIG8sXOmE9/Y1TKTfEFgpAN/K
 IH8jMQKSKY7V8v1lydLe09ca71HyvD1Ubuj0sSFhlBX3aSs5fKqTonK8YUP/Kbuk8cZN
 qHDw==
X-Gm-Message-State: AOAM53097XuYy6nmT7EcxXnXM53tEN4z7DBIEnquqY2kELB9fjzz+e4h
 BvciSbRTzSYMwTis9QrPFzONQyQZLB8T0H1AxBb42eB8PjBhzJUWi45KgoOJF1iUwezpZszcxqb
 TI7YkaLPYZ3bHY7SZamDbkBMLY+wBTQk=
X-Received: by 2002:a17:906:ccd3:: with SMTP id
 ot19mr8328325ejb.44.1606488579705; 
 Fri, 27 Nov 2020 06:49:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziJgFCl3SeEdk5g3Cw/j2M9Xq0MAQaOYyNzm7aGtir3Q4ibmBMddEKx6RntKuUA2B5UE0nKlxXrqFTyxwYmKk=
X-Received: by 2002:a17:906:ccd3:: with SMTP id
 ot19mr8328309ejb.44.1606488579479; 
 Fri, 27 Nov 2020 06:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20201113103113.223239-1-mcascell@redhat.com>
 <f24438ed-ee77-0583-3570-b18514292404@redhat.com>
 <CAA8xKjX5a1cTY=Zr+XvHsixrSTiCw9FvGg1Z-=5Yw7pWV6xweA@mail.gmail.com>
 <aef28782-aa5b-ea53-e112-1e4bf4fbd722@redhat.com>
 <CAA8xKjUuxtGnGqgz+J=G0TZhvu-JfWjz-fjROMhYsZrBSmAGVQ@mail.gmail.com>
 <204556ad-c6ab-2caa-aee8-3e3f7e0f60c2@redhat.com>
In-Reply-To: <204556ad-c6ab-2caa-aee8-3e3f7e0f60c2@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 27 Nov 2020 15:49:28 +0100
Message-ID: <CAA8xKjVjXeGp5irAjzT308LPq2iBeSFWPx90wVPByEZNsxaeTg@mail.gmail.com>
Subject: Re: [PATCH v2] net/e1000e_core: adjust count if RDH exceeds RDT in
 e1000e_ring_advance()
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gaoning.pgn@antgroup.com, 330cjfdn@gmail.com,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 6:21 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/11/24 =E4=B8=8A=E5=8D=885:30, Mauro Matteo Cascella wrote:
> > On Thu, Nov 19, 2020 at 6:57 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2020/11/18 =E4=B8=8B=E5=8D=884:53, Mauro Matteo Cascella wrote:
> >>> On Wed, Nov 18, 2020 at 4:56 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>> On 2020/11/13 =E4=B8=8B=E5=8D=886:31, Mauro Matteo Cascella wrote:
> >>>>> The e1000e_write_packet_to_guest() function iterates over a set of
> >>>>> receive descriptors by advancing rx descriptor head register (RDH) =
from
> >>>>> its initial value to rx descriptor tail register (RDT). The check i=
n
> >>>>> e1000e_ring_empty() is responsible for detecting whether RDH has re=
ached
> >>>>> RDT, terminating the loop if that's the case. Additional checks hav=
e
> >>>>> been added in the past to deal with bogus values submitted by the g=
uest
> >>>>> to prevent possible infinite loop. This is done by "wrapping around=
" RDH
> >>>>> at some point and detecting whether it assumes the original value d=
uring
> >>>>> the loop.
> >>>>>
> >>>>> However, when e1000e is configured to use the packet split feature,=
 RDH is
> >>>>> incremented by two instead of one, as the packet split descriptors =
are
> >>>>> 32 bytes while regular descriptors are 16 bytes. A malicious or bug=
gy
> >>>>> guest may set RDT to an odd value and transmit only null RX descrip=
tors.
> >>>>> This corner case would prevent RDH from ever matching RDT, leading =
to an
> >>>>> infinite loop. This patch adds a check in e1000e_ring_advance() to =
make sure
> >>>>> RDH does not exceed RDT in a single incremental step, adjusting the=
 count
> >>>>> value accordingly.
> >>>> Can this patch solve this issue in another way?
> >>>>
> >>>> https://patchew.org/QEMU/20201111130636.2208620-1-ppandit@redhat.com=
/
> >>>>
> >>>> Thanks
> >>>>
> >>> Yes, it does work nicely. Still, I think this patch is useful to avoi=
d
> >>> possible inconsistent state in e1000e_ring_advance() when count > 1.
> >>
> >> So if RDT is odd, it looks to me the following codes in
> >> e1000e_write_packet_to_guest() needs to be fixed as well.
> >>
> >>
> >>           base =3D e1000e_ring_head_descr(core, rxi);
> >>
> >>           pci_dma_read(d, base, &desc, core->rx_desc_len);
> >>
> >> Otherwise e1000e may try to read out of descriptor ring.
> > Sorry, I'm not sure I understand what you mean. Isn't the base address
> > computed from RDH? How can e1000e read out of the descriptor ring if
> > RDT is odd?
> >
> >> Thanks
> >
> > On Thu, Nov 19, 2020 at 6:57 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2020/11/18 =E4=B8=8B=E5=8D=884:53, Mauro Matteo Cascella wrote:
> >>> On Wed, Nov 18, 2020 at 4:56 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>> On 2020/11/13 =E4=B8=8B=E5=8D=886:31, Mauro Matteo Cascella wrote:
> >>>>> The e1000e_write_packet_to_guest() function iterates over a set of
> >>>>> receive descriptors by advancing rx descriptor head register (RDH) =
from
> >>>>> its initial value to rx descriptor tail register (RDT). The check i=
n
> >>>>> e1000e_ring_empty() is responsible for detecting whether RDH has re=
ached
> >>>>> RDT, terminating the loop if that's the case. Additional checks hav=
e
> >>>>> been added in the past to deal with bogus values submitted by the g=
uest
> >>>>> to prevent possible infinite loop. This is done by "wrapping around=
" RDH
> >>>>> at some point and detecting whether it assumes the original value d=
uring
> >>>>> the loop.
> >>>>>
> >>>>> However, when e1000e is configured to use the packet split feature,=
 RDH is
> >>>>> incremented by two instead of one, as the packet split descriptors =
are
> >>>>> 32 bytes while regular descriptors are 16 bytes. A malicious or bug=
gy
> >>>>> guest may set RDT to an odd value and transmit only null RX descrip=
tors.
> >>>>> This corner case would prevent RDH from ever matching RDT, leading =
to an
> >>>>> infinite loop. This patch adds a check in e1000e_ring_advance() to =
make sure
> >>>>> RDH does not exceed RDT in a single incremental step, adjusting the=
 count
> >>>>> value accordingly.
> >>>> Can this patch solve this issue in another way?
> >>>>
> >>>> https://patchew.org/QEMU/20201111130636.2208620-1-ppandit@redhat.com=
/
> >>>>
> >>>> Thanks
> >>>>
> >>> Yes, it does work nicely. Still, I think this patch is useful to avoi=
d
> >>> possible inconsistent state in e1000e_ring_advance() when count > 1.
> >>
> >> So if RDT is odd, it looks to me the following codes in
> >> e1000e_write_packet_to_guest() needs to be fixed as well.
> >>
> >>
> >>           base =3D e1000e_ring_head_descr(core, rxi);
> >>
> >>           pci_dma_read(d, base, &desc, core->rx_desc_len);
> >>
> >> Otherwise e1000e may try to read out of descriptor ring.
> >>
> >> Thanks
>
>
> Sorry, I meant RDH actually, when packet split descriptor is used, it
> doesn't check whether DH exceeds DLEN?
>

When the packet split feature is used (i.e., count > 1) this patch
basically sets RDH=3DRDT in case the increment would exceed RDT. The
next iteration should detect that RDH equals RDT in
e1000e_ring_empty(), and exit the loop right before pci_dma_read(). On
the other hand RDH is set to zero if it exceeds DLEN in
e1000e_ring_advance() so we should be fine in either case, unless I'm
missing something?


Thank you for your time,
--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


