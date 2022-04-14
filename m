Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0C501A0E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 19:33:38 +0200 (CEST)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3Lc-0004xv-SZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 13:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nf3KZ-0004JT-65
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:32:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nf3KX-0001wq-HW
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:32:30 -0400
Received: by mail-pl1-x635.google.com with SMTP id y6so5242943plg.2
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BlWq2g4GXvgFhLCkjeF3Hepu8BHQJ3J8MUMKEk4IzH8=;
 b=C/phWJsj8Q2tnGOrwtCNz/lwLVqs/n0M14/VNw52zXylIg9LkZ83T/klJdnEKxVhjc
 VU6VZnjBGrL79RG3ucjRv3JfOf11aAZq/1uxOen/AWfjbpLK0DSlYvEhWgtmUkAHV7t6
 4p2ltCGCI+b/WhgIeoZ35OOztcdUYoB93rcrO3jk56VMOkaGcE+uPvQJ0F81m8MUy+DO
 KMdAr77SNZBUig0j0pmyfwrYkmA6jRSuFQqnBTNpnctN0kEp3YjqexGWCCHxkEEeTc6E
 lRJOP3FuVnhHVJE7NaZkOl/W4RJ6AsGyriZhip/LaUJU1ZJd291rbbVTBJft/07XOYsr
 RA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BlWq2g4GXvgFhLCkjeF3Hepu8BHQJ3J8MUMKEk4IzH8=;
 b=WAZGC4tzPBPtj7LO89BAu7nTKI7ALK1XnQKgNDY3c8CY3bkyDf8mfx3T5l3a2c3vC4
 M84hSPDh1r3ui7Gr5ZRfX+XsKhxWBb/+HDVuOXLlIKqaBRlqhMQRyCSCYzL8UfyHR6UF
 CPyizGZMwmxYCGjn06hzITRRpzPnJDxiN0CvFYSyhtvzJa1a1+zbeUmLjdy19tAcjtA0
 GhxqhUYq78Z8p45IjOUrU6RlESVVI9uFkUihJdRIgh+RiiJcWhol74yRWlMBNz8klVXy
 WIGVIFp9+80CSACACtuA4WEYGZ2sqdkrsu0V20UD1Hots3a46h6ZHG16Iv5dZ/MZYEXn
 3zJA==
X-Gm-Message-State: AOAM530W+W8KvxwvIfay9vtTQkgc+5dc2YDq9NBDDeeIZE9DCN9fCP1X
 dVXl5HvA6IsvV1ePMPHUqdRkHA==
X-Google-Smtp-Source: ABdhPJzygptwMlcXJj0vkvuYg+vVjXjMUWurrC3Vsi0UPQhY7zWXi4FTKKymQhvfqEpL6Rm8QyQFsA==
X-Received: by 2002:a17:902:8c81:b0:156:7fee:643b with SMTP id
 t1-20020a1709028c8100b001567fee643bmr48428948plo.59.1649957547515; 
 Thu, 14 Apr 2022 10:32:27 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x7-20020aa784c7000000b005058d220b37sm465849pfn.64.2022.04.14.10.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 10:32:26 -0700 (PDT)
Message-ID: <687ea4a7-131f-2bee-96af-b9adc7267605@linaro.org>
Date: Thu, 14 Apr 2022 10:32:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 27/39] util/log: Introduce qemu_set_log_filename_flags
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-36-richard.henderson@linaro.org>
 <87h76vvhcc.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87h76vvhcc.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/22 07:56, Alex Bennée wrote:
>>   #ifdef CONFIG_TRACE_LOG
>> -    qemu_loglevel |= LOG_TRACE;
>> +    log_flags |= LOG_TRACE;
>>   #endif
>> +    qemu_loglevel = log_flags;
>> +
> 
> This looked weird - so should we consider a qatomic_set here to avoid an
> inconsistent set of flags being read non-atomically elsewhere?

I suppose we could do, as a separate change, since this has not been considered before. 
But I don't believe in tears to aligned 'int' on any qemu host.

>> +        logfile = g_new0(QemuLogFile, 1);
>> +        logfile->fd = fd;
>>           qatomic_rcu_set(&qemu_logfile, logfile);
> 
> I was also pondering if flags should be part of the QemuLogFile
> structure so it's consistent with each opened file. However I see it
> gets repurposed just for clean-up later...

I actually had this at one point in development.  But yes, there's no point in it for just 
the release.


r~

