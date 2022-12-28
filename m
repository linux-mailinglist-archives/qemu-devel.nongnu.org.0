Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5916576B1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:54:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVvA-0003UH-Sb; Wed, 28 Dec 2022 07:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVv6-0003Rq-EF
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:52:32 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVv4-0004Wb-Tf
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:52:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id co23so14878186wrb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gvupkxapq5gI0QMlcyegZ2s8IEjzH5BXi0qtcdzyuzw=;
 b=qyPaacnGQK2QgujhBjUX2mmaJXWptVDolvR1Waoc2tR9NnE0RpXulsBgTwtJHjcGR6
 /qZvkmdiAOZPBAmUkbNEl9lJRzdcPf/s/XeWDs0nE9VnDWbsCltHxe5OixysP7f5CsjW
 xhXSLRFVr3MuxFwj2wX3HZTF3JqDTxjyvn82nTvCoAYJ6bLNRJVVXmxZJm9P/2TdNGwh
 h9CET5szPhkSQmaH+BeyqzS5MaEh00QfwnhKX/8fLOlvyHTIf9okteJLmjpHCLHUIlgy
 7wxVOJBeNJ90AUhsxSIHGcsxcuof3fSchLlHEnYMSGZAXM37LRKL2sZk4boNsvKYrqEI
 VAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gvupkxapq5gI0QMlcyegZ2s8IEjzH5BXi0qtcdzyuzw=;
 b=i6ifbjLmX7TXGgR0gmBFSrNIlGj4kpTm9BhjtWEchgU+7YmAvyOYqTGtqA5mYy0Dbw
 y1Mb7azIxNXVkkolQ5vs3pbCRyGmxjFXuqjWt0Fpnj1j848J1EukQwCjhHMfCkwScKHY
 eH9jMN9wQasEn/Hjf8qego8a0EmzCUGz2w5oH5ihccO4da7oYCZqxnx2C6n8bHyObQa2
 BQe/U+XTjzF8612iY/8lWMYmRWDzQ2StnIkirEOxQoJxUC6BV5Yk5J9jh5sbErBTKcFt
 ZpCOM6LvL7HvJkPxoj8JEK+yWpDcbePo29dCMtRNFYZTCaoA0uVDc6/9qT7mrWkNnAID
 UQyg==
X-Gm-Message-State: AFqh2kruQPhZP5IarAC/cT2x2O+k9wyFsmZzaUyBDtYHQ6dDrRs0vpbx
 6ws8c08XIMqvL24c5GN1xKPIZOSBksXqKdbN
X-Google-Smtp-Source: AMrXdXtz1Otf7cTfXxUMXDymwB1sdtsKmu24cLQJVzE1tZNK0Eea5+DrjgaGQytu8Hc3spbI+P95fg==
X-Received: by 2002:a05:6000:910:b0:242:733b:af28 with SMTP id
 bz16-20020a056000091000b00242733baf28mr21777618wrb.5.1672231948917; 
 Wed, 28 Dec 2022 04:52:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o6-20020adfa106000000b002423620d356sm15721665wro.35.2022.12.28.04.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:52:28 -0800 (PST)
Message-ID: <03ddc1ca-c0ff-6c36-827c-01a51f37fa32@linaro.org>
Date: Wed, 28 Dec 2022 13:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1b/4] accel/tcg: Unindent tb_invalidate_phys_page_unwind
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221224151821.464455-2-richard.henderson@linaro.org>
 <20221228124918.80011-1-philmd@linaro.org>
 <20221228124918.80011-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228124918.80011-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [PMD: Split patch in 2]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/tb-maint.c | 53 ++++++++++++++++++++++----------------------
>   1 file changed, 27 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


