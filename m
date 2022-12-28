Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477F86576AD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:53:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVux-0003MB-HU; Wed, 28 Dec 2022 07:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVuu-0003JM-5G
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:52:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVus-00043Z-JN
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:52:19 -0500
Received: by mail-wr1-x431.google.com with SMTP id y8so14846534wrl.13
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EL/Z36sXxdHC2TGjNArUEr6C0LdjQ8ge6ht/jxjnR5Y=;
 b=LqmXSt7PDVCy5LlKt3jdqnAFQvIAtkgbS0h8M+M9F2b6SggeWEhTK07ksqzwdWoDxD
 0NUXHKE00JnyamF20rRqQUisEWgwKQJSZcZrNP39fdP86D9lt0T78jpE3kpI2Y4chf1E
 2jwKmGuuqpwvavjceXUeqaysNfM5Ub+VdEfQbpK4JvgDYt7eI5PZrbBxQCd/kIqkEP+d
 mqYs03iXlFrzNJDlFpvHWUmKRWFgxh2oVPs+huweJVJbaFK2Hm77BSnvp3qEf+yKAmyy
 Pl1g4C0tY+FE8D1rBw53kpnaD8SYr5X6S6G9m93DKkMYAfNP1i0ZPOVkL7yzaXYBeEtT
 IeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EL/Z36sXxdHC2TGjNArUEr6C0LdjQ8ge6ht/jxjnR5Y=;
 b=E589tQ4o0h6v+M4FvQ+94HeZMwV0eXW5g10L2k1j2jXLOYMfgmO7gRVtRGpWwqGfVi
 R0e3g8v3CLRDrspeZouBWJiosA3r594Jo/GpYw1ILjwZiLTX407t0PrvRuATKjBqCRxc
 X7Iv2q4ywbBs2j+4wgyaAO64g4jBCDPCCgTDxJxZSqeA5zT2pP+mHE/ePpCjpMWfUQ6v
 FeqebIb3R8d3v2AkDF9IhZIKxvLp5nJEtWPDlz5FCv5821495D3JyLNFFoAWecT30t4E
 YVlDox1KSbcFALN7U2wk9HpARJKDBHAPlEsGHpDhBU2snr7Yg8TVTivL3XB+fBnG0SLN
 VzCA==
X-Gm-Message-State: AFqh2kqF+Nr+6vcVvsAXe+rS+/dKuJzB5CebHvwLHURJEofGCXG5c+Bd
 l11rCNCQQpDPV+tuY3rDxhdYJ/pkIudHkmgy
X-Google-Smtp-Source: AMrXdXuC+HFQZNs5nB14XFUHYO9Ws/+gMkSEZ3+3icyb2BzmM8DD2Oqgg/qJIUfbUNMblpvVyWVpUA==
X-Received: by 2002:adf:c751:0:b0:273:e357:1ca with SMTP id
 b17-20020adfc751000000b00273e35701camr12402937wrh.67.1672231936266; 
 Wed, 28 Dec 2022 04:52:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h18-20020adff192000000b002422b462975sm15307572wro.34.2022.12.28.04.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:52:15 -0800 (PST)
Message-ID: <ab06857d-e58c-b277-87a5-59516a01cf18@linaro.org>
Date: Wed, 28 Dec 2022 13:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1a/4] accel/tcg: Fix tb_invalidate_phys_page_unwind
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221224151821.464455-2-richard.henderson@linaro.org>
 <20221228124918.80011-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228124918.80011-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 28/12/22 13:49, Philippe Mathieu-Daudé wrote:
> When called from syscall(), we are not within a TB and pc == 0.
> We can skip the check for invalidating the current TB.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [PMD: Split patch in 2]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/tb-maint.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


