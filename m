Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD1D3D75EC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:20:06 +0200 (CEST)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8N09-00054F-Uu
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m8Myr-0004NY-5M
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:18:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m8Mym-0004dz-3M
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627391919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+43wPP6Pl+uymtNk1SlzjmpJNE2y6MiQSo3EmDoEaNY=;
 b=NjV/vOTh2lbmI8vhw+KWtF93qLfB0JplY0cWUPb127DtMQTv0n018erUSUBZg6IXzMWG2H
 zOAmLBQ0a5sGKUb/4VKm/3cAKvt3I+zgdXyNMkYNSbwXvqxlePgJC+8WZGfK6C2d0bUPmD
 LBAz07wUUx1JngI31oxpQzy1Lvwt/DE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-P6AqQev_OUKoM6EwI3jdxA-1; Tue, 27 Jul 2021 09:18:36 -0400
X-MC-Unique: P6AqQev_OUKoM6EwI3jdxA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h16-20020aa7de100000b02903a6620f87feso6600985edv.18
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+43wPP6Pl+uymtNk1SlzjmpJNE2y6MiQSo3EmDoEaNY=;
 b=edGsA8jP8HwrmbRKsJSWDa/Px7qlmo9FFJeR1O2TJuBYI/NiW4RLq0YY4fcbgv/UoL
 vfsY0kUGr3ogVlzSDZfEqBGC6PvUmbVIdiDOKJQ1n31RPdIN6CzhncMiX3MNDkV19ptp
 UtO3JrDnixVp4n/4c/5eCDkwQcQJms9g/E4P169ry7SU8a1CzSvKKTuQ0NgVoisGsACE
 v+lb+bGCfIGBRGiDce2NcU1brxYbR4yvJnah68pNlYVhEJ1/dlQp31ISc/38H461Gl9O
 uQwHsq37sVYhBW5PJ3XUi3p2RKI1xFv9RBRp3MNIoLahSFSLaPBktwgPrfoTpzr8C4h5
 rDAQ==
X-Gm-Message-State: AOAM530QocBs59r+IXqD8t2eufdksoeZKLHKxqqSN0V9ZFzlaz5+NUIv
 70pblSGLgR6vt9zBOCEO/MudkLbHAnrkJRZ8caY6pmavHwxqfMpQ7stCeFAmAWsBVFnMgneXh93
 pKSowAoMRysqiMepR5TR8+tE373hNIns=
X-Received: by 2002:a17:906:718c:: with SMTP id
 h12mr21462459ejk.6.1627391915305; 
 Tue, 27 Jul 2021 06:18:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVojILd1AHJOizwM8MGXu3yff+j0rFoIUelmzSQHSMsuAQchHQ6eoplTYLiBE/0FUN7bJ2z5s1Gdf4835FyP0=
X-Received: by 2002:a17:906:718c:: with SMTP id
 h12mr21462432ejk.6.1627391915100; 
 Tue, 27 Jul 2021 06:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <87pmv4zj22.fsf@p50.localhost.localdomain>
 <CAFEAcA-UZMGK3azd5fHGhk8vivzv4agY=GXLAdWJfsErDkORPg@mail.gmail.com>
In-Reply-To: <CAFEAcA-UZMGK3azd5fHGhk8vivzv4agY=GXLAdWJfsErDkORPg@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 27 Jul 2021 09:18:24 -0400
Message-ID: <CA+bd_6K1QWbi17sCBNcBqZgTWcrgtJ3trKJ7v2ZRTnXHO9G=bg@mail.gmail.com>
Subject: Re: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 3:37 AM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 27 Jul 2021 at 01:39, Cleber Rosa <crosa@redhat.com> wrote:
> >
> >
> > Hi everyone,
> >
> > tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
> > is currently failing consistently (first found that in [1]).
> >
> > I've bisected it down to the following commit:
> >
> > ---
> >
> > 78ff82bb1b67c0d79113688e4b3427fc99cab9d4 is the first bad commit
> > commit 78ff82bb1b67c0d79113688e4b3427fc99cab9d4
> > Author: Richard Henderson <richard.henderson@linaro.org>
> >
> >     accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
> >
> >     The space reserved for CF_COUNT_MASK was overly large.
> >     Reduce to free up cflags bits and eliminate an extra test.
> >
> >     Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >     Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >     Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >     Message-Id: <20210717221851.2124573-2-richard.henderson@linaro.org>
> >
> >  accel/tcg/translate-all.c | 5 ++---
> >  include/exec/exec-all.h   | 4 +++-
> >  2 files changed, 5 insertions(+), 4 deletions(-)
>
> This is probably fixed by
> https://patchew.org/QEMU/20210725174405.24568-1-peter.maydell@linaro.org/
> (which is in RTH's pullreq currently on list).
>
> -- PMM
>

Actually, it is already fixed by df3a2de51a07089a4a729fe1f792f658df9dade4.

BTW, TCG looks like the right place where the bug was, because it
affected other targets and machines.  This is the actual list of tests
I was seeing the same issue (and are now fixed):

(1/4) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_vir=
t:
PASS (8.86 s)
(2/4) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
PASS (13.42 s)
(3/4) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_m68k_mcf520=
8evb:
PASS (3.20 s)
(4/4) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_xtensa_lx60=
:
PASS (12.29 s)

Cheers,
- Cleber.


