Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676CA4D5812
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 03:20:57 +0100 (CET)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUtj-0006vk-RL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 21:20:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSUrq-0005wZ-LO; Thu, 10 Mar 2022 21:18:59 -0500
Received: from [2607:f8b0:4864:20::c36] (port=37707
 helo=mail-oo1-xc36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSUrl-0001Y5-Cd; Thu, 10 Mar 2022 21:18:58 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 x26-20020a4a621a000000b00320d7d4af22so9071302ooc.4; 
 Thu, 10 Mar 2022 18:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3hNOL83u7KspnPU2duOmv6QXwr5lbggstXopvOq99F0=;
 b=fZt7ExUg9TPb2H76knAj0odGQI1tWl7BY3bQ07xychCSrcJYCzsjz0IbeWWkpEl5hg
 eEEXNjDaFLZjWuxWCFsq0ZGRjQRbwGRIWevNNL/guexET7VCrEL950HQu1Hq7YR3HPiL
 tfAMLr10RyrTGcR6hseE6bxaeaEsOB7LEJx0/pnKdP5S5BD9KJYoHgf4LZUBv8SeetlI
 tzLlS5YH4Sp93M4jCVpxviqCafwfqq08oPIDv2JokRraQZBGb2gz3DiUGTtqgB2I1qut
 5JkxkslujnJZqjMZjwUgcqEeElsSCUiEkW9bmqx+cW6vHjkccBxs5SpEDrGUAXreA0ZE
 T4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3hNOL83u7KspnPU2duOmv6QXwr5lbggstXopvOq99F0=;
 b=PIfaI8LXbXs/+2JldHTGFrFMyltd+/ZgWECISwVDcWQ5Xa788p9kSV+uNEkEoPxXn8
 TNIURwcxYZNDUlIhl+4CjGw19+dwPnm2thUMaXv4g5LMogdVP2mIa3XZYEE1wr/ajZQ4
 GmZlzYK7ubOqoz4f5Z9WzHHmCMg7giV5YSYFHHdYWvXxTSmQQb94fftUqTSsY0tvO7X0
 leNwevzMK3/+lhzjhS+LG+XXydsuwukL+pzzOUYjOsfejHMHZJirK0ohezeibXqXEoTy
 G/8S7AgTCj4xzIrDPaBdkrt7Uy8MjedodX0XkaPNCiyiL+5vHnGu7CN7xFVWMfpYiW9c
 5V+A==
X-Gm-Message-State: AOAM532g/kz3UmQi01QQdR3Wmu3ZOH0pWaiwUwoqt5EEo1XW5zT0FOcF
 DGeakyCTMdP+DJI/6EizQiI=
X-Google-Smtp-Source: ABdhPJy6CDNyrilvqwuestn6oTjLUVJeHaTWbrhviem4Sp8EcQZskIamyn0rbuOBxGIlY48QhGbTcw==
X-Received: by 2002:a05:6870:d585:b0:da:b3f:2b72 with SMTP id
 u5-20020a056870d58500b000da0b3f2b72mr10566775oao.273.1646965131940; 
 Thu, 10 Mar 2022 18:18:51 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:5655:fd2a:accf:db6c:e4fd?
 ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a9d7311000000b005b23b11fed3sm2907594otk.70.2022.03.10.18.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 18:18:51 -0800 (PST)
Message-ID: <0afba7b7-3778-2799-a77b-54091386a42a@gmail.com>
Date: Thu, 10 Mar 2022 23:18:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/5] user creatable pnv-phb4 devices
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220111131027.599784-1-danielhb413@gmail.com>
 <cc037332-a0f5-3acb-396a-49bdac653d2e@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <cc037332-a0f5-3acb-396a-49bdac653d2e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/10/22 15:49, Thomas Huth wrote:
> On 11/01/2022 14.10, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This version implements Cedric's review suggestions from v4. No
>> drastic design changes were made.
>>
>> Changes from v4:
>> - patches 1,3,5: unchanged
>> - patch 2:
>>    * renamed function to pnv_phb4_xscom_realize()
>>    * pnv4_phb4_xscom_realize() is now called at the end of phb4_realize()
>> - patch 4:
>>    * changed pnv_phb4_get_stack signature to use chip and phb
>>    * added a new helper called pnv_pec_stk_default_phb_realize() to
>> realize the default phb when running with defaults
>> - v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg02148.html
>>
>> Daniel Henrique Barboza (5):
>>    ppc/pnv: set phb4 properties in stk_realize()
>>    ppc/pnv: move PHB4 XSCOM init to phb4_realize()
>>    ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
>>    ppc/pnv: Introduce user creatable pnv-phb4 devices
>>    ppc/pnv: turn pnv_phb4_update_regions() into static
> 
> It's now possible to crash QEMU with the pnv-phb4 device:
> 
> $ ./qemu-system-ppc64 -nographic -M powernv9 -device pnv-phb4
> Unexpected error in object_property_try_add() at ../../devel/qemu/qom/object.c:1229:
> qemu-system-ppc64: -device pnv-phb4: attempt to add duplicate property 'pnv-phb4[0]' to object (type 'power9_v2.0-pnv-chip')
> Aborted (core dumped)
> 
> Any ideas how to fix this?

Thanks for catching this up.

The issue here is that we're not handling the case where an user adds a pnv-phb4 device
when running default settings (no -nodefaults). With default settings we are adding all
pnv-phb4 devices that are available to the machine, having no room for any additional
user creatable pnv-phb4 devices.

A similar situation happens with the powernv8 machine which errors out with a different
error message:

$ ./qemu-system-ppc64 -nographic -M powernv8 -device pnv-phb3
qemu-system-ppc64: -device pnv-phb3: Can't add chassis slot, error -16


Adding all possible phbs by default is a behavior these machines had since they were introduced,
and I don't think we want to change it. Thus, a fix would be to forbid user created pnv-phb devices
when running with defaults.


I'll see what I can do. Thanks,



Daniel


> 
>   Thomas
> 

