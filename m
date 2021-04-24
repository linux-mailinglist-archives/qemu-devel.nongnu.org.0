Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB4036A262
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:29:00 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laM5T-0007IG-MO
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM3w-00060t-Mx
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:27:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM3v-0004hU-6y
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:27:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso2928965pjs.2
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QKvLBPxGaEJCJtKdGoP5bkjpwb7jqav5d5qNhN3EctU=;
 b=XutpRCjTT+W6l1VG9bd+Wb+z4q4jaHISvvXm1DwmPJ0gVpPFP10epcCtSZ/LEpUCXb
 V/Jgl3zn1xzVys0Fg42CYLLoVjqdfu+geV92hk2YMFSzDwedQT80tJjVluZKuepQCdkg
 2Ik8J/gS31JWN355yvLJ3Wrq9LbZ+7FJO1UVF8CIMyJxme9m22fRSHVpzCrs3YNXTTI+
 3+/O/RIKAcRJNY/0hd8Sw0VoOxnlNaFzfi+K0t626YQXLJf3lyb8UyfTS0grPB4fZ2pm
 czfsav2tuvrDPCVYdDgw83+OvWBRYbYL6yAHw5IRxrcJQmOLvEIsTHdTi2AQbNDAXCUI
 eOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QKvLBPxGaEJCJtKdGoP5bkjpwb7jqav5d5qNhN3EctU=;
 b=guxPqd0SDFJaRYVj5GgkVwlejMXnnuG4yCFazJ9GhrDGNrpGQMWAPqRHNqf0w9AMCl
 AWK/sh21380uM9EDaB5fajk3N+NqFa99SRmlpzZ7VRPaNoDIivv7HlqpAH2m2/ebghkr
 H8WR/TgcJ+PXQWGG2z3mj55050giJLGilvhrMfnTyRBO2/ohJB1JJeP8FzbocO/mvmYq
 w3C+gtrstK6r4FN9UGgBDVL/g7J07jc5h/LnqBuM9EPKEZi2Xm7KC0ED1UPmOE9xFJRA
 yoWgECHIO0dJbLUoLFeN8wTjKbO6Pm9ZBXJAh0ifqybq8X0qxC0yyCo+GcZG+DfX5J+y
 gVPg==
X-Gm-Message-State: AOAM532g2gBtvjEmBXgddgxqkyi9Q9jHIaylrUguYMIFMFrXnLbFWO5c
 UrfTqfLD1toyH54pzgggh181bA==
X-Google-Smtp-Source: ABdhPJzGDlnRNBAZpHwInxda8jLngo0JscNfemfJYXyqVECLmORTJUCgH7c7PJhgci2XOlsGBL/tEw==
X-Received: by 2002:a17:902:7c17:b029:ec:bfde:23e2 with SMTP id
 x23-20020a1709027c17b02900ecbfde23e2mr9654044pll.33.1619285241626; 
 Sat, 24 Apr 2021 10:27:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 16sm2021828pjh.2.2021.04.24.10.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:27:21 -0700 (PDT)
Subject: Re: [PATCH v2 21/48] bsd-user: style nits: return is not a function
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-22-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a475eaf-c48a-a58e-273e-134575c5d291@linaro.org>
Date: Sat, 24 Apr 2021 10:27:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-22-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
>   bsd-user/elfload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


