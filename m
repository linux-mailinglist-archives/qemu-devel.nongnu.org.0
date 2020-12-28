Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A060C2E3684
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 12:34:55 +0100 (CET)
Received: from localhost ([::1]:41672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktqne-0007ur-Ot
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 06:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktqka-0006gj-VZ
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 06:31:45 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktqkZ-0003Uf-6S
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 06:31:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id d26so11023741wrb.12
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 03:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HpGl+L/T3VRCPNSaP2HN/EWNHGf2QEfHXGop8nPGAtU=;
 b=qgabh27W+XOx6aojVpwJxhu1XXbg4PK7EnTiN0QotBgvGov/Ps5W6y7D5IvYP+ea0r
 jHbaZzVoD32GlNpV3jpRWkcyP4lJtuhTBSnOHxS2BHlCuWBztET8ucgjVfJ+2HBLrAB1
 S8japi8p5qT1a+P7coSLimAzntjNGv0yE3LK3Apax69vS3RGEuca8rjriiqdAXFAorT7
 3S8G/3cstj/4Pga62mZkOqH41rYLtkBeVhVii4cby86Vv0wOPRh9PdPqmBcLMtp7PDsz
 7H1hDfrreRYcnPQ03ZBqhjgTPe/iH0l4bUmGeXe2pEKg2zmib95sw47XNw46Mhuame2a
 rnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HpGl+L/T3VRCPNSaP2HN/EWNHGf2QEfHXGop8nPGAtU=;
 b=nEn+XM264cdUuZEXNdnFoYmc4jDfrvQfT0C8WEYCikLLjFI+DYVmpazLT1CkvHKu01
 UNSK2ENac4Eov4+SobmI+ZfGawEVZSeRjemisFaEXEnBzJiqon4NIOibUMh67E9bvCP8
 57xzeNl0/KlO2uRTmvxnuuY0tbEP2UYMddeFkXxMiB0ShdkoQnUjT7iWMy2yqd+PdoNt
 fp67Et5Xjq70LYb0i9mSc0NbEgPvPu1YkgMIS+ytu71ja2QGTdnhWtmbdnXloGSsyxvS
 bpOmSut65VTIBqNFQCBbRzBxl4Zm/I3+zRf1D1ir2RrgDqC6CJkohGFSgp5rAwBYOfCZ
 uG9w==
X-Gm-Message-State: AOAM530eNfPs0Ihq9WL8RcSZ1FSjV8pp2cEKnCTDAR6EqnA64cguH3+p
 tEfEcb/r/8GdE6ZPmCZcTq4=
X-Google-Smtp-Source: ABdhPJxbcetEfyllg3iBR37qeEuKnYs2gxg+DZNDQAg5/Ei8nVMV7w48MfwBI922SphlV3g7ZyHC2g==
X-Received: by 2002:a5d:5917:: with SMTP id v23mr49144382wrd.308.1609155101839; 
 Mon, 28 Dec 2020 03:31:41 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id h16sm19943333wmb.41.2020.12.28.03.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 03:31:41 -0800 (PST)
Subject: Re: [PATCH v2 10/10] vt82c686: Remove unneeded includes and defines
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609121293.git.balaton@eik.bme.hu>
 <56a23e0638fb15b5bc4177a0bec836a7e000083c.1609121293.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d00b7a2b-ce8c-6271-e191-0eb59729b84d@amsat.org>
Date: Mon, 28 Dec 2020 12:31:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <56a23e0638fb15b5bc4177a0bec836a7e000083c.1609121293.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

On 12/28/20 3:08 AM, BALATON Zoltan via wrote:
> These are not used or not needed.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> v2: Added back a few that we get indirectly but keep it explicit
> 
>  hw/isa/vt82c686.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

