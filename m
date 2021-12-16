Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38678477B5F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:19:19 +0100 (CET)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxvLZ-0005b3-Rr
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:19:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxvKV-0004lK-EV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:18:11 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33765
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxvKT-0004gq-PZ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:18:11 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x5so103918pfr.0
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 10:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PUibhlNZMKnucbmnrkjSgTs7+wn9lW+Nqr90GpZKYCk=;
 b=VddH9LCv5VYu84KfukZfkPzLLsQBDk48AG3JbinVX+eAPLvJNmXwOVQymfMBKSf8nu
 bCXjHdB48OybJkj7BG1UPYj6KvBxvVxUMrWnxRdtihri5vItYfzF3GoUj8RGi3OxKt/c
 2ZblPATI9qO00TfDNdPU7N24r/i0ZeQldyVbobe0sl+uKIH3OR8CND6KNX8KkAmt/An6
 amEZN+LyPpsL2ox3zq8b7NIPl9koGB4ajc14yH3PBa488X7CwTQK2zJzdxoEC4OBnuLW
 vbPeqBjgAIWFunTBW/mEdZ8hx3tjVLRD4HsWCHYVymGT02RkKluiMjJ3v4hRDweUXvxt
 3MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PUibhlNZMKnucbmnrkjSgTs7+wn9lW+Nqr90GpZKYCk=;
 b=4Ab6SoFRtZJO84QNIcoJjKAtXU/NyhRn7/jK/awVwHJJ5HS/5feNpfJGFFzlnV4aIh
 PpRU/0OLk38IRLWyIGMSa6sylE9eYFve36ckXFJCTFbc50mwzNG1hQ92AeLXq4AD4FLG
 XQXFFzSR81rFYeYneQbg2hV6uaCt5DDGEOFydlRd9cKUEK7Y+mxXHY2ZsZPYFxJjRPFN
 vhX9EE/U5AEJr0Ql8eEGkNL9YbRDr+DNeK14KQR+n52/ijR3L+s6bn9lAtkYzudNhzCb
 QuAIbWeI5WRIGSwYjf5X8Uvda6D0CvUMpV9FB8rADslO3EPraCKKDSdRyOT2hqhRmcaN
 3xXw==
X-Gm-Message-State: AOAM531ls8/66IGXeOpJbHJJC3bVYzpVe+LrL/ZUUByXZOPQL+ue/u43
 ffAvuBGPGhXI1/09ZHUxN72cdQ==
X-Google-Smtp-Source: ABdhPJxvTC9JadHjVh3zY8QElLL58M3piShWRBtNw/RR4HhfjZICsBOFzj1n9cOA8PjWuJmv5zH4lQ==
X-Received: by 2002:a63:293:: with SMTP id 141mr13181015pgc.25.1639678687964; 
 Thu, 16 Dec 2021 10:18:07 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w9sm5124810pge.18.2021.12.16.10.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:18:07 -0800 (PST)
Subject: Re: [PULL 000/102] ppc queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211215165847.321042-1-clg@kaod.org>
 <2ef5a85e-8955-2028-026d-7cb3ad13d718@linaro.org>
 <2f7401a9-a466-2e5b-df8b-6544fc7b16ba@kaod.org>
 <56e6beae-1c4f-2723-6174-f239f1a38c94@kaod.org>
 <c794cd0d-fb49-467b-dc2b-01f2ea86a4c2@linaro.org>
 <77cde36a-d770-5176-b28d-2db7a157e45e@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de9fd39a-e8d8-2836-621c-95f59bea6132@linaro.org>
Date: Thu, 16 Dec 2021 10:18:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <77cde36a-d770-5176-b28d-2db7a157e45e@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.034,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 9:51 AM, Cédric Le Goater wrote:
>>> It's certainly due to
>>>
>>>    [PULL 017/102] docs: rSTify ppc-spapr-hcalls.txt
>>>
>>> However, it does not reproduce on f34 and 21.10 systems using python-sphinx
>>> 3.4.3-2 and 3.5.4-2
>>
>> Correct, it's a system running 18.04.5 LTS, python3-sphinx 1.6.7.
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/1890700682
>>
>> Is our s390x ci host really the only one left running 18.04?
>> That seems like a mistake...
> 
> ok. Tell me if you want a resend.

Well, yes.  I can't edit your signed tag.

r~

