Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F074871F5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 06:04:01 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5hPz-0001h0-Ra
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 00:04:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5hO7-0000w1-Ng
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 00:02:03 -0500
Received: from [2607:f8b0:4864:20::635] (port=47078
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5hO5-00053Z-Dg
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 00:02:03 -0500
Received: by mail-pl1-x635.google.com with SMTP id w7so4008736plp.13
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 21:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Mx9x7mMO8LG/T09toIYcb/bf6EyYrtvHjpg/4Mcr8+Q=;
 b=NpIXL5ehzOJYL7ENNg4wF7TP4+JKoYLB+Xrw5qPT4YqVoCIL5jv7p7Vn2Hjsw799O2
 HLetBJ3jBfZb6p70K7mb+TbCa1DRt3eOWr5ImHtclvDrjtLVjnFESkqTjZxscXyRg/TI
 Jk3KL3JBv08ORzGVnFFyHVm+Mt/EQ32mCgQoYWrTuVDtAjGjw6zcPhZG/uhqHa/gP90l
 kmD5HTW12Yq2VMpig+fxUrOBWjEJoROSKA+DtMgDHp6JNvdzXBnVbibbCYvc60Fcmn1i
 S21fIhPygw8Of6oX2bS3P3cno5UwV3lbPQEtG+yAsTCLsMqjoyB6RmxkEIjseTNwJgtW
 Zonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mx9x7mMO8LG/T09toIYcb/bf6EyYrtvHjpg/4Mcr8+Q=;
 b=uH3UJaGuDjWfqfzweVX6RPnSVfl4F6UVVP+OKYQgY3blPOG1J0HndDauo43sgAqBI4
 Up7ChSZmxxWL5rf40k/RoUTDXH/ZiRsfoKmPtfcqRF8sH+QlFXMbIwsLw1wjQrT1CX55
 YHspxYZrwqRdhynbgUQQqjWIPTcuh5dxDDqe2AoZ/nFb20Zt2XcwZ2WXmqWhJiU/Sq/V
 oZqn7ORJlCtr9dE1QR6QY+OIPJUt2CKiu2bfiIVxWEfn4GcLH4olx+pFt20i/01oBuWU
 AmCXM5qdm7xaTior7mq4JNt2UcfsxKh6IW9kuS4Fvyw8Q7MeYktr1pPE76mfWDeGmdUw
 Jbtw==
X-Gm-Message-State: AOAM533Gx4XQTsGoOgdt19O8NZ0GSAXzP4ZhpYJFfiNsk80jgfVRbvIf
 TF8P4mazUDdVKma7GpoYbxM+7REA6vZRJA==
X-Google-Smtp-Source: ABdhPJyPoaw2CUA/krbAWjgvP0uwygZCAVbFe1EfUD/WwnoQN7RRZSdooY8p7XNESMQ7sXG5wkZx5g==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr13671172pjb.13.1641531718800; 
 Thu, 06 Jan 2022 21:01:58 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id oa2sm7786708pjb.51.2022.01.06.21.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 21:01:58 -0800 (PST)
Subject: Re: [PATCH v14 00/26] Add LoongArch linux-user emulation support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org>
Date: Thu, 6 Jan 2022 21:01:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106094200.1801206-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 1:41 AM, Song Gao wrote:
> Based-on:<20220106074740.1754661-1-gaosong@loongson.cn>
> 
> Hi all,
> 
> This series only support linux-user emulation.
> More about LoongArch at:https://github.com/loongson/
> 
> The latest kernel:
>    *https://github.com/loongson/linux/tree/loongarch-next
> 
> Patches need review:
>    * 0018-linux-user-Add-LoongArch-specific-structures.patch
>    * 0019-linux-user-Add-LoongArch-signal-support.patch

You're still blocked on no upstream kernel support.
As shown in patch 19, the kernel abi is still in flux.

It would be best if you could work toward getting full system emulation completed.  Then 
all of the basic cpu emulation can be merged and all you'd need to keep updating is the 
linux-user portions.


r~

