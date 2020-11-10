Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E82AD21B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:08:32 +0100 (CET)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPdf-0003sh-8n
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kcPcK-0002zM-A3
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1kcPcG-0002Nq-Ic
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604999221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbF4PyYh/taKYG17SZcq57ljzdvHWKawsfb+/W6eUnE=;
 b=ChN9/xVUZ3MYSla9DO+lye8du0BACREiQydGLbFr6t1kMV5D8VaWzHUtu/ipFlpwl6ICup
 Ys0vQMHG53JrvXHYLPAJfir+o+029XUKWmIAmdcAulsyAZUoFIP67SlP2XFBDfICz2i5Nz
 PUd5AYJfyVtWdtapt87KLbPwF+DEg4o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-MYkv6jeuMzauiZN_i6UC0A-1; Tue, 10 Nov 2020 04:06:57 -0500
X-MC-Unique: MYkv6jeuMzauiZN_i6UC0A-1
Received: by mail-ej1-f69.google.com with SMTP id i7so734523ejz.6
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 01:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NbF4PyYh/taKYG17SZcq57ljzdvHWKawsfb+/W6eUnE=;
 b=a59LbUwG9VDNhvEtivQOZrBQCjONK2ayb97wN8hGe+NL5uY+IQ/NhXpIJ0Xk8f3HjC
 tWRkKXDrsXLCqjaduXYprCFBnZ6m8NxghpMW989+MJUW3EipNeq0qpm39A3nY4+xOZs8
 DknQK9vL+XuqdtvUCjwH4pJzsfKb+32LuxyDMTUFurd5hbTGt6rA08dfAdQU9I4IyiXv
 cgCY1kwj3IpQy/A2WvKtm2vykK+ARy92b7jDw/KZw7m+pOffRPP4YbMF2sEnDe+ErI39
 fHlHV4+xKNlrxYhT6jEYdL1UJon9jDS9/vcubefHmHLoxjB6FD3V8I8oiRbYc/gCqTfM
 u57Q==
X-Gm-Message-State: AOAM532K9NY4OMkACsNoGxVHgYJ6ma4b6mgGvIxIX4VLQdiiHBwTUQ96
 YU5kXXVH68E5f5oqW3i3hxTf+5fkCJ/HGqrTNWLVc3KZkAzZlXbqBaMSnR/LFLjfF98kY5jsZc3
 tZOPY/kGNV/ycXPZECOjDkDEyoLWBg6Y=
X-Received: by 2002:a17:906:2818:: with SMTP id
 r24mr20111943ejc.100.1604999216372; 
 Tue, 10 Nov 2020 01:06:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPlyxOnCBvTnJ1QQMwSh0BH4eZh6q8QZVZqB5KKnm8x73o9bSKYlGcYxlBeRwo/Fmtcev5IhCcjf2a0+jZuJ0=
X-Received: by 2002:a17:906:2818:: with SMTP id
 r24mr20111911ejc.100.1604999216041; 
 Tue, 10 Nov 2020 01:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20201105105616.327593-1-mcascell@redhat.com>
 <b34f724a-b4fc-6dbd-b660-2dfc2b8e943f@redhat.com>
In-Reply-To: <b34f724a-b4fc-6dbd-b660-2dfc2b8e943f@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 10 Nov 2020 10:06:45 +0100
Message-ID: <CAA8xKjUuM9XeBG920pRBmCWh_7DPdy3x=md=Q+JJ5+bQpn0=aw@mail.gmail.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
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

On Mon, Nov 9, 2020 at 3:38 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/11/5 =E4=B8=8B=E5=8D=886:56, Mauro Matteo Cascella wrote:
> > The e1000e_write_packet_to_guest() function iterates over a set of
> > receive descriptors by advancing rx descriptor head register (RDH) from
> > its initial value to rx descriptor tail register (RDT). The check in
> > e1000e_ring_empty() is responsible for detecting whether RDH has reache=
d
> > RDT, terminating the loop if that's the case. Additional checks have
> > been added in the past to deal with bogus values submitted by the guest
> > to prevent possible infinite loop. This is done by "wrapping around" RD=
H
> > at some point and detecting whether it assumes the original value durin=
g
> > the loop.
> >
> > However, when e1000e is configured to use the packet split feature, RDH=
 is
> > incremented by two instead of one, as the packet split descriptors are
> > 32 bytes while regular descriptors are 16 bytes. A malicious or buggy
> > guest may set RDT to an odd value and transmit only null RX descriptors=
.
> > This corner case would prevent RDH from ever matching RDT, leading to a=
n
> > infinite loop. This patch adds a check in e1000e_ring_advance() to make
> > sure RDH does never exceed RDT.
> >
> > This issue was independently reported by Gaoning Pan (Zhejiang Universi=
ty)
> > and Cheolwoo Myung.
> >
> > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > Reported-by: Gaoning Pan <gaoning.pgn@antgroup.com>
> > Reported-by: Cheolwoo Myung <330cjfdn@gmail.com>
> > ---
> > References:
> > https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Ddd793a74882477ca38d49=
e191110c17dfe
> > https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4154c7e03fa55b4cf5250=
9a83d50d6c09d743b7
> > http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-da=
tasheet.pdf
> >
> >   hw/net/e1000e_core.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> > index bcd186cac5..4c4d14b6ed 100644
> > --- a/hw/net/e1000e_core.c
> > +++ b/hw/net/e1000e_core.c
> > @@ -831,6 +831,10 @@ e1000e_ring_advance(E1000ECore *core, const E1000E=
_RingInfo *r, uint32_t count)
> >   {
> >       core->mac[r->dh] +=3D count;
> >
> > +    if (core->mac[r->dh] > core->mac[r->dt]) {
> > +        core->mac[r->dh] =3D core->mac[r->dt];
> > +    }
> > +
> >       if (core->mac[r->dh] * E1000_RING_DESC_LEN >=3D core->mac[r->dlen=
]) {
> >           core->mac[r->dh] =3D 0;
> >       }

Hi Jason,

> A question here.
>
> When count > 1, is this correct to reset dh here?
>
> Thanks
>

My understanding is that wrapping at (or above) RDLEN is the correct
behavior regardless of count. I don't see why count > 1 should modify
this behavior. I'm not sure, though. Anyway, this patch fixes the
above reproducer, so I'm adding a Tested-by line here.

Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>

Thank you,
--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


