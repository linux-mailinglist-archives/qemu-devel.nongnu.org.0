Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D28510AB4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:45:10 +0200 (CEST)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njS3Z-0001NU-H8
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njS1f-0000gS-9u
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:43:11 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:32854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njS1d-0003ov-P8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:43:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so2680157pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 13:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s8ffOVDXNHtTiMimOKw9LHbR4IHWZZA3ytoqQ5+7aXA=;
 b=Z9PVeDv6ipTCbSn6PwcQy6CgzD4ZLL5TbQ5A97F5H3ftK18qOpT9OdGiyf/xCmO4cx
 hT3X4zLmHzIfjwGI91q5Y2r6aOtQfrufyWuof8ohD1dK1XNToh/iY2xqUacYB5RNjWKR
 fioMv/zjsHwUq9+sh1dP23N5Evy3SnMcow5CK08S9hERsga7UphUkOtj+EBHQynoYtw3
 hajWRE2FdOCP6ChcZ43rnLvE1MYZkh3N6wsQ/k0PJW3xQUyPd+1cpKy8AtmnXwIxoMQM
 2zwPMWCKL1iACC95tiaIG7io9sqQT3aoSwPusGIYAH28sv7e2IfqTUnNqZJ4OznTY2Fl
 foew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s8ffOVDXNHtTiMimOKw9LHbR4IHWZZA3ytoqQ5+7aXA=;
 b=FKi5RV4azeKFrDs49jlFi/ySB+XFp8zHiVHrdIyn9P9dtkJfsHBqlV1sT46QId1Vjr
 e/UQezlbQyf5xUsQ4LPDf6Ghxd47xFn3umrrv0Id/It4IJM3NSuhouxbATQLFyfSEF78
 74sXvnIREuvMk+4XjfXyDUI3x6wVbHRlhM+VI5mTuLNZRodbxCJtl+NDlLgVFl6UGSPm
 7Uq/n5+JPguQGeb/RcqxlBloUIxQwgfjOJpRYdu0yHJIULv4vbau7XwChKqUcYsTjsOt
 BKxqKVbTLlfXaREWHs4T1i10GU2cY8x8LJ1QJMyS6EVzMdVE+A+4RBGHtnWKb3GIulgL
 QVCA==
X-Gm-Message-State: AOAM532rIbakAvH3FB6LZR16G1+qnT8sOoXc7yKB3J+V6+ZOaV5v3rvp
 Sv1ma6e0p3qgXjKx/sJxkX45uA==
X-Google-Smtp-Source: ABdhPJw2+0VZE4zS8VHcR0n3p9no7VGCzrSEMheofK42arJzTVbAyVVpPu6tqTAqxgk0uQ1rRblvzA==
X-Received: by 2002:a17:902:cf05:b0:156:9d:ca01 with SMTP id
 i5-20020a170902cf0500b00156009dca01mr24706645plg.111.1651005788130; 
 Tue, 26 Apr 2022 13:43:08 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a056a00194300b004f6da3a1a3bsm18026076pfk.8.2022.04.26.13.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:43:07 -0700 (PDT)
Message-ID: <161cf025-a591-dc16-2f17-a09d0aec766d@linaro.org>
Date: Tue, 26 Apr 2022 13:43:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 01/26] Use QEMU_SANITIZE_THREAD
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-2-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   include/qemu/atomic.h                        | 8 +++++---
>   subprojects/libvhost-user/include/compiler.h | 1 +
>   2 files changed, 6 insertions(+), 3 deletions(-)
>   create mode 120000 subprojects/libvhost-user/include/compiler.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +++ b/subprojects/libvhost-user/include/compiler.h
> @@ -0,0 +1 @@
> +../../../include/qemu/compiler.h
> \ No newline at end of file

Fix the missing newline.


r~

