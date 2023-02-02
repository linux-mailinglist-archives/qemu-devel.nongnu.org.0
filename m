Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76106688027
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNadL-0007c1-1W; Thu, 02 Feb 2023 09:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pNadD-0007V5-NT; Thu, 02 Feb 2023 09:32:09 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pNadB-0006lO-R8; Thu, 02 Feb 2023 09:32:07 -0500
Received: by mail-wr1-x434.google.com with SMTP id q5so1931633wrv.0;
 Thu, 02 Feb 2023 06:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I6dyQOgZukQ54QDK6aIe7WXm73Yx6J7f4p/XUgBjaiQ=;
 b=gYEzfD17n8nHeGoo5M7J1IahG2YNPvjdBolDnNH1dKlwLIQXMWw5VU0hROBTqSsbWm
 Npz0Q/sEvU9Pvv6n+f33YCfowllVjSHQofRAnH4e6OvqHfY4aYJ3iY1L6yRYpwNPNbmY
 VI6gWJfW8NBJaQYAgGel+y5tvn51iZ3Ky+OAt/opWL3Gmkwx0qezwoZKvXvva4g1nXQh
 IimNUx1q+fZliP6fbn4t2d+dyycwzO3lQKu0VqbQMomqkgPAL+BVeDucNBeEk42SdHEd
 ztaaXz6nwQvW7Q2rJfuhQDam4dWfsPjwyqs3RdNhBr+gZZXgE7a20uII9ldSfZgOEMm8
 8gQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6dyQOgZukQ54QDK6aIe7WXm73Yx6J7f4p/XUgBjaiQ=;
 b=qgNe2O+LPzenGpzMkwLJ8ECaXpnK4NL0nqz7rP3IeWA4kDwSrmPgUBuVCYn39Cro3Y
 0M3+pobQ9/D4uD9NnrOXlm3Qx34Rv4gdso+4I8avV65OmKW+mYSPOezrVvUh7f1xDVD0
 CpzFddFwMTh9vjMiGL7ra7MaKkvOF6px0WlbxKHWT0n+1MdB9e3GGBN9ZXiSRGB3OOIw
 Zyhf2n2k3OdwJKAzjCzYnMJMYXQ/P3mIDmct66dJyZnwsU9D1SF5l/5sweZSHSJ9FYKG
 12w+kbzwfZBqspignxfIGbpape4ou7wQfns99d4HnXdH0jIRidfXXrTgXt/hk3XLNsRT
 pV7A==
X-Gm-Message-State: AO0yUKVp+0+9L6wIDSrfnsQRLFtHFVKe0ZW2xBelmUGpIMWU2dd6nzZb
 9JohOgyZ1QuDfUUtbG4IQJ4=
X-Google-Smtp-Source: AK7set/Ded8UbNBqMS274a0klw1pXZiUb0FG0DCX0n76UwKL6fmeBdzYOvVoqjnvG9oAyaz0U8rRew==
X-Received: by 2002:a5d:464a:0:b0:2bf:b1f0:7bab with SMTP id
 j10-20020a5d464a000000b002bfb1f07babmr5097051wrs.47.1675348322958; 
 Thu, 02 Feb 2023 06:32:02 -0800 (PST)
Received: from [10.95.156.231] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a5d595c000000b002bfd8ad20a0sm16175013wri.44.2023.02.02.06.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 06:32:02 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5b7c223a-2c96-4bd2-7150-79a56281dd57@xen.org>
Date: Thu, 2 Feb 2023 14:31:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-10-vikram.garhwal@amd.com>
 <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
 <3e205146-5113-861d-ef39-c463257b54a1@amd.com>
Organization: Xen Project
In-Reply-To: <3e205146-5113-861d-ef39-c463257b54a1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 18:22, Vikram Garhwal wrote:
> Hi Paul,
> 
> Thanks for reviewing this and other patches in series.
> 
> Please see my reply below.
> 
> On 2/1/23 12:30 AM, Paul Durrant wrote:
>> On 31/01/2023 22:51, Vikram Garhwal wrote:
>>> Add a new machine xenpvh which creates a IOREQ server to 
>>> register/connect with
>>> Xen Hypervisor.
>>>
>>
>> Is this really the right way? Is it not possible to do the Xen 
>> initialization (including ioreq server registration) off the back of 
>> the accelerator init (i.e. AccelOpsClass ops_init function), which 
>> seems like the right place to do it now that it's no longer 
>> architecture specific.
>>
> There are few other machines using the "accel=xen" option and few of 
> these machines aren't using IOREQ and other Xen related initialization. 
> Example: /xenpv/ machine under /hw/xenpv/xen_machine_pv.c /and few other 
> machines under /hw/i386/pc_piix.c//.

Ok. TBH the concept of 'accel=xen' is probably somewhat broken then. 
(QEMU isn't even running the VM in question, so how can it be 
accelerated?). Maybe abstract machine types really are the right way then.

   Paul

> /So, that's//why we moved the IOREQ and other common initialization 
> parts in hw/xen/xen-hvm-common.c and call them as needed for the 
> particular machine.
> 
> @stefano, just checking if you want to add any other suggestion here.
> 
>>   Paul
>>


