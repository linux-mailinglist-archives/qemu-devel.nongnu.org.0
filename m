Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795632E8C1A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 13:20:02 +0100 (CET)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw2Mb-0005uQ-JQ
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 07:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw2JI-0004uw-Ay
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 07:16:37 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw2JE-0004lr-Re
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 07:16:35 -0500
Received: by mail-wr1-x431.google.com with SMTP id q18so28182392wrn.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 04:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I/dcAvb8brn3mTdDIMX/F+enQXHUwD7V/nbZC6v7a+A=;
 b=ZY7Aujo1TuwEFlCclunl8seibWO6Xght1MsnYg+7tBmwx6U1ugliE3QE782ohsq22e
 KTAMp/vZRbMOBvbcfAU9x/OBOwAcuxNe7A/zZhHDsSJcKql1xwOXkbMinhzx2JJuRWd8
 oxVIBkVWUxMnAA7LRHWUs6wRquMg2AlpPfMrHtKMm5tJCBhW4DB65MkjtkFLtrxHpp6r
 yLfJX8QX1YVc+AxL4YQ0OPGL6g05qlTRwYjIpINzFmL3auenLapGOYKJAAlP5kZq6mbJ
 v0iNyQmP95O5VL1b5+FN0/25NEAYqHkud06+dF2HvD5o5jhlWZKhb4UuuQdjHelTPUEA
 tLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I/dcAvb8brn3mTdDIMX/F+enQXHUwD7V/nbZC6v7a+A=;
 b=K069Yc463CSTl7HG5+MziwME7XLwwfD+J4ZeHXlgPc7dZymP/OROD/jJglFCEaFTF7
 PaVdrtaCRRa7DK9KnBXLgO/5b1mArpRC57Nf1p/HCX0qxz6tj5oyocK2YA4dNbPStV9D
 Ymh0biGdlxdLNV+xtEVtKtqu6IlgDygNs9vbPcWHguTYselJsWXDiGQ+zaw5IwqmdTer
 ijMr3/lDa+BWohnOJvJrHdxxuvdwjVD2eqEp6DfPp8btt59oRc9faLXveMZpmOMyFJQP
 yp6VnLRbUxYYRxAhReBy2ADC1JyZkWq4FHM3NOELxAC5nkInl4TB6CcuQI9fmu/K+A9/
 Pl0A==
X-Gm-Message-State: AOAM530FbqYGFQTMdetWZsGwclwd5PZJok0gy53sbqjs4YwjNiB87vNz
 mAVEgHOIhLd0P06FdukgxfI=
X-Google-Smtp-Source: ABdhPJwmtigGisLM6wPKQ3KxNT2agBFX7rhtlE5yuuvOfE7ds+gK54v9R2bjHis/vkRv8weMtMCzXg==
X-Received: by 2002:adf:dec7:: with SMTP id i7mr76285234wrn.373.1609676191570; 
 Sun, 03 Jan 2021 04:16:31 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id m11sm27247343wmi.16.2021.01.03.04.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 04:16:30 -0800 (PST)
Subject: Re: [PATCH 12/24] vt82c686: Rename superio config related parts
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609584215.git.balaton@eik.bme.hu>
 <4d30a2b4b771b2ad651509885daae79d7c4fe7a8.1609584216.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7696cb27-7131-314f-8601-7f01e57347f2@amsat.org>
Date: Sun, 3 Jan 2021 13:16:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4d30a2b4b771b2ad651509885daae79d7c4fe7a8.1609584216.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.118,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/2/21 11:43 AM, BALATON Zoltan via wrote:
> Use less confusing naming for superio config register handling related
> parts that makes it clearer what belongs to this part.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 48 +++++++++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


