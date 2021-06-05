Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E0239CB7D
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:42:15 +0200 (CEST)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpeze-0007hu-K9
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeyq-0006NF-MD
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:41:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeyo-0007SU-DY
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:41:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v13so6543628ple.9
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gaLWJfHje98Gjm2MMF1fHfleodIABZfvjbmBqYOUzMw=;
 b=LuY2KFD5SXmOLauhC0t96AT/CjnG3Vg8f4VdzdypbvcMpmRmO06gY281v3iH4r8b9z
 omWdJHjDSwnv9EQDCSf1QIJxdQ0v8WOpNlNfdwvXlSBlfrx6Snxdg5miUaF58AHu4kDx
 Oupzv4gs+OYaW4xVUgEgu2nfwvKLJugbw0Pe/kUKWhECphU7Pkw1SGkLfRImmMd0iXbC
 TbrMHEroUHlbAzWl/jgwIH3R7at+vsdlIIQnSEkmgfnPWwRNSs311eYk3DWqIhg0wO6K
 xXOhY/+9ou9sc8/i7KtXP/HO3dz7IFbVUGZ5GnJv6mGS0vKHCYODNbu23NwvkIM6ocCx
 4iDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gaLWJfHje98Gjm2MMF1fHfleodIABZfvjbmBqYOUzMw=;
 b=G7EyfOhpnsBWHkQdfXxg7Tp1zanCJdg4GX7iXk6lvWpYUmW37BbFEYw9H/r0tjw14F
 vvlHf6GFQMdZeAFQsMEV3u9tYpc7071u423caq9Etdm+cdhXKrIxqAGpyv0uw0mk89gv
 MiI0BzTGYxLGF5BcjXdRDLHcfWeBwoCqhL4Nmuppvn3EMXrahbfEYFKXwlrZdgkhVkr8
 v0rEnBaLoMxOJA5739hkiBRRh5U571kmtPvKFE3QFARNrVoDDtxKktk9s1H47mGAuUAa
 S5Mtxgu97pB6kRWbEEgEXwauTgs8shOUJtvuIfLZ8hoULnK08p24upOjGGytX2tMiCOl
 kQIA==
X-Gm-Message-State: AOAM5333ciSUddq27LTkLzNhNkWtMVAWP8qpoQ/yf2aW57xbhICNRk61
 Gl8WCe4uoQw8ozBUKnnyZp+biA==
X-Google-Smtp-Source: ABdhPJwQf1Q8e+JfLyJxMa1w5iscotQcdsasPeRYHfNL0EEzk1Y6BbxqI3UApopQrLAVhWtr4z8f8Q==
X-Received: by 2002:a17:902:b609:b029:ec:e80d:7ebd with SMTP id
 b9-20020a170902b609b02900ece80d7ebdmr10952521pls.75.1622932880549; 
 Sat, 05 Jun 2021 15:41:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o139sm4827009pfd.96.2021.06.05.15.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:41:20 -0700 (PDT)
Subject: Re: [PATCH v16 94/99] target/arm: move CONFIG_V7M out of
 default-devices
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-95-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <393ec928-55e9-1608-358f-2b5d4dbee96e@linaro.org>
Date: Sat, 5 Jun 2021 15:41:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-95-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
>   config ARM_V7M
>       bool
> +    # currently v7M must be included in a TCG build due to translate.c
> +    default y if TCG && (ARM || AARCH64)
>       select PTIMER
> +    select ARM_COMPATIBLE_SEMIHOSTING

I don't really understand "default", because if one were to set ARM_V7M=n in 
the config, things wouldn't work.  But I guess the comment sort-of covers that.

I'll give you an
Acked-by: Richard Henderson <richard.henderson@linaro.org>

anyway, because it does seem an improvement for the --disable-tcg case.


r~

