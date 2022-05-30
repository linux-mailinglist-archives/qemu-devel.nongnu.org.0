Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1B65384F8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:32:32 +0200 (CEST)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhNe-0007Fm-I0
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvhKt-00068H-0w; Mon, 30 May 2022 11:29:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvhKr-00011s-D6; Mon, 30 May 2022 11:29:38 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so14118723pju.1; 
 Mon, 30 May 2022 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IoEwGgaRXjxWpWtIlBIJDyO3c674/kFk5FYSyq8mUPk=;
 b=l9iWIUO/BxER60gSNCu9h5jZYSyno/cF6WD0Yc8XZMu62H/wkC3eVBKbFKJZVpClx5
 0bXuZc5ukAlrvSgPxoleyEapDtAmgpDJttuwkQOEHZsk8bLmaY1sHqnCGh0Rn/MbdOFE
 6R3PYi0Ma2YEliczgemC0gGRC9ZW4LQN1nteN3Mjcz5NX7DcYbZZ5HjqxwFSV4D5CdoS
 Z4F8qSYavPCZmBPzMSzPAf/16g/mXJnGQZgKfd88eaMgy5NqWt6RbjB1Ofg0PwuopTUm
 GcqbarjBZ1/yZmiMh6RtnG+GetXipBo7/Hcr43oTteLW01U72N/zq5g5hXV8LTtgBKq9
 gNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IoEwGgaRXjxWpWtIlBIJDyO3c674/kFk5FYSyq8mUPk=;
 b=sCQefC/viVA+573bZxibemcdnVj+HVTV/coPcrXChKVtNclp/yn5CfAUK7wDy7vzO/
 LPuufhW/6dDqqoZbVdir8UEe7G7ybu0SUSvpoGbtKeskGyzwnyKkXNTHypiWiPSvqljL
 LSCsxqj+UFg9a4eExo37PEbgsFbBQy9Cj9zSdhA5ZA1o9jVKV+6HGstZ1HKXSdxUIHeE
 0AwF3B+30GFMzPxVa/v0HUR1EGjIp8GplQQudDOuu/8lbtKqYhkNr8F07vzU7kU4Qzqp
 EaEfaBhagL2y/GmQeUAwjmZa/2Q07WaCz/vrdiVeVcJ3CiTxb7i/iUhq2H6aclbeXdXo
 kHSQ==
X-Gm-Message-State: AOAM531Ux7ZdgogjtWbm8Q3mcLwNRnmsglctCdthUaKJkFeEPGv2ey68
 VhG8Qe34jUEXSBirA2hwM/I=
X-Google-Smtp-Source: ABdhPJwVXNeZ3RDeR/8Z6VtU6wLXDmNbEel2FlNA0UXBo6q77RzEE3ocCTOEdPsRNKo4I+k3Sz1WwQ==
X-Received: by 2002:a17:902:ce82:b0:163:f215:e3b6 with SMTP id
 f2-20020a170902ce8200b00163f215e3b6mr2669110plg.51.1653924575751; 
 Mon, 30 May 2022 08:29:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 be3-20020a170902aa0300b001621cdf7172sm9536096plb.58.2022.05.30.08.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 08:29:35 -0700 (PDT)
Message-ID: <13cfe1ad-63dc-dc5b-7955-67f7f70f160b@amsat.org>
Date: Mon, 30 May 2022 17:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
Cc: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, qemu-arm <qemu-arm@nongnu.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>
References: <20220503204451.1257898-1-pdel@fb.com>
 <f0143ab9-54e9-09cd-d203-e779f9d8d6e4@kaod.org>
 <A0BF3AA6-C57B-4A95-BCE2-92CE7A3733A8@fb.com>
In-Reply-To: <A0BF3AA6-C57B-4A95-BCE2-92CE7A3733A8@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/5/22 00:47, Peter Delevoryas wrote:
> 
> 
>> On May 3, 2022, at 2:35 PM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 5/3/22 22:44, Peter Delevoryas wrote:
>>> Hey everyone,
>>> I'm submitting another Facebook (Meta Platforms) machine type: this time I'm
>>> including an acceptance test too.
>>> Unfortunately, this machine boots _very_ slowly. 300+ seconds.
>>
>> This is too much for avocado tests.

Use:

   @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
   @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'),
               'Big initramfs and run from flash')

> Erg, yeah I figured as much. I’ll just resubmit it without the avocado test then,
> if that sounds ok to you.

No, please keep the test. While it won't run on CI, we can run it 
locally, very useful to bisect.

>>> I'm not sure why this is (so I don't know how to fix it easily)
>>
>> The fuji has the same kind of problem. It takes ages to load the lzma ramdisk.
>> Could it be a modeling issue ? or how the FW image is compiled ?
> 
> Yeah, one reason is that Facebook OpenBMC machines have an unnecessarily
> big initramfs that includes all the rootfs stuff, whereas regular OpenBMC
> machines have a smaller initramfs right? I don’t entirely know what I’m talking
> about though.
> 
> I think most FB machines have moved to zstd compression recently though,
> but this one may have been missed: I can fix that on the image side. I’ll
> also experiment more to see if it’s something wrong with the image, or possibly
> a regression in QEMU. It would really be super awesome if it could boot faster,
> so I’m very motivated to find a solution.

