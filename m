Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F88850F4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 18:21:00 +0200 (CEST)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvOgN-0006nl-US
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 12:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40633)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@sifive.com>) id 1hvOft-0006ND-MY
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1hvOfr-0001bs-Lc
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:20:29 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41397)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hvOfp-0001XI-Jo
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:20:25 -0400
Received: by mail-pl1-x642.google.com with SMTP id m9so41393776pls.8
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=wmtlTJ2PpsGte4ZT3WDWrcjPOSh5JWo89KaQNHqHsB4=;
 b=C6hsf++5Kn5CJ166WzCUMDoH9cVQ3G0qOc0H4nt6U9qCb6r4x7tFhr0D/rJDzgOkwl
 DKMOBrwcKNKOtY6V/pQs7GtmpVSmRqknoYkRwVMSelQBoYG8A+4LaSsS7ei6nNGtMLwc
 Kv11RHXYZx7cAR8AL90o3wZDW8IyZTwFtmZBoT+6UeU2xJ8PR5az7Yb2G1G4xop4IuhV
 o8/qyBiDbFcRhanwwe4LknDGMLORrnaCmmeKbCzMC7HLmBYft6ZNHvJz7mSP+h/Z4zxa
 Uzbw9Fnpx5GGjqNS41faWjT+CVkHjaY9er4unxNOfkPpLHQWItFsViV79KEb13rse9Qd
 1s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=wmtlTJ2PpsGte4ZT3WDWrcjPOSh5JWo89KaQNHqHsB4=;
 b=diVzCLYua4sN+2sHc3/tVAxFA7VsDbbLN/pLW2qJoYHbxthUF7hWH9DbcPK4hjpx57
 DqPKQYE02GwSXZWXsECfiKmajx1ZaYwAiUQ3dkAK/vIsYsHIROmbkriWj+iZfEhf3Kcl
 nsUc28BLaJ/v6tynRKB9VNQS6ramYi03SAWS7r/b7RWxJ4khyY8eKA97GsEs/zIPdUxd
 jaE3cR9YRIgl6E7GyMACRX4AIxdzr3nb3Mz9YqqzR3gY6p27B4+jRRUzx175/i/hk3Z6
 0Kvd79AI4Kg8aoswjoPJvVvrwOQco4mHt4jQOP3cGy2V0jTWPiskeVbn9HNuYDoAXRKv
 c/nQ==
X-Gm-Message-State: APjAAAVkg3GRi//i144M0r/f0eevt/5UkH33olpQUGJDrvjlG3q7bHnv
 PaXcH05Tq3DbWlxhutcE05QhRQ==
X-Google-Smtp-Source: APXvYqywbE6l2fW7mmfgMu4pK4fTvpf6BdQFQ2/jE2k5040hfbZx5ML4/U3p52k+FtFDNCmAsU02Zg==
X-Received: by 2002:a17:902:2983:: with SMTP id
 h3mr9029249plb.45.1565194822755; 
 Wed, 07 Aug 2019 09:20:22 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x26sm116717148pfq.69.2019.08.07.09.20.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 09:20:22 -0700 (PDT)
Date: Wed, 07 Aug 2019 09:20:22 -0700 (PDT)
X-Google-Original-Date: Wed, 07 Aug 2019 09:19:59 PDT (-0700)
In-Reply-To: <CAFEAcA8q-NSx51TkcbLSgVTyHNYjDe5pK5+u9HXABxANQEhT1w@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-c7e7ab85-6684-4319-85fe-a468eb08a5eb@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH for 4.1] RISC-V: Ignore the S and U
 extensions when formatting ISA strings
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Atish Patra <Atish.Patra@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 07 Aug 2019 09:08:20 PDT (-0700), Peter Maydell wrote:
> On Wed, 7 Aug 2019 at 16:02, Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> The ISA strings we're providing from QEMU aren't actually legal RISC-V
>> ISA strings, as both the S and U extensions cannot exist as
>> single-letter extensions and must instead be multi-letter strings.
>> We're still using the ISA strings inside QEMU to track the availiable
>> extensions, so this patch just strips out the S and U extensions when
>> formatting ISA strings.
>>
>> This boots Linux on top of 4.1-rc3, which no longer has the U extension
>> in /proc/cpuinfo.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>> This is another late one, but I'd like to target it for 4.1 as we're
>> providing illegal ISA strings and I don't want to bake that into a bunch
>> of other code.
>
> Sorry, you've missed the 4.1 train by about 24 hours. There
> will be no further changes to 4.1 unless they are absolute
> showstoppers (security bugs, bad data loss, etc), and this doesn't
> count, judging by the description.

OK, no problem.

