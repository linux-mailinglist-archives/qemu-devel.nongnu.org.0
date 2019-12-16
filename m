Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C31120471
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 12:55:43 +0100 (CET)
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igoyU-0006Me-8i
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 06:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1igojS-00079k-Cf
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:40:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1igojR-0000g8-4q
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:40:10 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53661
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1igojR-0000eW-14
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576496408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEptjgwdPCVDxz5d+s4foCRgi6tuDgqm/z3CGwa4K2w=;
 b=ezyXkjLhvb9nlB9F+ZjWqYJ0FTP4OI1nYf8y0wnOnC6KOWx/fkrId3n300SBKCRRbcwJRf
 QSAG/f/T9MMJE5neRTuYaygQCtLa3BIw2TxSN/fsiRkKc4pWNQ1FXLm1ssI6UYS9OMMCoQ
 WFMtLHdbAd/Uts4HzVx5/8E+CulOhgo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-6JtXLdNhNSatjtuRnqY6XA-1; Mon, 16 Dec 2019 06:40:05 -0500
Received: by mail-qv1-f70.google.com with SMTP id n11so4750072qvp.15
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 03:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OYDDHez2+eQPnVZemBiQrMSGx/8BMcqXBE4o9nFHE48=;
 b=PtS7H5vDc6AIFIRmNxrN8IsaJHJeka9c8spK4+Sp1k3DcJUGH79YIlYkqa/9XPBaVt
 MZkg10wf04gclX1B3uO3YqIIPTq6zBuvtlCmk4tZ3/Vk5VERLhhhGljybQIGhO/wMQjV
 AwTdLkSfGAvzO8QF8BE063sXjMUCDiKpLTLSUR3HDIJClCUAxHz6My2lIE5Yai9wszY8
 lUdTbLR/xICE/eFQdlJomYInJkJLkKmYLla5WJ3BRxTaDFzdoJ5OtWIgIEIR35IRCHXL
 jT6WEQh5oUlBXR4fh868RpgrsyKsZSS0xLDCgQ8h5F05F+QfY3kJ9Z34GO/VvK1PD5ee
 j5WA==
X-Gm-Message-State: APjAAAVNEH68gUYnLZN0UHRrBNAtBcEXANDkU8h8q+IvYRkZ1lYKSRiF
 vakCki2DvmuZq1MFmTODBmKcNZk+0EnuekkofvJJ/qVnXjnNac8wmfRS/VQV+n3LVkgebA/GqXy
 Wi1pNigYMZd+1dhg=
X-Received: by 2002:aed:3be1:: with SMTP id s30mr24113994qte.163.1576496404876; 
 Mon, 16 Dec 2019 03:40:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXEbN84fE1lmg6l8FDj+7Ex2UZbgM0xB1RvZzIYTnBhmTSbs1wBzaphQsQXxfgMCt7496w3Q==
X-Received: by 2002:aed:3be1:: with SMTP id s30mr24113974qte.163.1576496404605; 
 Mon, 16 Dec 2019 03:40:04 -0800 (PST)
Received: from redhat.com (bzq-111-168-31-5.red.bezeqint.net. [31.168.111.5])
 by smtp.gmail.com with ESMTPSA id
 u16sm5807903qku.19.2019.12.16.03.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 03:40:03 -0800 (PST)
Date: Mon, 16 Dec 2019 06:39:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/8] Simplify memory_region_add_subregion_overlap(...,
 priority=0)
Message-ID: <20191216063529-mutt-send-email-mst@kernel.org>
References: <20191214155614.19004-1-philmd@redhat.com>
 <CAFEAcA_QZtU9X4fxZk2oWAkN-zxXdQZejrSKZbDxPKLMwdFWgw@mail.gmail.com>
 <20191215044759-mutt-send-email-mst@kernel.org>
 <CAFEAcA9ZF3VTR7kG_D-cJ+vPFTgd8zjmt2VPfJC7urNemF-5AQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ZF3VTR7kG_D-cJ+vPFTgd8zjmt2VPfJC7urNemF-5AQ@mail.gmail.com>
X-MC-Unique: 6JtXLdNhNSatjtuRnqY6XA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 15, 2019 at 03:27:12PM +0000, Peter Maydell wrote:
> On Sun, 15 Dec 2019 at 09:51, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sat, Dec 14, 2019 at 04:28:08PM +0000, Peter Maydell wrote:
> > > (It doesn't actually assert that it doesn't
> > > overlap because we have some legacy uses, notably
> > > in the x86 PC machines, which do overlap without using
> > > the right function, which we've never tried to tidy up.)
> >
> > It's not exactly legacy uses.
> >
> > To be more exact, the way the non overlap versions
> > are *used* is to mean "I don't care what happens when they overlap"
> > as opposed to "will never overlap".
>=20
> Almost all of the use of the non-overlap versions is
> for "these are never going to overlap" -- devices or ram at
> fixed addresses in the address space that can't
> ever be mapped over by anything else. If you want
> "can overlap but I don't care which one wins" then
> that would be more clearly expressed by using the _overlap()
> version but just giving everything that can overlap there
> the same priority.

Problem is device doesn't always know whether something can overlap it.
Imagine device A at a fixed address.
Guest can program device B to overlap the fixed address.
How is device A supposed to know this can happen?



> > There are lots of regions where guest can make things overlapping
> > but doesn't, e.g. PCI BARs can be programmed to overlap
> > almost anything.
> >
> > What happens on real hardware if you then access one of
> > the BARs is undefined, but programming itself is harmless.
> > That's why we can't assert.
>=20
> Yeah, good point, for the special case where it's the
> guest that's determining the addresses where something's
> mapped we might want to allow the behaviour to fall out
> of the implementation. (You could instead specify set of
> priorities that makes the undefined-behaviour something
> specific, rather than just an emergent property of
> the implementation QEMU happens to have, but it seems
> a bit hard to justify.)
>=20
> thanks
> -- PMM


