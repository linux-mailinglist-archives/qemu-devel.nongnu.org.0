Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0667765A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:34:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsGz-0006CU-RA; Mon, 23 Jan 2023 03:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsGy-000684-1H
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:33:48 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsGw-0006si-Br
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:33:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r2so10002794wrv.7
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 00:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7asl8pBIUUFrtQamQZNjK2GVa9xOi+RaypuYLKa2hTU=;
 b=Hm/t8a4Z9/BQDsvj09HZDw0DmxLgVfBd4x2djTXZxH3ieYxGZkFhg5ukyfTYD3aT6e
 S4U1LDb1frnIyaOyFtHIwtbIIK2U8B8lh0ni4rniVlydcy6YtB+4YFmDERzNvMRYL4j5
 S/I9oKetIBpboxecyVkK2cDe1v7+QUDb/laRpuJxxHk8eP7hTfwIr2TzS9q6qiN2FUkz
 +kU+edqBQHG7eJIQlAWSm5EwZpzvt/xm13rCj/nmxjh952AXLFc/tofgeZJs0GdPEmSO
 IGpT8hpll0j4OGTpEu9Qq/PciP/hgPytnsdaKn5K0dgjYi2Gf/qjIn15cqWiA/VLXmf7
 tvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7asl8pBIUUFrtQamQZNjK2GVa9xOi+RaypuYLKa2hTU=;
 b=RL6VUqr6vLrQce200zSJZYq6QEQQ985dbsP5XQ8qMzBJ5Cx3cweD95UzOyaUB9Hka2
 qsk/3IFeTbRguhW2WX7hNI6eyjdt5KpwXiU5pkM9L+31bWdAOY9kafY6aXCTbd+/CiMT
 JtwwQCJRfenwc4o7dB6F4/J/dB2FrCvXu9gyhLNQiJf2g+YMwGPYRQbE4HAm9PHbHQ+z
 36JebvbHE9Sdgm7jKa+T8RZcxCcp2txfJqP7wzfCj0ACop2LaR2Z+pTLErkALEcRzVVx
 MDcPqsgOFkHIo2+fSYupUsTzLu4zoUumdQiiiyD68GVKesI7k8Su33bUl7DAbIPYiGaU
 91ew==
X-Gm-Message-State: AFqh2krAhgiDDvt+23UmDNV+PvdY9YZiG7NMzyu3A6eQU03rZ8b9Xi/s
 CryxlDCN2KcKsTeUw9mU1TY8pg==
X-Google-Smtp-Source: AMrXdXvnGz5eHxEDb3vywO0F96NQ+nFHYWrIl9IVrx5zorD45V0a0gN0wD7m7uLB8V4l4K4WTmW9uQ==
X-Received: by 2002:a05:6000:79d:b0:2bf:95cc:7447 with SMTP id
 bu29-20020a056000079d00b002bf95cc7447mr8700577wrb.32.1674462824908; 
 Mon, 23 Jan 2023 00:33:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b9-20020adff909000000b002be5401ef5fsm7629181wrr.39.2023.01.23.00.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 00:33:44 -0800 (PST)
Message-ID: <7cb111b6-9831-b90c-cb7e-c1120ef44db5@linaro.org>
Date: Mon, 23 Jan 2023 09:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 05/10] tcg/loongarch64: Update tcg-insn-defs.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118011123.392823-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 18/1/23 02:11, Richard Henderson wrote:
> Regenerate with ADDU16I included:
> 
>     $ cd loongarch-opcodes/scripts/go
>     $ go run ./genqemutcgdefs > $QEMU/tcg/loongarch64/tcg-insn-defs.c.inc
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-insn-defs.c.inc | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>   mode change 100644 => 100755 tcg/loongarch64/tcg-insn-defs.c.inc
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


