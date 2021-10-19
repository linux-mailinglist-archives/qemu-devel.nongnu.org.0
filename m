Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DA2432C6D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 05:46:59 +0200 (CEST)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcg5a-00010w-P2
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 23:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcg3X-0008V0-F2
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 23:44:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcg3W-0006bS-3H
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 23:44:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id v17so45005138wrv.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IEynyfIlEo4CxOgBjtxg4zFP0237Jyah7NEbiypTlVo=;
 b=OC6CF4v+9K6FDszL+tluBAzotV0iiC1k1fwnvUQbkjnFiZs+wrM3UGFDtwfKiGlZeY
 LwVrn0vEXrkOlT4Wkt0YUP1Cuo8i1amwTvXJnwfPHUZ4qwQZDZncoPI+d9U54w1H8kXD
 CatI4IFKZaItmOg7rvCX04IFIkiL42TNGZ7VS4utJwfIKAbiPy5T7zuBC5PtCOAQv7iT
 QKQJHelCfv6pS2PUXm5ifVZF75pJ/DN3a07T0lI/hlOnKpBoFso3Tu0LrvitoxDP9nrx
 fEMcD4NLzSpn2TvTv5oUo1ceOhDVufOqhiIi+W0ewVyVJh0b4AKc6mLaq9QVMne/1xSu
 aWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IEynyfIlEo4CxOgBjtxg4zFP0237Jyah7NEbiypTlVo=;
 b=vVQ1jkB/ZOsR/A9nVav6efU7PW4rmXBQKNBfwFp7YIRZCANKh/Y3OuiJNqxzSI7r7X
 c6gx4jFXkWd1lBK9Y4K7BuqS4mKE2kK/xQMa2D6eC7GUMy7OE0v+LMpemVQbthZxg5j9
 Yi/yVbJ+xe1UcrUrKnScREr4S8ReAQx3tDF6FVuPR3blZ5G1ufS7n3J1mBUZpSGmPVIc
 IYj0evHC0JacAyuaoz8LBafEo/n3ul80KbZxyiRSW/MtkfCXQJK+75dmm5Oc91B1pFBH
 +adF2LufWtSM8ObY9TGIwaS7+q63gipOA6aiFJvTHu7ezWv1cr0DvxpWctcVHRW0yvu2
 BglQ==
X-Gm-Message-State: AOAM533pj77K83odYbPXOXQNQmB34D0wRWbEI2qhNh2Ux6LnUnQsxmrQ
 b461Nf1B8q2285EHM/rLVSChk8o8DjM=
X-Google-Smtp-Source: ABdhPJxtXYVLr9OjI61o/qQ0at2RxBRBzM87BWC+S+yANEVIQb2w1AIayyb1FZB2WliDg/yc5797mQ==
X-Received: by 2002:adf:e382:: with SMTP id e2mr30749003wrm.90.1634615087818; 
 Mon, 18 Oct 2021 20:44:47 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id d9sm13991158wrm.96.2021.10.18.20.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 20:44:47 -0700 (PDT)
Message-ID: <d913abd9-b72c-3d5c-112c-b4140fc61327@amsat.org>
Date: Tue, 19 Oct 2021 05:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] Hexagon (target/hexagon) more tcg_constant_*
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634031081-25450-1-git-send-email-tsimpson@quicinc.com>
 <1634031081-25450-2-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1634031081-25450-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 11:31, Taylor Simpson wrote:
> Change additional tcg_const_tl to tcg_constant_tl
> 
> Note that gen_pred_cancal had slot_mask initialized with tcg_const_tl.
> However, it is not constant throughout, so we initialize it with
> tcg_temp_new and replace the first use with the constant value.
> 
> Inspired-by: Richard Henderson <richard.henderson@linaro.org>
> Inspired-by: Philippe Mathieu-Daud<C3><A9> <f4bug@amsat.org>

UTF-8 copy/paste mojibake, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/gen_tcg.h        |  9 +++------
>  target/hexagon/macros.h         |  7 +++----
>  target/hexagon/translate.c      |  3 +--
>  target/hexagon/gen_tcg_funcs.py | 11 ++---------
>  4 files changed, 9 insertions(+), 21 deletions(-)

