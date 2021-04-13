Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14935E4AC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:08:14 +0200 (CEST)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMWL-0003dA-5M
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMSX-0001gS-S0; Tue, 13 Apr 2021 13:04:17 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMSW-0007qN-B1; Tue, 13 Apr 2021 13:04:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 b136-20020a1c1b8e0000b029012c69da2040so1754618wmb.1; 
 Tue, 13 Apr 2021 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1SiDznujmph2PhKe0GmO0eFLJOamtyyulZL/S6s0YWg=;
 b=h0GnWojaCwyQAu+w0cMKVur22/8E25BgbQP8jNeOQ0Gt6Frx6ud1eXzShrg5Cnx84o
 qe9PodaaJtczYqdJ7FCgkR8+ergFPH9BeNh2AtHjIGtvwDbSdm9vDzedsDQh6B+N+6pk
 6krCCWOps7daXTx06njgjBOgmwPQRd0bQtM20Qx7omDKr/mo2H9LWtO4s8WPxIHhsxNc
 bE68MO8F6ZNf5uGyFf529cP10cb65+6E/fVbBjoGwa9JIaPsL3lV56/SNIyf6SQMOHh1
 6r75bYVxgmQLFQIRAKPcZLczcWrZ0sJobjlhSk2hjX9yFJeRPE2HHeWCShQwBc60pZZ5
 kNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1SiDznujmph2PhKe0GmO0eFLJOamtyyulZL/S6s0YWg=;
 b=Vw7x/XRiktxlHONVaasXIjiQa4OI2r+3F/VGaqknLA5SeJhmgOOrMP8jQ9s9sCwEbJ
 NHubYCWxnpFwEyzgi4XwvMR5ntU20Jt1c+oyrxC0lDEjyPkqZqAVUJn7gscRiRfHL+Bz
 1VbrBhaiv7Ds226JGZJy+gcH24rxJA/LfP06pp2bcDeevQ63YI2fBkB9QLE4ZKwa4eca
 IE+e7aWoCGdoKUTCMWrTOe8fRPPZcxg+gxaq164rDxXplYIDHHaa0HgEfvFzQU462zwL
 OSKfPGipwj5Rm90D4UcXbjafsBhwl2/RaIaYV8Qdv9veLB5ybFJA7ZikUD0oMSY5tF/l
 y82Q==
X-Gm-Message-State: AOAM533YXresrVLfyjWyIGoGLl5o8jkuioeFkKfv87BpCgB7+tTqcNwa
 nA68CFnQSSbM3hU53eOhRArJ0VVEq7g=
X-Google-Smtp-Source: ABdhPJzMmrcF2BQTmU16WC7XioMDGlbbrQZ72J4nMA1eEznYoT3mT1vomY/PpDaNw8LaDXi4yvCICA==
X-Received: by 2002:a05:600c:3546:: with SMTP id
 i6mr917313wmq.104.1618333448761; 
 Tue, 13 Apr 2021 10:04:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r22sm3027164wmh.11.2021.04.13.10.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:04:08 -0700 (PDT)
Subject: Re: [PATCH 12/13] target/arm: Make functions used by translate-neon
 global
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5b36da8-ff3a-5ef9-d169-5268ad34a449@amsat.org>
Date: Tue, 13 Apr 2021 19:04:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 6:07 PM, Peter Maydell wrote:
> Make the remaining functions needed by the translate-neon code
> global.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a32.h |  8 ++++++++
>  target/arm/translate.c     | 10 ++--------
>  2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

