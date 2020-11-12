Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03BE2B02A3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 11:22:18 +0100 (CET)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd9k9-0006OM-DF
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 05:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kd9is-0005w8-6B
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:20:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kd9ip-0002bD-Cx
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605176453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u09qZEUNg5i34rHlIlFdjTzRco9GEvxwG6punDX1dFw=;
 b=SzzFF2S8KAuJZvN7yUj3ZKRVARWl/MaLoP+cmWu7VYlDOrbfg5Aaa5rln371GTMhvJUnZ4
 sYaNoml1FkN8HK00i5bMno+++okgC5mVzFEVBC6O8A6v7e+bte2zjU3zQXJbUttFQ0OvIL
 EFJ1gHxwiS7fFBkCyIVTllxWkGdsd44=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-ssrdz_thNoKj7U4F-9olSQ-1; Thu, 12 Nov 2020 05:20:48 -0500
X-MC-Unique: ssrdz_thNoKj7U4F-9olSQ-1
Received: by mail-ej1-f72.google.com with SMTP id v21so1667738ejy.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 02:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u09qZEUNg5i34rHlIlFdjTzRco9GEvxwG6punDX1dFw=;
 b=s7rRMfju5osm8Ph6QPczE76SUt03BFOExZBmZUMM9EAV822VGXdPypHwi4643Vw4ob
 EbbAAmRR2yvxa/3A0U0H/f/+QJ+GCaYBWNIOVsgRK9az+JdHjU67SUiv+cdAuNPq5nvN
 Z2YYCxonhdA326Tu+4yfA2A06UEQXLZCvPzM9VjbhKguutksnrHNTM16wgUs8NjuAgQD
 LEy2deK1iqY3KZDT4+lGSOQj70yERBNg6+Zyp1fUT2mJC3BXDhpNwUp/P6VIstziFQxZ
 2QliRY4TJY3jKgiT74uVB1GJiLeyBgDHt67WVzQRyTQ4n5gLprHueYYIMnEK+Fb+ClZA
 +81A==
X-Gm-Message-State: AOAM5325i62P8hQTjCC4BzvAPvseBgLJnJ1u8FId9et6QxQjP1arlOYS
 EJjb2/jT6UvAB3Jy22y57ZRdMkWKmZ7h8Qu7Nds+eS4G4bTRlnnXyRZynh9KOjtz+uXQqjTaZVL
 gYBZ1AV50hqR17d6BRg9nka+BcpP9LXs=
X-Received: by 2002:a17:906:a385:: with SMTP id
 k5mr29305693ejz.492.1605176447279; 
 Thu, 12 Nov 2020 02:20:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNERwpIhCWZMtG8CuZd4pp2fmXxzsoisnhcbJ0A8vRUqFqUsoYz0u8zIHxdWaP8oXXtREaSOz/aNW6bQm9Pus=
X-Received: by 2002:a17:906:a385:: with SMTP id
 k5mr29305681ejz.492.1605176447060; 
 Thu, 12 Nov 2020 02:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20201105105616.327593-1-mcascell@redhat.com>
 <b34f724a-b4fc-6dbd-b660-2dfc2b8e943f@redhat.com>
 <CAA8xKjUuM9XeBG920pRBmCWh_7DPdy3x=md=Q+JJ5+bQpn0=aw@mail.gmail.com>
 <bd944924-d227-a22c-c8e4-07dbf82312c5@redhat.com>
 <5421080d-ba5d-ee08-cbed-17c430114283@redhat.com>
