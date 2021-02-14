Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D9731B18A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 18:28:30 +0100 (CET)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLC9-0001hA-OU
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 12:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBL9c-0007nw-Sb
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:25:52 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBL9b-0008PD-Cj
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:25:52 -0500
Received: by mail-pj1-x102e.google.com with SMTP id nm1so2374662pjb.3
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FPQNVusWjm973n3xT0RkMQE88t4ve5gnP7mPrQ1ACiM=;
 b=B7g2lkcSLzrXBjrlPYg+T0+fSJBM5/QY9mhWVY+IqhPG0wTVFDa0J+XJm1Gb9lx9pa
 FNfKGUnHMHQ35vG8fjLGfI+r2l9Y7PuwF1PsskEukg7GHgrJpGh17D7QV4CYqkpjMvCp
 beOdw9lh4nlJcAr7x0q7cVuxPLql4uh5qKZYkQMY/D0WMUVEPsEvRw+fzPRoZGHW3mgc
 5dKpibpLRxuYju4SpNa6HOF/5dkpNB07DSwkpxZrT9b2l/TxzKskLdgUJ6AkpUOaXTLF
 QPYeapKzMVlU0gHJagv61AAM4OJE0oQ1sRsIMIiqxRFU4rg8oNli+nYyHrlCLmzbWQOd
 913Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FPQNVusWjm973n3xT0RkMQE88t4ve5gnP7mPrQ1ACiM=;
 b=a4GkPsTeLAXbh10YCPITL4mmB4W7Fn0XVM5MyHJHK6A+VzRBarUxBpXTbby3kQic5u
 l2L11+LFijZFHfG1+9fjdlPCcEYaxkURkbICrP9ESZUC5BdpElIaTFjOAzT9kSUSI550
 SZb6JE8i+IoqJxwZWqiDwSzvm0lgoz92HOVtlztSjz75xpCmkPoxh0Kttlcjot0NkKXZ
 GcA8Y6Zhb4VyN2ObXu0UcrX7S/QyGbs3zo/sltaQtlMp7K/ddmhLEWikkSLvugtaEcOq
 cmFSyH758n7YpduDVqlQnIIgKHFrYcGyKFAcS/88jk/ZaQF7hdCW5XUJMisfsjmCbkvB
 iOLQ==
X-Gm-Message-State: AOAM531LaG2wIOYxIoDCRN5NeSEz24xu1h6yVPmpKQ0/32FPWNHZ8ETQ
 5Jo0lfbvACqM1VIHtuoXtv2/fg==
X-Google-Smtp-Source: ABdhPJzD/9RclB2jorCMwx+nkR202rx420nj0D18BVD32cMocmqwggM7aPpM7Njq3nXt4C/02hQ6Jw==
X-Received: by 2002:a17:902:9341:b029:e1:7b4e:57a8 with SMTP id
 g1-20020a1709029341b02900e17b4e57a8mr11664341plp.34.1613323549884; 
 Sun, 14 Feb 2021 09:25:49 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 t25sm15434507pgo.87.2021.02.14.09.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 09:25:49 -0800 (PST)
Subject: Re: [PATCH v8 11/35] Hexagon (target/hexagon) register fields
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-12-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c6b4f4d-ba57-2164-f64e-d50727a8b993@linaro.org>
Date: Sun, 14 Feb 2021 09:25:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-12-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +const RegField reg_field_info[] = {
> +#define DEF_REG_FIELD(TAG, START, WIDTH)    \
> +      { START, WIDTH },
> +#include "reg_fields_def.h.inc"
> +      { 0, 0 }
> +#undef DEF_REG_FIELD
> +};

What is the purpose of the 0,0 entry?  Surely you don't actually reference
reg_field_info[NUM_REG_FIELDS]?

You could also annotate the declaration and definition of reg_field_info with
the array size:

extern const RegField reg_field_info[NUM_REG_FIELDS];

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

