Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FCC4D4645
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:48:59 +0100 (CET)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHHu-0000ye-FJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSGwN-0004Rg-Pn
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:26:45 -0500
Received: from [2a00:1450:4864:20::436] (port=45706
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSGwL-0007mL-Q4
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:26:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id p9so7402922wra.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aKHoOFjIX4NhYzDzBTayK8VIsR23Yx/ZpfRDkISyCu8=;
 b=lWn07VFeB4J21i+D2dgUESl29NN4OIBx5qOWBsDIe3QNqEZVXFvWpx9P2bxLvEUHmu
 LhI7qB4d2/Jgg3j7oCUw0xh7jR+X+MFCnR+vII5JTc5z7LhVHewcuxuO3ijn4qdG1ikd
 PvweyLNz7Sdk+ZkgH6Y4wzqqVFHI/1UGdgj6SXeFcNftFZJh1Zh2UnkHGbgxuzLQgsAM
 +31vMIFfCKvx0RH9vzR72kwYnDO8+T6QhjAMlsaGTroSGsL8VxDaQNEyVfHgQ4XjwP61
 +t5e7LwpWl1J3jz2JRokIvEuTI/AbT/o+PRlHHMWHwOy6v+YwARy59aJVdC4CIskKcO+
 VFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aKHoOFjIX4NhYzDzBTayK8VIsR23Yx/ZpfRDkISyCu8=;
 b=B59zNZNsMuDUxpC9n9MOGWLSglUnTYHz+3fz0PX7AGE7DY2ZMhtbvgRYzUdThaeYEs
 92mk3U5GkdjWnOt49PH6W4FBKHKtoWdM4phxb55vUNEu0cqzPleoL+rwHi6V6TEH1V/o
 1GzUoEFedDWACqEKCS6KMQcvr8omW+pdOzerRTQpPbDvN/UI1VdhENVmWFiff1JOvvM6
 9yIr33ADcJcoBsgiSILhcw/DmVcZAdlnZFfanyTz4amE5J1D6m3HtiKSObyRerz0tQqb
 ofnNCSybvkoH6N+VxGDdSRN5vmXdUnjcvUaLIdtFzAYbS/T8nvWrgyrCQ+TAyqON1gMh
 diFQ==
X-Gm-Message-State: AOAM531XsgU93e5hSkbBff7kQQ6dJf+gqL5tSxKpaM8PUGnqv73V3XAI
 CvfzeeJkpBwR3xBg4Ormuro=
X-Google-Smtp-Source: ABdhPJwFJPjQm5+/IqJltFyfXn8sadEQWREJcpVYGmh6ccYjB9gcuOseKSgzJ7Sr3ecaN9MTEYIsSg==
X-Received: by 2002:a5d:6241:0:b0:1ed:b534:e04e with SMTP id
 m1-20020a5d6241000000b001edb534e04emr3313905wrv.68.1646911600032; 
 Thu, 10 Mar 2022 03:26:40 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d49ce000000b001f036a29f42sm3799429wrs.116.2022.03.10.03.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 03:26:39 -0800 (PST)
Message-ID: <df92c6ff-1ea2-98de-09a8-716a3e7cea60@gmail.com>
Date: Thu, 10 Mar 2022 12:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: =?UTF-8?Q?Re=3a_=5bPULL_0/9=5d_I=c2=b2C_/_SMBus_/_PMBus_patches_for?=
 =?UTF-8?Q?_2022-03-08?=
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Titus Rwantare <titusr@google.com>
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA8ZuxcFYc-=27YyWNr8_x1m8VKSjJEPYAzV1yMAnpr6wg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA8ZuxcFYc-=27YyWNr8_x1m8VKSjJEPYAzV1yMAnpr6wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Corey Minyard <minyard@acm.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 10:18, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 18:22, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>>
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> The following changes since commit 9740b907a5363c06ecf61e08b21966a81eb0dab4:
>>
>>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220307' into staging (2022-03-08 15:26:10 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/pmbus-20220308
>>
>> for you to fetch changes up to 5f14cd7032beab6cac8d7ed1b09efc58baddb48c:
>>
>>    hw/sensor: add Renesas raa228000 device (2022-03-08 18:46:48 +0100)
>>
>> ----------------------------------------------------------------
>> I²C / SMBus / PMBus patches
>>
>> - Add some Renesas models
>> - Add Titus Rwantare to MAINTAINERS
>>
>> ----------------------------------------------------------------
> 
> 
> 
> Applied, thanks.

Thanks.

> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
> for any user-visible changes.

Titus, could you add the new devices there?

Also it would be nice if you could create docs/system/devices/i2c.rst
and list them :)

Regards,

Phil.


