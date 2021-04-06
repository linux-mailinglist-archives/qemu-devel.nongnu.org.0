Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B13355DA0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 23:06:11 +0200 (CEST)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTstm-0007z1-Pp
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTslJ-00026L-5y
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:57:25 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTslH-0006HE-IX
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:57:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v8so8187282plz.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 13:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7A+6MGtwllz1B2OyBZ3sbkZUCM82LUDpglCE1tIu/eg=;
 b=zvlx19gYknqaQH1WczneM5AELxtP9VkmwFrVF6CqG5PXVeuotRpA1s8OKYDg6naIoY
 fjpXzIjem0GoUOR+apDsPOjzvRJ8S5VjUbApMTEkvlW/8VQFDLK7HrUyPYQxTrVXQJ0q
 YmlxiiKxy7Ph2V+SvvfAuLdplfMX1VqxGMp2f/+CIXS1Cyf3cTb9AJPPQv1v5EmKCxUC
 eZnC41FoDo3ZZOA8VoSUkEkbncQzzdfeQEvQt/qNNBfsGKuZBRG2l2epWb9aURQ4mnsm
 ndifkgsNZDe7aNtaudQ5wi675o3ohkhltFKnNa9TCeN8pMTTs3Rkxlmi/hoxRG7/SLhH
 3g3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7A+6MGtwllz1B2OyBZ3sbkZUCM82LUDpglCE1tIu/eg=;
 b=BkPK8PdL2ab25d4INzcTjtejEPKiuWvEM7j+FUdsWAQE0JD3YhTilR+0Va/1hMz2e1
 2w4REODKxIYtn4c88Vj+CKKWKEdEJ9ZtkQSLLqxhFwhOeMo1LwxRaLHtl5KQQn0iFCAb
 PQqvkXyhnlCjWKHqM1hPuiijfDwkmnpImhGuG+mXtMKKkwc2yOzWRwoXuOxJ1qHRUY9d
 2mYjrcm3ubgcVSZgesnpQ9KLPMcGiGgzejHoC0YucyQ/NnXsO9LHZnSOrQy59IgeC9e7
 u4p/kSJewTyF9+U08f3FU6DGoqjtPgq9HWVr1k1JDjJPnEWAj7EEd3KJmd8hc3PHT6n0
 MIBw==
X-Gm-Message-State: AOAM5301eScQVexhlPSRagt5ShSCNlbSmAD34CJb7wMZwPEcbqRu4kh6
 edksUn/uUhE4s5C9kpjtkToJIw==
X-Google-Smtp-Source: ABdhPJwoBYbKzO6N+xgzRqmgOPF+UuxTW6Qn1rqhYnf9ch/fDTHDHF+1H0lZ64+/I1W7mBiSAgey8w==
X-Received: by 2002:a17:902:e84e:b029:e6:cbe6:34b5 with SMTP id
 t14-20020a170902e84eb02900e6cbe634b5mr10224plg.42.1617742642115; 
 Tue, 06 Apr 2021 13:57:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id s15sm19852037pgs.28.2021.04.06.13.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 13:57:21 -0700 (PDT)
Subject: Re: [PATCH v2 15/21] Hexagon (target/hexagon) add A6_vminub_RdP
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-16-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8758a184-32ba-af5a-216e-a4b8b0f24ca4@linaro.org>
Date: Tue, 6 Apr 2021 13:57:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-16-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> Rdd32,Pe4 = vminub(Rtt32, Rss32)
>      Vector min of bytes
> 
> Test cases in tests/tcg/hexagon/multi_result.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h              | 27 +++++++++++++++++++++++++++
>   target/hexagon/genptr.c               | 22 ++++++++++++++++++++++
>   target/hexagon/imported/alu.idef      | 10 ++++++++++
>   target/hexagon/imported/encode_pp.def |  1 +
>   tests/tcg/hexagon/multi_result.c      | 34 ++++++++++++++++++++++++++++++++++
>   5 files changed, 94 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

