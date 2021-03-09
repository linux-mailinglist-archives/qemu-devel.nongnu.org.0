Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C05332890
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:27:36 +0100 (CET)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdKh-0004FG-JZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJdEy-0005QA-IJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:21:42 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:42981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJdEq-0003U5-Ot
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:21:40 -0500
Received: by mail-ot1-x32b.google.com with SMTP id e45so12918816ote.9
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tWd3uk2YWgVFGfjkgGFWFBwno/Ry/8sVR8CJDE/Wdps=;
 b=SVfHq/a7/RRH6Xomp/RCq7yUJFdhqe/G7/RTzD7HMYJdrZhByNsqF+yDEnpuPR9O8K
 9rpcrhWoQZPP4y3bAn/o7UEKMjwM7uEPJH9p4DYNNqujlmtWLV81tP7EDozDtz9Ax8FD
 Q/mEH/Cku9wHrYNs6qglvaRNiTT7Ullk+7KC1h+M8gY51jznSW3oSzr7qX7ylcI2are+
 YY6Mc3jc23P7XrG1MuVa4/ZGe0fo5DZjHv4FtrTkpzM5r63NgNOhcbC+l2aRTxQdeZ65
 oG+chSGBKCLmpDdfVH2ihMJ6FoJ3Z+IPCMwUB3yxpcZgPajKIw7bDfh1R7R8DNOuEXQk
 FbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tWd3uk2YWgVFGfjkgGFWFBwno/Ry/8sVR8CJDE/Wdps=;
 b=rXrvbFVCDMGkNgSmh8KeKFoVuFpEjVAbxOiXNXOVau/tXMff6QuIcpuky2nrmUukmG
 9jGjdAQxgqd+/rOw10gbaMA/xtAFM7YUl9heiav7xpq1t6bhIgjBrGZ6gOG+f1Tq2I8s
 Erhi5LTqqMje4XUNzkf9sB/67x14tZgKGZtNvoS6ho4iQtU5OqTd5U3SKinBUSgIOJCo
 Qb2WLIEEscDefiJYzfp5NSQU2RISLfLIssejVjbAqTA+WwQdhfw6WtlAt66RD+YwFZhH
 mTJ2zgK3RRvHTKqhNpUaoVXquDbRYp0vmRjz/I48tCBdJKBjT32Q4cNhZD+FwgExEKBD
 h4kA==
X-Gm-Message-State: AOAM531TfPZ0xP6anvI3z8wXPK/9zl8qNa89DbBmXVDxcvuk8cfPS06w
 UyBNEuNCZXp2BqMsOVxLGJey3A==
X-Google-Smtp-Source: ABdhPJyvJZw4zpjoFnqdnBZX6J2w1+08iYTmm6HgiESrTQyrfmr4MgF1bbWOdHRfoj9nTUy2YQqyig==
X-Received: by 2002:a9d:ef1:: with SMTP id 104mr19805251otj.180.1615299691270; 
 Tue, 09 Mar 2021 06:21:31 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v1sm2928914ooh.3.2021.03.09.06.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:21:30 -0800 (PST)
Subject: Re: [PATCH v2 3/3] target/m68k: add M68K_FEATURE_UNALIGNED_DATA
 feature
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210308121155.2476-1-mark.cave-ayland@ilande.co.uk>
 <20210308121155.2476-4-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d95aaf36-0227-2541-2640-35febc4bdca7@linaro.org>
Date: Tue, 9 Mar 2021 06:21:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308121155.2476-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 4:11 AM, Mark Cave-Ayland wrote:
> According to the M68040UM Appendix D the requirement for data accesses to be
> word aligned is only for the 68000, 68008 and 68010 CPUs. Later CPUs from the
> 68020 onwards will allow unaligned data accesses but at the cost of being less
> efficient.
> 
> Add a new M68K_FEATURE_UNALIGNED_DATA feature to specify that data accesses are
> not required to be word aligned, and don't perform the alignment on the stack
> pointer when taking an exception if this feature is not selected.
> 
> This is required because the MacOS DAFB driver attempts to call an A-trap
> with a byte-aligned stack pointer during initialisation and without this the
> stack pointer is off by one when the A-trap returns.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier<laurent@vivier.eu>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

