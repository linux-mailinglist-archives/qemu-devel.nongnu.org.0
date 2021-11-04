Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9322A445C04
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 23:08:15 +0100 (CET)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miku6-0007UC-PT
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 18:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mikst-0006nZ-MR; Thu, 04 Nov 2021 18:06:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miksr-0002cA-HL; Thu, 04 Nov 2021 18:06:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so8251142wmj.5; 
 Thu, 04 Nov 2021 15:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ov5UyOWG/LREWFhsLE/a0C98bYm5nthMTa9ht29qXy8=;
 b=ZbjsvAyjdVBraonnCW4mIjpakoixzdj0iG7KRZsEP2woZpJi7fT5w7yDdd0gtihyRW
 IuGTDAO+VSYOzMHQZdMbJmPnnY9AgmYMnpx2hKPogAaknTNX8hnK45HS0/XWypQeaw0T
 dfwyBCc1fvB4BT6+JVLQChwKb9UUIMpEQUr9lpr+nJYTwW0AebnvpKBU2Ywghi6z9bOy
 aG4X+7plFYvMSD+5c4BtMTIfRosCUA2AoMQFACOBXyWQ/o3HZGICV2QUVcsU999AtJvB
 UjHBkR/vzmH1G9PScgJbJGwO60YOijEGaS6Esq8on/CSFzM1YpNzNqNWZiecDfgoE2R5
 kFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ov5UyOWG/LREWFhsLE/a0C98bYm5nthMTa9ht29qXy8=;
 b=hbXEXQoe2SLYa3y7O3Tg3P94wfd3EGdCoxUAprB/2Bkc3jq63hcHEcYz26DQfdXUih
 M4oVajFziVPQn/SNBmIQOZnY+loFUz3+ISoDdFwWeSRHia7r5YK9bKpEl0sK2oBEQDgc
 bjJYpdpAZWnXR70z4KeSIhynzmyH2K0QvtS6qZxE03+Nq70yMb/V+4Zk/FkcPPHahgyg
 8yK6Hx8SIYiOLHVe1+4RRIF9rlsCgfWw1xX3HgEfXPXxMjPah904zg803/HulINjzM8w
 hQaSmD9cqk7HqbR+uE+ZoUmkAbVUJDJJRSdevSxmV2eX8LxXdtU1AVPHYKmVCgGDPd+j
 Zx7Q==
X-Gm-Message-State: AOAM531NIgfG+8prEStGL4eaHn6wfbwJeZhqx4PSekJ2H7eEh7pQLpqP
 2hMPBSAzhPijhvV732/3S4T5iJk/Hhw=
X-Google-Smtp-Source: ABdhPJzFIExVh/H62KmFvkfNz6smxu6vWsg9E784qrXwxmYZLC5V2KWVkpw7QNIaMEbB8DU8LTXvQQ==
X-Received: by 2002:a05:600c:4f10:: with SMTP id
 l16mr7026694wmq.47.1636063614635; 
 Thu, 04 Nov 2021 15:06:54 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u2sm6150185wrs.17.2021.11.04.15.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 15:06:53 -0700 (PDT)
Message-ID: <fec0423b-8ef7-7a76-6827-1ebb6c69db1a@amsat.org>
Date: Thu, 4 Nov 2021 23:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 v2] .mailmap: Fix more contributor entries
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20211027043254.1248097-1-f4bug@amsat.org>
 <530b7d0e-9290-c78a-df50-7ef297dbf0b6@amsat.org>
In-Reply-To: <530b7d0e-9290-c78a-df50-7ef297dbf0b6@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Hyman Huang <huangy81@chinatelecom.cn>,
 Pan Nengyuan <pannengyuan@huawei.com>, Haibin Zhang <haibinzhang@tencent.com>,
 Alex Chen <alex.chen@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for 6.2? (Patch fully reviewed/acked by affected contributors).

On 11/1/21 11:22, Philippe Mathieu-Daudé wrote:
> Can this patch go via the Trivial tree?
> 
> On 10/27/21 06:32, Philippe Mathieu-Daudé wrote:
>> These authors have some incorrect author email field.
>>
>> Acked-by: Pan Nengyuan <pannengyuan@huawei.com>
>> Reviewed-by: Alex Chen <alex.chen@huawei.com>
>> Reviewed-by: Hyman Huang <huangy81@chinatelecom.cn>
>> Reviewed-by: Haibin Zhang <haibinzhang@tencent.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Patch fully reviewed/acked.
>> ---
>>  .mailmap | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/.mailmap b/.mailmap
>> index f029d1c21fe..8beb2f95ae2 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -69,6 +69,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
>>  # git author config, or had utf8/latin1 encoding issues.
>>  Aaron Lindsay <aaron@os.amperecomputing.com>
>>  Alexey Gerasimenko <x1917x@gmail.com>
>> +Alex Chen <alex.chen@huawei.com>
>>  Alex Ivanov <void@aleksoft.net>
>>  Andreas Färber <afaerber@suse.de>
>>  Bandan Das <bsd@redhat.com>
>> @@ -99,9 +100,11 @@ Gautham R. Shenoy <ego@in.ibm.com>
>>  Gautham R. Shenoy <ego@linux.vnet.ibm.com>
>>  Gonglei (Arei) <arei.gonglei@huawei.com>
>>  Guang Wang <wang.guang55@zte.com.cn>
>> +Haibin Zhang <haibinzhang@tencent.com>
>>  Hailiang Zhang <zhang.zhanghailiang@huawei.com>
>>  Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
>>  Hervé Poussineau <hpoussin@reactos.org>
>> +Hyman Huang <huangy81@chinatelecom.cn>
>>  Jakub Jermář <jakub@jermar.eu>
>>  Jakub Jermář <jakub.jermar@kernkonzept.com>
>>  Jean-Christophe Dubois <jcd@tribudubois.net>
>> @@ -135,6 +138,7 @@ Nicholas Thomas <nick@bytemark.co.uk>
>>  Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
>>  Orit Wasserman <owasserm@redhat.com>
>>  Paolo Bonzini <pbonzini@redhat.com>
>> +Pan Nengyuan <pannengyuan@huawei.com>
>>  Pavel Dovgaluk <dovgaluk@ispras.ru>
>>  Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
>>  Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
>>
> 

