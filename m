Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639EB2D3715
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 00:45:55 +0100 (CET)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmg6-0004nZ-E3
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 18:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmdi-0003ow-DG
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:43:26 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmdf-0003YT-9k
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:43:26 -0500
Received: by mail-ot1-x344.google.com with SMTP id d8so474835otq.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 15:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8a+ZvOKZ4jjdJfj6EkFo4Gs8Ey7HjcA7YKrJqNhd6WA=;
 b=HNxaw8FsfsU15ZFftWz2F4GWquMkm7epjsH2xvZJkdnyy3P4DcVc0toELF1gw7qayd
 oIFhyeS1JXCWDNz70tK7+XIO7HCSMrSKa43sQejSarOkhQqEjZFVqfwQwHncngSFrqmh
 IIe5gXBzLXuabke4l2rbMIcTZ3w3y9Ana+OZOrJSBXbMAiPWUzsA0ssOLoM6/EZEmWPS
 l+63yigNzk4AOdZCxILjwQDE4rj3RY2sRiTYxvCie9RbxB166Up3iad6Kcg8CdMO3eon
 tz3kaOE3bpwBUblR8ABva8eE/5fEqsXqKo5oLOFwWaM+3+3XQ1RD7k+mqY4vWpd+rHWo
 hBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8a+ZvOKZ4jjdJfj6EkFo4Gs8Ey7HjcA7YKrJqNhd6WA=;
 b=qKwlMnpCRDuWsT+Scfp3RS00ERd9XOdypvdY3tIKbt2RsmVws/kizUUaK3E39za5RT
 amJbO8fh/Qa+XesOGZsuvsrZDUY+7PB89XVYqkDhleDKeozwKwEmFPrCE3L592TvTwhR
 ZPGT5e+uWTwB2FtRYRalqQz1vMsOhFKAT3zFc8iHB6/f1K76pzNkikzmNMIbN7tNC+Vz
 fE2JCCXPVdV9uMgbl6PI/wV7xIjhIj3cTV9mNm5TLmgAR7RuLWUql5IZRihLbydmTQo5
 Pqs+jNzqI0JNTVw3ObPSpCF0FIvJfkA2yy59WBf9VOw5sZLvHl/ISgqvvZ2eT6zNJRhu
 YG5w==
X-Gm-Message-State: AOAM532lkWVAR7s/NYLMGzlh6TcIgt4PCwUf64WA5egFjc0BleL6bYLb
 4GBxpeiL0t2oRsEribn+dOSWDg==
X-Google-Smtp-Source: ABdhPJwmfsoM4GRzok1vC/QeTOXymVxYJtnQv2pGwSrJDYo9oJ6rVMH/nGD2BHln17Jgb4VrmQKiBw==
X-Received: by 2002:a9d:1d05:: with SMTP id m5mr458084otm.324.1607471002094;
 Tue, 08 Dec 2020 15:43:22 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm77401oig.35.2020.12.08.15.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 15:43:21 -0800 (PST)
Subject: Re: [PATCH 3/4] clock: Remove clock_get_ns()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc32fa4b-9c26-5e6f-5d36-70849e59796e@linaro.org>
Date: Tue, 8 Dec 2020 17:43:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208181554.435-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 12:15 PM, Peter Maydell wrote:
> Remove the now-unused clock_get_ns() API and the CLOCK_PERIOD_TO_NS()
> macro that only it was using.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/clocks.rst | 17 +++++++++++++----
>  include/hw/clock.h    |  6 ------
>  2 files changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


