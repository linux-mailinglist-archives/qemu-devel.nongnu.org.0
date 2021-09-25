Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225754182A3
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:22:15 +0200 (CEST)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8ZC-0007o1-5a
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU8Xm-0005fT-8M
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:20:46 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU8Xk-0004sT-Ab
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:20:45 -0400
Received: by mail-qt1-x82f.google.com with SMTP id t13so6403196qtc.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bwEJNenzhvbd7X/dFacWQzJM6HeD6qU1WmzjPc9t4T4=;
 b=LsywmDTQu1pfTDgxcCfXIWotjHR1kj0fxWL/hjV1HnAhTP5BccihWcmCNChkD0dlZO
 WLgIVHXUW0syDyhic4w4Mr3Tgci9uLGlBuYqYz1AD/u6Zbe5J+Und2YSdndhq7U+nHi5
 9308jTSifHab30hLg/ZA2H+XFVKbGWCSZnDi1ZZJSwM9O1FQCQCcTZTVPhCkF0ttzJ68
 qxDAGmsmpYPKEd3KWjJKekoIdOKAtor3/okIWQJC9XPA2Hz63rpdqCOl3D/6Qu7MOK8j
 omgJT+jEBEKvzVkGZv1v77PfVj6h9BCSYta9Uxt4jXruNCoI//oE7GclD+Tj/QEjORuA
 k0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bwEJNenzhvbd7X/dFacWQzJM6HeD6qU1WmzjPc9t4T4=;
 b=y43wHbVCVNwyI4IefEMG4Tj0d2oZeZG8BEPImaQHuZRcRbSsExfqtszW5P2sr5lMOa
 vRZ4t9PTD+XYHhU96jm9I/JGmyOky7a2waglRzKfLEVWceYJw0X3Y/Qi7VqZ0/BvbcIf
 HhDAHNkBFJKTsUUWPOuNsx8h6tHo/pwSt5FokONq+Wmf71lz9tnXOa0aCOkvbIy0XF13
 a8Skoh1OBUdO6bLM1m+J6cos7V01z+nM+Y/njZKhQ9FtiTvDw6XbHpCJjfgQD3rLBZCk
 1LwJgpeEH8HEH/v7lNVt6J53PrYI5eE56QfbEgpsErOQ+HztmCJQ7OGwHZiKfXvcsKko
 AUKQ==
X-Gm-Message-State: AOAM530orom/poAOOHXl31hO7B5pUvizyPru/v9Ie1ThiNj2aytrmrAA
 3TIjvJ8Gd2/H16WfzgwA/4n7Qg==
X-Google-Smtp-Source: ABdhPJzi+H5c6UDR5hr/Rh8F050MUWlzDDNjpKgoKeGONz2WrR1cd8NVyLr5YLVyD1RYfeTpuB4Amw==
X-Received: by 2002:ac8:5685:: with SMTP id h5mr9812338qta.153.1632579643102; 
 Sat, 25 Sep 2021 07:20:43 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id d16sm7261582qtw.14.2021.09.25.07.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:20:42 -0700 (PDT)
Subject: Re: [PATCH v5 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-5-git@xen0n.name>
 <313df1b0-9edf-7333-da46-7342ca308dfb@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6bc47454-7475-7b02-3621-54d064a975e7@linaro.org>
Date: Sat, 25 Sep 2021 10:20:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <313df1b0-9edf-7333-da46-7342ca308dfb@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 11:51 PM, WANG Xuerui wrote:
> Hi all,
> 
> On 9/25/21 01:25, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/loongarch64/tcg-insn-defs.c.inc | 979 ++++++++++++++++++++++++++++
>>   1 file changed, 979 insertions(+)
>>   create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
> This patch series is only lacking Reviewed-by tag for this commit now; may I ask whose 
> review do I additionally need to get this across the finish line? Or is this series 
> waiting for upstream merge of toolchain and kernel support too?

An ack is as good as a review in this case.
I don't normally "review" machine-generated code.

While the toolchain is not upstream, the ABI seems solid enough.  So there's no worries on 
that account.  The safe-syscall code has nothing in it that's kernel api specific, so 
there's no block there either.

It looks like one more revision to address the valid nits in tcg_out_movi are all that 
remains before I can merge this.  I'll work around the conflict with my SIGSEGV patch set, 
and Cc you for testing when it is time.


r~

