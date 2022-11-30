Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9663D33B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:23:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KEm-0003Gm-E8; Wed, 30 Nov 2022 05:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KEg-0003Dc-98
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:22:38 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KEe-0001Mq-LO
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:22:37 -0500
Received: by mail-wr1-x430.google.com with SMTP id h11so19034308wrw.13
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WBXdMjzsXFMMmZa2jCD+9pZh8pf9568khGn0qUy300I=;
 b=ojG3pYO88jOo4hXpfjQyU4m5FuteT3Bkv7fd1H3bpCAsw6smiEVFGUnuFharGGeSMM
 v2kO5sw2hpBQusJqcnezfrtxHhzBsI1PacdTV8qOGBX3AviZ9H7WLFYMCFx7dUoQHdZJ
 +t+RqaZBqCTcA9fmw7dfN+i0FrPlg1W/mGexUP3PyCVoPoCVDR+ME7DEeWArmd2dM8x4
 zqDgl/Oc4P9gtPPiHOfJ/GF2/XysEsbyHwuX4qLPaIMNIiACRk3zQa6fK2v/lwAhbOOV
 i8blZ/WZjbyks1YhZiBPoNgWc7xqs1W90+BFQCMZzGf++jzhUWXGk9pWFRQYm20x0It3
 uOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WBXdMjzsXFMMmZa2jCD+9pZh8pf9568khGn0qUy300I=;
 b=PaSwrj34BjSgb4uLYKCpx0JTxfq34SSn7jiM7jUUzgqdR+TEMK8c4WWL9yE2DWuOOP
 V5pKoNkBDH/QZ+lf14kMjcnkq7nAorpEPOgTpwRf/dzlf/+ttAdVdz3ePMzJ8g1ERBxW
 lKRFXr7lNHlK1QMp+ZAvosAfyEi4OycrHI635ztTBkqoU0BUXf0/TywOAAG2csbDDZrh
 2c990fpxeykQiI+yvPcg8iMJNKKZr7nlyFFtTXZcXzTLkx4sK+YM2K+7IX4hgO+VSyUu
 Y1pa1QaUKl0CFatKqTt+LfvDEAMn9tCiSf1BrxslnIfABrVu7hP2LNTeTj1sA4XtI9qC
 wsrg==
X-Gm-Message-State: ANoB5pl3vqaqmHq9heYu46I6ibB4kDfD50DhOEUXuzLfNZJD73KxhlBA
 B8+3iVwaEWdbWv+vakeSG6qPrw==
X-Google-Smtp-Source: AA0mqf5hF6qwFE8dwMhHyCShl6Z57Pwg500ASY3E1e4I2HfBg10xCax5eBYLLdQ9XafjNcf98LDH8g==
X-Received: by 2002:a5d:5305:0:b0:242:25e:e731 with SMTP id
 e5-20020a5d5305000000b00242025ee731mr17346852wrv.48.1669803753109; 
 Wed, 30 Nov 2022 02:22:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c14-20020a05600c0a4e00b003cffd3c3d6csm1453780wmq.12.2022.11.30.02.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:22:32 -0800 (PST)
Message-ID: <422c6c65-b861-b988-662e-9b1101a7966f@linaro.org>
Date: Wed, 30 Nov 2022 11:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 6/7] hw/intc/xics: Convert TYPE_ICS to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125115240.3005559-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 25/11/22 12:52, Peter Maydell wrote:
> Convert the TYPE_ICS class to 3-phase reset; this will allow us
> to convert the TYPE_PHB3_MSI class which inherits from it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/xics.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


