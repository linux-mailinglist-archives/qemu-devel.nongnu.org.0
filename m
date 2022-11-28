Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1601C63A2D9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:25:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZRO-0001y9-Ok; Mon, 28 Nov 2022 03:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZRC-0001xn-SG
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:24:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZRB-000332-0N
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:24:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id x17so15490767wrn.6
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NtGcove0F8vHYyWZkGB0+B4mu7An7eEUQxlkKt3W+rE=;
 b=ifd1FCltOS/rRDa0ReMpz1BtpYYA2yMV7UDxOvittrH1Xrb3lzg39Rmoj8uLH7idnU
 RY0rz1bR2ElY4E0NdZTHm2XnQlRD+ZYFYghJtnQKlhbKBtDrKnujyqkXGKXvO1g78fwV
 BEVLauummJx137CDM9oLQbhi+vahPELCsaWpGzwbAz+TyLmaZG+odpKqAO/9VNKd6cMF
 O9wpV/IY+9xJ4WVfE7H6TtdPruPUJF0FSf8MJjMZGIVBO8nTOjrH3XPCUnFml9EIU0PN
 xW3yQcrDnjp7rctrD1eAmt8H0KSWtmRlcsJ5CAzpayTtruxlsGyx3rikzI02Oq9nSviy
 K/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NtGcove0F8vHYyWZkGB0+B4mu7An7eEUQxlkKt3W+rE=;
 b=lWWzn8LeFev0qjdF8j+Bt976g+J5QTV4HOkjtSIpO38K1huRKbtqtPX4+xcaQ5ucGw
 hhWU9d/861xfNQ5+ZmbMmNEJTGmWYLgIlisKtv672Yh+KrIIp0Iss4Z3WOhax+HXENNZ
 9wmsF633MflInaGzUcD5qg87+5Pn83QTxJ78EMYbP3YpbT7lfBA/9nRRQOTGOv/qym5F
 rFgzbtg7ml7fxigl2iVJtIcJRpLtfx88QRkpe+qVfLG6DOi2HzMfkAXVIvfW2TyyK2Pb
 gmxCc8uS2KbxMK0zyE06SyFgNfCSb5ze+cC5xdUkMUHU6Y7izCNLKeCsOcoKSebunKQg
 vFQg==
X-Gm-Message-State: ANoB5pmQrUWWmCuOMLHLpta2ebFBqJk1cCBjySIvAw/i2uwvJ2G/Vqar
 d3j92rm8OWP6/TzcKBstu3oMfQ==
X-Google-Smtp-Source: AA0mqf7F5jR0LTcPxQ6OHNkEaBjp91bxCYrc8boTIuSErys6Rl9DsLDCC1765JtZKLMB82lYLJ35Gw==
X-Received: by 2002:adf:e48e:0:b0:241:50fa:f724 with SMTP id
 i14-20020adfe48e000000b0024150faf724mr18710297wrm.146.1669623863457; 
 Mon, 28 Nov 2022 00:24:23 -0800 (PST)
Received: from [192.168.1.175] (49.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.49]) by smtp.gmail.com with ESMTPSA id
 r4-20020a0560001b8400b00241bd7a7165sm10109249wru.82.2022.11.28.00.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 00:24:23 -0800 (PST)
Message-ID: <8eeca917-c78f-3daa-23a0-c3def1b5c2f4@linaro.org>
Date: Mon, 28 Nov 2022 09:24:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 07/12] pci: Move pcibus_dev_print() to pci-hmp-cmds.c
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-8-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221128080202.2570543-8-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 28/11/22 09:01, Markus Armbruster wrote:
> This method is for HMP command "info qtree".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/pci/pci-internal.h |  1 +
>   hw/pci/pci-hmp-cmds.c | 38 ++++++++++++++++++++++++++++++++++++++
>   hw/pci/pci.c          | 38 --------------------------------------
>   3 files changed, 39 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


