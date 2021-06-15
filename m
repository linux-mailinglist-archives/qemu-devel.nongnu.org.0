Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903D93A758E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:04:11 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0J8-0001hH-IO
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt0IN-00010l-01
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:03:23 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt0IL-0002JT-1O
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:03:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id 69so7754817plc.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 21:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NSBP3qB6ssHycoXv2zcW4k97cGYtIDmDejlKYro04nk=;
 b=DB2eQFOAzgjPac6/7k3iLwX0DhFjey3NlPY1O73bmyNWzmutKypHhMvZ0OHApQcq6+
 aaks1nU7ANBlRpnJpE3VyKlDlDxEY9OMbx5hRkSBFhw0IOsYEkGMr4tgZxMuz0Pj22fq
 suzKNrftmVEvtwLRB/eddjlPqxnHHN9fIfbpwWoDh4VZLYTxGOT6QGMfV4cj3HUdCRIq
 GcCwmosPVBm+6ieM0e1lz8YWEow9/EOsyA1M5emjjElZiupJrtBnxIEY8c+YlKHSPfrp
 oHxVIJ2JFOybvwCGJmNeDtLSljgVb2kQy9ZoHhcx5HErglIDE6EqsIct73Zc2GgILqqM
 BMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NSBP3qB6ssHycoXv2zcW4k97cGYtIDmDejlKYro04nk=;
 b=ELCOgE/8iWnTBWwGbwN+VgZncAWqB4jptmEPCpvhfknL3hoXLbj7NEqFE6eo4GaMyc
 rX1HAIthWv43mM6PVf4bgAcsluR+e63RcCfk7bcog2IZUpdYjXrMc/rxBnna8T3tGaeJ
 ypYrCf4ogTOjedcz3oOmY7X7twi2jBiJsmmgHm5RxYwkgcoRHLTLyvA5utQ56DPjJAFX
 p5wKVqaOxPcSO7oZXo+EYnwdlDxVSN4I2nS5CeOUm+QTWWwYF2g1OH5n8xhZQw5I1jUA
 u8OWpKPWDj5ZRLpX0iufmdM0dwiSRVkNsgtzuB9ZKFZio+bsSnAYhoJrRIpMMfmooO0t
 Hl1A==
X-Gm-Message-State: AOAM5332mj4cpN8xkXXL6P/fhMtWbKYG+hmii7eFpq8UNLlQJYkg6xgk
 AWtnNwmvMKL2Pns+F6VgTRaXhCp0JjxVUw==
X-Google-Smtp-Source: ABdhPJwshxAblcGfNzSc8geOrDr+Mu9nZCO3dGea9/Dm/zCUjQH5LDRcRoBeQMxQZpHlbpKbXbU4rg==
X-Received: by 2002:a17:90b:3144:: with SMTP id
 ip4mr2778374pjb.2.1623729798445; 
 Mon, 14 Jun 2021 21:03:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q91sm14256800pja.50.2021.06.14.21.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 21:03:18 -0700 (PDT)
Subject: Re: [PATCH 2/4] alpha: Set minimum PCI device ID to 1 to match
 Clipper IRQ mappings.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-3-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0917dea-c115-44f0-4322-636d24acfbd2@linaro.org>
Date: Mon, 14 Jun 2021 21:03:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210613211549.18094-3-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/13/21 2:15 PM, Jason Thorpe wrote:
> Since we are emulating a Clipper device topology, we need to set the
> minimum PCI device ID to 1, as there is no IRQ mapping for a device
> at ID 0 (see sys_dp264.c:clipper_map_irq()).
> 
> - Add a 'devfn_min' argument to typhoon_init().  Pass that argument
>    along to pci_register_root_bus().
> - In clipper_init(), pass PCI_DEVFN(1, 0) as the minimum PCI device
>    ID/function.
> 
> Signed-off-by: Jason Thorpe<thorpej@me.com>
> ---
>   hw/alpha/alpha_sys.h | 2 +-
>   hw/alpha/dp264.c     | 5 +++--
>   hw/alpha/typhoon.c   | 5 +++--
>   3 files changed, 7 insertions(+), 5 deletions(-)

Thanks, queued.

r~

