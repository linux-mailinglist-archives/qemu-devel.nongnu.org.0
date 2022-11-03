Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB03A617AD1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:28:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXS6-00005o-FM; Thu, 03 Nov 2022 06:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqXS4-00005Z-IM
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:28:00 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqXS3-0003jf-6y
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:28:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z14so2053080wrn.7
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=07tfAOTSqyXeodZsOMoqgCopIEICg2eAaSJD38f0RrI=;
 b=xssb7QIjyZTy2V0FkDFN0JVuFnZ/FHEW+Io66e+pYeZzZzXjF2sKN3XWXAquKC1ZMD
 cJ2cGycbmpogWYltxYwMPJItGpq7TEZMkpIskZ03mKfefJSyigMQyn2tjSAOjZlaLALv
 icSLElJlJoYo4zJOwmaIKuZVTCCrDL00XupsLaDbvYhT5YjaHgw8XYEcipQiDcA2DiKA
 ysTVTlXtGoM96pHZtmZZEqohFW+Z1bahUFfKej2MwUP5IdbWnkVIT71Df7MjX3yGM6C1
 Y6AA29xjAfDExXA3POofq/NxcjJgV1F35aUNdSkLSodTeYdKcRUpSxbCfGIrd1xiw8Hb
 tajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=07tfAOTSqyXeodZsOMoqgCopIEICg2eAaSJD38f0RrI=;
 b=r9a7/WBOIc92ZPGyNs3qmHD878nv8y02MELGGWa7kTdpK5tEwlIcRXl9G+GTgYBgRZ
 gHKvTNgOsXjzsgcBlhPZcq3L3rsAW3EBpvfURHIT+EUx7UpaizvDG54MJODjD3qoVIO1
 usINTbtA5IX+HVUl7x3VnLtHSM2xXpKwUwpJMu2QG7j3MGMDCuxxGCaGo+T+0Qo0lh60
 iqlyy0aJxgG0Ww+U+iJH5N77vAc6vqF46vQ92OHZ+ITV+kF6oVFVejsjsI467x1pLFvd
 ELqKhd1cGsmHTNwLTmujR+sD7wVhCIuzAXVBm8EyQjVsbNUIsaJRDuz5wKpcsw+cV2h5
 1wKw==
X-Gm-Message-State: ACrzQf0lRaxQJgCh8mhvk7u5DPMaDMdZ2kfS+hoXnj0ok+HsAMjRsuAf
 paZPnGSNCE+hz1wNQeHP8W+LokfwJxg7mQ==
X-Google-Smtp-Source: AMsMyM6WMnKOkB7eh2vl8lKNdVuPm/QILZeLYrWvvuIpx/a9arO8invSsb55RhOTGQLU/SsqAPoG4g==
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id
 b5-20020a5d5505000000b00236582b7eb0mr18058036wrv.68.1667471277361; 
 Thu, 03 Nov 2022 03:27:57 -0700 (PDT)
Received: from [192.168.182.175] (216.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.216]) by smtp.gmail.com with ESMTPSA id
 w11-20020a5d608b000000b002366f9bd717sm588286wrt.45.2022.11.03.03.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 03:27:56 -0700 (PDT)
Message-ID: <3c9455e5-07cc-c1b5-bafd-7786153b5b9a@linaro.org>
Date: Thu, 3 Nov 2022 11:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/unit: simpler variable sequence for test-io-channel
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: laurent@vivier.eu, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20221103102329.2581508-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221103102329.2581508-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/11/22 11:23, Alex Bennée wrote:
> This avoids some compilers complaining about a potentially
> un-initialised [src|dst]argv. In retrospect using GString was overkill
> for what we are constructing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


