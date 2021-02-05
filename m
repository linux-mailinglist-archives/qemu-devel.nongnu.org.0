Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A228310FED
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:32:36 +0100 (CET)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85uE-0006vS-KN
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l85U5-0003fd-R9; Fri, 05 Feb 2021 13:05:33 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l85U3-00061F-Tb; Fri, 05 Feb 2021 13:05:33 -0500
Received: by mail-ej1-x631.google.com with SMTP id hs11so13338760ejc.1;
 Fri, 05 Feb 2021 10:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bKZtXOGrUV+huIokx5vWjxW5/cJu+3tmYrHxLXL3uEc=;
 b=uBRAgKBLKG82ZhLOik6lRqbTxpkqG4AJeNW3m7GtRHuT6ZE5F42YXU6mEUR7FMJudB
 O5rzuz/fpkQzji5USa57sQlUHiJpehjR9AkcVDQal7o8gMnlKZZQ5zdVRTpSX9KeXNpv
 jXOFIvJhDcTdB2OJkbXXJfHEdwFMJVqJ6ABSmnmExzhsv7JICQNoVyFLQjGpCzbhKg1N
 CrDy0t29d8+kPoJAywIdPC3g3y+9xDlRmbBOVL5Tw0ZoXRHSh4vFu0EyEXclFpjYfv0s
 SiRQMkq3oOG3LlQ8wav/t514keitsZ8adKDu13hkm5RyHzWCTAPumNadWxKKbqzmA7xg
 eUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bKZtXOGrUV+huIokx5vWjxW5/cJu+3tmYrHxLXL3uEc=;
 b=Xui/SooGMJmWxV/zTzTDIQa9lLxawJ1XsiCsiq2uYkNC8PFl3XvzxDPIhCmkyqDoaV
 QT7lBR9zinfT5xcxeaDupyv7ooLsmwhMuOK8xhMsfJFZ28DXHIbaxWWg5kFlxqbcxhGl
 zBT9PwRSxs/RXOd1h26JVTCBR5hXXeoze7vIULFAii2+PT/2U+X5rNUDFXzcs73OwVVj
 hpcx6PkN0/EmtISG7kEY4aNPWrWX6PHQPlI9P2rP/xpcyi+kdk8RkhCkcwKGT+rM3zE5
 BbIzsHSgwENKDJwG8ZmWteLgbjmjixZauMB+BcG9Mi/Z1BcxuoL1oAJ24fRmeBixFmpo
 VeXg==
X-Gm-Message-State: AOAM533YivjfnGR/4plHeI/tk3f/6bCZrQ521tblwM19Eqk0Cwa0yNF/
 Ql0Cxxm0JuvR2q5KMe7zOAU=
X-Google-Smtp-Source: ABdhPJzl1eFZ19eOnxJpjcAN7T7Bu7Ml1Wrcdy8ATgaCIc+wA8dG/mvR1NNXizyaCJmwO1QbRs4Eyg==
X-Received: by 2002:a17:907:9483:: with SMTP id
 dm3mr5118892ejc.120.1612548330004; 
 Fri, 05 Feb 2021 10:05:30 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j5sm4332446edl.42.2021.02.05.10.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 10:05:29 -0800 (PST)
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
Date: Fri, 5 Feb 2021 19:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:59 PM, Peter Maydell wrote:
> This patchseries implements a new board model in the mps2/mps3 family,
> based on Application Note AN524:
> https://developer.arm.com/documentation/dai0524/latest/
> 
> Like the other MPS models, this board is an FPGA image; the AN524
> image is based on the SSE-200, like the mps2-an521, but it is
> for the MPS3 board rather than the MPS2+. The major differences
> are QSPI flash and USB (which we don't model), and support for
> 2GB of RAM (which we do). Since the MPS3 is very similar to the
> MPS2, I've implemented mps3-an524 as a subclass of TYPE_MPS2TZ_MACHINE,
> sharing most of the code with mps2-an505 and mps2-an521.
> 
> The motivation for this model is two-fold:
>  * Linaro's Zephyr team would like it, so they can test their
>    code targeting the MPS3 on QEMU
>  * It's a useful stepping-stone towards a future MPS family model
>    which uses the SSE-300 and Cortex-M55. All the "make various bits
>    of mps2-tz.c be driven by per-board data structures rather than
>    hardcoding them" changes will be needed for that future board model.
>    This way they can be code-reviewed now, rather than making the
>    future patchseries even bigger (it will be pretty large even so,
>    because of all the "implement SSE-300 model" patches).
> 
> This model can run the parts of the AN524 selftest image that
> would be expected to work, i.e. the ones that don't rely on things
> QEMU doesn't implement.

Yes selftest are annoying when emulation :) Lot of features important
for real hardware but we can happily bypass when emulation.

> (The selftest is part of the AN524
> download so it's behind a EULA click-through and we can't put it
> into an acceptance test. We might be able to get something
> based on Zephyr or Arm TFM.)

Wondering about that... If anyone can go/click/accepts the EULA and
download artifacts, then I'd like these tests to be committed to the
repository, with a comment containing the download link, and the test
can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
binary I downloaded is the same you used for your test. Then I could
run locally:

  $ PATH_TO_EULA_ACCEPTED_ARTIFACTS=~/Private/DL avocado run ...

Would it be acceptable? What is missing or should be fixed?

Thanks,

Phil.

