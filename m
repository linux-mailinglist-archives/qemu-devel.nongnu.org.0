Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5230C30E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:09:22 +0100 (CET)
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xIv-0001xY-9Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wyG-00007S-W1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:48:05 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wyF-0003kI-G9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:48:00 -0500
Received: by mail-ed1-x532.google.com with SMTP id s3so9496513edi.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HH/qTnEXS4eUhHqtj8g5Cw+sUyE1oSiIG7BsA5dW7g0=;
 b=pMUymucvZXB28J1ctpUB/RuQ2xgdNeoPvtXuXB736ur6l/3ehY/NWYDBPCCY98YlJe
 rRC/ux/w+wG9HU+U2KINWcEVSsLUhwnApQNhDBA1Klf8KtP05SiD/IwHLTDySueYNiJ3
 Vjd8EEv2bGX3vqv7px5wLuQSxuM+LrcIrOg4KpMsxhryFVJYt1CLZo+KMk3RsGhkTsIs
 ZkZ1hKma1089WdSaHdf4mASzLseOuwcjoZnDwBjc965G3LqMbeJAh771zD29zd6NrWAk
 FwqqR3P7GF01waLFN5qbV/SGsAc/fqvtyxrJqwDPXb7oyS5ONq1ud8iGgX9u6NfJeIvO
 aDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HH/qTnEXS4eUhHqtj8g5Cw+sUyE1oSiIG7BsA5dW7g0=;
 b=UTyPAW30yP5n1VrwjhcWNCYOMnVVpavu6x2JVpn1QUrl73vcuF4EfunhggjfXwyAWe
 v9ynIj+h56c12IVP4XH8kXXcQSUbSi7BTy/VXjkK8WYiniUV9js3dYHQ+ojpXTx+aPQ2
 +yIOFCta0ni2zJL0uz6oC4mNtzKfHoQPXul4EpMd2p1OB8jUXrdKa/QnfwDWWqiHtcMU
 E3YQMC6yz4/sGORGho4ZQvPRIDFdrb6Js+Pq8hp9AXSY7VDM1pNpQzfRaLYDkmGNsjfb
 XiEk+47B/WxGOu9L7ZPnm6OrBdEDr3JIoLzOkQ5dl8tgJBEvE778oOwvCU3+orEu7y97
 14BA==
X-Gm-Message-State: AOAM533ZRSlFVb3/ICElaXHqE3fSVcUgokSRhm7phs1Rqc2LdR7pWmeM
 tF4KSzuYkFx9U2Cic32pKgdwyUZcPRN6kOe4Rnmo31hFqyM=
X-Google-Smtp-Source: ABdhPJzSakfIFJOhGdnKPZWPtU/3hG7OIr6KcG/HfXf1DCGowNXikvcJNYnaZI5QvfXCYzOq0CQ+YdATDs5kzQj8hD8=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr23596989edb.44.1612277278299; 
 Tue, 02 Feb 2021 06:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-23-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:47:47 +0000
Message-ID: <CAFEAcA-TUeDMqcWcUWVcwboi+pjUj1jZnvwj=ynaeKKaVcmPyQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/23] target/arm: Enable MTE for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

