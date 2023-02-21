Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579E69DC97
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOg6-000124-BV; Tue, 21 Feb 2023 04:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUOg1-000110-CM
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:11:09 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUOfw-0007D1-O5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:11:09 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c1d0700b003dc4050c94aso2657381wms.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qV9Yrzt/UBdy8UcrPwGPmUj1t/AGD0v0PviqroBlFsM=;
 b=Tx075h4LKu6cXKimS0u6vVPjE2jK+ON4IYyvg4A/Rn8eI+DD16jw7yYzJRK9jvZ/de
 Rie16FEgb25GKW1ZdW+CbeYoLcaBUs4YxEFDMt9Blz6baGGugaHYIHifajTqPfs2WgIY
 gllOsHukp51GABJusrKkvF4A34GPUAJtXqpm/jZVx0ciZEwFb4JDKWykEiqxFKZq3WI+
 rjT/k0RGyq8/fzJ+ELDZi88HebJDmg7ZzcZzKC7TeePvJZoC2p6NH7z0bfALM2qTweDd
 OIF1GlZFe63MLh1GOExaZ+6VC1uXArM2BgZ42tBPuahAlGA6cEW/5gcBWLONNaUJDMrP
 ZrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qV9Yrzt/UBdy8UcrPwGPmUj1t/AGD0v0PviqroBlFsM=;
 b=bFE2j0Cv8Kz8jchtk5H/INvtPgZ+Yh2bTpfWgHeX7hk/AszMZfFsgSBiNuO829szEa
 36qjKdoKsgi2MQVGM9uEdY5NpVGW1w+KqI4eREkdXM+BfjMl+VGY3mfzHfeycRR/PLzA
 MMIAhKS9sQ8VVIhwuzIhfsGA2dP7LOaiMqGyuG3UxFL4fG2L9zxFIn/yjOzP37n/tvwm
 wK40CCIqQ0k936P7Dw2fGEiqqvTpR4F7jcvQbqGoGKr2qHfoQ6g3AKMXdgCaVW2DQzCc
 yUvMPoC2qzxZC9yZj63XOlkjQ8wXhHcIwhh3GQtMUWmUUIT+7lATIiNIhjAT1NasJfQa
 dzyg==
X-Gm-Message-State: AO0yUKWPgqT0eo76xtLJtP6yqnj+59hR4kHCLryRpQ4UAzGyIDjJUuBV
 FTkQe8Qmg4yPBgmm5U5gn0Mh/w==
X-Google-Smtp-Source: AK7set99HuNzNbXPcwqErZFqRfkihBjoxtA5oUWiRa690s4vmRNq4wSnmEUm65mjh3h/pjd3F2y0RA==
X-Received: by 2002:a05:600c:170a:b0:3db:331b:bd57 with SMTP id
 c10-20020a05600c170a00b003db331bbd57mr9557642wmn.23.1676970662796; 
 Tue, 21 Feb 2023 01:11:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003e7c89b3514sm1117595wmc.23.2023.02.21.01.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 01:11:02 -0800 (PST)
Message-ID: <eea44df0-80ad-765a-e5ee-843d06d5fa58@linaro.org>
Date: Tue, 21 Feb 2023 10:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/9] simpletrace: changed naming of edict and idtoname to
 improve readability
Content-Language: en-US
To: Mads Ynddal <mads@ynddal.dk>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
References: <20230221090104.86103-1-mads@ynddal.dk>
 <20230221090104.86103-4-mads@ynddal.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221090104.86103-4-mads@ynddal.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 10:00, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
> 
> Readability is subjective, but I've expanded the naming of the variables
> and arguments, to help with understanding for new eyes on the code.
> 
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>   scripts/simpletrace.py | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


