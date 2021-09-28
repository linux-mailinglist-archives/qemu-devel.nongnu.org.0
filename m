Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579341B5AD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 20:07:56 +0200 (CEST)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVHWE-0000St-FL
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 14:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVHV9-00088z-AA
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 14:06:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVHV7-0005vV-EA
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 14:06:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d21so59408367wra.12
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tH0cTGBjxSkfi7t2boQTRW1pbFOrf3fVc7vfOAl4AKQ=;
 b=DKeJbheipPXGEJBZW19sMd+pFk5LcYwnEJZJIsmlWlWzb5i4SyCJEB+/Wdy1w+TxUH
 MpyC8nLO9Z1qUTy/qFvj2MMG5SqrufR+d6Flbu0rW7NqrUgDGweUz/ZO5lLFHaTGM/gV
 RK2MbXBbFKZhI/zYDLpGMQwcTrFW2vf1cfRjdTkKEn0wvllZK0XoCRKfzg2zxD53olTB
 Uv1lWijk8ITGU4mKmHARwI6TTrXcrxaBaqLNAplQhIyjX1SZ8knRPXy0/BeO343enlk4
 zFOs4iqrtTgIyrU+hDlFxssL7OLoS0A+HbRzf/tmUGPjJNz5W10fjDd1GG4t8QZN+qgp
 CJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tH0cTGBjxSkfi7t2boQTRW1pbFOrf3fVc7vfOAl4AKQ=;
 b=I3XLoWyptewfrSrqyWwDy2ISuiKkRQGwmDxCgZaeIuerO8whQ4FE9Eg8bfmFws8U8r
 +IZ9Y3dyKJw0F0zffrveVParaVTLHP0qI3hj0bY7E+c58IzT2SemodNIgDGMpmd6+GLu
 KM2EAN/3uYpyaNd4gs516CjMQwS6KQBYEBes0uWEIMcyqi99sNsmq2551DPaDehdVw9s
 Zn6MYUbPSWMEU+2BVFwnlpypDYE2+I9cYGja/EYq+lLQt12BqhTYHI8Zh3GL1Qnatlr1
 GV/HQj1fn6xdX2olLKyteEEg9JQOUuOV7nM6wenIDLI1iTWm1ybbmdQ+vkt6JEPNg/AD
 ij8Q==
X-Gm-Message-State: AOAM532rOQsgKEEkrD5jazifzLqcQczhXZLBilKBdjQlTudNOHd3q8w+
 7EkWz6h45Yl0efOMjxFuXnM=
X-Google-Smtp-Source: ABdhPJxIT7ZTK/rmsxwQli7TzsoNFq/Vs8Ah3yruKff+Ed29oGHUdQj9P6FaM0d/DQf8baL/V0wfdA==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr1785802wrm.348.1632852402950; 
 Tue, 28 Sep 2021 11:06:42 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c8sm20814345wru.30.2021.09.28.11.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 11:06:42 -0700 (PDT)
Message-ID: <c5ab7645-cfcb-2c3d-63e6-37870c769e9e@amsat.org>
Date: Tue, 28 Sep 2021 20:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Emulation of IOT hardware
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Niraj Sorathiya <nirajsorathiya101@gmail.com>
References: <CAFT0Dp1CmK9zKcKrpRO=pQKZTUD-ax1zVg-uEofjnior8Fi_YQ@mail.gmail.com>
 <87zgrw7ro8.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <87zgrw7ro8.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 15:04, Alex Bennée wrote:
> 
> Niraj Sorathiya <nirajsorathiya101@gmail.com> writes:
> 
>> Hello Team,
>>
>> Would you please give me some suggestions on how I should proceed to
>> build an IOT (Internet of Things) emulator ?
> 
> Maybe look at the Musca boards:
> 
>   https://qemu.readthedocs.io/en/latest/system/arm/musca.html
> 
> these are based ARM's IoTKit which are modern ARM M-profile boards for IoT development.
> 
>> What aspects do I
>> need to consider ?  IOT can be anything like a smart light ,smart bulb ,smart lock ,etc. Here smart means that the device can be controlled
>> via the internet.
> 
> It really depends on what you are interested in modelling?
> 
> One area where we currently fall down is how we handle GPIO type setups
> in emulation. While we have models for displays and backends for network
> and block devices we haven't got coherent way to represent (and change)
> arbitrary IO pins. 

You can use LEDs as a starting point, see commit 7cfbde5ea1c
("hw/arm/aspeed: Add the 3 front LEDs drived by the PCA9552 #1"):

    The Witherspoon has 3 LEDs connected to a PCA9552. Add them.
    The names and reset values are taken from:

https://github.com/open-power/witherspoon-xml/blob/master/witherspoon.xml

    Example booting obmc-phosphor-image:

      $ qemu-system-arm -M witherspoon-bmc -trace led_change_intensity
      1592693373.997015:led_change_intensity LED desc:'front-fault-4'
color:green intensity 0% -> 100%
      1592693373.997632:led_change_intensity LED desc:'front-power-3'
color:green intensity 0% -> 100%
      1592693373.998239:led_change_intensity LED desc:'front-id-5'
color:green intensity 0% -> 100%
      1592693500.291805:led_change_intensity LED desc:'front-power-3'
color:green intensity 100% -> 0%
      1592693500.312041:led_change_intensity LED desc:'front-power-3'
color:green intensity 0% -> 100%
      1592693500.821254:led_change_intensity LED desc:'front-power-3'
color:green intensity 100% -> 0%
      1592693501.331517:led_change_intensity LED desc:'front-power-3'
color:green intensity 0% -> 100%
      1592693501.841367:led_change_intensity LED desc:'front-power-3'
color:green intensity 100% -> 0%
      1592693502.350839:led_change_intensity LED desc:'front-power-3'
color:green intensity 0% -> 100%
      1592693502.861134:led_change_intensity LED desc:'front-power-3'
color:green intensity 100% -> 0%
      1592693503.371090:led_change_intensity LED desc:'front-power-3'
color:green intensity 0% -> 100%

    We notice the front-power LED starts to blink at a ~2Hz rate.

Regards,

Phil.

