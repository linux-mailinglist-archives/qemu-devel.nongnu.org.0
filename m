Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479DF2E3188
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 15:31:39 +0100 (CET)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktX58-0000UE-BM
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 09:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktX3S-0008MN-Sm
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:29:54 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktX3R-0000EW-Eh
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:29:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id v14so7350346wml.1
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 06:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPEw+c0QmZMoHDZ7x0A0yMZLbbQshQ7Ip1qRQZY5MBs=;
 b=lhvk61RkiQZjIf3N6MSgo2mzy35EFKngiPSrUP/qBkrVw8YeqUjbXBHYi76jSUUxiN
 etGt6z9QVW4eelUW2gnu0XkJAg20wqWaUUuz2sfQETyiqExu6x0/nTIF2lw48b/7dcWi
 eNC4sr+2k6l53CnkSeH2Eo/GQQsaYUFgaRFz2vS8UEU0YBeLQFkFfC60HAzaG0iWpA7U
 dMFnvf6YNkn1kiNqO3Xi/Ew+EaDfQmEZPPvE60713U+wa0PQ4aA1af9PawB9xq+THuPI
 OMFDXmAJ1B5VCb5TVVKFU+B8aKuzDaTuFiJ+gxdXsSVrEIMYsBBSfWK1QKLy1XH1nGll
 icEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPEw+c0QmZMoHDZ7x0A0yMZLbbQshQ7Ip1qRQZY5MBs=;
 b=pJBMBpkcStu9vv1r9DVYFQM6Y8Z4VtksdPOqh0Cl+7XZ0rQqsFfIb65FslTgangN/2
 gcYnlzmCKMa5E2OsHyTbFKiq1Xg1kzkkY+q9ahdYwT9ZsSfNbKgl9AhtTPUzWSoOa8Wx
 Ng4BZb3nGkXRvvXuYr1FPbDSeLb8Q8q3eB35uBHi0Vo9Hi1KOo4DisOOCj/CWndNjdAH
 thr7mdyLxrsVXpDPKrZc4eBg1GaQyP6K+wbZsJEiW0GfLhKZIVJQPI6CRTswbjOFwo/o
 K1r5NVaF3r1Xx7jwvBlErHiQfwPgmoltLwvdPiXx2h2uWZazdjKyzDUwfdNxTf5X1122
 vNTQ==
X-Gm-Message-State: AOAM532KrQv+dEWFlb9BInP4ySHSuB048P7PoHlokVTxUBswOmr3jd+7
 0hUpQSd8LiSnpdbKAzildoM=
X-Google-Smtp-Source: ABdhPJyzkjp5nqU+LoiMsj2u41gGIRnbvd9ib7gaUqUPjBHo/7+U8O8GIyTEzCjOOzIcAUkAVMfv7w==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr16313846wmf.95.1609079392097; 
 Sun, 27 Dec 2020 06:29:52 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id x18sm60002278wrg.55.2020.12.27.06.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 06:29:51 -0800 (PST)
Subject: Re: [PATCH 03/12] vt82c686: Remove unnecessary _DEVICE suffix from
 type macros
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <f4697f5ba4c8bae032234f48a91e074fb3d62a91.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <12ca8397-159d-2c59-5a4e-da09962be64d@amsat.org>
Date: Sun, 27 Dec 2020 15:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <f4697f5ba4c8bae032234f48a91e074fb3d62a91.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
> There's no reason to suffix everything with _DEVICE when the names are
> already unique without it and shorter names are more readable.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 48 +++++++++++++++++++++++------------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

