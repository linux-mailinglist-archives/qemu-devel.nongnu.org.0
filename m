Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C0E109E3F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 13:49:09 +0100 (CET)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZaHE-0003RB-L3
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 07:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iZaEz-0002O3-JR
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 07:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iZaEu-0005n9-ER
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 07:46:49 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38729)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iZaEu-0005jy-7w
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 07:46:44 -0500
Received: by mail-ot1-x342.google.com with SMTP id z25so15750306oti.5
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 04:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJOgI7Fkx9fkZmmYIqDXFqTNTL2Dsde/US2qZ7f/uac=;
 b=OwxcLR3XpXnjPB31Zc5NzrdXvJw/jIqskulrp1cQ8FcmuG1DZNhZyQJvLfEVMRRpfE
 fkIkzEiuIrdb9UYE2b4q/6XwVwoi+fH/HwScwk/rn2KzfFYM+ODxBTgeJKUUlbBCI07/
 OFVsnRVeAmBhH3j/a49OMpTv+74AxToDwOyYlz/aYAGQnqDP9jdNMzi2/wN2+XO/sHuY
 Pb4GiMz5GAdvCPfkCOX7RaepABtlYZrh/zsPqLNT/oa0dy+jBPfrTcW8e76kXxvTVIDM
 4TtcBh3zxxpRyLsuqd/ZP185irwlJNVHOcFBWFOtG/JslEWRgg2fRzt1XX4Gd1+5QNaG
 iSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJOgI7Fkx9fkZmmYIqDXFqTNTL2Dsde/US2qZ7f/uac=;
 b=AsXQ1eMwDBvcB/gm50LPsOI16U9rPWH1z3WcBMsWSAL03lazFtf5sC+hI0MYng/4eF
 AcocLXBAByHClE7IR4vnt0ON3DDrO8J8/frJvSUht0ICZuNKSk5/pFEijmPB/TGh6XKs
 zKDouR/oKlimHXN86UaWichu5TF2xpDlfpdMdZjRaV59gF27T/S9RVTsb6Wm7152vBDI
 7nIwPSstwUrvSPjxCwP2TJt7+myS28uCJm4Pi4Uu2TOZbFrBq6L92nCUK+O32XklRcVy
 9CLTQ33lY5aOqLcx39/MOFFUyvqrQEUmmXfLLoc2XBJqVR/tcrYpj3WEuxJdvQZ941t2
 ccmQ==
X-Gm-Message-State: APjAAAUznB8Pt42x3FWORLn1V+F9ormSSRs5Wn1yeC1WHkxK0nY01ZPa
 86n6WZu1o+Iz2NAuxL+J9j5bjytbVBOpQlFGzKPPQg==
X-Google-Smtp-Source: APXvYqyuIPQDk7G6PQKTgCF+tzo2CVMn7YI29fNWYWLJgA2fUpG9fbZTs0uTA6UV5GDXf3ED1kxS6uZZwWUjEN8BDbg=
X-Received: by 2002:a9d:6357:: with SMTP id y23mr2263272otk.91.1574772402970; 
 Tue, 26 Nov 2019 04:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20191123115618.29230-1-maz@kernel.org>
 <CAFEAcA_MQpJ=8UFnP=Qnt+4GWMUO_AtJBBNz-bM2L2wf5htuaQ@mail.gmail.com>
 <4d8c4763da39d5bfb1800735f90d82d1@www.loen.fr>
 <CAFEAcA87ceF_0ifLn1t9CxyEwJ-rwW8h4QauJGk+ATphJaWa6Q@mail.gmail.com>
 <15acc2b5111716b10ab7624a1ee45ce7@www.loen.fr>
In-Reply-To: <15acc2b5111716b10ab7624a1ee45ce7@www.loen.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Nov 2019 12:46:32 +0000
Message-ID: <CAFEAcA9nPgELq1A0JNrb330kD6qkXFrNvK0BjRwVG+ryfk4kxQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Honor HCR_EL2.TID3 trapping requirements
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Will Deacon <will@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Nov 2019 at 17:49, Marc Zyngier <maz@kernel.org> wrote:
> I also had a look at TID0, but couldn't find any of the Jazelle
> stuff in QEMU...

We implement only "minimal Jazelle", ie the minimal set of
registers needed to be architecturally compliant for an
implementation without Jazelle.

thanks
-- PMM

