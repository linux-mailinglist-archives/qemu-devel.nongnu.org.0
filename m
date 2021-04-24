Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8736A267
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:35:57 +0200 (CEST)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMCC-0001Io-7q
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMAk-0000rT-G9
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:34:26 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMAi-0000ql-Qt
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:34:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id z16so37328410pga.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2rRPMWzKt0l0S4FD3Hw7b8+O4f6KKfxEWhx8F6E+aAo=;
 b=X/j7XUU+iWHoR5uFAM6rU3hcy0XTleHFbrMIhHm4rUC9mp5f7NH+lWdSlC8zVYtHeq
 Idoz1wypfxvreNpEy6U1PJc8sgo2IXY09eAirs7vaq+kENulh8sYnM2APqaSgZTMuve1
 a7bKR7EZ5FxASmn2OImYHi9oDjUxUGO50q/6uxQvCFkL0KH77ZCzSJF/QtWvqFaSHlZU
 f8Ez+5yHJGIeKe4Rtqv1xl0iKn3EI1FTwavkzofZH7nJReXG/PHbUqOxdqhFTombZBv3
 5tXcQWa7LYDj5op/9Fp+9SadeWY5k6B53Xtp7t+zl1mc4f3oar0BP7DcfQTZSAf64hvE
 MzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2rRPMWzKt0l0S4FD3Hw7b8+O4f6KKfxEWhx8F6E+aAo=;
 b=dTv/uzKcc91fV4brBkD35oLC3dZYBt4jU7K0STM2bAImwT6koUOqtJwktoHLTeWFDb
 gzXwo6xTeoFh5oIWrOoMODMvnEpF+UqaTABzdo4y1/BOVgns86L29/lMmLWUfZ+peVwL
 x249o/DEZgNxE2R6zusrDL5UXcLqdtciQ3EHtm/54Ou1yr4Mjq2T0l1Xk7pW+GU/IN5L
 RHRjTCx3kG8EnuT62fiFxpOZzVXGvw+m2ZamV7nSO8FRuE8ei44ScBWIomkO49nEF+zi
 u6UUErSz0J1bocwEbm8B2BaALveWH3IKI5ZrhWGfFaBEus/TXNdk7IJP1qYKE/FcFpbi
 Ue2g==
X-Gm-Message-State: AOAM532TjpiQ9iG40sfLMaNj8lgcn/w45tuHvBrPX9WDJfilIH69y1ZD
 vImXtoX0w2WGEA6DbPkmVTzUDw==
X-Google-Smtp-Source: ABdhPJy1PUGCiGbZ7lbCFf9zlVnpTRz4kXkQgzM4pFRJbsZrSjMFFbUQg6ZfV9rfpniSc2z7u+2lxQ==
X-Received: by 2002:a63:942:: with SMTP id 63mr9450116pgj.67.1619285663262;
 Sat, 24 Apr 2021 10:34:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id l132sm7752397pga.39.2021.04.24.10.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:34:22 -0700 (PDT)
Subject: Re: [PATCH v2 22/48] bsd-user: use qemu_strtoul in preference to
 strtol
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-23-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7effb86-3f98-ed28-a4a9-0ac3a7c4369f@linaro.org>
Date: Sat, 24 Apr 2021 10:34:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-23-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


