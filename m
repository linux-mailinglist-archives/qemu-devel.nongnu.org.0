Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA35211EF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:14:54 +0200 (CEST)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMtJ-0003fe-Gw
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noMT2-0001C2-SR
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:47:44 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noMT1-0004Lc-7E
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:47:44 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id m190so18146111ybf.4
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lq/3IIOrNje3xoyHhGdjCiJBDYsTG3+mTP6R1fJL3Nc=;
 b=Vfb3xmu1Z4lZ1jZ5yqRoUuU1DlBb4mtJqKpCNLGfBehL/PF9JzSW4AF/satVM9n41y
 ViThYCQpw9kjFifSO9hU1AkJSS6eCnCXlgWpZrAiuag7QPUxWooI+2+RTjyZViXkDniW
 5+xc77wYhqBcgDMSj5C0+5xa8ivsbB4n1PGPI+ox0R4hgcDpyZ1JDOhIEZpqNLPowxSs
 DM8WS2wSzAMtUEZwupHLu0n7hUG8pLPLFy7YLLjm3K4EQDhf0gQM/aILiNf5i3TDtbSu
 hFhF6y1VGVqDzLtHwvkVY7SRNKliuz6F6w6tqSO9N4fqbvXhSNEM/DQ4I/vdpmB9qCJs
 r9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lq/3IIOrNje3xoyHhGdjCiJBDYsTG3+mTP6R1fJL3Nc=;
 b=QPEI0KFGYyZAgUFO6j3GPpxNH7SQtwjlU9Hn3oAZBzG0ZaId6LAiMSxIij8iIs/FA7
 Rha73h3UnXRZZlP14JZ/P0iQWOCrxRfd6I/UfsjeAH5AmL6EJU0N3PwkR32Loi5o6FQ8
 fQglr2CcL0gIYz6Bk8QAKZXpVCesV2mGkH1jyl411V/HAktIgw4+eYOc7JUPjF2UchSL
 arxFtB+YeOdkT1150461v257+n6i+gyAA9IBX6GQleeXM1P6P0YFaLwpzluEWCxdylRc
 +GEWe4ukd/AcANC9S9pYATSwX6El8igvPdOAy2QpulLUbvZyESxrJo5Jz36Sr5LS6cmC
 Bdeg==
X-Gm-Message-State: AOAM5311B9e650XQRF/b0xR5l8smtLUwrX2G34nFCXyMyIgD4iSgLZsy
 KTPedP7dIdB+XL2hLdkHnkae3ddX4PxYP4vfH3ZrMA==
X-Google-Smtp-Source: ABdhPJw44HyWdHosK8BJOAxREQy3iQw/AQulgE0BQ+SMGxCLFd0rmlWNKxMN6Z2TtrZMa5tq28RpjKJl/Uz2Rhh+GCs=
X-Received: by 2002:a25:2fc2:0:b0:647:dcee:b2dd with SMTP id
 v185-20020a252fc2000000b00647dceeb2ddmr17093148ybv.288.1652176062130; Tue, 10
 May 2022 02:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
 <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
 <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
 <Ynou3EnxfSmrzGT0@work-vm> <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
In-Reply-To: <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 May 2022 10:47:30 +0100
Message-ID: <CAFEAcA9esRPKwHCwVjeuvjGAEo9E_zOffgOupn05N10ae+hadg@mail.gmail.com>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
To: Thomas Huth <thuth@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, 
 muriloo@linux.ibm.com, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-RISC-V <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 May 2022 at 10:31, Thomas Huth <thuth@redhat.com> wrote:
> On 10/05/2022 11.22, Dr. David Alan Gilbert wrote:
> > To my mind, qemu-system-arm makes a lot of sense, and I'd rather see the
> > 32 bit guests disappear from qemu-system-aarch64.
> > It's difficult to justify to someone running their aarch virt stack why
> > their binary has the security footprint that includes a camera or PDA.

There's a lot of stuff you would want to chop out if you want
a stripped-down "just for KVM" binary, though, and not all of
it is 32-bit-related.  And unless you're chopping non-KVM
machine types and devices out of qemu-system-aarch64 anyway,
you need the 32-bit CPU support in there: we have a machine
type which has both 64-bit and 32-bit CPUs in it.

> I'm not very familiar with KVM on ARM - but is it possible to use KVM there
> with an arbitrary machine? If that's the case, a user might want to use KVM
> on their 64-bit host to run a 32-bit guest machine, and then you need to
> keep the 32-bit machines in the -aarch64 binary.

No, Arm KVM is pretty restrictive -- effectively you can only really
use it with the 'virt' board. You can do a 32-bit guest, but you
do that with qemu-system-aarch64 and telling the 64-bit vcpu
"actually start with EL1 (guest kernel) in 32-bit mode".

thanks
-- PMM

