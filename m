Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC35648A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 10:27:12 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg3Gp-0002yG-OA
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 04:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45567)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg3FB-0001Tj-8Z
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:25:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg3FA-0002tE-6W
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:25:29 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45745)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg3FA-0002sm-0E
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:25:28 -0400
Received: by mail-pf1-f195.google.com with SMTP id r1so938479pfq.12
 for <qemu-devel@nongnu.org>; Wed, 26 Jun 2019 01:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sA9yQJwjq/CErx0u41h2VNIfrOSmE7x6FZeiFsbfxIo=;
 b=Ex9AJ5clWKVluNqLC9lMZYwcnQcf1lW0PAh1OABMinhqGlNY+Bgf8wyNQXeyRirDtg
 1WDlWmCQ7cTvrtsuzYIStw5y8Q5RAD4iqwUnaPhHMXinUyg7IHjuXVF3+ZBdhOrnu6il
 n+mCiLW4pjrAcFE7/YFN7P7ifFbdQYd0o6Gu7UfiDiF+u//62iLPATo/hXY2NW29tNAE
 nG8vRz/PjO9QgkZzSmLzZ9/I/96bSZAvwTTCZdou4Nzn9QirDHi82pWqz+cq1lzwv9E+
 sXYiDiqRHbswKJ9yvI/1B7kxVxYTjEpJqRGKdsVyOnKE72zuIa16cLor9TeJnOar61I+
 y6DA==
X-Gm-Message-State: APjAAAVy90ajH82cXPhOup0nEmYK2Rqj292kILT2JD2GVaq+OKMRQHMS
 1NfjPmQREbUg692QwFqMaXiP3g==
X-Google-Smtp-Source: APXvYqzihv0ls3BNF+A5rd/OgNeyYKG7Jlg6b2421NuPrO5Hc+nALw3owAyTGbiYTKtP+pKkZ68skg==
X-Received: by 2002:a17:90a:1aa4:: with SMTP id
 p33mr3302666pjp.27.1561537526850; 
 Wed, 26 Jun 2019 01:25:26 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id 14sm27064073pfj.36.2019.06.26.01.25.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:25:26 -0700 (PDT)
Date: Wed, 26 Jun 2019 01:25:26 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 01:05:18 PDT (-0700)
In-Reply-To: <CAEUhbmVZm-dhvT40Ck4d159SHin_D-U47+CHShjajzM1f-P9Gw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-4265f77a-c58a-4851-871a-093b4212df1d@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-devel] [PATCH for 4.1 v3] target/riscv: Expose time CSRs
 when allowed by [m|s]counteren
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, fintelia@gmail.com,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jun 2019 23:58:34 PDT (-0700), bmeng.cn@gmail.com wrote:
> On Wed, Jun 26, 2019 at 4:23 AM Jonathan Behrens <fintelia@gmail.com> wrote:
>>
>> I just did some testing on a HiFive Unleashed board and can confirm what
>> you are saying. The low 5 bits of both mcounteren and scounteren are
>> writable (if you try to write 0xFFFFFFFF to them, they'll take on the value
>> 0x1F) but even with the TM bit set in both mcounteren and scounteren the
>> rdtime instruction always generates an illegal instruction exception.
>>
>
> Then I would think the FU540 is not spec complaint :)

Ya, it's an errata.  There's a handful of them :)

>> Reading through the relevant chapter of the spec, I still think that having
>> mcounteren.TM be writable but making rdtime unconditionally trap is
>> non-conformant. If other people feel strongly that rdtime should always
>
> Agree. To test hardware (FU540) compatibility in QEMU, maybe we can
> add a cpu property to allow hard-wiring mcounteren.TM to zero?

In theory we should have properties to control the behavior of all WARL fields,
but it's a lot of work.  I'd be happy to take a patch for any of them.

>> require trapping into firmware then the natural change would be to simply
>> hardwire mcounteren.TM to zero (the value in scounteren wouldn't matter in
>> that case so it could be left writable). My own (biased) personal feeling
>> is that this full implementation makes sense at least for the `virt`
>> machine type because it represents a clear case where deviating from
>> current hardware enables a performance boost, and would not break
>> compatibility with any current software: both OpenSBI and BBL try to enable
>> hardware handling of rdtime when the platform claims to support it.
>>
>
> Regards,
> Bin

