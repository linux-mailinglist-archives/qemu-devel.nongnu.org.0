Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BBDF3522
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 17:55:05 +0100 (CET)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSl3o-0007WW-EJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 11:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iSl1Q-0005X1-9d
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:52:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iSl1O-0002xA-Lu
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:52:35 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iSl1O-0002wn-6x
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:52:34 -0500
Received: by mail-pg1-x543.google.com with SMTP id w11so2408240pga.12
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 08:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KQCtLcefXWN3Ffga/uquHl+0Zn6mwEYpVn1eJIc/dDM=;
 b=sTqJPxQyUZkgeRjSYG5u/UEeZopFo/XxJQ99wgv42BJ+ZP16qiEvEKTy+lDvCvA6Lc
 P7RkXdOiBfaByNfKkccVzUH1TDhBhBtQxveBLkcVBJQj9SSpL/73v1nnw6rBF9Wge8Ah
 3NM+TuXeh0yC65yAmBhVUB49bzGlPDtz/ctH4v3DiHZ6DmevmCddIaeebfs6k34/v+yv
 +wvVcB2q8tyteLEIz77jj3PzsCwfS8D+V8l/7F8mPrAa/WUt0wCqaG6YKru+Fvtytg1W
 26Nv8R2U0kxWT1v3xIt1rQqNfMhdU7fYrGBVU5CCYZMiko1y9pb8a0Q9SrH12vHHNXYp
 vXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KQCtLcefXWN3Ffga/uquHl+0Zn6mwEYpVn1eJIc/dDM=;
 b=QER+kIh862noE8BX+SSkoMzkWkBD3SNX2FfJCcaTXIQ7ayFNY7FWIs5JaVNTEiPhVn
 CJKgdB49vd2ofZDwKVRm+gwZ85uoderAB9PUI1OyeoUDmrGQWmPoDEhoQWoOqen7DMHS
 9D7aDQilZLpqkJxGBnsWV9vj4ML5vLEd5eou148iM19yMzmqNqL7Q1SQjPpPXXVlUYk+
 wQZeJ3YW6Ze0ZpU5ul45yHHNbSwEm18Rxp7Z58EHlwrjdv0fM8oUs+3J24vohZsCpoHd
 UfrDzOvPDRyqSSZcxNsGvtxvMy/hi/9iQ2m4KmWDEJHyfB4A8b4VZIOTycS1fJMKBQIC
 tjdQ==
X-Gm-Message-State: APjAAAVtLybBgcfB7nc4Rf4SnqeqDrZEIuRUXlC7cI55+5S0YfetqFt9
 CXNjmyvd/TpV+SNchISiJPDdnw==
X-Google-Smtp-Source: APXvYqxMH83l8Efo2BQC35h3P36kNgNcb/5nXZ0kAGYX3XgQPumNcc02056VVwv/BUKexO5QVcC9VQ==
X-Received: by 2002:a65:664e:: with SMTP id z14mr5530898pgv.201.1573145552458; 
 Thu, 07 Nov 2019 08:52:32 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m13sm2536669pga.70.2019.11.07.08.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 08:52:31 -0800 (PST)
Date: Thu, 07 Nov 2019 08:52:31 -0800 (PST)
X-Google-Original-Date: Thu, 07 Nov 2019 08:34:14 PST (-0800)
Subject: Re: [PATCH v8 0/3] RTC support for QEMU RISC-V virt machine
In-Reply-To: <20191106115602.74299-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-fceb5aa2-7610-421a-b350-d939ace5fee2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Anup Patel <Anup.Patel@wdc.com>,
 qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, palmer@sifive.com,
 qemu-devel@nongnu.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, anup@brainfault.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 06 Nov 2019 03:56:29 PST (-0800), Anup Patel wrote:
> This series adds RTC device to QEMU RISC-V virt machine. We have
> selected Goldfish RTC device model for this. It's a pretty simple
> synthetic device with few MMIO registers and no dependency external
> clock. The driver for Goldfish RTC is already available in Linux so
> we just need to enable it in Kconfig for RISCV and also update Linux
> defconfigs.
>
> We have tested this series with Linux-5.4-rc4 plus defconfig changes
> available in 'goldfish_rtc_v2' branch of:
> https://github.com/avpatel/linux.git
>
> Changes since v7:
>  - Fix broken "stdout-path" in "/chosen" DT node of virt machine
>
> Changes since v6:
>  - Rebased on latest QEMU master
>  - Addressed all nit comments from Philippe Mathieu-Daude
>
> Changes since v5:
>  - Rebased on latest QEMU master
>  - Added maintainer entry for Goldfish RTC
>
> Changes since v4:
>  - Fixed typo in trace event usage
>  - Moved goldfish_rtc.h to correct location
>
> Changes since v3:
>  - Address all nit comments from Alistair
>
> Changes since v2:
>  - Rebased on RTC code refactoring
>
> Changes since v1:
>  - Implemented VMState save/restore callbacks
>
> Anup Patel (3):
>   hw: rtc: Add Goldfish RTC device
>   riscv: virt: Use Goldfish RTC device
>   MAINTAINERS: Add maintainer entry for Goldfish RTC
>
>  MAINTAINERS                   |   8 +
>  hw/riscv/Kconfig              |   1 +
>  hw/riscv/virt.c               |  16 ++
>  hw/rtc/Kconfig                |   3 +
>  hw/rtc/Makefile.objs          |   1 +
>  hw/rtc/goldfish_rtc.c         | 285 ++++++++++++++++++++++++++++++++++
>  hw/rtc/trace-events           |   4 +
>  include/hw/riscv/virt.h       |   2 +
>  include/hw/rtc/goldfish_rtc.h |  46 ++++++
>  9 files changed, 366 insertions(+)
>  create mode 100644 hw/rtc/goldfish_rtc.c
>  create mode 100644 include/hw/rtc/goldfish_rtc.h

Thanks.  I've updated the patches on my queue, LMK if there are any more 
changes!

