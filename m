Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D436A287
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:20:27 +0200 (CEST)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMtF-0004Wb-NF
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMok-0002lp-KE
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:15:46 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMoj-0002Ed-1q
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:15:46 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y62so3570985pfg.4
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g0u5MBLrWk/B3MTp2bsJ0prG4NNtghuMuFImd6RT9IY=;
 b=l1HGdnKW/Twm5a/8Ce4Mwrcv1aomDW7oxZUl20ABZ9kzkBK60pXKy3nIgEYfVh5IRa
 pV2voZts2E5ODJsaH5h4J5IDomFy0QnAhVG5CKSXBYC3WgovYK0t2StVH9It/jzmZKK0
 w+RCXwsaUHkgD7VPpNdeFeAXUVoddVOWKl0ayAXtqqeauzryrQ41avrBz2BN56yjVeVt
 tUTo/4yLLhAXfaeQmZoKaUy7hixvx3p9Ym9/Cjkw7isp8lRaFBEvGzWQvjXDibQRdyRx
 VuFV+quAfwmXuSwGCHY/kYE5KP5mirEtkT3Mn/apTRC6YIONTxQV6tQTCJosXnfqhADr
 2CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g0u5MBLrWk/B3MTp2bsJ0prG4NNtghuMuFImd6RT9IY=;
 b=FRgKUDbqFYPKZTk+77ZiEq9XE93+CEE6eVcl7f3kcbAp71Y8J3tohxDR1C92P/ZXXc
 yTuCjztTaG7+HNMJpa7fowC8MpwvF1kr786RKErEjdCXld82efdn31TFEE4i+9Dq6WnR
 QIpouFEBNZTE+B03CFBeD540PQjqSTz6lOYTTT7fSynHaM80PlKk8Ud8v+Da4ARKPYxe
 DcGLd1GM9M073Y/voHELiwFb1pDbgKBwFokfZ0a4zz07yC5mq+I5kcCkb7C2o2J7UR27
 3tuztk23bmPi4H2z//DsSj+OEQsU8PAIinkJqaKEAah1s7b1wm/qJODFq5C3lHq/GpME
 lBzg==
X-Gm-Message-State: AOAM5309r6BV1iwZCkS0UQJTrBO7kncCAWZnnU7GHe3lPekAjHg5w4G0
 C8pI5HzXWLrZIGx8ChED5TkbIMCH6kfpaw==
X-Google-Smtp-Source: ABdhPJyMdlQRBXPwbe9RnMVFhsgEtq7hSzCgJJPGIoiBniFVYV7nVEK16qDUAXPd5kGRlkZ5atAl8w==
X-Received: by 2002:a63:dc57:: with SMTP id f23mr9148332pgj.294.1619288143648; 
 Sat, 24 Apr 2021 11:15:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h8sm7791875pjt.17.2021.04.24.11.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:15:43 -0700 (PDT)
Subject: Re: [PATCH v2 38/48] bsd-user: style tweak: use {} for all if
 statements, format else correctly
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-39-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b0f05eee-dade-1fd0-3c88-0b3040f6dae6@linaro.org>
Date: Sat, 24 Apr 2021 11:15:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-39-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/uaccess.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


