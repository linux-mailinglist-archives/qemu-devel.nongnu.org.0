Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D73DE929
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:04:05 +0200 (CEST)
Received: from localhost ([::1]:48292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAqLD-0000My-Mz
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqK2-0007Kr-Ae
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:02:50 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqK0-0002qt-0j
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:02:50 -0400
Received: by mail-ed1-x52f.google.com with SMTP id f13so28005372edq.13
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r8fpJyJTQYiSETFPNIE3u8CFQLrci8TghacHJJ7RsgM=;
 b=Fcx8NZy8QeHiIQwfZ6zg96fZJ0CcXvgSwPLjAXwRf7Q1je+WUaUVjKSY3kBQO3jTaQ
 WNe961M22L9v9yjIr9Yy9IpWDCqhHR97vkFXC4NASXDyXZzMB2mn5l9NxDjL7EYdBuZ3
 GnHRWCj+Q7qDMJ7hb105n0W6RUHzHIwouNlhbJZmr0e6dFZ43aFJOlemamFxCV8J83Ci
 R9rw1w+4HSplT2BzaS1gOfOwozTEJlBS76uBK2zlVhg8DS+bQwlM6m336mjX44I9HxSZ
 bHKA3lYum229Gwn96GeEOI9Il5cIX2BEF8EDgPIawkxsoUscfxJi0qrJNJriWd14SSS7
 E7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r8fpJyJTQYiSETFPNIE3u8CFQLrci8TghacHJJ7RsgM=;
 b=ViOk1sjTSo+wK7CuoOPjrOpgZ6DCY3imTm4z85dm6ccZL4kv1aa7opKiYSAm7CCb1D
 TVCrGSyAru2LtvAcd66X9bfLXQHv78dZ+lLG9ZKHK+6Bqw8IdHSTkcisXe3rqzTFXYYS
 jr5eDRNrRWcuXQzUAE+Lico4v1HWIJdA+qxMzXmTmw98rNcN7m2IJkLULVbEDZVuSAuX
 XFpDbg4dPM/CcxiGnklL8WOVUMF0J7w5KHCTCY6BK7jNOmh2X/VjJY5Wyr/4wRqS+uhB
 xIG6L1TenE3jUUYhnXwyiU+0QLiaCWXniavO+Ct8VzfpCfPfwdRPaU7jgc/oCo172XSK
 KFgA==
X-Gm-Message-State: AOAM532Wn+tv4hSj0aT/vGYY+Izp7Yn71zwH5nqTb+BMJb9E1VdsgtRV
 P++KD5DZghjt67rsonQIeLrvGOMa7E6c3DlFDCAbrQ==
X-Google-Smtp-Source: ABdhPJx/9gtqlx2vZ3pbUEcNoozeWv+qfsbis+NU3c2MGRVNX0BFvmG6u1LLxTe4Nwob6gJG4qRyRK/eqwxJC/iMHWk=
X-Received: by 2002:a50:f615:: with SMTP id c21mr25006041edn.146.1627981365932; 
 Tue, 03 Aug 2021 02:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210802235524.3417739-1-f4bug@amsat.org>
 <20210802235524.3417739-3-f4bug@amsat.org>
In-Reply-To: <20210802235524.3417739-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 10:02:02 +0100
Message-ID: <CAFEAcA9r4vwz1CsBXhCvtVkNAPAu_UsKK-6CwfP7oyf4cXFreQ@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 v2 2/2] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 00:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> OSS-Fuzz found sending illegal addresses when querying the write
> protection bits triggers the assertion added in commit 84816fb63e5
> ("hw/sd/sdcard: Assert if accessing an illegal group"):
>
>   qemu-fuzz-i386-target-generic-fuzz-sdhci-v3: ../hw/sd/sd.c:824: uint32_=
t sd_wpbits(SDState *, uint64_t):
>   Assertion `wpnum < sd->wpgrps_size' failed.
>   #3 0x7f62a8b22c91 in __assert_fail
>   #4 0x5569adcec405 in sd_wpbits hw/sd/sd.c:824:9
>   #5 0x5569adce5f6d in sd_normal_command hw/sd/sd.c:1389:38
>   #6 0x5569adce3870 in sd_do_command hw/sd/sd.c:1737:17
>   #7 0x5569adcf1566 in sdbus_do_command hw/sd/core.c:100:16
>   #8 0x5569adcfc192 in sdhci_send_command hw/sd/sdhci.c:337:12
>   #9 0x5569adcfa3a3 in sdhci_write hw/sd/sdhci.c:1186:9
>   #10 0x5569adfb3447 in memory_region_write_accessor softmmu/memory.c:492=
:5
>
> It is legal for the CMD30 to query for out-of-range addresses.
> Such invalid addresses are simply ignored in the response (write
> protection bits set to 0).
>
> In commit 84816fb63e5 ("hw/sd/sdcard: Assert if accessing an illegal
> group") we misplaced the assertion *before* we test the address is
> in range. Move it *after*.
>
> Include the qtest reproducer provided by Alexander Bulekov:
>
>   $ make check-qtest-i386
>   ...
>   Running test qtest-i386/fuzz-sdcard-test
>   qemu-system-i386: ../hw/sd/sd.c:824: sd_wpbits: Assertion `wpnum < sd->=
wpgrps_size' failed.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: OSS-Fuzz (Issue 29225)
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 84816fb63e5 ("hw/sd/sdcard: Assert if accessing an illegal group")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/495
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

