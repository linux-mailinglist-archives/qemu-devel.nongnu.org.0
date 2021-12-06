Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959F469784
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:50:11 +0100 (CET)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muENe-000719-IW
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:50:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muDtG-0007ze-O3; Mon, 06 Dec 2021 08:18:51 -0500
Received: from [2a00:1450:4864:20::32f] (port=54842
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muDtE-0000Z1-QM; Mon, 06 Dec 2021 08:18:46 -0500
Received: by mail-wm1-x32f.google.com with SMTP id i12so8099731wmq.4;
 Mon, 06 Dec 2021 05:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYZSJa3VGranUvU4vAyj9g3ZQxTXlc14mrYxkUPtVds=;
 b=M2NtJ+Rh5XoxjIxIqo39tb8WVd5jYX9PuKE4Lns46y5OVkWjYHhDQGhjLpC3Vc/FvN
 jOZ9+IdSHV/AXVYXfUUCWME7qaTmoVeZWwlXxnXzOhTyGFGVetzlxeNx5+OsvKk3sQN8
 SevL69+V2DFpoOwDlpr6r43exoJdT9Hze7/uWfdqzhbbc5hsc50A/AjBpzL2eHd6j/e9
 5rLpqV4jsqAYubEwHye2mVToH7JYXF5Nzly7rUWqoOq+UQcKpWOFOdFUqDG7bisQvPWw
 FE8J1qNAutOY1Cl7Z53gaEeaDzzHIk0A32WaGF0Ul/sQ8dExyL+xcX3K5atyN+LgikBf
 I+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYZSJa3VGranUvU4vAyj9g3ZQxTXlc14mrYxkUPtVds=;
 b=sU6cyuCbmdKXW86jAy4BnhUcTU37QqVSuEE6kzRXEa92hvYvLH/yYnNdFr/X/tgVw2
 RNC2yxKS5ndF7kaMjDbi10P/4t0IP3G6rwg02lDpLZ/e+CtQfu4TIs5o0b/d2iI+hx51
 Jy7OukNZTrby/LlyXeBFTa12GQrXsJdmb8X6xjRPCpPKrVJC4y/WH+VUpyW36R0nzsCI
 GCFNAGWwCZg9pAFKLEKsJUOHcht6hu5hG46jiQOc3AC2CxyVMc1n4cmjoY8H7Sgsgkqi
 6QH15Czs9qNnFvL+BSFQreRmq6d6X/K/o3nkCiksADjBZybOFOqoIkYTi4RmIrxEbjPU
 b0FA==
X-Gm-Message-State: AOAM533U4Ci+DYCulwWrP5AYpl7Jyy4cWfVA9lIVAQM72a1DcRxmoXkf
 oZFVT67CAb2J9YIdJBo/uyo=
X-Google-Smtp-Source: ABdhPJyGNlnXQVx/2qfMMWrQeKW/RM0wKryiQnKNxIH5sfVW4PaRvAO86H+D6vAHNxAGDD0ByL/n3A==
X-Received: by 2002:a7b:c455:: with SMTP id l21mr25056043wmi.168.1638796722831; 
 Mon, 06 Dec 2021 05:18:42 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id t127sm13752489wma.9.2021.12.06.05.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 05:18:42 -0800 (PST)
Message-ID: <1125f430-67db-13d0-8c01-9e82c08f0628@amsat.org>
Date: Mon, 6 Dec 2021 14:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 05/15] ppc/ppc405: Drop flag parameter in
 ppc405_set_bootinfo()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206103712.1866296-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 11:37, Cédric Le Goater wrote:
> It was introduced in commit b8d3f5d12642 ("Add flags to support
> PowerPC 405 bootinfos variations.") but since its value has always
> been set to '1'.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/ppc405.h        | 3 +--
>  hw/ppc/ppc405_boards.c | 2 +-
>  hw/ppc/ppc405_uc.c     | 8 +++-----
>  3 files changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

