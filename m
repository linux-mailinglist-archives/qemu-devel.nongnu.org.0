Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E2475675
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:34:17 +0100 (CET)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRc0-0003gJ-4L
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:34:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRWU-0006ci-K7; Wed, 15 Dec 2021 05:28:34 -0500
Received: from [2a00:1450:4864:20::42d] (port=37473
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRWS-0006ag-Ns; Wed, 15 Dec 2021 05:28:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t26so994737wrb.4;
 Wed, 15 Dec 2021 02:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QwkEHXiosJIaS+OyAADBU7K8nwRx957nZ9Du90mUYm8=;
 b=R3jRLUeoF3OEBLoJ/qSh3ID/XDXQbXjffvw46UMFnl47wnKeDHnsZBkIZ5E6shuSIQ
 1Pd0IevFUFNlpNFcUm7Ji43SsAfIjYn3FVCHL/eHmVPvH3fZTWfz4HkKTK0k/VElSvhY
 O2pxtfm8Z40KctIK5UXEKRE1xBF6MmrolD1eayP1WRA4+54bFdxFhwYZq9TYJZyyO3Fd
 JYzNFUvxVPVXJkd27V7prS5mbqPRDKZw3low9I9BuEN+JXp0FLZtDPNq7LXST65NlYYN
 LP1Ga4J7UviLp94XswBAgKR2U9bv/vIECCBYRUF+h1HeUEmR5mpnpFT2dYv9Z1qtQzE+
 u72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QwkEHXiosJIaS+OyAADBU7K8nwRx957nZ9Du90mUYm8=;
 b=mUTa0wHHj4D71RNno7DeQnsnGOenVeKSzRLT+yL0TMiD6a9IZ8P08dZIU+aoouM+rk
 CxiPxnHBsOBZFdopX2XPi6D+wPdWOI4n8B0tbYVdtrABnPHZZTDyzBuI/wsnsjOPfHiQ
 lPgg1GtEsipe1h71ri6sbENk/adXaR6zk5hb1X9cajJYNC9JIrARJOANs/rYEMZKU8un
 rp8T7NKlN3OJ/2WsiZoC1/tIdREEcnS/n+0aZrvX5/BxPMQUkMy18FzBpF8Rax+lPTsO
 4HgPHSNZWIykUB5cGpMCw1rKSdREtR3x+caxcGU+FXz1//i39uGsiZybAsWHfBPc5HQc
 AKaQ==
X-Gm-Message-State: AOAM5331KySbEJZIQU9yM0PgaoI18zYr5E16MGxDkyI1eaoEKQt5cdm1
 5I9RAkq9X5BZOk9gKT0oiwTknl8+oR0=
X-Google-Smtp-Source: ABdhPJyrDiZlFEK6sXtd1rUvM9sKBgPlTRYZEEbkrbw/tXpAzwax1D1+TetSQ+AgstvCUmyCeVmf3A==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr3886173wrv.371.1639564110565; 
 Wed, 15 Dec 2021 02:28:30 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id 10sm1933866wrb.75.2021.12.15.02.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:28:29 -0800 (PST)
Message-ID: <cea68742-6f9b-02c5-a705-2231d7efb6c7@amsat.org>
Date: Wed, 15 Dec 2021 11:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/misc/auxbus: Improve aux_bus_init() docstring
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211122104831.1052063-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211122104831.1052063-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Peter for documentation review.

On 11/22/21 11:48, Philippe Mathieu-Daudé wrote:
> Mention in aux_bus_init() docstring that the AUXBus
> is not simply initialized, it is also allocated.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/auxbus.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
> index b05799d2f7a..bd8612018a7 100644
> --- a/include/hw/misc/auxbus.h
> +++ b/include/hw/misc/auxbus.h
> @@ -85,7 +85,8 @@ struct AUXSlave {
>  };
>  
>  /**
> - * aux_bus_init: Initialize an AUX bus.
> + * aux_bus_init:
> + * Create an AUX bus on the heap.
>   *
>   * Returns the new AUX bus created.
>   *
> @@ -101,7 +102,7 @@ AUXBus *aux_bus_init(DeviceState *parent, const char *name);
>   */
>  void aux_bus_realize(AUXBus *bus);
>  
> -/*
> +/**
>   * aux_request: Make a request on the bus.
>   *
>   * Returns the reply of the request.
> @@ -115,7 +116,7 @@ void aux_bus_realize(AUXBus *bus);
>  AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>                                uint8_t len, uint8_t *data);
>  
> -/*
> +/**
>   * aux_get_i2c_bus: Get the i2c bus for I2C over AUX command.
>   *
>   * Returns the i2c bus associated to this AUX bus.
> @@ -124,7 +125,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>   */
>  I2CBus *aux_get_i2c_bus(AUXBus *bus);
>  
> -/*
> +/**
>   * aux_init_mmio: Init an mmio for an AUX slave.
>   *
>   * @aux_slave The AUX slave.
> @@ -132,7 +133,8 @@ I2CBus *aux_get_i2c_bus(AUXBus *bus);
>   */
>  void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio);
>  
> -/* aux_map_slave: Map the mmio for an AUX slave on the bus.
> +/**
> + * aux_map_slave: Map the mmio for an AUX slave on the bus.
>   *
>   * @dev The AUX slave.
>   * @addr The address for the slave's mmio.
> 

