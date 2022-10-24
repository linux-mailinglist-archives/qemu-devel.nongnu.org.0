Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB160B161
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:21:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzad-0006RM-AA; Mon, 24 Oct 2022 11:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1omzaa-0006RA-UL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:42:08 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1omzaZ-00032s-B3
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:42:08 -0400
Received: by mail-ed1-x532.google.com with SMTP id r14so32407828edc.7
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v+mHN3ErBBBsbADz29Ldk6jmeeoNmEyDSlnja4h3Z5I=;
 b=OTPg1H2p+/nSPeAA5ycIYEkE4b636onNMyjdcX5BMkk2sGN+Wf3qoHCcnmXQSeeepB
 SYZMyv18DH3dNj/0Tm381zl0BVItLsw0hamopn8w0s3bc+JofGVPuFNp85Pvzn6wbhof
 8KbrBb++grHljJhn0U2tiWZoMuzf7rKxjOXvOzzcP1QI3dOb18nuC8cdfcwxacIKum2R
 7YoBwEfH/OR3Ng9HBgehlsAlc6UQlB40EWT8veSEQeMT2DEm7xI1MRA/oylzqM063/qd
 v8fTmZuV5lGnFBV3P9t3cgmOzgPiA3bMwy65etJMDiaWD0AdxUutjRuJ/dWJRKdLdTXo
 74Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v+mHN3ErBBBsbADz29Ldk6jmeeoNmEyDSlnja4h3Z5I=;
 b=Sif/Ewb+EwR7FvuhyQIK03nYccNf6BwOTZpkmhAG8rgicHHSwoebv+I7+eSac+/2oh
 eFy+Yi8Tn4UHi+rA2W3FY7b0szRVXxUIpCZdmk4ID59r2yTA/DleaBrtVo9lLC4ZdNgU
 xT3HXUqmmTY+hrecluZp+3CdNrR4QRQtWY97H3jdzNNGiTf5AZ/6AwTjIp+qbhFCBZiz
 FMcQbPUX+jcpqkSW6E3YwA3jpKLUMeTU4ZjXu8UZZa6JR+PE2OYvdzJnnuBHzdY1+zmU
 0tGBkpqnuS4jB0ymjg4WeOkGsux1lqLSeUo2AuJYNdTGw6GnHAIKwWwVK7U6usGgSLiT
 FPXA==
X-Gm-Message-State: ACrzQf2PB0+3qk5QlrIaQ+0/GBca8M8rmfXUSU7XJW7Qds+6zjUA8MZ7
 DyMbW0e3IO2YhFWrNOXcYQc=
X-Google-Smtp-Source: AMsMyM6J5Be6eKaqHwS7Q3SQW4XZlrDcxBnMZr4sSJGQGGThUAXBx3Yug9O5Zpi+gcSiETWm/hXX2g==
X-Received: by 2002:a05:6402:254b:b0:45d:b117:90f0 with SMTP id
 l11-20020a056402254b00b0045db11790f0mr30825645edb.57.1666626124455; 
 Mon, 24 Oct 2022 08:42:04 -0700 (PDT)
Received: from [192.168.1.9] ([202.21.109.40])
 by smtp.gmail.com with ESMTPSA id
 y21-20020aa7d515000000b00461aebb2fe2sm55771edq.54.2022.10.24.08.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 08:42:04 -0700 (PDT)
Message-ID: <407d964d-7a00-4e94-a0d7-054eb6f881cf@gmail.com>
Date: Mon, 24 Oct 2022 23:42:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 2/4] hw/audio: fix tab indentation
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <cover.1666371095.git.amarjargal16@gmail.com>
 <5072d17c33b7bdb068f45308961259889ce1fd8a.1666371096.git.amarjargal16@gmail.com>
 <2448bc23-3849-a25b-8e77-f487ae7efb46@t-online.de>
Content-Language: en-US
From: Amarjargal Gundjalam <amarjargal16@gmail.com>
In-Reply-To: <2448bc23-3849-a25b-8e77-f487ae7efb46@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=amarjargal16@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 23/10/22 15:53, Volker Rümelin wrote:
> Am 21.10.22 um 18:59 schrieb Amarjargal Gundjalam:
>
>> The TABs should be replaced with spaces, to make sure that we have a
>> consistent coding style with an indentation of 4 spaces everywhere.
>>
>> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/370
>> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
>>
>> Signed-off-by: Amarjargal Gundjalam<amarjargal16@gmail.com>
>> ---
>>   hw/audio/fmopl.c          | 1664 ++++++++++++++++++-------------------
>>   hw/audio/fmopl.h          |  138 +--
>>   hw/audio/intel-hda-defs.h | 1008 +++++++++++-----------
>>   hw/audio/wm8750.c         |  270 +++---
>>   4 files changed, 1540 insertions(+), 1540 deletions(-)
>
> Hi Amarjargal,
>
> I had a look at hw/audio/fmopl.c and I think the result doesn't look 
> right. A few comments are no longer correctly aligned. I guess you 
> just replaced all TABs with four spaces. But this is not how TABs work.
>
> For reference: I used the vim command
>
> :%s/^I/    /g
>
> and the result is identical to your file. The commands
>
> :se ts=4 expandtab
> :retab
>
> would have been a much better starting point for the last few manual 
> changes.
>
> Here is another example. For the file hw/audio/wm8750.c I would have 
> started with the following vim commands
>
> :se ts=8 expandtab
> :retab
>
> With best regards,
> Volker

Hi Volker,

Thank you for your review!

Yes, I did indeed replaced all the tabs with spaces. I'll fix all of 
them and update.

Best Regards,

Amarjargal



