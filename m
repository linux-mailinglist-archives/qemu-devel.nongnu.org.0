Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2D428DF7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:29:52 +0200 (CEST)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvNH-0004Ik-3u
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZvIa-000649-67
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:25:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZvIK-0006Yt-QO
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633958683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yp3ghqMUTxKSry/3jse++dV3Hnf984A1GpBqf5uy2MU=;
 b=ZPFjIMKopUcCfYenyR2/5wXw9sUtGiTTLujqSuNMP1amIhJOdmKWipsQ3XACf3L8lrnO76
 o71dOvkJL/TXB35KQKxlWs7oHwfANOFwRrW/NGbULPA/tYYl9l9PhCSmSwBxiNqzvrx9CU
 zxneAqrKN6ADCSCygHwDkkAc3KgGFGA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-oOc-i6JVP9GVKMfQxSK7Sw-1; Mon, 11 Oct 2021 09:24:40 -0400
X-MC-Unique: oOc-i6JVP9GVKMfQxSK7Sw-1
Received: by mail-ed1-f71.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso15910649edx.2
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yp3ghqMUTxKSry/3jse++dV3Hnf984A1GpBqf5uy2MU=;
 b=Jh68pYRduKERHElaK+nIyDTGLhAE4ocW7lvrHVRdFjIFPXkuiVB73+2UINE00VIjVx
 rOfiV562Aq+D+XX3zgZb+3n8LcpJPu2Jr7OPea07+4DJVk9KteLbUcr50KTV5ZiNRrd8
 wCf+SsgUTI6PmKJYIfRcDnp/3hYMlwrRtwvwIRRwjYqv7KcSwa2p6a41hWMpw88P668F
 l6PFK3Wvlfrwq2aPlPlPcSbVlSzNzn/SJoLf/K9wadJ/XGj06BqavUGS5lxofVq0YBSj
 7uab9pbd1jZOhbbeU85CQ2U62qTTcmuvjV6fCY+va6nheM5VbHZiVrN9yXFN0urhVMcA
 QuhQ==
X-Gm-Message-State: AOAM531v9VLZs4TyoOLZRXNLzRIpbtDO59xWuqloC7cvtf287olgpgzm
 eWahq7xrULhSbzJX0KAyZs8YJp4duTp9gFGl/LIUn1i+xQ45eJ4R0ZNxdRmetNoDgN9Zq5DGfMa
 yIr5V6Ru4mDaqf0A=
X-Received: by 2002:a05:6402:1b90:: with SMTP id
 cc16mr41206624edb.2.1633958679727; 
 Mon, 11 Oct 2021 06:24:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Ovuc5q5u17ZSw24L5G1gMAWypDFUDLzZtRjnTs/h7zBX4TQrMn+6rPRlxwOeCrnCFuuczg==
X-Received: by 2002:a05:6402:1b90:: with SMTP id
 cc16mr41206569edb.2.1633958679480; 
 Mon, 11 Oct 2021 06:24:39 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-184.customers.d1-online.com.
 [80.187.97.184])
 by smtp.gmail.com with ESMTPSA id u6sm4170362edt.30.2021.10.11.06.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 06:24:38 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: David Gibson <david@gibson.dropbear.id.au>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
Date: Mon, 11 Oct 2021 15:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWQB1FMhQfmqRYxN@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/2021 11.20, David Gibson wrote:
> On Mon, Oct 11, 2021 at 10:10:36AM +0200, Thomas Huth wrote:
>> On 06/10/2021 09.25, Thomas Huth wrote:
>>> On 05/10/2021 23.53, BALATON Zoltan wrote:
>>> [...]
>>>> Maybe these 405 boards in QEMU ran with modified firmware where the
>>>> memory detection was patched out but it seems to detect the RAM so I
>>>> wonder where it gets that from. Maybe by reading the SDRAM
>>>> controller DCRs ppc4xx_sdram_init() sets up. Then I'm not sure what
>>>> it needs the SPD for, I forgot how this worked on sam460ex. Maybe
>>>> for the speed calibration, so could be it detects ram by reading
>>>> DCRs then tries to get SPD data and that's where it stops as i2c is
>>>> not emulated on taihu. This could be confirmed by checking what it
>>>> pokes with -d guest_errors that shows accesses to missing devices
>>>> but don't know where 405 has the i2c controller and if it's the same
>>>> as newer SoCs. If so that could be reused and an i2c bus could be
>>>> added with the SPD data like in sam460ex to make u-boot happy or you
>>>> could skip this in u-boot.
>>>
>>> FWIW, I've just tried the latter (skipping the sdram init in u-boot),
>>> and indeed, I can get to the u-boot prompt now.
>> [...]> I've also attached the patch with my modifications to u-boot.
>>
>> FYI, the changes can now be found on this branch here:
>>
>>   https://gitlab.com/huth/u-boot/-/commits/taihu
>>
>> I also added a gitlab-CI file, so you can now download the u-boot.bin as an
>> artifact from the corresponding pipeline, e.g.:
>>
>>   https://gitlab.com/huth/u-boot/-/jobs/1667201028
> 
> Thanks.
> 
> Are you going to send a v2 of your proposed deprecation patches?

No, since there was interest in keeping the 405 boards for testing the 405 
code in the Linux kernel, and since there is now a way to do at least some 
very basic testing of these boards (with the u-boot firmware), I don't plan 
to respin the deprecation patch. I just sent a patch for adding the boards 
to our CI instead:

  https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg02072.html

  Thomas


