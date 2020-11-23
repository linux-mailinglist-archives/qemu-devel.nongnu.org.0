Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C92C17C8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:42:05 +0100 (CET)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJb2-0008WJ-6K
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1khJPs-0001C3-77
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 16:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1khJPp-0008Rk-Ek
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 16:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606167028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqEzxKrz7n+/jOv0VPcZZkU+AXGf1pIYnJ2aS97fEzE=;
 b=MN0fvZ8nMxTDE23iXky5zpdRPcNVymJmitfDgVJAjzy8FGVTPpiKZxlPpiXzXphWHA9Ckk
 o8eqvrEM3OJ+66bKVtQ1nVfVP7lP8wisD8+mUEcnY4avH53bi3HI3AUIkqia2u3uBN6UaY
 2CdrMiwuyh4IBYOJGaUp2QHQZJ0cYAc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-7Hlw9JqMN-m28rXhl6T_eQ-1; Mon, 23 Nov 2020 16:30:25 -0500
X-MC-Unique: 7Hlw9JqMN-m28rXhl6T_eQ-1
Received: by mail-ed1-f71.google.com with SMTP id y11so7092227edv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pqEzxKrz7n+/jOv0VPcZZkU+AXGf1pIYnJ2aS97fEzE=;
 b=e1x1pO61HB9BX7dm17gOfLQXLkmqlpvD05bFOAT5hQczB7DjbXHAoYrjBvzxlaTvg3
 po3otHIi5WGxioVUuVfRT3hCkidR6/ecMjGd5CFPCG9dsjw/nDtAtI1fxH49EdhL9p1y
 1oVcqsgR/4TJnFJcpsiTsUKeb266XPFk3jDIEW17Yub6heKXc5CyH6qeIJEueK0JRf3J
 sTKcSy5dU+hNx8/o6nJ0RgTaMNrtOMkBVOVNETOOMk2TvNt22FG51WLhuawaDaSe2wyX
 IIL3O/tahA7yjXvi0TKWHFc6AYBSonm9rjWmdPUnU3E4iYTmSLWboDwaq6M/RbrcIx1x
 IWOA==
X-Gm-Message-State: AOAM531xT+/ex8YtyGM/Tuq7E2l8bSQNGsR03xsm0V5/j69JzFCGb+qh
 PsJCtGKEwni5fgB6tmP0vVyY7v2wBtXF4aL5g9+AOEo0sktC2dpozH38O+uD6BPStOE6uvnJHMw
 BmTYjmgUiK4gYQZqLujFUZqFkG80vaOY=
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr1172812edu.47.1606167023414;
 Mon, 23 Nov 2020 13:30:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6JlUbawyvKISwU0kOXLBGIEeSJmY4ncUkOLXBWloKCKVB2xiyfxQYK3JMALHwaSS4vftJkuxDyv1bFNgIbpE=
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr1172790edu.47.1606167023138;
 Mon, 23 Nov 2020 13:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20201113103113.223239-1-mcascell@redhat.com>
 <f24438ed-ee77-0583-3570-b18514292404@redhat.com>
 <CAA8xKjX5a1cTY=Zr+XvHsixrSTiCw9FvGg1Z-=5Yw7pWV6xweA@mail.gmail.com>
 <aef28782-aa5b-ea53-e112-1e4bf4fbd722@redhat.com>
In-Reply-To: <aef28782-aa5b-ea53-e112-1e4bf4fbd722@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 23 Nov 2020 22:30:12 +0100
Message-ID: <CAA8xKjUuxtGnGqgz+J=G0TZhvu-JfWjz-fjROMhYsZrBSmAGVQ@mail.gmail.com>
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

