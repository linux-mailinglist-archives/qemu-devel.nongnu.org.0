Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B36775F1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:00:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrjv-0005US-Bi; Mon, 23 Jan 2023 02:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrjr-0005Tw-0I
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:59:35 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrjp-0005av-EF
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:59:34 -0500
Received: by mail-wr1-x429.google.com with SMTP id b7so9942928wrt.3
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 23:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=llL+2yPoNeriYESGtAdbjIlGQ/tTcsiJTrw1Wy1rHbc=;
 b=PjH5SQFWnorwIkBkvnhUrdUvMmutKTmWkeyTO/PlBP9WO5J+QpToZBUz8gJPReaU2p
 Elk9aVtaah6YzzrOJNxAH9zuan0qMHGFSAdAJ2S5W/bDP6mkuaTwECqt5Ja5GYJoyM+m
 d1/puNG6dbeAE2YnvvCV0nCinrOcT6Xvc4mWblbiinSTlOorDF5j7oU5jfeTKO+AZO07
 NDvNPGePwhfRiDBB8MJKiwKqPe7xkrmXVC5c02RbqR4UJ/saBcwaDh5gAfq9U2st06lU
 eDcBIzeJahZ9N0SKiEDkCUuUDP1aQox19TjD7KsUMl/lcZdNDrmSqYuH0Xo7ItqSW6C0
 g77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=llL+2yPoNeriYESGtAdbjIlGQ/tTcsiJTrw1Wy1rHbc=;
 b=4aBDe9bx1m1Kl54Yb9rMq2wJuMljmuLtqLNSysxMht0tqkoiBrbV4kwrfTQ5QoQl8e
 yPGgwKZ6QUENtJzm3E9q5+NKA1FUnROP7f7e/ngz09lzlDYfwHAu70UvfXmwOh9DwlDK
 O8e23+cXK2V/MZ9IVKSo+Y4BU3swfGzx5ujQvgUsv85RzH9766DlUJeWl2Mf7RsOvu15
 ZOYAjd9HcmLmhZWMl6oRml/Ooi/xRRhbIVDy4SD51n860mqz68kxM5VzfpQjIPYfMgbw
 v94QuCiYrIhzRGNTYlW+HNFFeiYXWz3lKIVeL5LWM/vt5vn7iadfSikOJp98um++vcPp
 rpSw==
X-Gm-Message-State: AFqh2kofXtEwwZM9SRHBrcR53Ge9s2xD7ecMLcihZQjDpEEgCO+plqwm
 wRJabVZDGgxHFf4XXblzKEczCw==
X-Google-Smtp-Source: AMrXdXs8S/3t16H9+Lq9JX151hxAtVs4CNhsgd/f3m1TCq+rTws6MDAIQuFxylkFzymgaSw/jHdQ+w==
X-Received: by 2002:a5d:4289:0:b0:2bd:d7e5:82fd with SMTP id
 k9-20020a5d4289000000b002bdd7e582fdmr15851761wrq.15.1674460772074; 
 Sun, 22 Jan 2023 23:59:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4fc9000000b002bbb2d43f65sm2448437wrw.14.2023.01.22.23.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:59:31 -0800 (PST)
Message-ID: <a2720373-3012-e4c4-57e5-c585b34075b0@linaro.org>
Date: Mon, 23 Jan 2023 08:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/7] hw/acpi: Trace GPE access in all device models, not
 just PIIX4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230122170724.21868-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 22/1/23 18:07, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/acpi/core.c       | 5 +++++
>   hw/acpi/piix4.c      | 3 ---
>   hw/acpi/trace-events | 8 ++++----
>   3 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


