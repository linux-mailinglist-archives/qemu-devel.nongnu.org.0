Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68949DBF7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:52:10 +0100 (CET)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzZh-0006yK-KA
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:52:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyQh-0006GI-TP
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:38:48 -0500
Received: from [2607:f8b0:4864:20::42a] (port=36518
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyQZ-0006GM-FI
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:38:47 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 192so1796978pfz.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KV1WDV2Duziybhz9qXTMnHmRat2gObZb4IzBdgAcnmw=;
 b=k1c1ZBPU7pS4nF77qJPXNrRsPDKFRgqEynnexhBwqCKfIh4d1RY9wuAd956uh3ClmC
 AthTsR+4KgrvbmTu1DZKgNWku1OblLzi94jNIhGoRBaxyQk4nMPC7C6asjjX6lGSV2Tg
 asGAsFJ4Em9NXSP2mDg1RvK2oSOXdfPQaEam0zl4/tk7E5rB2PKXu4vCib/W6T0oyWa8
 PUAOrUdNIZQ0Pr5MRMCnAPFbxj7+ZJ0Hs3nbxulDSQdorovXJIp1Ma0fuh1CWJFPeULU
 AmYp20DNWZ4nOdC3UhOlYnn7iJ/hoTMTUHuV9Gx/nEH5KlLsZoYyIZ9bdd6x/6rJrZ2w
 H3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KV1WDV2Duziybhz9qXTMnHmRat2gObZb4IzBdgAcnmw=;
 b=btwpdXrqJS4vsk2B74LEp4YE2ePT1a9RbxadXdG7rM1K8YYi3wj90LEbOZgxf3VPLk
 3UFsGddkhHnkWyN+Xsmrn8+dV8s4iNr2cDkR3CKXCiHYGx7BazkvgjSlQ2wjiz7wEDRT
 t3jj6E92mlFtgSmvF59FVW7Nqumx813U6hAzvmCq+w4uws4zZQ9grRQXzI0oNaOSsBKs
 cPG6b2NSdfFhC4Ib2SRGkohBF5bpDXLS+ocC3vaIEAqIBmchaGm4rGiQOl6tSf69zccy
 FKI37OQnT72RIGhXjndG/VNcT0rw2blEs04ju5xeQl4sb7cH493XEEHQXsTZWcP4Lbha
 fXCQ==
X-Gm-Message-State: AOAM530GIKu/sMCMUGKLCxmGPHdaYAUobZWggFwtkbuzNA3Ni3ciw6bl
 jAvRcKQ2td98by7r1bHVdv9iMQhGhV7/m7L0
X-Google-Smtp-Source: ABdhPJzcOgit9ZajTz2I0qznJPgVt8CpcFDQYZchm1V6RPKi/6dHc+PuA3g/PUoWzaOHs/JZkkeZxw==
X-Received: by 2002:a65:4088:: with SMTP id t8mr1754672pgp.241.1643265511523; 
 Wed, 26 Jan 2022 22:38:31 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y3sm18076639pge.60.2022.01.26.22.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 22:38:31 -0800 (PST)
Message-ID: <a67e8309-f697-55e3-99cf-3777a43b63ba@linaro.org>
Date: Thu, 27 Jan 2022 17:38:26 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 19/40] bsd-user/host/arm/host-signal.h: Implement
 host_signal_*
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-20-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-20-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Implement host_signal_pc, host_signal_set_pc and host_signal_write for
> arm.
> 
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/host/arm/host-signal.h | 35 +++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 bsd-user/host/arm/host-signal.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

