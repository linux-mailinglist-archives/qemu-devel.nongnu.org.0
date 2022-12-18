Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764256504D0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71KP-0003DP-35; Sun, 18 Dec 2022 16:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71KJ-0003BZ-Ts
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:36:08 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71KE-0006EM-Ss
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:36:07 -0500
Received: by mail-ej1-x634.google.com with SMTP id fc4so17416116ejc.12
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n41MB0Vgi3FDCs93Jx5E/X41nQxlhk1zZ/U2ad/7cIo=;
 b=vBCHhM4MfLOx0O2SzeNW+xZShJ7gbtUC11Sh3VdwHxrNZB6FbB6cVojs5lej9HVNIt
 q/fo+GRItEkGL0ElaGG/+vF578H+7bgFWCHkcSMxcYH60Lnsqj1CrfcOVSRxqAZZeBM7
 NiH4NH5az5XdZobHtJOpuik3bT5N9ZBANoNeHiPTJaNLf/c09gvWhsKOnYmW5OGi1NY7
 UKNSVbQchYd67kUZOCFwU5pH33jwzxo9H6Lbu+oNz4DR1L5nVm7a8NMfi1P0KLq/YOJY
 55/VrXFodwvtbTqAr/j/XErl9LRwyqDLchgI4U5yCW5ENRhrS6jliAo4tSNYcrSpYr/q
 pZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n41MB0Vgi3FDCs93Jx5E/X41nQxlhk1zZ/U2ad/7cIo=;
 b=X0SWBGvUP7ynSPGn9FwUKbG4RXN3Y2xfbmW7SlfSO5SlIWnFW3F3W7NNWtNrv1IFZ0
 dJMwUsGg3z9j2oUA/a+9OOQ6xY9eqefsq0lfpQj+QyNCKpYnrU9VzQge/m+QiN/szof2
 g/kptvi65SHxBXWssFpp5wscKI0X1xHIFq9F3qzDGjgGxNI6QdkTtVC4mnXwQR+Pv85j
 JSGkpO3pXsvgkBm6Pba2SENkGe5wLJ+TKd6lxs09hP22W/jtZh5/CIYIFoZrIF061D7u
 +rWu0CnTLJHTPae/efxijS5mIoJzY0GDslHh+9e3BdUcMaMOpkFe9iYoTDCd5nSrT3yx
 SRyA==
X-Gm-Message-State: ANoB5pnxyBPVV+P4VevWwmrC8DGZiD3YISXoc9bf6qyMbzsBfCfVcUY6
 Zcla7McocLc2waEhP8aGKxPbVg==
X-Google-Smtp-Source: AA0mqf451DED7H4ABG3DixKTB4zKzCdaatVN7NebOO4ZybLgE17aTnFysAisqiBp7dab3VtoUSzryA==
X-Received: by 2002:a17:906:9d18:b0:7c1:9aa2:a36d with SMTP id
 fn24-20020a1709069d1800b007c19aa2a36dmr14597107ejc.5.1671399361211; 
 Sun, 18 Dec 2022 13:36:01 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 3-20020a170906300300b00826afe264bcsm330176ejz.194.2022.12.18.13.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:36:00 -0800 (PST)
Message-ID: <b0465846-2c31-1dd7-8018-aaee86e35244@linaro.org>
Date: Sun, 18 Dec 2022 22:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 06/27] target/sparc: Avoid TCGV_{LOW,HIGH}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213212541.1820840-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/12/22 22:25, Richard Henderson wrote:
> Use the official extend/extract functions instead of routines
> that will shortly be internal to tcg.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 21 ++++-----------------
>   1 file changed, 4 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


