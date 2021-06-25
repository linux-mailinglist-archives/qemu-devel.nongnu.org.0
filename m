Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0A3B4823
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:21:48 +0200 (CEST)
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwpWV-0000Ta-BA
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwpV8-0007co-OE
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:20:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwpV6-0000d9-Ir
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:20:21 -0400
Received: by mail-wr1-x430.google.com with SMTP id u11so11356155wrw.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N7giX/ECf4vpn1DeVF6DPWgZdMiYLVUBtO7u6Lx/oWo=;
 b=NSDyvnMytoVLKN3VcrJOvzWo0v+FGeBu67ZmZsaQKmFEQxmeG2pvc9tGZG1o+0lYU0
 e2Yt/kYwRinsKJL7GkV2fba3UFmNHNMvRg0pFDJlA1KJJyBe1on2WiW1E8v/75fo5Mss
 vt7Sh2247oMP+3zsYs3OoY+6HKb6RtHVQsLLQCqOs3Dz5Rd7/TNJ1lxpCMDAtOzXYSMH
 tdPpscW8LATzY7zlDnSobgpJZk80USsXx47V9RU4Z7kW8jdj9cIy7DCVI8RYvS8qHCQz
 +rPSmjgkDxTSOr7+omeXOL5Uh/wczfRT7ZHZex1XlVvamkuOmJeN8CYmZXXp/wR7GbsM
 LeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N7giX/ECf4vpn1DeVF6DPWgZdMiYLVUBtO7u6Lx/oWo=;
 b=o6pSSZGRdBqv9n/Z5YBPKeNQypcFzvP0IeTBD7knBbJ4k2kqOJTsty4r8dPTz/Y9LP
 YGwJaSPQQy1e/isJF0jiD+TKNtwxHpKz9YXREercnr/xXr9s4z+YCEqtK638zNXktUGg
 ZzkyCL4Uwud2A/DNCF2lFN5wmkjL1CGol6gcallygzhUrb3kZg0Se8NVDXB5npaftSk3
 U+3/FyJ6nfYsHAKUfiqk3o3AxMR354m6DzTIk7v/YiO0uL9MBrLD9ImZkj4cXlvcEDoU
 G4fMjrfZhh7Kh8a+YKuAJwvMiyaeeYRobyzmUc3MxhqGwXyeDWnLfvyU14BcEygR47nH
 aTEw==
X-Gm-Message-State: AOAM531gjAF3H6pDmM0F8micK3CjbsPTw2cLYWWi1ei9vTXhNnNeSm2t
 KqOxbtrJYNXwy8TsYgz0KsQ=
X-Google-Smtp-Source: ABdhPJzx8vJmKlsBVedHUjdDp88Z6UAlBDEOWJzPACiG7TrWD4FqzDm21kiSOLSkMB8HmLR9PclgEA==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr12354674wrs.420.1624641619006; 
 Fri, 25 Jun 2021 10:20:19 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n8sm6411485wrt.95.2021.06.25.10.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 10:20:18 -0700 (PDT)
Subject: Re: [PATCH 0/2] g364fb: fix migration (or: fix migration for MIPS
 magnum machines)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 hpoussin@reactos.org, fthain@telegraphics.com.au
References: <20210625073844.1229-1-mark.cave-ayland@ilande.co.uk>
 <23ac7f38-6378-1506-aad9-9602ae5379e8@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dbde0ed8-8f9a-2267-1eb9-f3676f3dc8f6@amsat.org>
Date: Fri, 25 Jun 2021 19:20:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <23ac7f38-6378-1506-aad9-9602ae5379e8@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 6:37 PM, Mark Cave-Ayland wrote:
> On 25/06/2021 08:38, Mark Cave-Ayland wrote:
> 
>> I noticed whilst testing the previous dp8393x patchset that I would
>> always
>> get a segfault whilst attempting to migrate the MIPS magnum machine.
>>
>> A bit of detective work shows that the problem is an incorrect
>> VMStateDescription
>> in the g364fb device which expects a G364State but instead receives a
>> G364SysBusState.
>>
>> Looking back through the git history suggests that migration for this
>> device
>> (and also the MIPS magnum machines) has been broken for several years,
>> so patch
>> 1 takes the opportunity to improve the migration stream for the
>> framebuffer
>> first whilst patch 2 contains the actual fix.
>>
>> Note that I don't use the MIPS magnum machines on a regular basis but the
>> patchset fixes the migration error and survives some light testing here.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>>
>> Mark Cave-Ayland (2):
>>    g364fb: use RAM memory region for framebuffer
>>    g364fb: add VMStateDescription for G364SysBusState
>>
>>   hw/display/g364fb.c | 27 ++++++++++++++++++---------
>>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> Thanks for the review Phil, I've just sent v2 on its way. Does it make
> sense for this to be merged via the MIPS tree?

Sure, I was going to suggest that too. Gerd could still beats me
since it is hw/display/ ;) I plan to send another pull request
during next week.

