Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451B47E661
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:30:44 +0100 (CET)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QzJ-0007PG-Ro
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:30:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Qn7-0007CH-DK
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 11:18:09 -0500
Received: from [2607:f8b0:4864:20::1029] (port=37446
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Qn4-0001CZ-Ty
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 11:18:05 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so9216041pjj.2
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 08:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S85tLz/plxlY0nyRW2QwJKRABAlyLNdf21J/aGLmVf0=;
 b=WpD1oDPlPDH8whVr7TVA//p0tX1hYXZnudf+O9a5wHF+aPywj6poO94qc9IYRd8kvd
 E8JefOKTmggF2SEN9eYkRtQZjP0F75wdnLRD72J3pzVWlV5PtOEbXeuxBMbQ/sNYoumt
 2Zrtuu+PdqEMJs4bb5MrgHIYza8pdXH9rbhaCwR1sL0DQPr09KpilH9ilV6srFFwPjgc
 ZQN++axc3PtPau1U++D5IY6w2BPC8aAdc7iplYl3lKxo5jK6jZbtEdjdTghCAY23DHDZ
 UU1QFRugM/0vZYwyW4ObrAsC632E2qF3ruJtjcBKbrtUZSTv54RRbVnlWGtBeDsbkAWK
 9wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S85tLz/plxlY0nyRW2QwJKRABAlyLNdf21J/aGLmVf0=;
 b=lod1iPBLNtXFskm9Jsr+LwJ1qQh96oe+dvs6jeNE/MwrI2jtuYNGLIrh8qBtHklGMg
 9bZUAdnWu0b3DSRshopjqJP5MuMz6uJYnBEot6GFsQz2kcbR0xAcW5O0GgbataRy0HDw
 t+32kcS7LhECT3zBYaj+FGehL5ACk+o8Sox72CixxNuwYARC/WeT6rv6oVveMZSmpnrg
 tSykI4hhRXeo6vqRrIf0WW3D3hMks3bKE+KUmWb7iI9eCZFG6o0gC4o1y18AStAGLyhM
 P6qhIdNImM+7lULNbt2ID7hLhGSV8FOSWkJV/m3WMOY98vgmT2KDP2EJVVfjnmhQ9qGR
 187g==
X-Gm-Message-State: AOAM532r2UWoDntC0oLX+U+bpFDKPnuZCbjctuGwiuVYjZb6y12opxAw
 ELqn32YchYRVKPknRJuXdnkJqA==
X-Google-Smtp-Source: ABdhPJxaeF45b0koWMWq9O5Xd7xAhh8DrLTHtUKjtatuqQLIjQ5Wt/1F2JxINL9+M+8kavUjLV63cw==
X-Received: by 2002:a17:90b:3787:: with SMTP id
 mz7mr3460747pjb.17.1640276280791; 
 Thu, 23 Dec 2021 08:18:00 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id t3sm6569104pfj.207.2021.12.23.08.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 08:18:00 -0800 (PST)
Subject: Re: [PATCH] target/ppc: Improve logging in Radix MMU
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222071002.1568894-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <53485311-22f7-72d3-b63f-9c890a385e88@linaro.org>
Date: Thu, 23 Dec 2021 08:17:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222071002.1568894-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 11:10 PM, Cédric Le Goater wrote:
> +static bool __ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,

Don't do the double-underscore thing.
It's technically a reserved namespace.
Use e.g. ppc_radix_xlate_impl.

Otherwise
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

