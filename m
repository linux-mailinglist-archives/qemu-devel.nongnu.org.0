Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C06370E3E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:42:18 +0200 (CEST)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldG6j-0006WO-3I
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldG53-0005iA-Gg
 for qemu-devel@nongnu.org; Sun, 02 May 2021 13:40:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldG4w-00059D-RL
 for qemu-devel@nongnu.org; Sun, 02 May 2021 13:40:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id i128so10153wma.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jKXsp1NJgz8YpIGlPXw4684NXW5bx00buUxzBqKQbJQ=;
 b=kRQsiUDgMKRyb8xGAV9Sbf6kWyod+PKMU1G+pTOqLUfjWhLVfEpb6ZanMDe87sUB4I
 +j4UoObRaSnqrb8rWhltEkkYGx4e+5zqJRz8/tEMlXBRrxbomvS42zDFL4qdfnQ2qAaA
 JdlQ6gGJ+nN4Qw5lRbFk5UckZBvj/anZ30+KSAgY1J0eoMvk0aPFjFm0woS8X5dN/Z/m
 07Q1lLUj6d5k2h81D2/Xo5wLUcVglnLkpHlkRl6U61r9A/NAvjbQwcPNjmCmKq9amd7B
 zitlTNaaOeLnm1aBIoD+nLC8FoZNkwKxGvtMrR3kOhi/mdwU5XvO0NVrdvkNRms9vvs9
 0gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jKXsp1NJgz8YpIGlPXw4684NXW5bx00buUxzBqKQbJQ=;
 b=uABiGpcdkK957M0UBoTRcwlGBwHLu86Rbi2/WpP+C2GfXDvRlycgMT8b/CQJxgjt2z
 p9aGGquxmgN+zFK75KETXasF8NBXJVMU5IT6e5LbDXmFVuhaQVCxWEd7dZaRFg0zj/uD
 hDJ6KUVFi358TDxsUZsPDWJn3asZlAWAZIfsjxIzJgUTRW1pIHXtdyKXOyER/I48+U9J
 Z3ffYDVae1+inX8pzXxv9R06Civ7BjQrxcd9PHwHQS8RUI9DKVyi+aBeXEIUnDxPbrUH
 BN8pE7AKEGUJW/QlSVr9/FYXjlz5gusaUBrtm4aximmn9+Yek9DPrDwFDPFleK+J9RhF
 Ywpg==
X-Gm-Message-State: AOAM530DRppUdqi4VtWjBrszJq08R+voIMJjYEwzqyvyVgfAEHFBqbI+
 jYCN5ggwDNGwVrwd3XIeP0U=
X-Google-Smtp-Source: ABdhPJzoXU4tPDZbKqa3pnSY7aabddSPoMOHX3EmQCxrMX4L8/TF3WP3qIYb9fWW9lAO9khk1hr57w==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr17365551wml.123.1619977224871; 
 Sun, 02 May 2021 10:40:24 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d9sm622221wrp.47.2021.05.02.10.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 10:40:23 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 0/3] hw/sparc/sun4m: Introduce Sun4mMachineClass
 to access sun4m_hwdefs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210407175305.1771069-1-f4bug@amsat.org>
 <2531855e-f24e-cd38-7e67-edeae26d0dc5@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5671047-a8b1-56dd-2d49-cad235a4fdb0@amsat.org>
Date: Sun, 2 May 2021 19:40:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2531855e-f24e-cd38-7e67-edeae26d0dc5@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 1:20 PM, Mark Cave-Ayland wrote:
> On 07/04/2021 18:53, Philippe Mathieu-Daudé wrote:
> 
>> Hi Mark,
>>
>> This series QOM'ify a bit more the sun4m machines.
>> I need it for a further memory maxsize check.
>> It is mostly code movement (and the diff-stat is good).
>>
>> Philippe Mathieu-Daudé (3):
>>    hw/sparc/sun4m: Introduce TYPE_SUN4M_MACHINE and Sun4mMachineClass
>>    hw/sparc/sun4m: Factor out sun4m_machine_class_common_init()
>>    hw/sparc/sun4m: Make sun4m_hwdefs a Sun4mMachineClass field
>>
>>   hw/sparc/sun4m.c | 178 ++++++++++++++++++-----------------------------
>>   1 file changed, 69 insertions(+), 109 deletions(-)
> 
> Hi Phil,
> 
> Possibly it might be worth having an abstract TYPE_SUN4M_MACHINE and
> then for each sun4m machine to have that as a parent type?

This is what this series does...

> This would
> allow you to move sun4m_machine_class_common_init() directly into the
> abstract sun4m_machine_class_init() rather than having to call a
> function from within each individual class init function.

OK, can do that.

Regards,

Phil.

