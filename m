Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCD4E1D9C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 20:36:28 +0100 (CET)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW1Lm-0003Jk-JN
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 15:36:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nW1KE-0002Ce-EV
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 15:34:50 -0400
Received: from [2607:f8b0:4864:20::435] (port=35412
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nW1KC-0003pM-VL
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 15:34:50 -0400
Received: by mail-pf1-x435.google.com with SMTP id a5so13862753pfv.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iXj7P8MX507lg298k13mDivyGtQq8El/UdwAD3XE2z8=;
 b=eL5w8fIcfLeOo09FAX0AKpzyp83DeBHR1/jHdnGRJ1mWi1xOlr7gi14xe6UzrJMfmx
 VPUfN219iRakW1LUyHmkVZN+tkyfMndDVRi9vXtA5tDNiyLJYfAFIMrH8wbYWJ5rltfU
 nTzvLAHjfaPLQoBTBPnB7M8yyisRTIesOn9BM2ku/cMmnB39ydnZsGmFtSNpHa1Vt24l
 UIwT0J4dsSk5Qv2DxMec8Iv3TfG3gvw68ZtJq7OyDqxPTp9spFHnrsxMAEQeyyD0zitP
 uQwzkvSsSNERR/kWv85eC7cyiFspvRCNTbKuu7NXUYIOFPMud0dXtS0/Tc8mIoGFlgrh
 Ni5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iXj7P8MX507lg298k13mDivyGtQq8El/UdwAD3XE2z8=;
 b=d+uDiAzvmnsagAloGAn+BRVY+gESSOvMwJoOmAoc7UkJiJuW9/swqUMDTPH2gTJ0fi
 UsmrNe2nt4J4nNSg5CzvP4WHATk/ex1cApKkScJP6+CYS3Yn6XozAuyjRDRcwzYFMJdj
 6YLMuhqqa1fUKXRlIWUPJQPug9kGteJE9msf84G+tyixA19bGDXm0ppU/Qvon0nU+oK8
 QlzX0fZ3GL5VlyR0ScOF4PubpoznYFc6aG7R6wO+MCXsWnM8EQYFxWaCOAvUM6Jhi2j+
 fRunZ1aGIpadWfUiWWd0c6Qt5QL27gKGLbQaUaZ+Ot/uNeq2ba3mtM0LV4DbWnnS/Lft
 KgSg==
X-Gm-Message-State: AOAM5332x9+sD8H/f9rsME+OK1EGExnCcsbLBKVTwDpG4YVDBZm+iubU
 A6cZmLQXij16YUpL1yDYVugFOw==
X-Google-Smtp-Source: ABdhPJyRJ1y9qXTx4D90M5ZTzYr94Di+s/9jnv7wubIBs5WOY6IUmFIhp72lXIvXB1LJBePNX1e5uA==
X-Received: by 2002:a63:dd47:0:b0:381:2bb3:86ba with SMTP id
 g7-20020a63dd47000000b003812bb386bamr15745827pgj.381.1647804887356; 
 Sun, 20 Mar 2022 12:34:47 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z37-20020a056a001da500b004fa7bce792asm6372214pfw.129.2022.03.20.12.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 12:34:46 -0700 (PDT)
Message-ID: <43f1bc2e-91e4-6895-0088-8c298d104fa8@linaro.org>
Date: Sun, 20 Mar 2022 12:34:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] linux-user: Clean up arg_start/arg_end confusion
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220315224519.498463-1-richard.henderson@linaro.org>
 <CAFEAcA9KjAtYy7KxjX_1LDafBOj07NHnzKaRzxoaa5JVU+kwzg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9KjAtYy7KxjX_1LDafBOj07NHnzKaRzxoaa5JVU+kwzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/22 04:41, Peter Maydell wrote:
> On Tue, 15 Mar 2022 at 22:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We had two sets of variables: arg_start/arg_end, and
>> arg_strings/env_strings.  In linuxload.c, we set the
>> first pair to the bounds of the argv strings, but in
>> elfload.c, we set the first pair to the bounds of the
>> argv pointers and the second pair to the bounds of
>> the argv strings.
>>
>> Remove arg_start/arg_end, replacing them with the standard
>> argc/argv/envc/envp values.  Retain arg_strings/env_strings.
> 
> "Retain arg_strings/env_strings with the meaning we were using
> in elfload.c" ? (ie linuxload.c changes to that definition).

Ah, yes, quite.

>> -        /* FIXME - handle put_user() failures */
> 
> Why are you deleting all these FIXME comments? That seems like an
> unrelated change.

Indeed.  Instead of just removing these, I should convert to lock the entire buffer and 
use __put_user instead.


r~

