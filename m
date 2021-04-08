Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475CE358D71
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:24:25 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaGO-0002pp-0U
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaFP-0002Gx-6I
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:23:23 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaFM-0004vl-Hl
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:23:22 -0400
Received: by mail-pg1-x529.google.com with SMTP id k8so2105753pgf.4
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Uv0jAg1tex/p6P52G9UO0FeW+GxnDqjF3l5/qEkB0Es=;
 b=FIXQqvf1o//ifYDPraIsKt7n6mzusdJKsUdFEOxUnUsRhGcNH5D52KBHv6FOEi9+bJ
 1DYzACZCC635D6yQ/MdICiKu+lzKvY52FZpWneifW8xqPHRrroU92T3wMD1wWatJ0aPF
 /GP/Xm2hHApiPgVfWK6S7TOdGrpF7UWIPUE7eYOJgV3l1tWewregSqdBQALaxDWtYV85
 Rphq7fQ6B8vgSUSTTZTsPGMrbnUwlcaJjup+hTra00/32HraES4nsMsXyJaDmYWDfFJT
 /49TWxDiwjLmUAoO0t8f+vbnVjAsFfjwEARq1Lub95DXXAid9Bf1rgGAiZRKFNL0gxb6
 PUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uv0jAg1tex/p6P52G9UO0FeW+GxnDqjF3l5/qEkB0Es=;
 b=qxKXTdtACl7gZPxgVJVwuoMLthz+K1r8/fbQi6+ZiUevaZiaRXZfiN/0p7s0GYHVL0
 8xCDrAboOB1V7UABcv24867E4lru5M/rq3v3kkkLWrcj1mkWiiF96hx8IIUvWwwDYf49
 Wz9n585jrfO6raiOURXfu0gAmn0wuu8pbPJAte2QA86FemW1bpOXdayjjevRTxh1ZhRK
 R+0HqgsPjedja2CV184UWcmHkiTr2iiey9hKGo8XiX41s8C3cC9IOb9kLw/cRLvRb9MK
 Q6x0CfE4MD4dV7nydGNlH5t02ah1KFXvCjpD7E+f4I7LxV4lQZv7tN6m+ve7mpd+WlUq
 qlrA==
X-Gm-Message-State: AOAM532AstY2p11Xdq9GlafK7lcrsrqgkvn+f/BQegLc2q0nLS73Y7Um
 5HrQTth5zPE5UM1lv9kDC9aWAg==
X-Google-Smtp-Source: ABdhPJyJCqlo7QS8EWqU7ETCO9XJWRMO0vpVpQ6/f2SxHs535j7AhroU3nHBItNOVTS5YCrzwewFAA==
X-Received: by 2002:a65:4582:: with SMTP id o2mr9618769pgq.93.1617909798971;
 Thu, 08 Apr 2021 12:23:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id gz12sm175828pjb.33.2021.04.08.12.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:23:18 -0700 (PDT)
Subject: Re: [PATCH v3 16/26] Hexagon (target/hexagon) compile all debug code
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
 <1617847067-9867-17-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f73f85c-a916-4a82-8e74-110679bd8c37@linaro.org>
Date: Thu, 8 Apr 2021 12:23:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617847067-9867-17-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 4/7/21 6:57 PM, Taylor Simpson wrote:
> Change #if HEX_DEBUG to if (HEX_DEBUG) so that the debug code doesn't
> bit rot.
> 
> Suggested-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c    | 72 ++++++++++++++++++++++----------------------
>   target/hexagon/helper.h    |  2 --
>   target/hexagon/internal.h  | 11 +++----
>   target/hexagon/op_helper.c | 14 +++------
>   target/hexagon/translate.c | 74 ++++++++++++++++++++++------------------------
>   target/hexagon/translate.h |  2 --
>   6 files changed, 81 insertions(+), 94 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

