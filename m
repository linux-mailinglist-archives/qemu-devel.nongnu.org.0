Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606426A3496
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPO9-0003Yb-Kk; Sun, 26 Feb 2023 17:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWPO5-0003XI-9U
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:20:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWPO3-0006GV-PR
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:20:57 -0500
Received: by mail-wm1-x329.google.com with SMTP id p16so3119571wmq.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ymBJ4Rx1oyu8QJ+UtZnJDGSAsV75VAnp69M7Gh9zQGM=;
 b=Rr8PFLE49QoCBY8Ja4blLn3OShJuetZaAHHXL+HP561Ffu9PFPjKL7OZ3KLy0TLJXT
 jgi1nXU1I75mdbbXhMbb4hKQ7J0+RaxTxJ+vu5XE9GLLn3sMqxhfDVgeUngzLL1Ko4Bp
 fFrQDlkIjuXcLqQgobpcuK6x9dgb7e6UKU/6lMaYw42IXjY6cVf0edHR9GP1hlHrULRk
 JYVxMvNWqm8Ituy/TNJldQ9pll/zhd3sNY5FgFNK9BtIczDtUv7Bp9FkvZiCphGh+Rt1
 QjLNSc/H1a/va3sQ8kw16rG5f23kQhQiKl1eKKHxoX+m8mYpsda38nzRwC3s5CQK/OoH
 BQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ymBJ4Rx1oyu8QJ+UtZnJDGSAsV75VAnp69M7Gh9zQGM=;
 b=daBv06IVclw9q1aVCA6rZCSv4Uj44dMYsqX3IuLkm1QxgEAyOJjgeErvTNBVmYkKyA
 37i3mnIY66aG/w34mzV8J0/jDIcqnh/VbgSEIuOu3r7Y1MwNYAeit+1Oq7q9+MKI4GkA
 g6Xtr8/ffdfdZBrGTnvqwfXsi0X8X4BbxKlVzK1gZOpngykLiMyhEvTRkxb4AvgnBknZ
 H9DSL+AupMxjvXcH1JpsPCKq08qrfrj62cCKLTAkiddH52nSCZWnhb108B5phFoL572q
 l38a4wkBO3CIeLGIJyRsTwua3yeDVgaGTpTfgd+Un5SHpdgeP+qIaMQDt69Y1qo1JtmO
 2QXQ==
X-Gm-Message-State: AO0yUKWQe7OnEiswn2JxREKgVe/PI2NtdVJ7lbFeEtsVx5Z6htLMM40z
 7J1eHzfxfXgrIjPnXdhJApZF9w==
X-Google-Smtp-Source: AK7set/rWvR9By+5JlR+ZKOql8fSnI3GMBVkQg21W9hQaoK8GQ1BGsM2jChM7yFWXmo4K0RzCuem6A==
X-Received: by 2002:a05:600c:1609:b0:3eb:39e7:35fe with SMTP id
 m9-20020a05600c160900b003eb39e735femr2253998wmn.30.1677450053975; 
 Sun, 26 Feb 2023 14:20:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003dc49e0132asm11517190wmo.1.2023.02.26.14.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 14:20:53 -0800 (PST)
Message-ID: <d9ca1567-d151-d625-4f4a-93eee00ba4be@linaro.org>
Date: Sun, 26 Feb 2023 23:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 7/8] hw/audio/ac97: Split off some definitions to a
 header
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, vr_qemu@t-online.de,
 ReneEngel80@emailn.de
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <6f0980fdc3753624be6f3935a6ab0a2dc1df4b30.1677445307.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6f0980fdc3753624be6f3935a6ab0a2dc1df4b30.1677445307.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 25/1/22 20:48, BALATON Zoltan wrote:
> These can be shared with other AC97 implementations.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/audio/ac97.c | 43 +-------------------------------
>   hw/audio/ac97.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 66 insertions(+), 42 deletions(-)
>   create mode 100644 hw/audio/ac97.h

Please carry previous tags.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


