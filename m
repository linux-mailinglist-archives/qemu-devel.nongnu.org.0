Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1790C4A3B0A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 00:35:50 +0100 (CET)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJjZ-00031P-6Y
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 18:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJgp-00025W-7j; Sun, 30 Jan 2022 18:32:59 -0500
Received: from [2a00:1450:4864:20::42b] (port=43708
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJgn-0003bP-Pl; Sun, 30 Jan 2022 18:32:58 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v13so21951669wrv.10;
 Sun, 30 Jan 2022 15:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cO22NxY86LNQzff1lbMqxWWagEqE2cRnVTBJV0kV1yY=;
 b=S6chWxsFeZ7fb/JO7i0PqeU/DXNZzWsZZIR/GctOVIpBBXZxK7P0zYi8+KMK9b8gii
 GlvezFYW5rtiL3Ns+u2Yyv6tNYO6d3UNTNlLeDJflnbSLES8M70jaYsF8CCN/ueidDqz
 WYhbndaLPsyxtI+8RiFhkjirRCYx6IGdXgtg1D7HDWHxWOknkXbIl54647+tE09Cml5A
 8Wza1BSy+urLsfGHwo1Q7Cq70/NNki9JbqVNp6u86eo9DhGksar1KtZ47PxveDOK3NRS
 /B1C45UOJaLix774Wn6TeNUaDLFgCrd2PDxG4wdRuoYr8liWrl8N6RCKsUZS9w5SSo+n
 gojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cO22NxY86LNQzff1lbMqxWWagEqE2cRnVTBJV0kV1yY=;
 b=w2Sr5JVSAdcsnA6Y9TPFKxXk6sIPrpl0Zc4atNWZUXm73aZOtc4vyF05kIDfSGJ5eb
 e5niScg0rewcU9xFGyoraZzTvCxz5V1pQL6+DFls/4F5bz9NKX+iWDSIy+5/i3NuYS/R
 HjuO9YrMALAwWMq6g+egKN+7q18z0fOSgqZaNlqDiOI2WnkG8HggSPT5w52u7R8QD1Yh
 K4NmhUCmPWA5f/DaYnmA+s0C9HCk1toGQHEqTo54Fy6+iCQF+B4PqtAVvSki0OGQnzTJ
 pYCus7QCzlGOIFw1kAJhYHZgeA8bolR/w6CUP8aMJM/vdflAeWrH1g1bwlaskITN6RXo
 gr+w==
X-Gm-Message-State: AOAM5318HAdEHGH4cvSXeyFnzOkdl1NdldjNsCI56L8eAscjvZM8+KCh
 7oTDZdm+YYLonoGmPw7FaYgEYz6kFiY=
X-Google-Smtp-Source: ABdhPJz0csgFYmlF0Y9QALVg63A9R37YWtdbfuYn/Kkg9fwTqTEblKPsJ2ja8G6WfFO1MRQ1HCiwRQ==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr15302065wrc.138.1643585576144; 
 Sun, 30 Jan 2022 15:32:56 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n15sm12315212wrf.37.2022.01.30.15.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 15:32:55 -0800 (PST)
Message-ID: <5f2ab436-adb3-c80b-3dda-bdf8c32ace25@amsat.org>
Date: Mon, 31 Jan 2022 00:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-4-edgar.iglesias@gmail.com>
In-Reply-To: <20220130231206.34035-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 31/1/22 00:12, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add a model of the Xilinx ZynqMP CRF. At the moment this
> is mostly a stub model.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   include/hw/misc/xlnx-zynqmp-crf.h | 209 +++++++++++++++++++++++
>   hw/misc/xlnx-zynqmp-crf.c         | 270 ++++++++++++++++++++++++++++++
>   hw/misc/meson.build               |   1 +
>   3 files changed, 480 insertions(+)
>   create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
>   create mode 100644 hw/misc/xlnx-zynqmp-crf.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

