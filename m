Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFDE31BE98
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:18:38 +0100 (CET)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBga5-00010o-P4
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgX0-0007iQ-Uc
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:15:26 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgWz-0007iR-9o
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:15:26 -0500
Received: by mail-pl1-x629.google.com with SMTP id k22so3979459pll.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4vl+6kQSU7F0sJaWhUI7nNyUdEyD9KI5H1/dIXJcvrs=;
 b=TRyYB3b4nTqn3mj7pnVbIAuNT5WP4aYzTB2Aj4WdMHo+4FEnnWyC8Vs8m57Y+y/XB3
 gQ1DtMyfhkxXv9Tk1WYNJZboXJVYusOGzAfNDhH/V7Ew2XkgwvqxKapHZVze99UWMTG/
 M033rEOSSQl3oe9BLy/zqSvi79799YQX6ZzqEdullG/NPqtnHTE1U2nlSVFCL1k4ar+X
 uYLQZyzZHLHx1JFPxyBsa4f9/ADU1Al4N1Wk8vJm8lo/UQU2YzlUXL0QpK2TEkCQGUZa
 iTdprtDGD6U76tRtUZWuYeIPezUOvEAICP1Pw2c7fnUWqzs+UZk9STuynAcWXjXfoOr2
 r4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4vl+6kQSU7F0sJaWhUI7nNyUdEyD9KI5H1/dIXJcvrs=;
 b=RCEFIkj8gQGojz8UcFMDwrcJdRrRwjOP2klGAa0cKpsuNM0cr8/GArqB2oM2I0MjgF
 mvZmc+MfhMJCUFS1Fb0vmgbb6JGSBMaLdPGn1RYxxWW6ndefEufMvqYQFrp1s899W1gr
 fqenobQkAKOB4qtpDwVx2laMTmzYPVc0fAeUjx+2QZ3FhosXXxwEEe6YA7bVg3v07sRE
 mohZkcgLyz1BWcoXsnrog0YR0CSpOx//VlVDgHZx9KXzViKCmrY9oFO/p/u28opQa3rj
 9/88/GYyGVBc2RM0joXgX0QSjIHCVzqGeZjuAiOh9bF5knntYalgHKTWg4d7kpqGLYfg
 zRHg==
X-Gm-Message-State: AOAM53130iwO2VtjPO1NOfJnE+zwNb92xy6Pk21S7MZwXAd/+/2Nkpen
 0dX/pJyAy0RS3dMZ/QN+451nMQ==
X-Google-Smtp-Source: ABdhPJxs9mMaHc2VHoEUZqbzQtnip8lgYAlZyYFJJwlgBFIWQ6sC00UISE6GyB1oOIM+YPLAkzJmqw==
X-Received: by 2002:a17:902:9348:b029:e1:506a:7f67 with SMTP id
 g8-20020a1709029348b02900e1506a7f67mr15863560plp.71.1613405723846; 
 Mon, 15 Feb 2021 08:15:23 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 lr7sm17535866pjb.56.2021.02.15.08.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:15:23 -0800 (PST)
Subject: Re: [RFC PATCH 05/42] target/mips: Rename 128-bit upper halve GPR
 registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c8e6b90-8671-ca07-fdac-8514edd698e9@linaro.org>
Date: Mon, 15 Feb 2021 08:15:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> TCG displays the upper halve registers with the same name
> as their lower halves. Rename the upper halves with the
> '[hi]' suffix.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

