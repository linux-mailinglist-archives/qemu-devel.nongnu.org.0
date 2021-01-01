Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240552E85AA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 22:18:05 +0100 (CET)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvRoB-0003fl-N4
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 16:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRmu-0003B7-Bz
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 16:16:44 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRmr-0002S9-BQ
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 16:16:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c5so22827646wrp.6
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 13:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XT7YWtdBcAdedvqkDIbLS4/XZbeQddUs5x+jGM0tQvo=;
 b=ckCattmG4dau4eHZxi7MzKYpnAa5axVzEVlZCLIf4yDGix2yn3K2z9FsxycJxRO+zv
 PRKTrfkSm81o6cb1C+hnULLRSOjUeZA/qqW0yr8HE5i5qUyC+DunYR6xu+F8pjpeRBiX
 fPPBVzCtY1UDUO1OKgQtg4Xhs7N98lpwFmXiYKpj1da+Med5dEeLimjAWkbCmhiOnmOZ
 /9oPHfuPJRMegR7QaQ+feD3daS0F4nuoH+4EinQ9ScmdjCJnPVMyJXZ1xdNEmebQAJVr
 MHLx4dC6XZmkBB6tgj50w9NIpBYoX9CT8PkyEPS7rgI0IbBzopphrBNfp+rpSETYyRzW
 wBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XT7YWtdBcAdedvqkDIbLS4/XZbeQddUs5x+jGM0tQvo=;
 b=IEh+FTgPRKKZlsAXW6EOKKDEF2YUfFOY+pm0I1Of/hmZ/EnipfAPXcC4oLBZPF2ggR
 uw1bfakBdJIiHr+ulkGy7voKtYPhS/8zkVyaq57qOPkOB0P8MExwmrF91pwbwYyNC4Xk
 WYVf6en6ul1q8kXsoQVyWwk8A7uwXcuPUXz5N641t8AdPu4OfdfT4GhvbgKL/7ujZD0j
 kKZ+4//pap+i2W9/AL8aAr2YyrWPvvrOmGWmKvBkkUbbSdiCwN+xlECmFEsnOUcwitzE
 M88u+VggeKAML5b9g6Bd/RekSivgzXu+Du6dt9CVgT8hvQQIe9So5H3/JP8/s8LsV1RJ
 GtuQ==
X-Gm-Message-State: AOAM531CqlL1xy6HPQOdDnqXuph8AvkMYUQlbgEjHQheRo0qsraB9uZR
 NfJJFnSdsybJck4/IaYylRQ=
X-Google-Smtp-Source: ABdhPJyniuCNHIzP98sb0zmyPY+oua+u3g+LnL/KfnepxLDHi0zpOS1mAiTFZ2IztM/5tg5z0Gs5cQ==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr72633417wro.338.1609535799837; 
 Fri, 01 Jan 2021 13:16:39 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id s25sm84029924wrs.49.2021.01.01.13.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 13:16:38 -0800 (PST)
Subject: Re: [PATCH v2 04/10] vt82c686: Remove vt82c686b_[am]c97_init()
 functions
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609121293.git.balaton@eik.bme.hu>
 <0df2885abd286feab5d8edf864afa65bf35c6f95.1609121293.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7073a2ba-03ad-c2a6-43be-1c3dc886fe58@amsat.org>
Date: Fri, 1 Jan 2021 22:16:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0df2885abd286feab5d8edf864afa65bf35c6f95.1609121293.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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

On 12/28/20 3:08 AM, BALATON Zoltan via wrote:
> These are legacy init functions that are just equivalent to directly
> calling pci_create_simple so do that instead. Also rename objects to
> lower case via-ac97 and via-mc97 matching naming of other devices.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 27 ++++-----------------------
>  hw/mips/fuloong2e.c       |  4 ++--
>  include/hw/isa/vt82c686.h |  4 ++--
>  3 files changed, 8 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


