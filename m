Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A624355FB4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 01:48:56 +0200 (CEST)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTvRH-00016T-EU
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 19:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTvQS-0000Q4-SS
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 19:48:04 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTvQR-0001wI-2G
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 19:48:04 -0400
Received: by mail-pl1-x632.google.com with SMTP id z12so4338202plb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 16:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zV9HKJ+BKLMXg4qY1LrUGvdLvEPdBkNpH9AsmcDgn24=;
 b=RnC2RnY8EtH02OURrDdx23c5Zn/K6dRA4fSV7fU+sO8Txi6Omz706zTprkpFMig2T6
 Dl69EMKVr1o4I8EqtAyYzTWIx5m2yqq/DljOFCSKAAHAXYYSMDnpWJluwAmhlRI9Oybj
 MsflbhyNmu++ZL3m58wqHqyNqeKKDzTzUN+k3ujgvRwJQnC9lDcvs+Rx2nVdP8lTSSG2
 gW9+SX+dO19dxBNIaPCWsZdQOJfJLpRTXtjyWcCnMIPAnK8rPfqLCJXGOKFULpGrfdUv
 EvO68FTQ0lqE4skbCfPm+lA9dwU0dIHjTua0w3zHuMQfBAtGcZrQiR3PilSuxbY4x+qA
 lZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zV9HKJ+BKLMXg4qY1LrUGvdLvEPdBkNpH9AsmcDgn24=;
 b=IeKAG/lEb8ItS/vWPhCE9s2MZEoM7Mm6i6DibxYoVb35mVGyhiNWOwalowtV29XAHf
 +WxU8gy/90/gf+Cnjx4JHZcNb2Ld/vmzsi9sER6Kzs0WTgikMF5L2la9cLRnpwpQLYh+
 AawfPn0FFXm3G0vCAS/+9FMpfpKb5NpIlEuplecASdD43Aurf0rWh14pgeksNpN41YH9
 2DCVdcO2wSPI7YCoyum2fLc4wV9rvdjY9x1oVQ2GTVeYrNzIcHdjZjBon5vpIrXrwodr
 t2BrjJfS7rzhSNaPPKf1dWpOTzSRemjsYDY4/WOFcDgCqR8lD95SsCo3mlY7B/7PArrc
 T2zQ==
X-Gm-Message-State: AOAM532F022RbH769tmvk4a9HN2KsWtn8AM++wTGzVQ94QDBkvaFFgIL
 xxcSl4RhpQb1vlaZ256DvJ5exQ==
X-Google-Smtp-Source: ABdhPJw7hRGmh6gECTYY2tNhi0QKQ8MwsBkCtAXxmfHcVx932B8979eIAodSh3hyQfzmwKBi4AlK6w==
X-Received: by 2002:a17:902:446:b029:e8:c376:6651 with SMTP id
 64-20020a1709020446b02900e8c3766651mr622835ple.72.1617752881531; 
 Tue, 06 Apr 2021 16:48:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q10sm19418027pfc.190.2021.04.06.16.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 16:48:01 -0700 (PDT)
Subject: Re: *** ARC port for review ***
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6af34171-223e-55d8-d908-55dab5e63abe@linaro.org>
Date: Tue, 6 Apr 2021 16:47:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> In order to simplify the review process, we have separated the patches
> for ARCv3 from the previous emailed ARCv2 ones. Being the patches from
> 1 to 16 for ARCv2 and 17 to 27 for ARCv3.

How may one find the arcv3 documentation on the synopsis website?

The closest I can find is

   https://www.synopsys.com/designware-ip/processor-solutions.html

which best I can figure leads to a paywall.


r~

