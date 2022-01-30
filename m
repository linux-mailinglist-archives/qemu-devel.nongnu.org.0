Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68314A39D3
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 22:21:56 +0100 (CET)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHdz-00018C-Ta
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 16:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHcO-0000Ea-A2
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:20:20 -0500
Received: from [2607:f8b0:4864:20::52c] (port=38894
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHcF-0007pZ-0t
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:20:11 -0500
Received: by mail-pg1-x52c.google.com with SMTP id q75so10402281pgq.5
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 13:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/uczNb1jDtmHJ1hubUuMEddpxluabZsLv2MJZ7ldSvg=;
 b=r64IXfG9eoH9SWvZU+pboewriFZdvzu1xV8WW0xhxjo7NeHNswSSB+Mi2sP9S/Wo3Y
 /SwwXGRW3Gh5lt2YMJhMgLvd3El163FrJ/f+oDwRocCy5VelSlfXr0OQ383EmD79RNLz
 0c6gw+Q6poqvD/pD0WMuDI9xPtqjMnvHlW3FDaebIfw2H4n3/Y9/t0CD2QCRLadQnRNU
 +NLmDtngJ/qh7Yh230OUk25fLk5nKTvkG05A44cIhCr+oujbOUpDujH5r0hmocThXB5f
 snCgRjjJ9ymcXfHmy8Kik7oSfj1yES/ZyOOnhrWMTZ21SwzQDheXfcpBfnZ39WGNAsk6
 Zplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/uczNb1jDtmHJ1hubUuMEddpxluabZsLv2MJZ7ldSvg=;
 b=4kJZ5UBzr2Q1OsFoBdD+6d5oEF8sIF3JPqE5MqHg6xmQX3i0qXcGP7qlwFmGYH/NXU
 PH6S3JJCsn9FSoG/nBHwmAXtVQ8jnC8v+ofG5xc2+dHsM8H8aa9T1Nu6tBq0kMUvVB8e
 xZSyK76yaOEy5J6Q2+HLrWY3inXUpUC3EsNl34Ffu/DrYet6lopSnBlxSwfgve12Ax59
 IElFpFnulYqFB4ibE8BnLUIVGigGanumw30j2HzyC5GJEhjWyhK7Fc243RCV9P18GmBC
 2/9FgXEwNu0yIykjBJd7J1kdoLAp1fw9MVYfSmnskYywxOTKjB6QFC3RzgtsC9Hp6Jbw
 DDLQ==
X-Gm-Message-State: AOAM532x9lOhqppsQLNEhx7ACPNgyGxLiaBRLETwp0zv5jS8NhOWgQ+I
 tJPQiTsOBW/ug5LBfj/b8DZDoA==
X-Google-Smtp-Source: ABdhPJxRAc1bdArbJpfDgKc86qVbskVCwkC7gbGdxMSC7yPOjz/fjZDqPT2DQaWUCoOJd0m4jykfyA==
X-Received: by 2002:aa7:88c6:: with SMTP id k6mr17628782pff.68.1643577593986; 
 Sun, 30 Jan 2022 13:19:53 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id x187sm15980663pgx.10.2022.01.30.13.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 13:19:53 -0800 (PST)
Message-ID: <78170fc0-ad21-168b-9ad6-1c34b26a6f41@linaro.org>
Date: Mon, 31 Jan 2022 08:19:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 36/40] bsd-user/signal.c: implement do_sigaction
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220128232805.86191-1-imp@bsdimp.com>
 <20220128232805.86191-37-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128232805.86191-37-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 10:28, Warner Losh wrote:
> +    if (block_signals()) {
> +        return -TARGET_ERESTART;
> +    }
> +
> +    k = &sigact_table[sig - 1];
> +    if (oact) {
> +        oact->_sa_handler = tswapal(k->_sa_handler);
> +        oact->sa_flags = tswap32(k->sa_flags);
> +        oact->sa_mask = k->sa_mask;
> +    }
> +    if (act) {
> +        /* XXX: this is most likely not threadsafe. */

It surely is -- we never set another thread's sigaction, and we've just blocked all 
signals, so we're signal-safe.  Am I missing something?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

