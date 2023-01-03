Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2C65C080
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCh4q-0004MT-2y; Tue, 03 Jan 2023 08:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCh4d-0004LX-LQ
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:11:23 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCh4U-0001OF-0E
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:11:15 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j17so24004686wrr.7
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 05:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NGOD5OhRDMRv1WVaYpDLdtI9x6RyjYllPGbRoIs6QXQ=;
 b=qzj0DuNeGRYdGVj6JZZcD+4KLiKEEnY+XaFLsJCm0eZFxd9NQqBxKWDVJwtkOdqsjg
 2jHONizie3EH0EEJu62ypfq6R0d04STOWOFc9ClPjBsvd70fM8M8Ru3sWDu/NMRizrsl
 s8Yag633vUvce5PkW79F3388eKkTaJELZCmp8HUHxIJO+ZbLmwphKDyU/vxeTbZseX+p
 Z72J1OkA/Dw9x2JLbHTtMgbnKK/3zZzqnS0ZsCh/zfciMQc7dI/YLjTyw07OXpFg+mfM
 kZs31nHs8GgXxIP9B/Hr2okcEoER8O1d7F5vxN4BsfqAbkPCY4hc5UDo4ZjEm+JNjlbO
 nlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NGOD5OhRDMRv1WVaYpDLdtI9x6RyjYllPGbRoIs6QXQ=;
 b=6mAxGmbWZj2lCFWqs/areNBGYSJLjII7ETy7DkbeGRR31eUoyI1GsJvjR9MZwLi/vb
 yY/DA+RqvsQHhsFKzikgMIhMXxoFXhfI52j+s39OZCzN5nEXPNeaERGzBslnaJrjCkPL
 1xSMUHyUQQZISmmEuw1kIwyQ+dGU4PX+ClS2Z2/ez6M8WTtfQ2+7+FEVYn2V+Edb+cd0
 tJH4LbogQRyKVt0sfsO2foKVj3xDXe4Q40BvrZC/dW906m4Yna3KFmDi3J+7WUjVa8d0
 K/mhnehA2/GJ9AR6aPANv1fdrbNhejggaIC83LGHxMztdZtJ/DZ1rh0KfF/wHCOszZrf
 uQOw==
X-Gm-Message-State: AFqh2kpb2Cb+GhK5zHFYKAmH31VPQc1yZlmaxokCdUOvvwlHLQNvnye9
 VHLIEuFh5bp7mMJljZ1E3ALDjg==
X-Google-Smtp-Source: AMrXdXuAoK+iQJxdGea/h3gxVKh4228j69rtSU1IX19xGQ1mxoxKSmvt+yeYsX5glZtHuOL0l7O8nA==
X-Received: by 2002:adf:d4c7:0:b0:25d:6628:debc with SMTP id
 w7-20020adfd4c7000000b0025d6628debcmr29218825wrk.10.1672751472421; 
 Tue, 03 Jan 2023 05:11:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f13-20020a5d4dcd000000b0023659925b2asm31207656wru.51.2023.01.03.05.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 05:11:12 -0800 (PST)
Message-ID: <b96d4938-65c6-37c9-603f-170270ac39e2@linaro.org>
Date: Tue, 3 Jan 2023 14:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] hw/i386/pc: No need for rtc_state to be an
 out-parameter
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103084801.20437-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 3/1/23 09:47, Thomas Huth wrote:
> From: Bernhard Beschow <shentey@gmail.com>
> 
> Now that the RTC is created as part of the southbridges it doesn't need
> to be an out-parameter any longer.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-12-shentey@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/i386/pc.h |  2 +-
>   hw/i386/pc.c         | 12 ++++++------
>   hw/i386/pc_piix.c    |  2 +-
>   hw/i386/pc_q35.c     |  2 +-
>   4 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


