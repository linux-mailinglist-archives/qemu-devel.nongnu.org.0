Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530464F0AA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 18:52:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6ErE-0000d5-Tq; Fri, 16 Dec 2022 12:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6ErC-0000b7-FX; Fri, 16 Dec 2022 12:50:50 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6ErA-0005L9-KL; Fri, 16 Dec 2022 12:50:50 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 x25-20020a056830115900b00670932eff32so1807300otq.3; 
 Fri, 16 Dec 2022 09:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+4rwcmR0CfVG5rF+8pjo2VgduZA8mnqHQp+fEREIlNc=;
 b=JS8fSZ3z9FuDZE9dVlkD149BQN5mU+ssPo+HpNLvFPKB8P16zw9xdLjK9myOEWlY/S
 HrgxEpIz31bRu22gErw61JEVbHkWjbvK6NVGpJ0hlesTYjEfAwqQWatLLA1qOg1+oXSK
 1utL98ud8V7inSRDMih+wzJfP3eDxW5AQZpADj0WcqUrHKbdGaqEixLZ5ri3nDzw0Nrw
 TquJGs8/xhaLujdb/4rNpoyvDp2SNGhWHcI6Qx96lZnDF3K1f6Al7395Bg5iSoMtCtJi
 ta9Dj5bH1dBqe+Q32EuaQeXZfXiKeo3bmsEMEPU0kgy4xf7AVCVMBi8UlaOVfl2X67e4
 ImSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+4rwcmR0CfVG5rF+8pjo2VgduZA8mnqHQp+fEREIlNc=;
 b=tsE8XEVFgSO/ZDOf/fpcI5xH8fqb9y4b6YoDKSLR5EPUTys/RdwDhua/wEq/0c7Nng
 7g3mct9QcmQOquPJTnG4LFlavhUyG1icooYXCSSJE6GwnPulCzM6O2z1mrw5JQ6YeqhO
 l9semrL9fhO0ECXGttVhal5IowFQ5x7mywAjYde2mTo1eIaD5OsVGrO78G592u5dSRvX
 3ez97K4irBoVgqrL+sMUPnF0c+tJGC86MgM42vJ0rpCF1D3UAWAPXxkE8xLEdUFwwFoH
 qAuR5hJuF3jsVoTmS2PQEyabI4HkkdsmaelwpPW9jflXYUDgGzEe03NFSFCZ3yvTDH3R
 V22Q==
X-Gm-Message-State: ANoB5pl506j+Rk1kZsuXGboM+brp6ZgfV7RUVdu8sLZMevkaoRnuZyui
 1oUuHSu70Ttw1Vhk52JrpP8=
X-Google-Smtp-Source: AA0mqf6TfXgca3JAJ+q2+buGs2UFpqzuDaFXUosglRLAZZ0EX6I3r1C6UuUs2Ii5ZLj9TrLtSf0SLg==
X-Received: by 2002:a05:6830:144d:b0:670:7c74:2616 with SMTP id
 w13-20020a056830144d00b006707c742616mr15282349otp.11.1671213046043; 
 Fri, 16 Dec 2022 09:50:46 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 k19-20020a056830169300b00666a5b5d20fsm1090544otr.32.2022.12.16.09.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 09:50:45 -0800 (PST)
Message-ID: <6fc82e52-b7a4-778b-1510-4831570a50a3@gmail.com>
Date: Fri, 16 Dec 2022 14:50:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/6] Trivial PPC cleanups
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221216145709.271940-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 12/16/22 11:57, Bernhard Beschow wrote:
> These are some patches which helped me when getting a u-boot image to run on ppce500 machine.
> 
> Testing done:
> - `make check`
> - `make check-avocado`
> 
> Bernhard Beschow (6):
>    target/ppc/mmu_common: Log which effective address had no TLB entry
>      found
>    target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
>    hw/ppc/virtex_ml507: Prefer local over global variable
>    hw/ppc/e500: Prefer local variable over qdev_get_machine()
>    hw/ppc/e500: Resolve variable shadowing
>    hw/ppc/e500: Move comment to more appropriate place
> 
>   hw/ppc/e500.c           | 10 ++++------
>   hw/ppc/virtex_ml507.c   |  2 +-
>   target/ppc/mmu_common.c |  5 +++--
>   3 files changed, 8 insertions(+), 9 deletions(-)
> 

