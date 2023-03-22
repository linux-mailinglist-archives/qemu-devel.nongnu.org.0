Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C36C4A0C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexLM-0005qh-M3; Wed, 22 Mar 2023 08:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pexLK-0005qP-Uw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:13:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pexLJ-000173-2L
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:13:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id r11so6004wrr.12
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679487203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WyLOa6yogVL1IKw+smlVp0/gFg552tVUeOx43r9KKi8=;
 b=mYRlL9ER+gx09qhtLxUpEo7BgBlwOls8CbUzZkrmw33s9Gquq3xc+yqzss2Y5e8UK7
 wnBg57+N7s/NGodW8f4jVlQn2d1UO5OgPpbIUpHvurMo2B3Y4H3i2UgYQ8Vd3i69VEqJ
 7ZbBw4ckmVFxTkPn1z6C0bd6K7KQbH7vosYvPMlva9BKb7bmMJTNvtxC2jZSNPJi+kvB
 Uzd/CL95modD5jQgqPFNbVwMgurgBOst0kCPvKD9fF9vlkE8+cGMPojvG6gyJPTAPemF
 CTZYDdqkWaobpRq1plBy+wt3KQSrAZme0+sexZwtWtthXtfytDFP37Dw/NEeiK0RXPkj
 vHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679487203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WyLOa6yogVL1IKw+smlVp0/gFg552tVUeOx43r9KKi8=;
 b=qmiTeJnFqL7R8Sf1K0+I5KqIAobJMGFIQdPl2Rut8pf6knaDcY8BsmyJbdGrwsB8mt
 W16YcXbc7S8oXlnssLxqJphNTdWO4+fdXVHI1no1h4jtJklcnvNF9vTlLrCuulboIFCg
 +d5HjTorsTwkyGZVxr+SmJMW+bEaz5aVtZmJYlx3TnFbd732sXVxe1LBdV6a9wJdpyT9
 /l12GnRhf7Zueridi8GapznCKxSYn/64xnCpsIMJOLnJIM49ivbS7KxcG6254npzGewp
 aLkR9aZURU0iOp7akt0GPCjBzZ6s/ceF2OeW5kejfKcd2+Hd4bE2evfycf6iMjoK9khw
 aL9Q==
X-Gm-Message-State: AO0yUKVcGlCD0XLw7Ii53ZlFodqc6AQzKC9Zz1iheimK/U2syzFJa4sQ
 A7MhYnkrrNZ0UnJJU+x5JZr3+g==
X-Google-Smtp-Source: AK7set/37xHzzgD1qxUpKJrpjeOFQbjCwEiFKdnlrZllqxpWA9g1VIDrvQ52C7aQ5vLGSWhbdka47g==
X-Received: by 2002:a5d:4d48:0:b0:2ce:a9b5:37d4 with SMTP id
 a8-20020a5d4d48000000b002cea9b537d4mr1296488wru.21.1679487203084; 
 Wed, 22 Mar 2023 05:13:23 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n16-20020adffe10000000b002cfe63ded49sm13725350wrr.26.2023.03.22.05.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 05:13:22 -0700 (PDT)
Message-ID: <133c2b45-452c-c9e7-7fc4-c07d31d94298@linaro.org>
Date: Wed, 22 Mar 2023 13:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] cirrus.yml: Cover SPICE in the MSYS2 job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>, Jintao Yin <nicememory@gmail.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322110521.59949-1-philmd@linaro.org>
 <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/3/23 12:30, Thomas Huth wrote:
> On 22/03/2023 12.05, Philippe Mathieu-Daudé wrote:
>> Include the mingw-w64-x86_64-spice package so SPICE is covered:
>>
>>    C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc 
>> (Rev10, Built by MSYS2 project) 12.2.0")
>>    ...
>>    Run-time dependency spice-protocol found: YES 0.14.4
>>    Run-time dependency spice-server found: YES 0.15.1
>>
>> In particular this would have helped catching the build issue
>> reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:
> 
> Well, hardly anybody is looking at the output on cirrus-ci.com, so this 
> patch here likely would not have prevented the merging of this bug... 
> for that, you rather have to add it to .gitlab-ci.d/windows.yml instead.

It seems we have 2 jobs doing the same testing (even same version,
msys2-base-x86_64-20220603.sfx.exe). Does it make sense to maintain
both? At least with GitLab we notice a failure.

