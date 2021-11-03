Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00507443C00
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:48:51 +0100 (CET)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7Gd-0000wd-4F
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7FC-0008G9-EB
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:47:22 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:42573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7F7-0005Dx-S7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:47:22 -0400
Received: by mail-qv1-xf30.google.com with SMTP id b17so1437778qvl.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QxMx/OLVJWXoSgv7bLM7cCW8EIQOD8UuKaKV0sFo2RI=;
 b=FHwmbtz3FsK8UqcOyG1CP0erXIaBzvwwE+e5Uxy9JEJsAWzcp1TcewD22afY5uJ9+X
 NlAK9OTUWvJozRKm5wfxhHB5Gv4ADii9zuOHu2NaSJr1+4XxXkdM+thCnCL9Aak3hLlN
 5Q/pL8ZNpb2z5izVgwMcHnUwjNfzsNK4jWVyqM2oumwQp42GkEYtRox7+mxI8uqc/ogu
 QqY3dE01FH0+ulnRx9oP1Sty8cSZOsVLEiJPLIOmIyp1y6jSDOQkj0z8d2pFOOK+j43x
 M7IN29eupr82BuvzNmP+7aqr/DOGCs1QR0xohvLpNsmwLwCBo76X/Cxo9pNuhLEOuXh4
 ja7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxMx/OLVJWXoSgv7bLM7cCW8EIQOD8UuKaKV0sFo2RI=;
 b=2ooRbVZLTSGgZqQDbkGrHAcrMDBMVn3A0WUpgsJLynLggop65sNRa46wUbk0KR7mxs
 YmpVKqMh+g7tOLemqV8xk71G0vIPiF983Fl7UgqYG8M8o8JCtFK3buLPEVpL8wE94MFY
 Z1yspVZnzjvTmjdrJ172BjQjomkMJygeKv8mtP2xx80ya4uiATQvBY9Nxb2pRYS+YM/b
 YgVGKb1xGssYhYaxMfIs5xrGserH9Ok0fXmEZhZJpcmmtV5vIP6C6eA+7tX44KQ/SQoK
 ozFdDa3EcJYa905pD4NYMj9KLdbKyUGn6J5zrPa8UCMpB6jssRryDGMdsBWy7S62Zluv
 dMnw==
X-Gm-Message-State: AOAM5311fcdlDYCzx5ETljpc9s+kf6i9v0NAyXh1T8uhgJNfrleLpYUa
 WFIBWwqcGvN7GxBqt2rhft939w==
X-Google-Smtp-Source: ABdhPJyN+35sshO+mhSKkTeQhQCwVVMSO92m9F9k5nYiFccVXuNOmTIQ71VOwibUAA8R9Dmld52Lmg==
X-Received: by 2002:ac8:5a11:: with SMTP id n17mr38477512qta.210.1635911236727; 
 Tue, 02 Nov 2021 20:47:16 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id q14sm675171qtl.73.2021.11.02.20.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:47:16 -0700 (PDT)
Subject: Re: [PATCH v2 25/30] bsd-user/arm/target_arch_signal.h: arm
 get_ucontext_sigreturn
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-26-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f152831e-dc66-698f-3aea-fd970d109a64@linaro.org>
Date: Tue, 2 Nov 2021 23:47:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-26-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> Update ucontext to implement sigreturn.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

