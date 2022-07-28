Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435B1584894
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 01:12:35 +0200 (CEST)
Received: from localhost ([::1]:33070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHCgD-0001gv-Te
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 19:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHCeL-00008b-Ec
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 19:10:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHCeJ-00013h-U7
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 19:10:37 -0400
Received: by mail-pf1-x431.google.com with SMTP id y9so3142972pff.12
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YoFsbJyfZpCtJsDRE8EebZZuTtR/E7s0MFmJ//twxQY=;
 b=PExiWKvOEZ1z2HmQkZWbOJrRVY+qsM4F7Fvsp3ebGdyBJnenh7/ibDVhVZmCrM1hqw
 oBrp58K7vAYPQ27A60pWQOYLq3kbS/JPkByfrecRiWAsFXxrYMeuzCFSdLzhDAj20bnn
 8is1DFmOGiKlE5aXWHdF8LHZpt13EcUOSZHja5zXIjoXJpXslQ74m9Bi4eWmHu1hXt1U
 bCdvt1uL7kpf5fkgFxd3cKeV2vTH2oDBpOz5F+Nzkl1Vqywz5yGopFSp2h5RUkYO5Hr+
 AiE7gw9rXliy5GfJDkfHLwS2jxQ2rz2a/Z2mIbjejnGsXK0Kou+vtAx0h4wPhii/chQd
 jWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YoFsbJyfZpCtJsDRE8EebZZuTtR/E7s0MFmJ//twxQY=;
 b=2JHGn01XAI2yzYxkrxVU1mLA9kc1slDQUsgoHPMDlzzq67XuUQGe4br0SdS8hVuTcX
 N41Uk1ailxi/GJq6jDFojPW4Ppdp9k5/TtUs4uWSPWSfFRIeqLKSv0mszFGlqT6fepTV
 zx9MMUsJffM2CcXfNXay21FhGz0qPTTgy1JUa0W7g8ob8eUdWu5ANfFGodGp1AFTMkBY
 XR21rrNxasDDidmoFL1bgOke164AZ3Af7qY9NFangY2Fj3gEIF3U1q8d2138H+3M3HB8
 OzEvhpyJmhscnP6xHjmoUYXvW4GNollrnhSFPYpyWYvOKhF/JScB4WqiKM8FKGoY7IuG
 rI4g==
X-Gm-Message-State: AJIora8sQAxX1Sl8zRgVE+optndqpDyXcjdjuXVdz/mRsoB6Gs1ZAXrk
 bU7nrn+DG8HsifBzroVzKim4Jw==
X-Google-Smtp-Source: AGRyM1uyrNc7EUQDGpoluz1Y32ir5seJLin3w6mi0Kio8goES2fmb18/fkA9Asah+8oXJuwP+67dkQ==
X-Received: by 2002:a63:4645:0:b0:41a:6c24:4fa3 with SMTP id
 v5-20020a634645000000b0041a6c244fa3mr807498pgk.114.1659049834160; 
 Thu, 28 Jul 2022 16:10:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:d1a3:8e57:d847:7607?
 ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 18-20020a621912000000b0052ac5e304d0sm1328049pfz.179.2022.07.28.16.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 16:10:33 -0700 (PDT)
Message-ID: <48c09d94-9b7c-1417-64f3-f14053f084ea@linaro.org>
Date: Thu, 28 Jul 2022 16:10:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] configure: pass correct cflags to container-based cross
 compilers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
References: <20220728222237.307698-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220728222237.307698-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 7/28/22 15:22, Paolo Bonzini wrote:
> probe_target_compiler returns nonempty $target_cc for installed toolchains
> and $container_cross_cc for container-based toolchains.  In both cases
> however the flags (coming from $cross_cc_cflags_${target_arch}) must be
> in $target_cflags.
> 
> Therefore, do not clear them prior to returning from probe_target_compiler.
> 
> Reported-by: Taylor Simpson <tsimpson@quicinc.com>
> Fixes: 92e288fcfb ("build: try both native and cross compilers", 2022-07-08)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index c4c02b8438..72ab03f11a 100755
> --- a/configure
> +++ b/configure
> @@ -2173,7 +2173,6 @@ probe_target_compiler() {
>       build_static=
>       target_cc=
>       target_ccas=
> -    target_cflags=
>       target_ar=
>       target_as=
>       target_ld=

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

