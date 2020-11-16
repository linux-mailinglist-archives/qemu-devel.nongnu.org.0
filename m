Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A32B4561
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:01:44 +0100 (CET)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kef4h-0005KA-Ca
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kef2Q-0004WN-V2; Mon, 16 Nov 2020 08:59:22 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kef2P-0003GY-CD; Mon, 16 Nov 2020 08:59:22 -0500
Received: by mail-wr1-x442.google.com with SMTP id d12so18754300wrr.13;
 Mon, 16 Nov 2020 05:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mrSkhpHV/FX7vqyYHrqYZ+ipl4u9XbEx+c2jRbUV4po=;
 b=Ayw7gkge+v31z3D8wzZciPE9LkBC7hu5bVN/AlOzGuLAQv0n0Ovs8pCZB+B8/45G0L
 P1U/NLJOxmGXktopLgI6/YdTG0UtjQeG4KIP11Ip/NfTLoPirEYd2l0GU6+WExyPD/OL
 6fjQlOKAtNsn40nMYjkpsVucNvG8MXNxy1p/YLSrKGi7rSCPijKjgp5xBw7vtbapdmKb
 W3FZD0NSb8GsnrHk2tGgr0OegnzSMQ4ZB9AR/q3JYVGrsJRap+ZxJrUOnkbY3dJZ5Jj1
 7DJtPdHBXh/AMbm86tyvU+BMBWRw+nFlOO/K8Fv8T+m30wUjmllCfkKYTtf5v9FvDDKT
 yFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mrSkhpHV/FX7vqyYHrqYZ+ipl4u9XbEx+c2jRbUV4po=;
 b=PhmA8wolZfZ7V5YZwoHDxZN01NNmiYaFgbVzqPG2E8H97xq8vcXpoPF3uKqV4s7S2v
 mXLHX4gYicvdSW06bzoBwxSB0O8uR4GVMdXPpmXMiG/rGnRkJLbYa1kKteezOpqN+YuD
 YK138vAYZZmjEddBIXs4rCSkAx81XbkRje9pvSKIXc84enRP/GSbaYnUvr2OgQNqyd68
 iYR2FRMXFrwIBQzBN9wVysMzzvzGcjndX5F6KbY1CDxrI3xu3Cxd+AkqASGQhVcpIqKX
 A5kxVf39NiCjjSzBDbqu5ZerzdHbtDP55Lv8mmJ4K7pZyjPvdca234EAmmVKf/Jn11Cm
 ppfw==
X-Gm-Message-State: AOAM530D4h2EMtjBxrRjoXxmr3yIi30PhTPzPfhCeWLlN5scznMrqQGj
 kW6piFrRY1+cUbDQ36CCM7M=
X-Google-Smtp-Source: ABdhPJxALO93PUv5D9i1rfEggAvlnJ1aMGlQAELb4P8RsQf1W0hdeajvG9tKnWL9JK3sNjnrf1nTeA==
X-Received: by 2002:adf:eb4d:: with SMTP id u13mr18670657wrn.146.1605535159527; 
 Mon, 16 Nov 2020 05:59:19 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a15sm23042774wrn.75.2020.11.16.05.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 05:59:18 -0800 (PST)
Subject: Re: [PATCH 12/13] SPI flash devices: put them into the 'storage'
 category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-13-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e4591e68-04c5-8645-f50a-e5a9553326c9@amsat.org>
Date: Mon, 16 Nov 2020 14:59:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201115184903.1292715-13-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com,
 Alistair Francis <alistair@alistair23.me>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/20 7:49 PM, Gan Qixin wrote:
> SPI flash devices have no category, put them into the 'storage' category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


