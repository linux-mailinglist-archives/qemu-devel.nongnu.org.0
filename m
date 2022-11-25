Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97E638BE3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:10:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZP2-00030q-BJ; Fri, 25 Nov 2022 09:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyZOq-0002xf-4r
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:09:52 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyZOn-0001MM-Jp
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:09:50 -0500
Received: by mail-wr1-x436.google.com with SMTP id n3so6948935wrp.5
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ItxggoMrDrIqklyE82NEBNwge31CSjMxmwg8Xl1+Gs=;
 b=YihpUpmEy3z2nV2jko8P6kgQnpQM/31qgMrClkE3+TJyA7dqdHbhsYg0JYSRV3MaTc
 qx5hU9WWS2bcRt1zBHNqkNUZWogMuIEaQiFK0xhI009Vj2Kr4hsDtVvmMoAgA1SLIqkx
 wRcuSZ/WDuF7vTbE7BigqOhTbObIsFZQoqEa2EVoZGjxZgdthArPTUAr7erVkiC3jV2Q
 P+46DCSjzbzgzjROYbqCMIi+5pwE66JQ+8qOVFcLwS5EL3yy/6MK1Al838IHvTOFA5tb
 eLdsk9moZC50PaxvpLSaVtw9R06xF8nXm8osUsyRs2VZdrM0Ea2L+mbKYnGcL4nBAMgd
 bK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ItxggoMrDrIqklyE82NEBNwge31CSjMxmwg8Xl1+Gs=;
 b=2OWpHuzHbmhBCl0pxviESxUVoFKEWmzhE2K1lZEUj/AM8s4Z3O4zSqOuoZ/L8o97Hq
 tFWKNUZ5TS1vaXqHHSbayP+BmPj2HAk4DIGeTOVudR0+LaVRACwEgCyamigddJFn7f2I
 8qMnRhoIpNeYUo8bSZA8NIqm0CIwTudKM4apq/xGz7AnqUrwwCROw4CX2Pm4s67p7JaS
 hnJBLgXSniL0xqx5NyRrFu5U3SWRkAxJ4FyMkl1DYdpVtb9TdMkZPdN9NUC26GtbBnsP
 ZmfgxzJtE1wKRahuRUS0Rx4nxw6Z2FUH1al0FPq0BxgoSiQxkqb+v3wI4CkJkAjs5ycQ
 SRpQ==
X-Gm-Message-State: ANoB5pnhSOC5Mwma92cHro4BaYlPEttbON2qiH1iJ0S2KjXXWxzCY5iE
 GvO0OoOcRL0RHK60DjjqreyrUQ==
X-Google-Smtp-Source: AA0mqf5Jquf3JFynm9GAYKNUZBo/j+JTTOj0rwSX8NOt/G0J4ZvEmAZ5Q3F5X+CZgQXq+0VXlb7hYQ==
X-Received: by 2002:adf:e50e:0:b0:241:cce2:1af with SMTP id
 j14-20020adfe50e000000b00241cce201afmr18903877wrm.615.1669385388953; 
 Fri, 25 Nov 2022 06:09:48 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003b435c41103sm11344722wmo.0.2022.11.25.06.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 06:09:36 -0800 (PST)
Message-ID: <742070aa-d990-1d54-d3b4-cfa285e4fcd7@linaro.org>
Date: Fri, 25 Nov 2022 15:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] docs/devel/reset.rst: Correct function names
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221125140645.56490-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125140645.56490-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 25/11/22 15:06, Akihiko Odaki wrote:
> resettable_class_set_parent_phases() was mistakenly called
> resettable_class_set_parent_reset_phases() in some places.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   docs/devel/reset.rst | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


