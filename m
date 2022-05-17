Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D152AA61
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:15:02 +0200 (CEST)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1id-0007Nm-LG
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1fm-00060d-7R
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:11:54 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1fj-0002Zu-Cs
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:11:52 -0400
Received: by mail-pf1-x433.google.com with SMTP id p8so17593333pfh.8
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ojW+TcFIHiEWuPmRb6YZXsbdWfWXhatROAsWOlH4PHE=;
 b=fZ/GxoEEuEOMGlgQkHiAk6dYcYlPgD0FQicQR8CPtKhoDPp9OSJrXtZoZ09XUrVfiA
 ErfHKDJXqJmg29+6JGqeVQH1NKIVczRyRuNzAsMECJo42sakk9vdpo7TQdNy7XrbrVly
 jZMSDqX7XrLne3XUxuXk3i+kTTaQe36fKiw3l3phOQHcVM2LqacUxn6Pv24NuoJz8HPC
 3NtOoX1FBPDnTbovpxfB9kgL33QuvpKFa+DeRRjdhLMhuWftmlOhCc8g/XYS2uqGPccI
 aR5iG9pl1M9WsDh616PCg8+12u88KyMEQZO/AxWcbD/pWmxkgjXbOBp0ZVAH345xr/wx
 bLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ojW+TcFIHiEWuPmRb6YZXsbdWfWXhatROAsWOlH4PHE=;
 b=sv3KmU3SO12/ejPiqqaGi3XniVhBbYM2o619LJ0OGr9BkmjPcu8cLdGrrxkmZOw9EC
 EQI3rPN1kfjBKHfuHIq48YL7ur0lt7zdhVSPrGOBbD/FsqZypXq87hTlH8LqE6xRqGwf
 jMDibwL3rKgf2TwLk2rgB067kf1WWOSNygPbVnc13D/SUELwRfo62nqEhx75wMie7k3r
 KskpuxlUDReiIB7YtIbIeW7a8NzKozz9zWN+UeUSz23FXyX+YiVctLb3wEuJatQRwnSy
 FhiI9EUgaGu1CTN0sEGPpndCRgRC3ynHFjpbN31OLARJEx0eO6tVEiZHMTwwodIstPHP
 4B3w==
X-Gm-Message-State: AOAM533vm6rq2N882clI0eHO1i9r7pLc2CCBZjvFhOZbaxrf61TJNs/w
 o1la23XG5Ewr9Q8oBS+E8AMzMA==
X-Google-Smtp-Source: ABdhPJwt8d6AdMCsVaQKWrWdJPhG7hjiTdaaVumRsefoENe12mNTc58wUiH8jz+kz34KYSUs9otqRQ==
X-Received: by 2002:a63:2215:0:b0:3c1:fd25:b6a1 with SMTP id
 i21-20020a632215000000b003c1fd25b6a1mr20300875pgi.406.1652811109704; 
 Tue, 17 May 2022 11:11:49 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a62c31a000000b0050dd5ad0f8dsm45911pfg.76.2022.05.17.11.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:11:49 -0700 (PDT)
Message-ID: <9cc1ea91-76b7-cd07-522b-e7b59655d771@linaro.org>
Date: Tue, 17 May 2022 11:11:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 06/16] tests/tcg: correct target CPU for sparc32
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <20220517092616.1272238-7-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517092616.1272238-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 5/17/22 02:26, Paolo Bonzini wrote:
> We do not want v8plus for pure sparc32, as the difference with the V8 ABI
> are only meaningful on 64-bit CPUs suh as ultrasparc; supersparc is the
> best CPU to use for 32-bit.

s/suh/such/

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

