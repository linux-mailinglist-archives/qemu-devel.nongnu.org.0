Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6D3DC6A6
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 17:27:10 +0200 (CEST)
Received: from localhost ([::1]:60440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9qtJ-0001Yk-By
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 11:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9qs1-0000pg-NT
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 11:25:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9qs0-00041o-2v
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 11:25:49 -0400
Received: by mail-wr1-x436.google.com with SMTP id b13so4559596wrs.3
 for <qemu-devel@nongnu.org>; Sat, 31 Jul 2021 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/WXJIGBY+ztVMhcOsue0YfytGUJdw5DBc4sA4AvIFVA=;
 b=WFPtyDV8Xa8lYKYPWUPTbsUtZncmpGy1wJbHVclOt2yQKS070XHMsdq3Yx3mxq0RbJ
 tEArpeltpd5Wy3l/jWaq0arIMxWbppZRdkGbM3bttV2MUL28NAn4m5Th52oRmI8R1Ou6
 HTc8wZ44TYFIxQwd+m2uqI1nn/sRUyPmjs29ZxCvpqSEp/V+sU/zZez9WZXEkpU4dHAW
 mjw8DsxocEzQet3w9GVcgXqdsx2jZSRikykvohzWutnM+qdUJXUMpRnur5D25itSXqj2
 DwWtFok93tQVjYLYG+ItFrlSH5Xx4kwlCZkXbP//f3Vqgurger8dtwgoHFe6axgSBe7m
 3RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/WXJIGBY+ztVMhcOsue0YfytGUJdw5DBc4sA4AvIFVA=;
 b=IuCgsIJX/OhJ/myz1A7xA0666YShK+X/eiXxbN6OSAxtU4f0Np5AnsBTgRQQJyvxM4
 9WIKni02JGWppUS3bIQ7Su5toEJAMULjqYP3sS57dVcA273uK2ycngCoZ7tVKs7YtJAk
 ZIa8y0/bExrHmoqiRe1xfw8FsZv6gWo9KNzwDRORndQn2Up2p/NlBnxHEmAuE2Sp7Yrc
 5VNgNeJdLfUXTbUWQzG/cD+ebmjCKEqMCFE/nfIXRsZxXxADD65kJJJ5SuYaOsifqKWz
 KktfWL85r2u6+yHQZ9uHlUWuSO1Q6NA1QkeKENhSk/HjmnErylyAIHSLRiK5rlcGPtRt
 54Mg==
X-Gm-Message-State: AOAM531i0AowBIIxUOonrXmX+nOOPRspZSiU9yvf/R11kGpFti+BjCKp
 kgCBKEOZlTolcW5HPjEWypI=
X-Google-Smtp-Source: ABdhPJx8pszxFztJnr1JogUXIz3olHkrFEc30znhDwN5XkdsHml3mI8HHkqO+3XLLlnUP1TaQtq3Dw==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr8625179wrs.341.1627745146806; 
 Sat, 31 Jul 2021 08:25:46 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id l24sm5099887wmi.30.2021.07.31.08.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jul 2021 08:25:45 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] coverity-scan: Add accelerator and sysemu
 components
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210708155735.1805767-1-f4bug@amsat.org>
 <d5b87a24-5fa3-eb9f-4105-76342f24f790@amsat.org>
Message-ID: <ae47059f-623b-2499-8eaf-7d44ca3104e9@amsat.org>
Date: Sat, 31 Jul 2021 17:25:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d5b87a24-5fa3-eb9f-4105-76342f24f790@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping^2?

On 7/22/21 6:08 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 7/8/21 5:57 PM, Philippe Mathieu-Daudé wrote:
>> Add 'sysemu' component for issues not related to TCG.
>>
>> Since v1:
>> - add accelerator components (Peter)
>>
>> Supersedes: <20210619091342.3660495-1-f4bug@amsat.org>
>>
>> Philippe Mathieu-Daudé (2):
>>   coverity-scan: Add a component for each accelerator
>>   coverity-scan: Add 'sysemu' component
>>
>>  scripts/coverity-scan/COMPONENTS.md | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
> 

