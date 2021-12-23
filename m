Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FAE47E10F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:00:14 +0100 (CET)
Received: from localhost ([::1]:60488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0KtR-00037D-J2
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:00:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1n0Krq-0002EC-T8
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1n0Krn-0003vV-W4
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640253509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1nHfxTrYCtV/Jr7O+SKWAMExYPlycBblwr2sgjV02s=;
 b=QTCw+t+yHJN8xCsUEatuS7EWu+feLffRkMxxPnGd+tQxnoy/BSQON8zYlcHIvRBK3DZaul
 rey698Tw5lH2U72HlpMP/WN5gib8ybtPntLKbybZyUCpLgfsCI++swOzmMh3pWvWW3JJrF
 78wswnhdTM9FOUbR43W0/VstqjT2opY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-eMqKQ0OhNHCw1q8wpFwBUg-1; Thu, 23 Dec 2021 04:58:27 -0500
X-MC-Unique: eMqKQ0OhNHCw1q8wpFwBUg-1
Received: by mail-pg1-f199.google.com with SMTP id
 i8-20020a639d08000000b00340a257c531so3039125pgd.16
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 01:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/1nHfxTrYCtV/Jr7O+SKWAMExYPlycBblwr2sgjV02s=;
 b=QRwzRVipa8PHpm8VcVTBFyd3Z0+xHiogrH+s91C3Jz3YEpTV8WTD0sLdlEIX4wtvT6
 zloPDdyulgzU04jkaksBDWHF2XPWLYpQ047AXSBi9UPK6zw88F/igTFfYPUJDMjYgLJ4
 kzvuuo1DsmeTKq8yWkRg/N+ks6xX0ezeIqwF2zwFylzZ3YbUt/bStEHsXkg54NdCurlZ
 5KgIaqcZEswnuT3KfyteFY+Ub4Wdnht7kmaYwKc+JMdRNnnNg8k1PnT/OFmQ+KDYBVGi
 g8tmncK2JOeS+7s2RCmFkYSzKb94x7yEs7uWI0+EtkeQU/aIGQNyBg7VoC8r7LSBCZY+
 wgYg==
X-Gm-Message-State: AOAM532LPw+EBebN3vYIx2jfkRU+iVFIa+emschYFjgPfxoeJq3jTNpw
 MhFOO99CTR6/PbYe9pwuYbqDW8C1B6ipUu7tm7R9Zwl4nVVuPMpcWkPHUEjKryaLJEQ5IeRYcUy
 8B8PNDHXqvAkByUGe1tHKjrBs2qrLFX4=
X-Received: by 2002:a17:90a:7023:: with SMTP id
 f32mr1905966pjk.226.1640253505916; 
 Thu, 23 Dec 2021 01:58:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6EUrZWxQp2FYlt1D1cN/w0U+qNFUhK4va4Pwf76QciI8jZrmaGF2RXEdmUcSu565oR8t7Ilebg9wKGC/TJL4=
X-Received: by 2002:a17:90a:7023:: with SMTP id
 f32mr1905942pjk.226.1640253505648; 
 Thu, 23 Dec 2021 01:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20211221144852.589983-1-mst@redhat.com>
 <ad22de10-a52c-ff34-0790-3be8e7d62630@redhat.com>
 <20211222151922-mutt-send-email-mst@kernel.org>
 <CAP+75-VaN5SD22ABqKNTC=dHhN4yaN-22Ucfdp=6aeYa+q+83A@mail.gmail.com>
 <20211222154841-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211222154841-mutt-send-email-mst@kernel.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 23 Dec 2021 10:58:14 +0100
Message-ID: <CAA8xKjWJhXge6_3k-kPc7Y3Z_X1JqbOdZvOCSuAy62ifO4E5gg@mail.gmail.com>
Subject: Re: [PATCH] acpi: validate hotplug selector on access
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Prasad Pandit <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Wed, Dec 22, 2021 at 9:52 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Dec 22, 2021 at 09:27:51PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On Wed, Dec 22, 2021 at 9:20 PM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > > On Wed, Dec 22, 2021 at 08:19:41PM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > +Mauro & Alex
> > > >
> > > > On 12/21/21 15:48, Michael S. Tsirkin wrote:
> > > > > When bus is looked up on a pci write, we didn't
> > > > > validate that the lookup succeeded.
> > > > > Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> > > > > bus pointer.
> > > > >
> > > > > Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI de=
vice")
> > > > > Cc: "Igor Mammedov" <imammedo@redhat.com>
> > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > > It seems this problem is important enough to get a CVE assigned.
> > >
> > > Guest root can crash guest.
> > > I don't see why we would assign a CVE.
> >
> > Well thinking about downstream distributions, if there is a CVE assigne=
d,
> > it helps them to have it written in the commit. Maybe I am mistaken.
> >
> > Unrelated but it seems there is a coordination problem with the
> > qemu-security@ list,
> > if this isn't a security issue, why was a CVE requested?
>
> Right.  I don't think a priveleged user crashing VM warrants a CVE,
> it can just halt a CPU or whatever. Just cancel the CVE request pls.

While I agree with you that this is kind of borderline and I expressed
similar concerns in the past, I was told that:

1) root guest users are not necessarily trustworthy (from the host perspect=
ive).
2) NULL pointer deref and similar issues caused by an
ill-handled/error condition are CVE worthy, even if triggered by root.
3) In other cases, DoS triggered by root is not a security issue
because it's an expected behavior and not an ill-handled/error
condition (think of assert failures, for example).

In other words, "ill-handled condition" is the crucial factor that
makes a bug CVE worthy or not.

+Prasad, can you shed some light on this? Is my understanding correct?

Also, please note that we regularly get CVE requests for bugs like
this and many CVEs have been assigned in the past. Of course that
doesn't mean we can't change things going forward, but I think we
should make it clear (probably here:
https://www.qemu.org/docs/master/system/security.html) that these
kinds of bugs are not eligible for CVE assignment.

> > > > Mauro, please update us when you get the CVE number.
> > > > Michael, please amend the CVE number before committing the fix.
> > > >
> > > > FWIW Paolo asked every fuzzed bug reproducer to be committed
> > > > as qtest, see tests/qtest/fuzz*c. Alex has a way to generate
> > > > reproducer in plain C.
> > > >
> > > > Regards,
> > > >
> > > > Phil.
> > >
>

--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


