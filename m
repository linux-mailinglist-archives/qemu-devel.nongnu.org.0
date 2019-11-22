Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5934106820
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 09:30:36 +0100 (CET)
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY4Kp-0007Rg-UD
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 03:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iY4Jf-0006v0-Ve
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 03:29:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iY4Jf-0006Gc-0m
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 03:29:23 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iY4Je-0006GA-PL
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 03:29:22 -0500
Received: by mail-wm1-x344.google.com with SMTP id j18so9654360wmk.1
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 00:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wha1hglNGt4UstaAQQvLQMbo/kd1j8mCEModtILhLKk=;
 b=ccN2HvfIuPBCfRYS/bPPAbsOK6lIz7D8lMTzencQTbLXiT4prEC+XQ4sQTVrQYMQuT
 BJF5fyDFYjExZm3W5fnxiPwksxZKL96uqll9qsUeeBl0PKUmNP9tRB/eWi3zF51gdgTr
 YjV4S+qH5MXv12NCNsRIdxlgP6Xkr6bCXb7MISQsIxiBEm8B9gGIsY+0v6oQxuyajhiE
 kbZUW/Q5mhzk0pPH6AF7T7rLY3Qwhv+SbfBrq3qmhLyyXQh9AqfRtwe09u6A9NNTJl23
 AsBEGIo2NoRXI2530o0CYLOCMg3Uk6V9uBdZProlq0ytC7bMqNTByqoDcjOuh6weDhzH
 mpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wha1hglNGt4UstaAQQvLQMbo/kd1j8mCEModtILhLKk=;
 b=ewFMawfCn9qhgYfmv0oJcCi2D0X97y7QUn2VjqaG7dPvzncZ4p+AePSzPD+H9FIDAK
 N9WOC/z5l3Zz2rpGN47qnTEsm/Xl4qzLee+uoW0bc8Z7Rk86MYx2koRoD3Iysc1yN69G
 9SpqsLU1dDw5xSR+m+oNVfHe0mZYMg2KquwMW98psqWE3T4qOxTB20kaQfQ1FcKyRDdW
 0FE6IeYL1TC53atm2fmywUrgpzQdO16UYlsvLr55pS4+lHnliJemnqyl8/ZebzpS5MXw
 cjZ1G/MB7t2lJb8G5HWzocpD0nC1wFzxrkdm1L/Vb64x9yPG36+Oe3bOvvtiP65o9jth
 oCJQ==
X-Gm-Message-State: APjAAAUtND8SmE5r81SozdWTyDJoq3OvnAshxIAul1LQAxQ64iZSr/tH
 5J9XIDUL5HE6K+PfJy+KOKWF4w==
X-Google-Smtp-Source: APXvYqxnFIiF6Tr8PV3ns6yAC/dnuCqahHAbsIyvYK5YipNGtq9KllcfWaAY6VIrBJdtvvHg6gPeDw==
X-Received: by 2002:a1c:20c6:: with SMTP id g189mr1203573wmg.6.1574411361531; 
 Fri, 22 Nov 2019 00:29:21 -0800 (PST)
Received: from [192.168.1.143]
 (host217-43-132-120.range217-43.btcentralplus.com. [217.43.132.120])
 by smtp.gmail.com with ESMTPSA id o21sm2583113wmc.17.2019.11.22.00.29.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Nov 2019 00:29:20 -0800 (PST)
Subject: Re: [PATCH v3 2/4] Memory: Enable writeback for given memory region
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
References: <20191121000843.24844-1-beata.michalska@linaro.org>
 <20191121000843.24844-3-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <eb14d17d-3120-2697-add5-d98d82cc51e7@linaro.org>
Date: Fri, 22 Nov 2019 08:22:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121000843.24844-3-beata.michalska@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/19 1:08 AM, Beata Michalska wrote:
> Add an option to trigger memory writeback to sync given memory region
> with the corresponding backing store, case one is available.
> This extends the support for persistent memory, allowing syncing on-demand.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  exec.c                  | 36 ++++++++++++++++++++++++++++++++++++
>  include/exec/memory.h   |  6 ++++++
>  include/exec/ram_addr.h |  8 ++++++++
>  include/qemu/cutils.h   |  1 +
>  memory.c                | 12 ++++++++++++
>  util/cutils.c           | 38 ++++++++++++++++++++++++++++++++++++++
>  6 files changed, 101 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

