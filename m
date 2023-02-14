Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300E696777
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwlF-0002PV-AM; Tue, 14 Feb 2023 09:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRwlD-0002OJ-Dt
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:58:23 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRwlB-0007BD-N7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:58:22 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m10so7037630wrn.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 06:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XggBteHi0Dsc2BPLSYVscWqvcQ5OSrEjfAnU7teHw7g=;
 b=LBMCH/OQAFv9xdA4gX8ibdtLD9gc52YU6MqKtBTlCErlraZo3EDHDvME1khmvF5iiv
 Nb14wnzTkLfGX845x0mHCdiQl64KZK3+z4QFAqOiHfJx/a3by2xNcYx/+lWOWYizfs8C
 YS3P4d+XeBqA7FX++vdZSxQ/v9x8YJhUeN1+7bGkH2N3I1zvlUjrn7UkZjp4tdW5BI4x
 /24iKGjsapC10Z4IIAFrJ99ABc8BA7RMyt71adEcQc32ZZ8V9kaojUrkw4a/xgaPzL8a
 aED91YOmXua9Ho2dUapb4kEyW4AtZzKewZ38+2oP92ajgeTX7HzJ3l6MrD6/yLon0CZF
 7/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XggBteHi0Dsc2BPLSYVscWqvcQ5OSrEjfAnU7teHw7g=;
 b=Srkxt6A6C8EHM6+jXdFd6cpk3lo4AeKa0859fhrK+qAjYxfZ5Si+uVd4EEXgESGXs9
 l3yrJf5XZxtp4cTNBTLl3Cl5VsrIVLLXnFQN5/LTesOXhNjAYfGJf3n8oIjKwnI/Lw0a
 zJyp/OIrjr9Yj5Xd4cTxI10bBYV/Hqxy25EXUe93/5mNdVVPX1STEx1Iwu51u6d3i7a0
 m/DVtFNMTqtmdCNG0htmtf19BoNinNyMiu3n5eOlPP3V6qMy793bH5fJunKv5zhUDQDs
 FXe+8f8Ljz8r2pvNR41Jo36J/GCBsTXjeYh5ChSw3W7zlLDautavH5I3tfHV3YFCUa5y
 7oDw==
X-Gm-Message-State: AO0yUKUSFkUuR2r/0/SSG/wY9Vw06YfbZPtoBpliVpUU0ZuTZZJkb/rs
 /5Fn704fITHxzL7ZqA8jiNDjRA==
X-Google-Smtp-Source: AK7set+sL6ATT+EMI1H4kvd28AG+2zF2qhvSRHDVX1cbKflseVlF3zO4UHTF0yAndavLMs7/Y38wOQ==
X-Received: by 2002:a05:6000:d:b0:2c5:4c0e:3736 with SMTP id
 h13-20020a056000000d00b002c54c0e3736mr2391019wrx.24.1676386699986; 
 Tue, 14 Feb 2023 06:58:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d16-20020a5d5390000000b002c4008f0daasm13295909wrv.107.2023.02.14.06.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 06:58:19 -0800 (PST)
Message-ID: <24404a86-3583-0561-09ea-f3e4e38bb952@linaro.org>
Date: Tue, 14 Feb 2023 15:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] target/s390x/arch_dump: Fix memory corruption in
 s390x_write_elf64_notes()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230214141056.680969-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214141056.680969-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14/2/23 15:10, Thomas Huth wrote:
> "note_size" can be smaller than sizeof(note), so unconditionally calling
> memset(notep, 0, sizeof(note)) could cause a memory corruption here in
> case notep has been allocated dynamically, thus let's use note_size as
> length argument for memset() instead.

Correct.

I wonder why use one notep* pointing to a stack allocated or a heap
allocated buffer. This isn't hot path, one heap use could simplify
this code complexity IMO.

> Fixes: 113d8f4e95 ("s390x: pv: Add dump support")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/s390x/arch_dump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



