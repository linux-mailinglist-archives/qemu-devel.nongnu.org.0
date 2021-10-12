Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9459A42AFA9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:33:00 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQKR-0002ed-HF
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQI8-0001FI-1z
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:30:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQI6-0003BZ-8C
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:30:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id r7so1741332wrc.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 15:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rU4qUHS8GtM8b88urnIn3ZrkVRNajs0GNHyy6DvdgtE=;
 b=OyMwfteyL1sdxtmgd9BtkMbStut9WKSEYWZEpHoeFAkmEtnWwDRYGLaQuAj9ZzjHoP
 sQgFezXrtUO4M5EZ9xK8fm3LNQPZ0mknkyR4TXVWI/wWjHT58i7n4LAuxRkOZZIMfb9s
 D/ANBURDZLx0Wu6mkXU0ezjz1HtCGauWc0c3VNbWHRE9h6MWO9wCWKUESl21GwEw3noD
 kvB0fQKobgFR9b+CHyFulEL+f/7fYlND/LX6KtvemblAni3knXOb+5GkKFdoWWezQDPV
 5g3YMMQ2t9O6qXf0BYXLPEoVTZLIgDGXQI52m2a9VQQ16qstI0e6zE7zQljxTdHQlg3H
 1RCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rU4qUHS8GtM8b88urnIn3ZrkVRNajs0GNHyy6DvdgtE=;
 b=c16r282WfswjIn9zvDR7nMgSawbRHOKodFfNV/w5+mVep8AovzQBP59vkcf1Ji3F7K
 +MtS7eqbjis7yO69xKSweA1PSgtOwI1cepoiSXC5/sin1S/pCTsEezmeS0fCfXD1oNwe
 BljPK8SdpcyJmR6ous5nTrtu7AicFl6dN+3ZNBfWGS+OfokK90X1p9OyatjAR8vUW+Y+
 qQM42pZ9kxHT4L1un/SsaBWaCavubkSf7afnxLBvXW1gHIzPVmmRtpF5JPE+KV2awI5n
 vo2ZH3bCwOkDq4lxcocRtvY4oB07XWBiEv2J4Za2pk0844yEaVNUimnIDXlzrYmpsE0u
 kdaw==
X-Gm-Message-State: AOAM532WuXMf/3eV+YQvqC+XKRJvd48XXovW/alebZpQy1hyr+IX4bPU
 YeAkFyfb9jHwvIjeI1r6Aog=
X-Google-Smtp-Source: ABdhPJxIYhoxRUM1ma7+nMOyKKnursd1Uxi/7skTTtVPt4R2Baf3IgSB4HG1bF/rl/fTMrWH+71LtQ==
X-Received: by 2002:a7b:c199:: with SMTP id y25mr5782644wmi.55.1634077831547; 
 Tue, 12 Oct 2021 15:30:31 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id o11sm4793960wry.0.2021.10.12.15.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 15:30:31 -0700 (PDT)
Message-ID: <2297a0ce-852a-312e-c3c7-7ffaaf06eee6@amsat.org>
Date: Wed, 13 Oct 2021 00:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 05/23] target/hexagon: Drop checks for
 singlestep_enabled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211012162159.471406-1-richard.henderson@linaro.org>
 <20211012162159.471406-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211012162159.471406-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/12/21 18:21, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/translate.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

