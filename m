Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1422EC2C1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:52:19 +0100 (CET)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCyo-0006CT-Ui
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCxM-0005ju-Qn
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:50:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCxL-00052F-DJ
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:50:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id r4so3327408wmh.5
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7iWnIi51Qx0vRpypwG7rAsWRDntKJ/lEFRKdx5h41HQ=;
 b=gZqLnmFvb3Wk5wYDprgGntssCL0int4dEI0UBLxjd09b4n5DV2KU5zXYaHfC6Nxl6C
 HUWXQh0eM0kKgwwFzVcaOrWnRmLCuu0DakbMPa5BqEhUZ89uHM0krWXcFL+YMEztKUoM
 z3/odoxnTDvF0Fy5bvGfmsxRXLJSK3Hwvef1YO4bIAr2Ve1qO0dNGXO5VUckVoLkGqlj
 GJr7+Vg1sbn4UYiygYBm6JdmWblrBTQgYL09y15X4BbwA+vT2YEoetLX3yOvAIStr/Am
 igblV6qK308VbKyDZ4qxAdK6oWDYwRjypM8RfECiT8lHE14TUIUpT1srL2OeOHK/MklM
 2eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7iWnIi51Qx0vRpypwG7rAsWRDntKJ/lEFRKdx5h41HQ=;
 b=StqKIK37mleIWPPW39iBBN1eW/Fip8Yc7Y9nRMEyR9H9zhYhpSyMJMwOuCwpYFAFvl
 BFboU5fOw8cxhhPqVenhGBkVm8CiUdGPyKHxzLHVDsjOYuTwbJ/DQdJfAVtHbO8UIkBW
 LDvM08xOZuAYBO41z6+hsASHXy/AlDtxgTGDzBkNQF0DMjZwmb8bqNa8V6xVwaTxI8Cx
 wNqB5EQqyYqv2PuX76TD+PyUM5y8qW92XbWA+ZqFb4QH6nWSR6LFssGJ75EL5E0ScVzt
 iyZlACG2KFJG6d1ZRGksTQNCFydQSWZ+/RM9HMWLSMGH5RSpBZORPMNGGOd+1J8gh3J1
 5abw==
X-Gm-Message-State: AOAM531ApVUVHYvXUJf+uHllKyWBw4P5iwEgypEQacLP0jryxUzlzUvL
 QDXMMC83SD6EckIzQyzzZx0=
X-Google-Smtp-Source: ABdhPJwucD7akQ/tnw8vP8nPaWd9jNXlbqPW0NJMhVnTNtmVHQ6xQRx+lfZAL3aql0OTT1YbCXJ56w==
X-Received: by 2002:a1c:4156:: with SMTP id o83mr4652301wma.178.1609955445810; 
 Wed, 06 Jan 2021 09:50:45 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id j2sm4370063wrh.78.2021.01.06.09.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 09:50:45 -0800 (PST)
Subject: Re: [PATCH v2 0/8] MIPS Bootloader helper
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <f96001e4-5ef4-3d22-5372-45687761a951@amsat.org>
Message-ID: <720beb63-f1b4-84cc-d1f5-46ac05346bda@amsat.org>
Date: Wed, 6 Jan 2021 18:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f96001e4-5ef4-3d22-5372-45687761a951@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/21 9:42 PM, Philippe Mathieu-Daudé wrote:
> On 12/15/20 7:41 AM, Jiaxun Yang wrote:
>> v2:
>> A big reconstruction. rewrite helpers with CPU feature and sepreate
>> changesets.
>>
>> Jiaxun Yang (8):
>>   hw/mips: Make bootloader addresses unsgined
>>   hw/mips/malta: Use address translation helper to calculate
>>     bootloader_run_addr
>>   hw/mips: Use address translation helper to handle ENVP_ADDR
>>   hw/mips: Add a bootloader helper
>>   hw/mips: Use bl_gen_kernel_jump to generate bootloaders
>>   target/mips/addr: Add translation helpers for KSEG1
>>   hw/mips/malta: Use bootloader helper to set BAR resgiters
>>   hw/mips/boston: Use bootloader helper to set GCRs
>>
>>  hw/mips/bootloader.c         | 157 ++++++++++++++++++++++++++++++++
>>  hw/mips/boston.c             |  62 +++----------
>>  hw/mips/fuloong2e.c          |  48 +++-------
>>  hw/mips/malta.c              | 171 ++++++++++++-----------------------
>>  hw/mips/meson.build          |   2 +-
>>  include/hw/mips/bootloader.h |  48 ++++++++++
>>  target/mips/addr.c           |  10 ++
>>  target/mips/cpu.h            |   2 +
>>  8 files changed, 306 insertions(+), 194 deletions(-)
>>  create mode 100644 hw/mips/bootloader.c
>>  create mode 100644 include/hw/mips/bootloader.h
> 
> Patches 1-3 queued to mips-next.

Patch 6 queued to mips-next.

