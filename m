Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B82367FBD8
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 00:34:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLuhU-0003qD-Le; Sat, 28 Jan 2023 18:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pLuhT-0003pu-EQ; Sat, 28 Jan 2023 18:33:35 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pLuhR-0003tu-VT; Sat, 28 Jan 2023 18:33:35 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so10992933fac.2; 
 Sat, 28 Jan 2023 15:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZZe4VNlZtLr75fg+qhbbujaZ6qov/K5CAC/7EM1uyfc=;
 b=BY4Mk1ind3fS+gCI3+prf0cpCLsNbkwyRdFg5E1pPhMpWPrUrRre/sr60UkOkZ6Apk
 WWqocPzvBFnSr4ln5JzHcz6KIvifpqVDRrhFatXE00wRWsAReYCPcx4S3FA4Ng4Ft4p8
 yHzozwgyXEKcJiBRHHf8dLpGIsCUGXdQB0k1H5YZBiN0nqmVL9GGWQKHqz8BFAcfwoQs
 3dp/wJzfAWpJSlcZfQ/t7eN6BdWXpT3YzsyXYCmv7oYVZYq/n0OUy4odG1SIpoUUgzCz
 tkd59HxHx9Q7945FPk9UJJK0L0W88dXmDQ86m+o4wsZcB9ss895uJqsFxPtg4rKkZ2cY
 vBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZe4VNlZtLr75fg+qhbbujaZ6qov/K5CAC/7EM1uyfc=;
 b=nWj71oRzlEk1iDF7+vR7RYO9VomFBCGYbHEZDNNQjlIfzdMWrzZ6wRHrPpUqWsFQEE
 V9M0KIxuSBNIvh5HTWypZFKwWe3tcPmL3hH4I2IYp/YVi/nsoLuh8O5QjSjlR+9OpoB8
 OyVpThqQInsg6WrbskxPwKHDjtQBLr/vRkHsTL63zbMHxTKJSkb1ZlUwqst4bTd0jAHf
 4LHocUm2pBI07RqnlFjIzC9AAK5l/5aelpRwYANxqz5XvxN6j+MHbn5a1spTTA0pknCT
 KH3HWxG73Qo3YINVgzu3QzD8pDAUMWTN3bSpH4ICLrOD+zr1T45lwMHzujSwNQWSITll
 GAyw==
X-Gm-Message-State: AO0yUKVzC3IKQSRHrG6JGMEsoKlmS5T3UWH+Fc/8OLSY+3Be6pYX4zkz
 uteGLjpErBmoj4EAB8613j0Nkkrl+xE=
X-Google-Smtp-Source: AK7set/03+wUCwdyloCdqTXqRslHAsh3/mZbDzITJQqq+gqd+HobNkoLh9jK/gFvx5ULBPwGRv6KEA==
X-Received: by 2002:a05:6870:17a5:b0:144:57b1:c8cf with SMTP id
 r37-20020a05687017a500b0014457b1c8cfmr1557046oae.47.1674948812062; 
 Sat, 28 Jan 2023 15:33:32 -0800 (PST)
Received: from [192.168.68.107] (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 j26-20020a4ad2da000000b00517425df590sm1298544oos.14.2023.01.28.15.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:33:31 -0800 (PST)
Message-ID: <808dc3a5-eb7f-0331-99c1-d6cdbeb81cf7@gmail.com>
Date: Sat, 28 Jan 2023 20:33:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/4] E500 cleanups and enhancements
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20230125130024.158721-1-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230125130024.158721-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.148,
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



On 1/25/23 10:00, Bernhard Beschow wrote:
> This series includes some cleanups I came across when working on the ppce500
> machine. Furthermore, it enables support for the 'dumpdtb' QMP/HMP command
> which was missing so far.
> 
> Bernhard Beschow (4):
>    hw/ppc: Set machine->fdt in e500 machines
>    hw/ppc/e500{,plat}: Drop redundant checks for presence of platform bus
>    hw/ppc/e500.c: Avoid hardcoding parent device in
>      create_devtree_etsec()
>    hw/ppc/e500.c: Attach eSDHC unimplemented region to ccsr_addr_space

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

And queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> 
>   hw/ppc/e500.c     | 24 ++++++++++++++++--------
>   hw/ppc/e500plat.c |  9 +++------
>   2 files changed, 19 insertions(+), 14 deletions(-)
> 

