Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD97530654
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:47:56 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstQZ-0001Sj-Og
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstP8-0000mL-CC
 for qemu-devel@nongnu.org; Sun, 22 May 2022 17:46:26 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstP6-0000D6-NN
 for qemu-devel@nongnu.org; Sun, 22 May 2022 17:46:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id p8so12074618pfh.8
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 14:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BNLrlNxr9OHvDNQGQW6ukxQvKvgUc5rGW46H8kPfxdg=;
 b=LBDB2g5xnlNzgSol1X84i7BaCCejO3MXHzI9g2Kf2E+/Q/poulHRgk6Rx05M/juYc+
 8B2opFM5dQGLZNd6/SNgjekn3BpAUrkE5Z6LdPqx7/TG+k1esKN9npyAZP1yQSIdsFVr
 BUvNRGdASLSNjJxa0JvLV/75AB34g2vA4IOu9Yw8VJyegQVXqMcZhYeuTUE7+nhSD5fl
 mYmVLTjrKpH6fcDPmJYPWZ8s5RRB4vvg5B3fAxIvT/upODRLu2932P5oZmX1fjY6YD7J
 AaGf2g6NTPWRJK1nHaIqCQ3zZ/EfA4zgTtAGsVGnxXdeVzFkVD+tPTpJZd4PNalX3I4y
 oadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BNLrlNxr9OHvDNQGQW6ukxQvKvgUc5rGW46H8kPfxdg=;
 b=V89vfx5LPkmyllV7xcd/coNxUUr/0esR1YJtQMWTgTDxHcxfW3ujIwtkXR607foPjA
 16eFw6d7EcBiLivncxyxKGAI6Gb/TX4KbMsPfIzjmXLlGSsYNykm2hTaBD53t2Wd3gRu
 IORuv7YY5aYOT+f87OGLKUVnSFQGmpO5OsvxVbeLxEPBCyJ2NrPhjTVU0UOAvvmP1E9x
 3KcI6xEwF4/qzB2BzVTIMK0MCS4tZ1nbjbZs5Voxzi8kLtH162u1MLuoDlCmPpQ9+Ojt
 ex+OSmwZzLDKwdWWyF2tVeTkFARFfZmLhsev/MTq9mbhxmtdwnqgwbkiFu+Ru/fn1PDl
 cI2A==
X-Gm-Message-State: AOAM531u7rrEpG+5b22GIhs4x3yPl+W4embjLBYsx50SB6lnN52FQhdX
 gd12nJ8KRG4BpNvW653DbY8=
X-Google-Smtp-Source: ABdhPJwbmuIth9yrqUIyrB4MUY/3kN7Df0wWqFNoDYQvaWG46gJu/pBL1S9Atikjh31AjuLGesJbRw==
X-Received: by 2002:a05:6a00:994:b0:518:6f30:502d with SMTP id
 u20-20020a056a00099400b005186f30502dmr13817916pfg.68.1653255983085; 
 Sun, 22 May 2022 14:46:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a1709029a8c00b001615f64aaabsm3529577plp.244.2022.05.22.14.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 14:46:22 -0700 (PDT)
Message-ID: <4df9b272-6b9d-0817-b53d-c38d85a9467c@amsat.org>
Date: Sun, 22 May 2022 23:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] linux-user: Clean up arg_start/arg_end confusion
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, laurent@vivier.eu
References: <20220427025129.160184-1-richard.henderson@linaro.org>
In-Reply-To: <20220427025129.160184-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 27/4/22 04:51, Richard Henderson wrote:
> We had two sets of variables: arg_start/arg_end, and
> arg_strings/env_strings.  In linuxload.c, we set the
> first pair to the bounds of the argv strings, but in
> elfload.c, we set the first pair to the bounds of the
> argv pointers and the second pair to the bounds of
> the argv strings.
> 
> Remove arg_start/arg_end, replacing them with the standard
> argc/argv/envc/envp values.  Retain arg_strings/env_strings
> with the meaning we were using in elfload.c.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/714
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/qemu.h             | 12 ++++++++----
>   linux-user/elfload.c          | 10 ++++++----
>   linux-user/linuxload.c        | 12 ++++++++++--
>   linux-user/main.c             |  4 ++--
>   semihosting/arm-compat-semi.c |  4 ++--
>   5 files changed, 28 insertions(+), 14 deletions(-)

Nice simplification.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

