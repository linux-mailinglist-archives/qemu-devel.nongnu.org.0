Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2878567BA8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 03:50:27 +0200 (CEST)
Received: from localhost ([::1]:50094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8uBO-0003xZ-C0
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 21:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8u9a-0003DO-9s
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 21:48:34 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8u9N-0008OC-A4
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 21:48:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so4347347pjr.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 18:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=TAh7GNSYSg0P/TQVwbDd5//tDWgQkiE0iuUrFG1bit4=;
 b=eD5JO7xDF+g3qTmYY66rs9QBTNpZlF5TGskCPO6wqxHEftpoNJRmcqjMJ2l8mdtwkA
 pCrVI6tB1nji+2jLrDUt7t25VdqhvXipbX1FI/rQtujeK/qQTVAjAc3k4StF38josYn/
 2NK4+QdrOkGUt1f5dPv+NVToCImhtrZUP9GOQaOzw5zv8+Q+v8kLP2FPJ46xf5dzSrZ5
 u+llvj2vHXvAL73kQM2jDz9kjlVOGlrH9JHTnFoDTsNDa3u8H1DaXDfgfUDXWAFWc9bi
 5EBjXca8UWsIRMfdDbiDFRYypsx5hOlfUqRwtsbGG/veM3nL5jAltZp1BYYR127VHLiK
 RQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TAh7GNSYSg0P/TQVwbDd5//tDWgQkiE0iuUrFG1bit4=;
 b=TAcYevN59rrrZP/X/CMqP9z4pMeVs2IdLJJa0tguMqZOLWUYaXebcCavahf2ij/Vx1
 2xkFeFuc3KkO6KU00tG7mHGxrAx9D4255Y4VJEOw0qH74+rSt6o26e78OM/G/auc2kwW
 WGzlhTNG1Uj749YieCyQv9MJosj/zNmT52nk/rgbEsEIT+K1XPgfaulKYLWv15pswaRx
 Nr0XXbwf3zFSkOyJsXiDTJwW5r7K6k7Ez568fp+2SPG5Wc1Ln0JrgWVCNDUtgq23jMJt
 Po3VkXDIclLiIIwFumQeHDqPTc7jfy4tBQeDqFaySggXTIHXESoc489kMIYy7Ud5Q8fl
 fNxw==
X-Gm-Message-State: AJIora8BQFEymNMlbbC7oYRdHiUhuYKkwno/62yvHRur03+lqaY07HQu
 TtNrRH8zPwRsjuku4SBKjXwyXg==
X-Google-Smtp-Source: AGRyM1t3dgRlMjTqT4+MjqRhuxpEp2NVtJIt7OaavWjmyFhAPiG6uxo8ZmTFbo9JJ+3iHFHowYM2Yw==
X-Received: by 2002:a17:902:e849:b0:16b:f38c:d90b with SMTP id
 t9-20020a170902e84900b0016bf38cd90bmr5462672plg.154.1657072099495; 
 Tue, 05 Jul 2022 18:48:19 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a056a00234f00b0052542cbff9dsm24621128pfj.99.2022.07.05.18.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 18:48:19 -0700 (PDT)
Message-ID: <41a74ed5-6d67-89db-a5c2-d317f2f5ee0f@linaro.org>
Date: Wed, 6 Jul 2022 07:18:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/2] xen queue
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20220705134536.11109-1-anthony.perard@citrix.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220705134536.11109-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/22 19:15, Anthony PERARD via wrote:
> The following changes since commit 19361471b59441cd6f2aa22d4fbee7a6e9e76586:
> 
>    Merge tag 'pull-la-20220705' of https://gitlab.com/rth7680/qemu into staging (2022-07-05 16:30:52 +0530)
> 
> are available in the Git repository at:
> 
>    https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20220705
> 
> for you to fetch changes up to c0e86b7624cb9d6db03e0d48cf82659e5b89a6a6:
> 
>    xen/pass-through: don't create needless register group (2022-07-05 14:19:48 +0100)
> 
> ----------------------------------------------------------------
> Xen patches
> 
> - Xen PCI passthrough fixes

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Chuck Zmudzinski (2):
>        xen/pass-through: merge emulated bits correctly
>        xen/pass-through: don't create needless register group
> 
>   hw/xen/xen_pt_config_init.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 


