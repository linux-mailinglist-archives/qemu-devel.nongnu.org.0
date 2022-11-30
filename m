Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DCC63D309
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:18:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KAN-0001Sb-7i; Wed, 30 Nov 2022 05:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KAL-0001Rr-62
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:18:09 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KAJ-0000cm-Kw
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:18:08 -0500
Received: by mail-wr1-x434.google.com with SMTP id h11so19015747wrw.13
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9RPHJyhrQiUPw3sB2sEFiXlKkpzxOBC+npY5LGOkozk=;
 b=nGSBvJEYqRV6ZNI8XPpMMlQUoiExTtBmyRw0HMDVGAxGw2jN5KJtraTypDujadq9+l
 AXBnZq9yR9/2iLsN7eiJKNueuEkCOYy+tkFRvaNP3XcTo146AuMmH7rW9caMWIGWSf2V
 qsZyEY9IEkwcJiXDwitY82oSxgOYwFzYJdZMm9TeDtIj8giB2SYeycuoxsp4q594r7U0
 Y4xmruhTxLqBzxDCKXwz7scItqZAFB1OoJXP6NS8mZcpCvx/mBRwsH9KlBo56OD4mx0G
 83lLev9r75OL78/4s7vKDO/nyuvpEKoFxekdKoHPYCwl+L0jyMgwfoqKhpS0pJMj2ZR3
 goTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9RPHJyhrQiUPw3sB2sEFiXlKkpzxOBC+npY5LGOkozk=;
 b=tI7kV/J0Ewg3nV+7SVw8oTTO8lN3GrFZ0I83B59hUAKczoJI11v9HS0RBVpSXegAML
 SftA9RcR2V0i7WODPdR9LANiFCBG1LYr5vuv9qDa82m5lhLYeK7OtuGwkw/8ZkV2l9x6
 CjdNqvv2LWcKO9amV64johpbLIsv6eUH6h3acIZ2GkEU92plPC2ElE+6K/H+ESGMwss2
 n6G5z4sL0uL0cGwobO0JsDahzGWT+Nd43p04v4In/CttvAF7Xo442ASp0Tku1aQHh6WM
 epYaix4HCsHmdWbYnMWMQhhb5aD3IFjXucQlzjp6kE6D8BXesy16VJ1Mo0t7dhQuOqHx
 8pHw==
X-Gm-Message-State: ANoB5pngNBoF6UZL13jlxR9XbdyQosX5gXfjhDsG32Lgnf2j451SYkjg
 vFiXAWKkh91bPuBSuN1XbCe5Xg==
X-Google-Smtp-Source: AA0mqf71gs0XXJOdgcGgywPIVywx5fdUfTMNCCKNMyTIDqBNahVpI1N50ZHUwpcRhBwbcv9EXQmpoQ==
X-Received: by 2002:adf:ffd2:0:b0:236:59ab:cf33 with SMTP id
 x18-20020adfffd2000000b0023659abcf33mr36860741wrs.568.1669803486283; 
 Wed, 30 Nov 2022 02:18:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b003cf894dbc4fsm1449727wma.25.2022.11.30.02.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:18:05 -0800 (PST)
Message-ID: <cab0d750-3d85-ae6d-29d6-d811a59063da@linaro.org>
Date: Wed, 30 Nov 2022 11:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 3/7] pci: Convert TYPE_PCIE_ROOT_PORT to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125115240.3005559-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
> Convert the TYPE_PCIE_ROOT_PORT device to 3-phase reset; this is a
> necessary precursor to converting any of its child classes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/pci-bridge/pcie_root_port.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


