Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AAF681FCE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:44:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdoU-00028e-9U; Mon, 30 Jan 2023 18:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdoS-0001yT-6h
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:43:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdoQ-0002dz-J7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:43:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso9405682wmq.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZC3hsEfZJNjNahXw2mfBCFIJs0m7NpJSn9jD94+nuro=;
 b=nOJhtmUk1+UgFQmOvVgPv93NFSmWHekg+FnL0tdEE2KgdjDDLrpNQE2234r66T6H06
 8IbK1XkW0eJiRCSoLHdgZx87mM8eUpORs3xPmA9rPtGc8bprLSMm2QNpeopxqIKtvnvP
 akOG+ygBtnsHwMuypNXf++UdO9c8JzS17GNt/e/Pub6YO2BxXPH5kaROxpYDrBszuVqN
 BFOmSjKMuZEMRjefWjERQev2VphXZ942EJlXrCInMNpefUSmmb0LvcuofUkJRbcScCGP
 ubyqdTVze8l3r12SVRFmtyfhiz6Be+3INUZ5Ztn+GRMY5KTTBBowKmqwd9GutMIedtqP
 woEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZC3hsEfZJNjNahXw2mfBCFIJs0m7NpJSn9jD94+nuro=;
 b=D2e2VtnwSTfnAlX2PmIQQjK8JccCuvrURX0SbRYb9g2SsGtfQ0y9A5O2ZM/lkqsnuu
 ppwaAPLTfIyvBibjjPKBVoYdPGtszoleeDPeac5jbZwyR3lrJ5uz7or/2NUd58MA5aBn
 fMTdEmlv88MCwPNZkidhMcrLs9fXYVzYuTjzm4kzO3t/W005UzfxRFxON9+QMU5fB6tL
 UTVKBTnVxEGVdAcgUdCsSnuVZf9GGg7mn5Yp09l+YU/iAtFdpkWeavzehx/9SC52U3GW
 FtKffFr+pjn57g1UwNOgeaRIvHNXiqpYJqwLDZL8CvHvq3SD1nkN115iejoqr8DiYFBo
 Zpdg==
X-Gm-Message-State: AFqh2krBiEj8QSU1W2r4qH/apehpRBow98ktmKAMFXf/RvyOeKKSpPxN
 VKAP5nNGQZb5+/OberdgUuL7HQ==
X-Google-Smtp-Source: AMrXdXtKxdh/h+iuajpXWQNXSg6J58M+mEzPIQXE5CWTdESD530f139/hXJy7FKYz19j/MyNvf1edQ==
X-Received: by 2002:a05:600c:5d1:b0:3d0:761b:f86 with SMTP id
 p17-20020a05600c05d100b003d0761b0f86mr51988112wmd.28.1675122225079; 
 Mon, 30 Jan 2023 15:43:45 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003dc541c4b13sm5839108wmf.21.2023.01.30.15.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:43:44 -0800 (PST)
Message-ID: <9924f161-9fc1-ed4a-49f4-fb7922ba3ae6@linaro.org>
Date: Tue, 31 Jan 2023 00:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 19/27] target/hexagon: Don't use tcg_temp_local_new_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Since tcg_temp_new_* is now identical, use those.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/idef-parser/README.rst       |  4 ++--
>   target/hexagon/gen_tcg.h                    |  4 ++--
>   target/hexagon/genptr.c                     | 16 ++++++++--------
>   target/hexagon/idef-parser/parser-helpers.c |  4 ++--
>   target/hexagon/translate.c                  |  2 +-
>   target/hexagon/README                       |  8 ++++----
>   target/hexagon/gen_tcg_funcs.py             | 18 +++++++-----------
>   7 files changed, 26 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


