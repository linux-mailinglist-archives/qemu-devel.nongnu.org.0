Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E2615548
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 23:50:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq04R-0002yK-68; Tue, 01 Nov 2022 18:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oq04L-0002xR-Eg
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:49:17 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oq04I-0008Sg-Us
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:49:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id j15so22122014wrq.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 15:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e5ROKbB2w8Moj/tEj/w5IGmSVPePQrigX2/qen9EKgs=;
 b=mAmBIjnSnclgahdqU50hGgyFREPlLe5Cv/YpSfkiKpSkFFcfUyeIoeuHhaqbzcOmgi
 DR1736OboUKi+nEAtEAgC1YtzL/S7T+3V5sfFKkpRv0jkULWcrQamj5ZPv3n4+I37LXJ
 iHmtjCUb7Fh2axIQMHMwmQFaOteP55zrFM4UpiR6XHcX5HvOMA4lsLo0GRb6GExxh/NV
 r6xYsTmZFDBGJzuwYxI5V1057yCpdpwYrg9r8PbI5MvqRySN4TkttyBbBj/TL6x/QTj5
 miQVGiKQHJZ+kZOwR88rbg09aLybpLSMz/i+xs89UZQjx4i88dZoFV4VHGLbuvJWBcQV
 CMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e5ROKbB2w8Moj/tEj/w5IGmSVPePQrigX2/qen9EKgs=;
 b=nQjPU/ihZ8fq3YZs7yEYEg19/LfgCQw/t9H+2l5OjVUarR+8t2IrQ8lTxlvs8U9BB/
 mgmqGR/SLsh9nByT8FtrBhiV7T4OynZxNBwSNzY2nq7s+Mv3ql8Wm0FQTBLEp5r07VPv
 4ee2rtJUku20yMUNnkLSqJMa+5IQueMyG9QHVGj1jhcuOj1go47osYoGFcH9SRv11aFg
 X4zyygH+7AmCbMngEaYgt0EyMeo418SumWaZ7ul2xoYV+C5sMnPBD///WiFYz/uIjkm0
 HeYrvku1GcfaM0QbDj9+jYZMI72f7Bc+Qv/rObHez3IruJQn0EWrAOlEIw+dVWuvfIWv
 KS+Q==
X-Gm-Message-State: ACrzQf2+nSAs9csKoEonBGZeeMDejEkFcdmMcNZw4aU0sss3KD7/CHw7
 pwrOtb418X9wHazjhfQj79VhEQ==
X-Google-Smtp-Source: AMsMyM5VwuHZpgBpvQCQ13VZXT3uXObjhYJnvmDhzKERH7rutYfrRij2XjFv8TdrsqIcj+QvLo0Gvg==
X-Received: by 2002:a05:6000:1c1a:b0:236:8321:d875 with SMTP id
 ba26-20020a0560001c1a00b002368321d875mr13117328wrb.45.1667342951942; 
 Tue, 01 Nov 2022 15:49:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a7bc7d8000000b003a6a3595edasm84180wmk.27.2022.11.01.15.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 15:49:11 -0700 (PDT)
Message-ID: <78b914c5-ce7e-1d4a-0a67-450f286eb869@linaro.org>
Date: Tue, 1 Nov 2022 23:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PULL 59/62] hw/block/pflash_cfi0{1, 2}: Error out if device
 length isn't a power of two
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221028163951.810456-1-danielhb413@gmail.com>
 <20221028163951.810456-60-danielhb413@gmail.com>
 <CAJSP0QWiE2gmUB4Fcb_TdS1SzXiS3fFvjoCXjqYbvts0Nvb+HA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QWiE2gmUB4Fcb_TdS1SzXiS3fFvjoCXjqYbvts0Nvb+HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/11/22 23:23, Stefan Hajnoczi wrote:
> There is a report that this commit breaks an existing OVMF setup:
> https://gitlab.com/qemu-project/qemu/-/issues/1290#note_1156507334
> 
> I'm not familiar with pflash. Please find a way to avoid a regression
> in QEMU 7.2 here.

Long-standing problem with pflash and underlying images... i.e:
https://lore.kernel.org/qemu-devel/20190308062455.29755-1-armbru@redhat.com/

Let's revert for 7.2. Daniel, I can prepare a patch explaining.

