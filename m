Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A22FF797
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 22:50:52 +0100 (CET)
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2hqt-0008Io-AD
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 16:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hpp-0007k9-Eb; Thu, 21 Jan 2021 16:49:45 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hpn-0001n6-Te; Thu, 21 Jan 2021 16:49:45 -0500
Received: by mail-ej1-x62c.google.com with SMTP id a10so4762267ejg.10;
 Thu, 21 Jan 2021 13:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NZRv8c56LxDFfvf4ediy/CV9SnfkpLYQikuf+TGdR8w=;
 b=fmIXTZXwnAzzIhvMdTjwJFBKWV4jIQXhIGfOsWt0r626EW6yajkl7jGB/ey45+HHgA
 q4mWc8ZjcsUc0wJP0fP5tBkf+GP2cvI5ReghIr+AmF5AEsOahw256Ph4RIIArW7ncN7l
 VpmmbySO3G4JhTgI1Tf3jB73A90HXvU9hK570O4mqoCAWLga9ZFvAOrt7RGF5cv0ebDN
 UNd/0/VyR7P1hgnzaVdo6ZvTnN6m9ywp8y7ZADG10NXhpAtimye8Y4A6y2ZacCshp2pW
 qu7/Mi+126cRtSbxxM+3/SUcyAtgcTwHy06gTDlUfuZ/O+/QltFBeKqnoDxjRviOlpFC
 XkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NZRv8c56LxDFfvf4ediy/CV9SnfkpLYQikuf+TGdR8w=;
 b=uKmI2dZI6vA+E4+XPGGXURxSMFFNo0+q07YMbCJ/cntvEXm2RGpk5sP64k76D23GyE
 Xb6ftWX3KoY6jnkr52DZtP938El1G4pEV3uGRBIj5ysPvsJQaUOO1Rn9fm870TFGqXe5
 BaJ4EmjgRdpQ3hqAVCpTYZ/6oyDLTCDDJ5v2YdWL88FVC5KLvyegTnrZqTExGf0YUaRk
 zF1tPGP7cbG/YYksthH1RfOXpOcbqbTI5FULY7YacUXxXZ3CXDTpri8+1YdKkrlf3Ocu
 K6LZqF8WT4lt+4HB/16phJiCOzSZXQFV6I87cNUQ+LzIfvD+cwnOaGYjkNBWbMqyAxIq
 XuhA==
X-Gm-Message-State: AOAM533lMJ+6BqbV5woDKrZ7xQD00jrNuRzr9D0oIzSWUYI04klLQqOS
 qarkdfoVcNTJjEdjcsLJNcs=
X-Google-Smtp-Source: ABdhPJx9/Evzjj6GxD8jpApr1LvN0L87tPEAYCUPAwpvsQPNMEky/1VxfrCx3r1xCPJGSB5RDP2UbA==
X-Received: by 2002:a17:906:11d6:: with SMTP id
 o22mr1039569eja.106.1611265782143; 
 Thu, 21 Jan 2021 13:49:42 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h12sm2869385ejx.81.2021.01.21.13.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 13:49:41 -0800 (PST)
Subject: Re: [PATCH 08/25] hw/timer/cmsdk-apb-dualtimer: Add Clock input
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <34e1d477-ccb5-2dab-ede8-54349e1b1cbf@amsat.org>
Date: Thu, 21 Jan 2021 22:49:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> As the first step in converting the CMSDK_APB_DUALTIMER device to the
> Clock framework, add a Clock input.  For the moment we do nothing
> with this clock; we will change the behaviour from using the pclk-frq
> property to using the Clock once all the users of this device have
> been converted to wire up the Clock.
> 
> We take the opportunity to correct the name of the clock input to
> match the hardware -- the dual timer names the clock which drives the
> timers TIMCLK.  (It does also have a 'pclk' input, which is used only
> for the register and APB bus logic; on the SSE-200 these clocks are
> both connected together.)
> 
> This is a migration compatibility break for machines mps2-an385,
> mps2-an386, mps2-an500, mps2-an511, mps2-an505, mps2-an521, musca-a,
> musca-b1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/timer/cmsdk-apb-dualtimer.h | 3 +++
>  hw/timer/cmsdk-apb-dualtimer.c         | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

