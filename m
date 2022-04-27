Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84389510F28
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 05:06:19 +0200 (CEST)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njY0Q-0005gG-Ll
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 23:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXwb-0002qD-T7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:02:21 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXwa-0002K0-BI
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:02:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso3857081pjb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 20:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=y++/z04OzDrUzPXpGPxZrjCoAu4m4VnjkbaCWTZp2L0=;
 b=z6Tic3y2A0/b5AM18Af4HUWn2jqad4gzVtdEN39K1uPRgfZ+NIYtZgidNQiGeXhZrv
 o+7jywYLLhjD+PYZTzBcJeJTEKoy6xth0lp6HKlWD8Mba+GQSqZ4h1PmB0FX+EMESAke
 FKlyFgCDmhme6ipu7mkY6WcjB+yGDMyXMxkt98BrxYweT+QKxl8qRu9pRm/dR47u/P1R
 1qCn4aT+0g2JU4vxlleDGKmuWt9iJcj2rvwZsvRPm5gbMqTkaRnf3J9SLBtJxdyHyfju
 1bIO/Hi9s3n8Z4HdnqWxSdgOkz3pYyooKP266cTSL4DGLCmnM5A08BYFoG6IHzJciJac
 Gd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=y++/z04OzDrUzPXpGPxZrjCoAu4m4VnjkbaCWTZp2L0=;
 b=DEUdaAjGzlS857ZAp8sdd+4MBGDdajdB7FbRkKSfq40EtyIXTiygcJIrGtfeatCCFb
 KmEPKKO2bnK/kcUnGOfyGM1+kKAsbu8bc0TiO4VLbxo0mJy1DnQ71XkxKDpeS3Fe7qcb
 NqNbHwRgK8H6zdY0D8uNqhl5VwWYrq9sLrS+8hBMoXq4pAVCj6+lB5h/3lyN704OhTzK
 yivfewaPgh8Vz3Vnm16rNTsu2QMTkF1LXfkGoRTxUU7DR9PB9xTW936iaC11V63Xr5D5
 CBgXXNA+JS3I6Sa54Lb+Ai329yXtXTMjmYMH/GHmKu3ejhZ4a3CJbKtQHJvptWFXW+Wr
 8U/A==
X-Gm-Message-State: AOAM5302Zx5ReEAK0H8tJOLFbn6jfJBvgPBaVV8YrJ/V1W0eZzrSCxlN
 sVGeYI2HhM8DSPpPHIupDp5kftibzcTipw==
X-Google-Smtp-Source: ABdhPJyQ8I9VNBi4rABoZ+m5RELXPnDzdsf5kCXiyFvJymS5hyRNAZE33yWAf1Mk3+DXn/g70JibhA==
X-Received: by 2002:a17:902:e8c6:b0:158:f809:311f with SMTP id
 v6-20020a170902e8c600b00158f809311fmr27115535plg.4.1651028538928; 
 Tue, 26 Apr 2022 20:02:18 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056a00088a00b004f7ceff389esm17778406pfj.152.2022.04.26.20.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 20:02:18 -0700 (PDT)
Message-ID: <8ad176dd-f3db-7936-42f9-2a3273afaf57@linaro.org>
Date: Tue, 26 Apr 2022 20:02:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/3] softfloat: FloatRelation cleanups
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220401132240.79730-1-richard.henderson@linaro.org>
In-Reply-To: <20220401132240.79730-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 06:22, Richard Henderson wrote:
> Make consistent use of FloatRelation throughout the
> implementation of the float compare functions.
> 
> I don't yet know if this actually solves Coverity issues,
> but they all look a bit cleaner, I think.
> 
> r~
> 
> Richard Henderson (3):
>    softfloat: Fix declaration of partsN_compare
>    softfloat: Use FloatRelation within partsN_compare
>    softfloat: Use FloatRelation for fracN_cmp
> 
>   fpu/softfloat.c           | 20 +++++++++++---------
>   fpu/softfloat-parts.c.inc | 11 +++++++----
>   2 files changed, 18 insertions(+), 13 deletions(-)
> 

Queuing to tcg-next.


r~

