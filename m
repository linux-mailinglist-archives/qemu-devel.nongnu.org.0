Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA833F12B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:32:00 +0100 (CET)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWHH-0001yf-5J
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMWFS-00017z-7i
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:30:06 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMWFQ-0008VB-1i
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:30:05 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so1764771otr.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wSz8/Z67I7jS1uiXxL5/RHMZgMm0TN7Nmr4DXIYvV/k=;
 b=GW8K9Z06c4fDC7cFWTrzS+iSx20PFbzRA0frohCkUjQqx/MbmH9FvI0GDr+gIzut59
 mUomfm8CtM+VGE9wNjhL5CnurnwP+e0tClxEdSGo5l7m/C3P8hw7etSH9n0ykhCuzAOq
 kzlJYlpOvs+4zJnKDitmUeAe2KzOlpiHReWTI0XXwAsHvjhVFk3IEhnDGrcIJIBYJ0Jj
 dJzK4HWJe8dyHAxacj4viFVeMOS4h/HgZRcrSHcLiqNlImlW30M6khC5beZ9jQou6FK3
 upJRTu3d4++fEGwCESy5bwjo5J1y2oj/u/XZeXWAsfZzvzJ+A/+X1j7KdKuyKXt0BGgx
 MHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wSz8/Z67I7jS1uiXxL5/RHMZgMm0TN7Nmr4DXIYvV/k=;
 b=be+psu7+SkgibUt8JcblNls7v3W8tGpvW9XeWdf6z1f2XrIlVmImimnYp1Hkcrj67Y
 8Wp2kJg/eWj7u86ZJsEe+avtbH2yChaiqFu6KON3dQTKpixFLRhOyWmRrvSoQwAmrtm1
 s/B5su0gSfzldYYAyZ/kEW71c0J7BVuwsvMMo0P1UdxP2f/hFWpTyesHYBIJtP9BJedg
 R/rlkL5I7iOGmT75cxSE0hIndtaun5SyPYWz5BriTvSmANYyRFLkNRHPw89UD4uPOOsC
 gSIeE3SpvZ5e8AAcM6Ww3IDKAWg0tAkiwO1dLwNIsVVrCme5feasK0vbcjwE2Asq6KrD
 j4xw==
X-Gm-Message-State: AOAM533Vm3kVtP5YmtBfO4Mas0ynp2Re67uK6zUsm7I/sdoHcAcYME+1
 iz62cc1Id3lRWnPcm814Q+5RQQ==
X-Google-Smtp-Source: ABdhPJyL3lM5WW/OlE2gIx7CiHpgTjPHFTZUOEMQgElC8AlV9i1rdCUSIUyOev/pvaXPBJxa/RNDyQ==
X-Received: by 2002:a9d:4f05:: with SMTP id d5mr3427597otl.88.1615987802660;
 Wed, 17 Mar 2021 06:30:02 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g6sm8650441otp.68.2021.03.17.06.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 06:30:01 -0700 (PDT)
Subject: Re: [PATCH] Use identical prototype for tcg_out_vec_op and tcg_out_op
 function
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <20210312121418.139093-1-mrezanin@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cec740ef-b9e6-713d-ed00-3eb8ed93bda0@linaro.org>
Date: Wed, 17 Mar 2021 07:29:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312121418.139093-1-mrezanin@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 6:14 AM, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina<mrezanin@redhat.com>
> 
> There are two different versions of prototype for tcg_out_op and
> tcg_out_vec_op functions:
> 
> 1) using const TCGArg *args and const int *const_args arguments
> 2) using const TCGArg args[TCG_MAX_OP_ARGS] and const int const_args[TCG_MAX_OP_ARGS]
>     aguments.
> 
> This duality cause warning on GCC 11 and prevent build using --enable-werror.
> 
> As second version provides more information, unify functions prototypes to
> this variant.
> 
> Signed-off-by: Miroslav Rezanina<mrezanin@redhat.com>
> 
> --
> Note: These changes were send to mailing list before:
> 
> - First sending by me using first variant
> - Several iterations sended by Philippe Mathieu-Daudé with additional fixes
>    that were not accepted.
> ---

Queued.

r~