In-Reply-To: <5421080d-ba5d-ee08-cbed-17c430114283@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 12 Nov 2020 11:20:36 +0100
Message-ID: <CAA8xKjXo-2wR1mDPFW3gMorrpaN_denP8b7W4bAKkx-ZgdvaQw@mail.gmail.com>
Subject: Re: [PATCH] net/e1000e_core: make sure RDH never exceeds RDT in
 e1000e_ring_advance()
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Nov 11, 2020 at 1:48 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/11/11 =E4=B8=8B=E5=8D=884:54, Jason Wang wrote:
> >
> > On 2020/11/10 =E4=B8=8B=E5=8D=885:06, Mauro Matteo Cascella wrote:
> >> On Mon, Nov 9, 2020 at 3:38 AM Jason Wang <jasowang@redhat.com> wrote:
> >>>
> >>> On 2020/11/5 =E4=B8=8B=E5=8D=886:56, Mauro Matteo Cascella wrote:
> >>>> The e1000e_write_packet_to_guest() function iterates over a set of
> >>>> receive descriptors by advancing rx descriptor head register (RDH)
> >>>> from
> >>>> its initial value to rx descriptor tail register (RDT). The check in
> >>>> e1000e_ring_empty() is responsible for detecting whether RDH has
> >>>> reached
> >>>> RDT, terminating the loop if that's the case. Additional checks have
> >>>> been added in the past to deal with bogus values submitted by the
> >>>> guest
> >>>> to prevent possible infinite loop. This is done by "wrapping
> >>>> around" RDH
> >>>> at some point and detecting whether it assumes the original value
> >>>> during
> >>>> the loop.
> >>>>
> >>>> However, when e1000e is configured to use the packet split feature,
> >>>> RDH is
> >>>> incremented by two instead of one, as the packet split descriptors a=
re
> >>>> 32 bytes while regular descriptors are 16 bytes. A malicious or bugg=
y
> >>>> guest may set RDT to an odd value and transmit only null RX
> >>>> descriptors.
> >>>> This corner case would prevent RDH from ever matching RDT, leading
> >>>> to an
> >>>> infinite loop. This patch adds a check in e1000e_ring_advance() to
> >>>> make
> >>>> sure RDH does never exceed RDT.
> >>>>
> >>>> This issue was independently reported by Gaoning Pan (Zhejiang
> >>>> University)
> >>>> and Cheolwoo Myung.
> >>>>
> >>>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> >>>> Reported-by: Gaoning Pan <gaoning.pgn@antgroup.com>
> >>>> Reported-by: Cheolwoo Myung <330cjfdn@gmail.com>
> >>>> ---
> >>>> References:
> >>>> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Ddd793a74882477ca38=
d49e191110c17dfe
> >>>>
> >>>> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4154c7e03fa55b4cf5=
2509a83d50d6c09d743b7
> >>>>
> >>>> http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller=
-datasheet.pdf
> >>>>
> >>>>
> >>>>    hw/net/e1000e_core.c | 4 ++++
> >>>>    1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> >>>> index bcd186cac5..4c4d14b6ed 100644
> >>>> --- a/hw/net/e1000e_core.c
> >>>> +++ b/hw/net/e1000e_core.c
> >>>> @@ -831,6 +831,10 @@ e1000e_ring_advance(E1000ECore *core, const
> >>>> E1000E_RingInfo *r, uint32_t count)
> >>>>    {
> >>>>        core->mac[r->dh] +=3D count;
> >>>>
> >>>> +    if (core->mac[r->dh] > core->mac[r->dt]) {
> >>>> +        core->mac[r->dh] =3D core->mac[r->dt];
> >>>> +    }
> >>>> +
> >>>>        if (core->mac[r->dh] * E1000_RING_DESC_LEN >=3D
> >>>> core->mac[r->dlen]) {
> >>>>            core->mac[r->dh] =3D 0;
> >>>>        }
> >> Hi Jason,
> >>
> >>> A question here.
> >>>
> >>> When count > 1, is this correct to reset dh here?
> >>>
> >>> Thanks
> >>>
> >> My understanding is that wrapping at (or above) RDLEN is the correct
> >> behavior regardless of count. I don't see why count > 1 should modify
> >> this behavior. I'm not sure, though. Anyway, this patch fixes the
> >> above reproducer, so I'm adding a Tested-by line here.
> >>
> >> Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
> >>
> >> Thank you,
> >> --
> >> Mauro Matteo Cascella
> >> Red Hat Product Security
> >> PGP-Key ID: BB3410B0
> >>
> >
> > Right.
> >
> > Applied.
> >
> > Thanks
>
>
> I had to drop this since it breaks e1000e PXE test.
>
> Thanks
>

By debugging the failing qtest (/x86_64/pxe/ipv4/q35/e1000e) I noticed
several cases where RDH > RDT in e1000e_ring_advance(). Given the
RX/TX descriptor ring structure, I guess this is a possible scenario
when the tail pointer wraps back to base when maximum descriptors have
been processed. I will send a new version to only cover cases where
RDH < RDT and the increment would exceed RDT. This should be enough to
fix the infinite loop issue while making the e1000e PXE test pass.

Thank you,
--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


