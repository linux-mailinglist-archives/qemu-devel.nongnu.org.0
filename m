Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE62DED72
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 07:22:20 +0100 (CET)
Received: from localhost ([::1]:52152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqVdD-0004qj-6K
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 01:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqVcB-0004Pq-SY
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 01:21:15 -0500
Received: from relay2.mymailcheap.com ([151.80.165.199]:43499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqVc9-0006HB-9n
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 01:21:15 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id 957BD3ECD9;
 Sat, 19 Dec 2020 07:21:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 6CC172A5BB;
 Sat, 19 Dec 2020 07:21:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608358866;
 bh=T77gSqiDQCdhffzMCw3HFPcwhRGIAi2rtFu+ujHFNCE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=O5wGTAVy2XvqNV2VOZ/m8eVZx/ScH/RIFv5an8WvLcc4Z8oGTKjUSiknNlkyLQlfI
 w7ovwZ8nmsSJKCxBNzE/vgKGuc/0W8ZnHMk0+iuJOvWJaw588BLGQYhZQ+Iv0ZZkuO
 OV/g0yzj+cRtCMmB3OYD5JCB4zWnD6gejyynM4f4=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLaq7L0ARhD9; Sat, 19 Dec 2020 07:21:02 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 19 Dec 2020 07:21:02 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 852D541E18;
 Sat, 19 Dec 2020 06:21:00 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Ewl0MmgP"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (114-42-199-102.dynamic-ip.hinet.net [114.42.199.102])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id A73F241E18;
 Sat, 19 Dec 2020 06:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608358854;
 bh=T77gSqiDQCdhffzMCw3HFPcwhRGIAi2rtFu+ujHFNCE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ewl0MmgPANzibzXEAZAbVixHfsoLJa+7EQclGxn1ZWzS6NjVAhDkqI9ZUUfL+2HBR
 adjO0w8dktNMJmFY296lfalqcv9X5H1i3DBBvBIY8Fd+MeoFw3p/8SPI3mWMYtum+i
 NEFZklZbQBMq/y3bAw3R0hHJ4TaqG1aV/BfrE5Ds=
Subject: Re: [PATCH v2 0/8] MIPS Bootloader helper
To: qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a03d3b90-edc3-f6dd-1898-61e0a6f06f85@flygoat.com>
Date: Sat, 19 Dec 2020 14:20:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spamd-Result: default: False [-0.10 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_PBL(0.00)[114.42.199.102:received];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 TO_DN_NONE(0.00)[]; R_SPF_SOFTFAIL(0.00)[~all];
 ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 852D541E18
X-Rspamd-Server: mail20.mymailcheap.com
Received-SPF: pass client-ip=151.80.165.199;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay2.mymailcheap.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



ÔÚ 2020/12/15 ÏÂÎç2:41, Jiaxun Yang Ð´µÀ:
> v2:
> A big reconstruction. rewrite helpers with CPU feature and sepreate
> changesets.

ping?

>
> Jiaxun Yang (8):
>    hw/mips: Make bootloader addresses unsgined
>    hw/mips/malta: Use address translation helper to calculate
>      bootloader_run_addr
>    hw/mips: Use address translation helper to handle ENVP_ADDR
>    hw/mips: Add a bootloader helper
>    hw/mips: Use bl_gen_kernel_jump to generate bootloaders
>    target/mips/addr: Add translation helpers for KSEG1
>    hw/mips/malta: Use bootloader helper to set BAR resgiters
>    hw/mips/boston: Use bootloader helper to set GCRs
>
>   hw/mips/bootloader.c         | 157 ++++++++++++++++++++++++++++++++
>   hw/mips/boston.c             |  62 +++----------
>   hw/mips/fuloong2e.c          |  48 +++-------
>   hw/mips/malta.c              | 171 ++++++++++++-----------------------
>   hw/mips/meson.build          |   2 +-
>   include/hw/mips/bootloader.h |  48 ++++++++++
>   target/mips/addr.c           |  10 ++
>   target/mips/cpu.h            |   2 +
>   8 files changed, 306 insertions(+), 194 deletions(-)
>   create mode 100644 hw/mips/bootloader.c
>   create mode 100644 include/hw/mips/bootloader.h
>

