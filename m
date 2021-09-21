Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C241300A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 10:15:28 +0200 (CEST)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSavz-0003UK-K2
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 04:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSauO-0002dc-BC; Tue, 21 Sep 2021 04:13:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSauM-0002r7-5g; Tue, 21 Sep 2021 04:13:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u15so36640206wru.6;
 Tue, 21 Sep 2021 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NN9NFCtCjYb3CNMK7XCn0Ryw3nySBEkOY8TnmsDwP5U=;
 b=QYiEyJoHBmrZ/5oE3p5Dhnmezv2toy55EtwLXwBDv1IK6L958cwUAIMNrrKEhkM0qa
 DyIqKE3YGn3/t893RvHroq8IXBq16oXQk0THrFT3K88wnPiaeaaLGIUO9dmij7UBueyo
 GcWsLg3cis4G3gAWASP5qYdqd1tVT1hwuLlU09cuuo6/t6RIV6fgy4kOT3QHfhgpX9+l
 0ULJmZs+IxwBbe0CbAUQtc9McwZrh/3ePB+yPtZh/byhP4+tP888tWxu2Gfsp8KMnb32
 WLOFD5WGN2CV0o/GFtvU7c6NrC9XlCcUm10XazVpTpjrKN0zhWsfGqGcejB3zOH4azoB
 twTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NN9NFCtCjYb3CNMK7XCn0Ryw3nySBEkOY8TnmsDwP5U=;
 b=KFsqFSZqzrBLB4RGbbnqg75qbvhFul7Inin3iI8PpmuGiHcdRI1gVTq5OCfLSwKdCs
 qxyAGDu4/SEZvVFEKQv2C+7p/Uew1ojWpOsYWgvWXSP/q635SC++aZEVCvWmAVlYuieX
 ZDohNacBKJDD/UpZ726wtNQI3lI5Y3BC0yWBzHO8b/Gmx4ZX/DdsbBOhGSk5kTlI6f0c
 ekEh+UqM6A8PRiMIOjevWnw2IacguhcRyZRYpFl9wYywqL1N96L/ubE6szbG2SjAJRvZ
 4O/gaIrHZxE5KAIj1JFmB039sCJBoCP662AYytcGpTxYmxUNGe8hiuR2buJxsw0ZIr3/
 dU9A==
X-Gm-Message-State: AOAM5313mfTKvuhO8Gzq7wF4zeNvPetsxoySbhe9Ow5hX5PtUxnkYxbh
 b1FUyOksoOV7yYF6QjHugyw=
X-Google-Smtp-Source: ABdhPJy3euQu6UHNGlpueYHNWJSa88RG9EnVCBVjgmXRe4xVVLtIFkSihksMTOslDhnM/Qg9t55qJg==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr14226604wrw.327.1632212017891; 
 Tue, 21 Sep 2021 01:13:37 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n15sm4208016wrg.58.2021.09.21.01.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 01:13:37 -0700 (PDT)
Message-ID: <c329c9a4-0662-4a4f-70fc-b3eda07cb149@amsat.org>
Date: Tue, 21 Sep 2021 10:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RESEND PATCH 1/3] hw/intc: openpic: Correct the reset value of
 IPIDR for FSL chipset
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Bin Meng <bmeng.cn@gmail.com>
References: <20210918032653.646370-1-bin.meng@windriver.com>
 <YUlQo68s9mxISwEs@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YUlQo68s9mxISwEs@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Maarten Koning <maarten.koning@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 05:25, David Gibson wrote:
> On Sat, Sep 18, 2021 at 11:26:51AM +0800, Bin Meng wrote:
>> The reset value of IPIDR should be zero for Freescale chipset, per
>> the following 2 manuals I checked:
>>
>> - P2020RM (https://www.nxp.com/webapp/Download?colCode=P2020RM)
>> - P4080RM (https://www.nxp.com/webapp/Download?colCode=P4080RM)
>>
>> Currently it is set to 1, which leaves the IPI enabled on core 0
>> after power-on reset. Such may cause unexpected interrupt to be
>> delivered to core 0 if the IPI is triggered from core 0 to other
>> cores later.
>>
>> Fixes: ffd5e9fe0276 ("openpic: Reset IRQ source private members")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/584
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> Since these patches are very simple and look sensible, I've applied
> them to ppc-for-6.2.
> 
> However, you should note that Greg and I are both moving into other
> areas and don't have much capacity for ppc maintainership any more.
> Therefore I'll shortly be sending some MAINTAINERS updates moving
> openpic (amongst other things) to "Orphan" status.

I'm not trying to force Bin to become (yet) another maintainer,
but from his previous contributions, he demonstrated a very good
knowledge of embedded PowerPC ISA & chipsets, his patches have good
quality and description, and he is consistent over time in his
contributions. So if he is interested, I'd vouch for him as a
maintainer for embedded ppc. Now up to him, his time and/or employer :)

Regards,

Phil.

