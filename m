Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC0E47434E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:20:44 +0100 (CET)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7jV-0004BJ-6F
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:20:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7ad-0005iF-Mv
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:11:35 -0500
Received: from [2a00:1450:4864:20::434] (port=47008
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7aZ-0000m7-VT
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:11:30 -0500
Received: by mail-wr1-x434.google.com with SMTP id i22so2503456wrb.13
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ytBG49JiKMqHQmI2s2wW7QYcTpq+jVlO+Y3WlmOmYWc=;
 b=oOn2vnXXRnX+1Z642lqlN7FP0S6ucWFuyP7bujjrqGyN4uCxQcCy0O/HwSgYJfQMaG
 ZGQoxi5TiW3tMLQ2fO62Q41SkYnHdPBBy3lJLXGszBgFAo+wgLVapVS7qJJl2wrzIoqT
 rEByirtvLKr4l4d7RFzdPSZ5QI01a6Fr3x+wW9CiCeqr4chPXWEp4IXrFX3eCtX3WYOm
 gGHBlYjJGD3OI4t2f0VqaZybVusg+F3z3i25lwfZmQvFM0Gix222oc+fhSA3U1oqVvq8
 AedlZpxEGmdKwkqqmTx9Ab9qFbnxskRniYWpYqSREJ9w5ZlcUXdkLNXI7CPqAqRD9OxP
 9A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ytBG49JiKMqHQmI2s2wW7QYcTpq+jVlO+Y3WlmOmYWc=;
 b=iCjjnW7B7VHbY0Zzt8j9S8b8fvgGKyA+72CexwesvBuTSWcuTTdw15r6CiD0l9tYcm
 xyTwaSSNNsuphZA0KTymVcIFe4UVaDVPpL0J/B6wK6Zpz2+Rglv4R53eFzbxzhsrxI2l
 /qUa2bqnLF7bHqyOrLslmJE0QEm4MP+RATm771/vVHNnmccu0J6rx9nblzZZAKhq+6/S
 i1dCPpuHzhbjrT/KsubhcWnvuEMDiqjWSeI9kmCaMfl+J0sK17uhvAuEolPOuAgbE6nE
 ym+2qnQLQgKhLx1TuV4VocaxV+8+HeUFo2kbAQ82ogojO83gZ+FU9KprqC/t35WLh7QE
 UUbg==
X-Gm-Message-State: AOAM533yzfITFoofiCBbEK2BBi1sZGHvioGE8hgQlnirKd1CFHCEQKqu
 Bn7S5WkzH86/0nTjrD0jGRs=
X-Google-Smtp-Source: ABdhPJzRgxBKOrm3R+dxQvbBh+ZARsQVMC1bmHAH1CS4i0gTitmH9B7/PqsF160M7UChAZ9WB5WOEw==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr5791270wrd.369.1639487457531; 
 Tue, 14 Dec 2021 05:10:57 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u2sm16175047wrs.17.2021.12.14.05.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:10:56 -0800 (PST)
Message-ID: <eb81896d-809e-2dbc-0680-adf6c87e1e99@amsat.org>
Date: Tue, 14 Dec 2021 14:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 10/15] bsd-user: Create special-errno.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214002604.161983-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 01:25, Richard Henderson wrote:
> Pull the internal errno used by qemu internally its own
> header file, for use by safe-syscall.S.
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/errno_defs.h    |  6 +++++-
>  bsd-user/special-errno.h | 24 ++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 bsd-user/special-errno.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

