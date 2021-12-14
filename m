Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAEB474348
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:17:53 +0100 (CET)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7gm-0001Qe-6W
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7Ww-0001t2-Ub
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:07:43 -0500
Received: from [2a00:1450:4864:20::332] (port=56222
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7Wv-0000Fh-HL
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:07:42 -0500
Received: by mail-wm1-x332.google.com with SMTP id p18so14172124wmq.5
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wQmZKuHAHB5vOh9SUjuSf2hIqUWPMV4lpZyN1IXrSHc=;
 b=Vv4p6tqcMdvb+DyLdXIQ5uujx5bSYEr3RXUYh+Rdf1G0KJ54sUcf3EFkCGbGuTeO21
 9kOadWSb9nl6LoZw+WqHd6iwT6IjlyZl50WVbFZbJY85gIMUX/xLSprK9xoqtzcigoTI
 Tuh/dLIuqs2nUobTSVilMUvD3BGvC2rvaqFipo71d+UvA45keOkTc0mWH9Hg7MHB4XrS
 uMvXnjA09jD/fujZrip/PDC2bEbC14x0Uc+KEgIb99yoPalaBvkVJc3F/6EuuvY0luJI
 4dEPibjE9Z9+XfoqsoWdQYJpQtaP6AwjuZRKJu1WxonrvsgQhsJioTnt7htqB0jFucHT
 QWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wQmZKuHAHB5vOh9SUjuSf2hIqUWPMV4lpZyN1IXrSHc=;
 b=Emshu1iFFn0hWbEdx1qLxznnJQjpO0YLq54FksvMwuHTG66o52YCj7zrQBQpu+e//2
 pBxobjxedyDgG9ukxtp/tTSI+XoNLBLJSM4liiQ7ynFnC9Z1T4HtKUksfsuI20tiNLVk
 uRkZB+EKq4ZTSyslum4xtswiFUG2WCL/gapMSI7cwYund5fvd2qjeXUBUGyMGFMsq03Y
 9F+TfTQdCa/9lzOg7toik9VNSyf/gOH4908ZlMaxPVXA6STuSGdCfM6PrfnhDW8wiXtT
 UTnkeTV1+p1YHmrYX4reV1ToBMp3yGhHyaIjOPG26BiXmuJ3xtwL04/1Buc7EpvVRD4E
 gwoQ==
X-Gm-Message-State: AOAM533I5ubYnvS6OEHgDdLYXLdbbLXRcrrQN089IsJf/QX8QWSrokiX
 X8JNRv4r2GuvC7xyU1ylnR8=
X-Google-Smtp-Source: ABdhPJxRDrkUMOdqcrB/UTNSlibHM4l6eHL6IKahBzIdV86UVCn95dm+ny4i7FbDJjaKI4iKBItT0g==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr7019052wmc.56.1639487260241;
 Tue, 14 Dec 2021 05:07:40 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id z6sm2692929wmp.9.2021.12.14.05.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:07:39 -0800 (PST)
Message-ID: <c2c08b8a-14ba-fce3-04ff-eda60b7abcd4@amsat.org>
Date: Tue, 14 Dec 2021 14:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 3/4] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20211206224528.563588-1-f4bug@amsat.org>
 <20211206224528.563588-4-f4bug@amsat.org>
 <99ebc4fb-f061-1e57-da07-e66035bacf9b@redhat.com>
 <87o85jz912.fsf@secure.mitica> <YbiTm4ovRPjLW7EF@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YbiTm4ovRPjLW7EF@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Finn Thain <fthain@telegraphics.com.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 13:52, Daniel P. Berrangé wrote:
> On Tue, Dec 14, 2021 at 01:05:29PM +0100, Juan Quintela wrote:
>> Thomas Huth <thuth@redhat.com> wrote:
>>> On 06/12/2021 23.45, Philippe Mathieu-Daudé wrote:
>>>> Introduce TYPE_VGA_MMIO, a sysbus device.
>>>> While there is no change in the vga_mmio_init()
>>>> interface, this is a migration compatibility break
>>>> of the MIPS Acer Pica 61 Jazz machine (pica61).
>>>
>>> It's unfortunate, but as far as I know, it would be pretty difficult
>>> or even impossible to get this done without versioned machine types?
>>> So IMHO it's ok to break this in this case here.
>>
>> Hi
>>
>> My understanding is that outside of x86*, and now ppc, arm and s390,
>> no one else really cares about migration compatibility.  I am not even
>> sure if they really care about migration at all O:-)
>>
>> So, if the code is better for other reasons, I will not wonder about
>> migration compatibility.
> 
> Essentially if it has versioned machine types, then migration ABI
> compat is mandatory. If it doesn't have versioned machine types
> then migration API compat explicitly doesn't exist.
> 
> There are no versioned machine types for MIPS, so migration compat
> is a non-issue.

Thank you, this is a clear explanation worth being added on
docs/devel/migration.rst FAQ ("General advice for device developers"
section).

