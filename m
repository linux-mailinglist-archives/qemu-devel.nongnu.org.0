Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA33BA97C
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:30:16 +0200 (CEST)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lziX2-0003dQ-1U
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lziW4-0002xf-MY
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:29:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lziW3-0000kh-5i
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:29:16 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t15so13041316wry.11
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nn5WkBs4Zqk4AMQiLPljajT9zzaM+wGpu0f96GyADco=;
 b=n9dvHSf91ioQ6CsYDgMGJ1OIBrMRp7YNlCFNf4M33s8Q+gJqaN/TTuNAz2YI1f0HKB
 xx1SH5OqFbSQKpzh6VAzvTGZgystquJ6nH/UdMBzSgJU71c92l10Mx23tIr4bRRjRd9n
 AiVvvyPkDvEvxnBoI47t4DzqwRi5SbwxGqrbZ8DJz8rv1rOOIoK6X2//t77bw04iwiQG
 h3xXr3mE3fEHvgMRqKNeABipqz+XtRPEt/H7nXVw4/jurJ/qD2Rg1kFjH2zgV5O+wBoa
 ey9A+GmCB464JwHEwiYQg/UkKaXzmW4KhsLC0oMlulave8ky6MVIN2JGi7PHmmGEyzUM
 ruew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nn5WkBs4Zqk4AMQiLPljajT9zzaM+wGpu0f96GyADco=;
 b=CfUPblDXfBvz8zoR9TGGnEuvuVvngcF7eJJdO1SPfmD1f0wRPVvA+6m942QLuCysWg
 ignUM4ICYwHKm7ew1GPIlcACmVOnVW+D+ptq4MXpUazOhACIa2XRTNBvEZDrdk7OqRS4
 H7YTmnCdPUhbslxC0BCB/POVdAF5efzok/j2yiJL+N49kAw/RUMXiIgCHbuzDaJ60kXW
 1dAk5w4MLguEu9Q669TmfW+3+lx4wWlK7X7OzxFeK1wbiDRCBQmps8Q8K8iBeGom5stI
 YRxFW2KD14haxgUI9EVBVIn3zIj4iFHsdDt9FLzCg3LFlADhrl+VPjLM2KQqr/7CliXZ
 E+EA==
X-Gm-Message-State: AOAM530XxZJ6LwGPCq5JytU8QJODrbDKY6J2ELQMZJ0vUmJqM9CTqYJp
 hBsfh9ttSz+N+KiS+D2SYf8xOlQuCMd4MQ==
X-Google-Smtp-Source: ABdhPJyua133plyRjjfhk2/3Y4jIoa1Bo9qljtTgzy3kOz/arK78FEbMBkRWrRZifOaTBJMB9aW7yA==
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr5899445wrw.399.1625329753659; 
 Sat, 03 Jul 2021 09:29:13 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f9sm7137227wrm.48.2021.07.03.09.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 09:29:13 -0700 (PDT)
Subject: Re: [PATCH 2/6] dp8393x: don't force 32-bit register access
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-3-f4bug@amsat.org>
 <88ef2d9c-7dcb-2e2e-037c-6af306ad2a12@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6fb1c380-1a0c-9d0e-be20-b2a7baec3f51@amsat.org>
Date: Sat, 3 Jul 2021 18:29:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <88ef2d9c-7dcb-2e2e-037c-6af306ad2a12@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 4:39 PM, Mark Cave-Ayland wrote:
> On 03/07/2021 15:19, Philippe Mathieu-Daudé wrote:
> 
>> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that
>> all accesses
>> to the registers were 32-bit but this is actually not the case. The
>> access size is
>> determined by the CPU instruction used and not the number of physical
>> address lines.
>>
>> The big_endian workaround applied to the register read/writes was
>> actually caused
>> by forcing the access size to 32-bit when the guest OS was using a
>> 16-bit access.
>> Since the registers are 16-bit then we can simply set .impl.min_access
>> to 2 and
>> then the memory API will automatically do the right thing for both
>> 16-bit accesses
>> used by Linux and 32-bit accesses used by the MacOS toolbox ROM.
> 
> The change should work, but the commit message above needs a slight
> tweak - maybe something like this?
> 
> Since the registers are 16-bit then we can simply set both
> .impl.min_access and .impl.max_access to 2 and then the memory API will
> automatically do the right thing for both 16-bit accesses used by Linux
> and 32-bit accesses used by the MacOS toolbox ROM.

Do you mind sending v3 of this patch reworded (and including the .valid
fields)?

>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
>> Tested-by: Finn Thain <fthain@linux-m68k.org>
>> Message-Id: <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
>> [PMD: dp8393x_ops.impl.max_access_size 4 -> 2]
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/net/dp8393x.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)

