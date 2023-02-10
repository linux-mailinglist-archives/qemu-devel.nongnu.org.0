Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2E691F42
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:46:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSmO-0006Va-Kw; Fri, 10 Feb 2023 07:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSmM-0006Um-FF
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:45:26 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSmL-0005BF-0h
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:45:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id a2so4958661wrd.6
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0fSnH1e4vyd2u4Kryqx30mRURqd4lKi6QXrHiBpdw1s=;
 b=J8JlCuZYTh+hV/zbDLNGUIYLAst+EWpykoyqRcl//txtLxFtff1UQT6kNpk7M4gtGI
 d7C+i7G5upIkEBXdntNuvl7ltMNpbvhDbgIPLE/djkf/tvuFB4yxRC7tSpmcOUYOwiD7
 l743THN21Qjq/rh8iCbhbdKemhMfEyX33TSObtU1D5+e1FxkvyPeZRiI57HN2qVsDJoO
 BpXp4HKY1cTjqptm6GRP+nAhfvmVj1ys37HCreoVGeFAuVpfImDRM33LOZWlW7cCwOMQ
 7ouuZgCJWE1CYbLx24iIUv7cHxdqJAOLflHOCNaNIEFORLuVM4efgbuBk+aIZ0WPM2IY
 E0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0fSnH1e4vyd2u4Kryqx30mRURqd4lKi6QXrHiBpdw1s=;
 b=HyFiGZ7jq1JneSdxz19lm2p3Wb/UmzTl6UppvkgHZhlLYzA4YVzTaRuwHkBq5PWyN3
 V2FYDmwcaRcZFN4QeEkJSFC/kluVrgU8C1/CMCaDIVqUW40jZfHbA2texH5KT2eTAP3I
 Hquyrl5WlvG2gQIXnRD4P1ALeXG+B78DwCDPyb7QBEWXBBZSj5XOv6lrqNPDXFYbM0oS
 efcQX7yoxOBuPOjBxoCVp0miDSkj/XFo7/QFqLmbzTfDQ+9MVoMiPIFuckrPqdv/i8ZQ
 sOZpawtPd6/i/U58WI7ILwh6on90NJ22A2KBs2OD32cPWT53cyxYCeqpZbUSj5aPCzKy
 PzPQ==
X-Gm-Message-State: AO0yUKWePuMWGDlksyKIIZhCJAUTIKG+piX3Ysimqyl+6UBXXJZK2atn
 +hRY6qNcT8HvSrT7cfPvi1cMeg==
X-Google-Smtp-Source: AK7set/J6FxMFQ1jau/ankFu1DXRadpO2AsUdYuE5mtyAsMo2HwU9ylbZZGoEyZskPFQj1rz4ew0sQ==
X-Received: by 2002:adf:f145:0:b0:2c3:ee0d:563 with SMTP id
 y5-20020adff145000000b002c3ee0d0563mr16133249wro.28.1676033122576; 
 Fri, 10 Feb 2023 04:45:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d4a52000000b002c3f210e8c0sm3682578wrs.19.2023.02.10.04.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:45:22 -0800 (PST)
Message-ID: <09b35ac7-367c-d039-b544-70b5cb1ab795@linaro.org>
Date: Fri, 10 Feb 2023 13:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] include/hw: Do not include hw.h from headers
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>
References: <20230210112835.1117966-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230210112835.1117966-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 10/2/23 12:28, Thomas Huth wrote:
> This include is not needed here, so drop that line.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/ssi/ibex_spi_host.h          | 1 -
>   include/hw/tricore/tricore_testdevice.h | 1 -
>   2 files changed, 2 deletions(-)

Possibly more?

$ git grep hw/hw.h $(git grep -L -w hw_error)
hw/pci-host/mv64361.c:14:#include "hw/hw.h"
hw/ppc/pegasos2.c:13:#include "hw/hw.h"
hw/sensor/dps310.c:12:#include "hw/hw.h"
include/hw/ssi/ibex_spi_host.h:31:#include "hw/hw.h"
include/hw/tricore/tricore_testdevice.h:22:#include "hw/hw.h"

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


