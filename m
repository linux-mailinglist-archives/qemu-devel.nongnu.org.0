Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CD347979D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:44:36 +0100 (CET)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myMtv-0000P5-R6
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myMrq-0007wt-H1
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:42:26 -0500
Received: from [2607:f8b0:4864:20::1035] (port=44949
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myMro-0007Ap-VO
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:42:26 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso4248259pjl.3
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 15:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SMA7GGQFdgwY+cNj8VHa0AhtzZEAViBcMJ8wMX42msY=;
 b=L9EP8EKAv294UAfejE07q41cvHAeEh9Y+WeEyszBVAUFmQfIjbgJZtlA7vPVE7c/PN
 Pi2a43dxhSv/OMOEHnZpsNOno0KSD1nDwy3LpDdRs2VWFV/qHZXkQWWOznyOEenIp6iT
 4dXNK/5pZTe2sCyAa+UKdR8YFUVbNVQJjrYbtBvZ2lN26vXy5IgwUPrZP4HvjNopKNoh
 fUxwk1KC3tpaZ7obUJKtoLUKrlzB3SIqVYnUR3rZqEdEvGZW/jOL6Fw4WiPGEsj90AYs
 Gm80zSaNSXkJuITx1l0+H/8NsKTCfOYD+GR2JAOqivxZvfgZkG+cXHGPvJNkiS/tD+nS
 EkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SMA7GGQFdgwY+cNj8VHa0AhtzZEAViBcMJ8wMX42msY=;
 b=F7/qzmwuyq7Ccda9Bctm8Nh9TiBuIarGRwCkoZ4W5uxKmWrjRuCBjLNvCtlTE9UksZ
 zCykfuYrwY9RnG7CZYK7nbxI4u8AP2zpSJnw3qU+y8xa7oG9fReFqm2TQojDep6l9NAu
 oJpkfQE6/MttYu/w/lv4oLd7P6NmqMFkBIusMYArOtaEynMYpNy/Hk4wMLsiK85Tcnvv
 RKpRgCWVlEW2MlQ3hZPH9QID5p57gvuYOwMowOHiD45cYylhGGLq5Ov/K6KHcP0pE0gr
 uh7tQ78FxJRq3u4h4FDlG8ftypcnsKlQu2FRhLJzLAm4X7P4mceTvqGf42l3qC0bFQF3
 ocUA==
X-Gm-Message-State: AOAM533JK46rAMVTA7dcZvm/9Y8D6VS8phX9kwrVlyjZ04ioMWSWHSY0
 VE7r6PzCuYTYtDkEKyRcJ91pBg==
X-Google-Smtp-Source: ABdhPJwR5v3t3SMMaVhIqQAR16N4LawVyHn+LtcegZpMby9QaJRNd0iqM+8fxtiwBZYp5l5Pmt/ykw==
X-Received: by 2002:a17:90b:1c87:: with SMTP id
 oo7mr14470113pjb.159.1639784542570; 
 Fri, 17 Dec 2021 15:42:22 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y25sm11314902pfa.12.2021.12.17.15.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 15:42:21 -0800 (PST)
Subject: Re: [PATCH v3 1/3] hw: Move MARVELL_88W8618 Kconfig from audio/ to
 arm/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211217233006.1466747-1-f4bug@amsat.org>
 <20211217233006.1466747-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <655480ad-7ee6-5ad7-5294-d9d4dc01f6e0@linaro.org>
Date: Fri, 17 Dec 2021 15:42:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217233006.1466747-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 3:30 PM, Philippe Mathieu-Daudé wrote:
> The Marvell 88W8618 is a system-on-chip with an ARM core.
> We implement its audio codecs and network interface.
> Homogeneous SoC Kconfig are usually defined in the hw/$ARCH
> directory. Move it there.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/Kconfig   | 3 +++
>   hw/audio/Kconfig | 3 ---
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