On Thu, Nov 19, 2020 at 6:57 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/11/18 =E4=B8=8B=E5=8D=884:53, Mauro Matteo Cascella wrote:
> > On Wed, Nov 18, 2020 at 4:56 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2020/11/13 =E4=B8=8B=E5=8D=886:31, Mauro Matteo Cascella wrote:
> >>> The e1000e_write_packet_to_guest() function iterates over a set of
> >>> receive descriptors by advancing rx descriptor head register (RDH) fr=
om
> >>> its initial value to rx descriptor tail register (RDT). The check in
> >>> e1000e_ring_empty() is responsible for detecting whether RDH has reac=
hed
> >>> RDT, terminating the loop if that's the case. Additional checks have
> >>> been added in the past to deal with bogus values submitted by the gue=
st
> >>> to prevent possible infinite loop. This is done by "wrapping around" =
RDH
> >>> at some point and detecting whether it assumes the original value dur=
ing
> >>> the loop.
> >>>
> >>> However, when e1000e is configured to use the packet split feature, R=
DH is
> >>> incremented by two instead of one, as the packet split descriptors ar=
e
> >>> 32 bytes while regular descriptors are 16 bytes. A malicious or buggy
> >>> guest may set RDT to an odd value and transmit only null RX descripto=
rs.
> >>> This corner case would prevent RDH from ever matching RDT, leading to=
 an
> >>> infinite loop. This patch adds a check in e1000e_ring_advance() to ma=
ke sure
> >>> RDH does not exceed RDT in a single incremental step, adjusting the c=
ount
> >>> value accordingly.
> >>
> >> Can this patch solve this issue in another way?
> >>
> >> https://patchew.org/QEMU/20201111130636.2208620-1-ppandit@redhat.com/
> >>
> >> Thanks
> >>
> > Yes, it does work nicely. Still, I think this patch is useful to avoid
> > possible inconsistent state in e1000e_ring_advance() when count > 1.
>
>
> So if RDT is odd, it looks to me the following codes in
> e1000e_write_packet_to_guest() needs to be fixed as well.
>
>
>          base =3D e1000e_ring_head_descr(core, rxi);
>
>          pci_dma_read(d, base, &desc, core->rx_desc_len);
>
> Otherwise e1000e may try to read out of descriptor ring.

Sorry, I'm not sure I understand what you mean. Isn't the base address
computed from RDH? How can e1000e read out of the descriptor ring if
RDT is odd?

>
> Thanks


On Thu, Nov 19, 2020 at 6:57 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/11/18 =E4=B8=8B=E5=8D=884:53, Mauro Matteo Cascella wrote:
> > On Wed, Nov 18, 2020 at 4:56 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2020/11/13 =E4=B8=8B=E5=8D=886:31, Mauro Matteo Cascella wrote:
> >>> The e1000e_write_packet_to_guest() function iterates over a set of
> >>> receive descriptors by advancing rx descriptor head register (RDH) fr=
om
> >>> its initial value to rx descriptor tail register (RDT). The check in
> >>> e1000e_ring_empty() is responsible for detecting whether RDH has reac=
hed
> >>> RDT, terminating the loop if that's the case. Additional checks have
> >>> been added in the past to deal with bogus values submitted by the gue=
st
> >>> to prevent possible infinite loop. This is done by "wrapping around" =
RDH
> >>> at some point and detecting whether it assumes the original value dur=
ing
> >>> the loop.
> >>>
> >>> However, when e1000e is configured to use the packet split feature, R=
DH is
> >>> incremented by two instead of one, as the packet split descriptors ar=
e
> >>> 32 bytes while regular descriptors are 16 bytes. A malicious or buggy
> >>> guest may set RDT to an odd value and transmit only null RX descripto=
rs.
> >>> This corner case would prevent RDH from ever matching RDT, leading to=
 an
> >>> infinite loop. This patch adds a check in e1000e_ring_advance() to ma=
ke sure
> >>> RDH does not exceed RDT in a single incremental step, adjusting the c=
ount
> >>> value accordingly.
> >>
> >> Can this patch solve this issue in another way?
> >>
> >> https://patchew.org/QEMU/20201111130636.2208620-1-ppandit@redhat.com/
> >>
> >> Thanks
> >>
> > Yes, it does work nicely. Still, I think this patch is useful to avoid
> > possible inconsistent state in e1000e_ring_advance() when count > 1.
>
>
> So if RDT is odd, it looks to me the following codes in
> e1000e_write_packet_to_guest() needs to be fixed as well.
>
>
>          base =3D e1000e_ring_head_descr(core, rxi);
>
>          pci_dma_read(d, base, &desc, core->rx_desc_len);
>
> Otherwise e1000e may try to read out of descriptor ring.
>
> Thanks
>
>
> >
> > Thank you,
>


--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


