Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE72E3191
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 15:41:27 +0100 (CET)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXEc-0005IF-7A
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 09:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXCp-0004Lp-VL
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:39:35 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXCo-0003bM-DO
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:39:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id a6so7362842wmc.2
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 06:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p66jpZTLxlWiW0Q+SgSKN0oWS3eqwnnnmLB8HGWkUg0=;
 b=NyiLtFyvno9KeoNaMqb4W0Ty9Dpg2KhI3lng/oCmKETwYzJWG31j9rKpz5vQOyvilJ
 KFOHEzKulqbhJIKdgZfpqTGPLX7KwW9TfokMhHUJvSnwyU7gUXJphLEpWIYiKYvpqYR2
 GVE49RPQD2kU+s1Yt/6DPiEmOAUQO+slkiL83jSaJQUMFsYcLjc9qi3VGhdBN7qYJN6i
 kh/ZkX5a6z2FQJ1wEKLPF/tm8bcUvja+JDY+2ZYbDD/S0JIKx9GXhmhY0R4Z0X+Nnecx
 4PkX8/6VE3nhtMgeH0ocZ4Wgll2gbSh2TSNd7mtdNNJfbVv4eAVf46LSE9wWaPqdRI4N
 lXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p66jpZTLxlWiW0Q+SgSKN0oWS3eqwnnnmLB8HGWkUg0=;
 b=N7wN+7JOnOjlVOaSR07izEvArn3txO02pPPvyHlb8hQyq7Gmi/GzZY3IZJyKMO96AV
 njnfZMCiBulqYcuv2OgMWEshn1Qpgev6nWr732f7puMapDaHEuXKOlJ90aeKEmmDFjlg
 3kjdDvv9GfQkLYhbMjxhUmUDV5XoSkUdVMr9/pYK7O6m/hn5pUTSujR9l0bc7IzUjvFo
 FUvEbaZ9TPcblLCwPYKxuLO6z4D0/UIK1h5HWgcvF4lpwKzOSW5lErYtyjk76Uy1z0g6
 NNQye9ELrKQNx6rv5CdGFFUjZyFtGal0IuSDcOyqVFADlKEPLLLX1Mh0yIMZCVdigukq
 7EiQ==
X-Gm-Message-State: AOAM530kUrfXCUQNBvXjlgwxpscPKbqnXrTJfn3XvQd+SlPtUt9LGon0
 g4vxcbANNQztBFBHeLmgO8g=
X-Google-Smtp-Source: ABdhPJw0krvviwTY0fmrfjzTDNhwM8KrAA/nug3UtcPKi/YU02GPu+QA/KdANRRJHGMGfmydOpCNFQ==
X-Received: by 2002:a1c:a749:: with SMTP id q70mr16592787wme.120.1609079972843; 
 Sun, 27 Dec 2020 06:39:32 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id o124sm16022021wmb.5.2020.12.27.06.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 06:39:32 -0800 (PST)
Subject: Re: [PATCH 08/12] vt82c686: Remove vt82c686b_pm_init() function
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <5959fddaa1ae4b2b9b95954bcda8e468460affb0.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3b2ab6dd-3e19-38ad-2741-6b2610e451b2@amsat.org>
Date: Sun, 27 Dec 2020 15:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5959fddaa1ae4b2b9b95954bcda8e468460affb0.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
> Also rename VT82C686B_PM to match other device names.

s/Also/Remove vt82c686b_pm_init() function and/

Preferably copying the subject in the description to
ease reading:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 17 -----------------
>  hw/mips/fuloong2e.c       |  5 ++++-
>  include/hw/isa/vt82c686.h |  5 +----
>  3 files changed, 5 insertions(+), 22 deletions(-)

