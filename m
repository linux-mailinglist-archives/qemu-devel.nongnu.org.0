Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9542E85A4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 22:08:38 +0100 (CET)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvRf3-0000ga-A5
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 16:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvReA-0000GO-To
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 16:07:42 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRe9-0007qh-9G
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 16:07:42 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a12so22777775wrv.8
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 13:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vq/USKe8fs7zbnFkdSJeUSfwpx8YaJJc4tmJlfVWs1M=;
 b=h15+75WqAiFP7n7LSeua/+vjg/yoBGm5CM9tWrZw88XP4wu7nm5NXyHcIh20/hX8cv
 +xsBvRqyADqpTELCKEJufa0SuaNoJnY1DE/bwE035kYC/jZnXMu+BbOLIEw6aZ2XQ5xx
 mnG6woR0EGG0h+lQ1fdLGLre1paK4zcZK13rYgueoRDEXZRjQljybhHi8mR0IwK2xtaN
 wWcSnIrosHXeXRAGp6XyXt5HBhJA4aIJ2sV6UyTix/F5QhgBjYYtrbVJ/swLrjz6+3Zn
 QIZCO8IWxuR1I/6golbDFg3yfjVRDWhknBExiQa75bg11/3ZtJu95QtGXi04iLf4o9Jt
 i6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vq/USKe8fs7zbnFkdSJeUSfwpx8YaJJc4tmJlfVWs1M=;
 b=ZpwO6VT5xM3kMEXNWtohKkuTkYvMblAvaX0wQr3iuRVaOh2c3qmiw0A/PuRbo2gHeF
 952VWqLtE+21W7ydLjne+yG1bst59ouh+S+4XSRbeBV54mvu9b4doWcGp+FXkfbRQpVU
 9kWtEUJ7ZmEouoFrOmY1/E1FfQpF2c6kTl5KXraKircK+HhPC4X8s26yw/klr0gI3Kpg
 ZDEGsIh0q261F7eUmiFf9Lmdxtg3GSO78xivOI6tm09Sh+FJV62qqXXx5KsvaOQc5sgU
 4cdc/VITNo1r5xTAYr0iGbFxFMfN0wCymPXghXqcJo0ZDtx+i2Hr0YI59KlXa15193T8
 wXgA==
X-Gm-Message-State: AOAM532bzj1CIzBMoZHZNjq1Wi0iJ3r9biVLQ2kl7+X/shQEDQkYIKRG
 fh6AuViruV1hI5yxy4bbO3k=
X-Google-Smtp-Source: ABdhPJy7nS6/qI//rDt66Nz9dz5ga+D9a0zCBS79ulACSCDp+rPJ9I4Fq6BpaJ0SNm+bQADJyDo+bQ==
X-Received: by 2002:a5d:4f8a:: with SMTP id d10mr68832352wru.219.1609535259389; 
 Fri, 01 Jan 2021 13:07:39 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id a62sm18871686wmf.7.2021.01.01.13.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 13:07:38 -0800 (PST)
Subject: Re: [PATCH 04/12] vt82c686: Remove vt82c686b_[am]c97_init() functions
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <2abc13fd1f445660e2dd9c75e98e0346b67a9988.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fb2790ce-426f-1d45-8750-c2dd5aa7d05a@amsat.org>
Date: Fri, 1 Jan 2021 22:07:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2abc13fd1f445660e2dd9c75e98e0346b67a9988.1609031406.git.balaton@eik.bme.hu>
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

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
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


