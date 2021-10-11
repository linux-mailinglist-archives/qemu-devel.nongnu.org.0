Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E04242994A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:03:58 +0200 (CEST)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3On-0002LI-16
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3Lx-0001QS-P5
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:01:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3Lv-0003g5-Fd
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:01:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id e12so60491610wra.4
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LlvZR0ouem3zCx10YO8pz9yleyqzdhesq5Elgu5JFBs=;
 b=e6DI/pjgfuJUFa2JoxGSutndzO3NXnaffF6U28K4QxWYRnW/EVUlU8mntZn6jjKGyt
 eTrKdhQwgv9KPgY0vrQahXyAlMxMeGfQoVlebwlaYCUMLTUOiOLNcQspiRTiMUSXfJX6
 4IGQGIA0Ly5EEWr/kiA6PnWqopgN9gy7mn/NKnx4TW9EcpQQyxZgteMhDaQbGiHbygtZ
 DWYK95QQBVkq+5fgPrdes0CSV7sDfrRcEkz9o6fXugyrPXcZ8f0LA2OKT8Vq3DUOV65j
 KErbccB3w+c2UfSsLqCJWiE+OCZWiPibG5UtJ22Nk5e57I2iAEsoEY082pPNdXrAtXXG
 NMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LlvZR0ouem3zCx10YO8pz9yleyqzdhesq5Elgu5JFBs=;
 b=XfUUxDHd93s+eagbYvy8vx9PhCzSvRo6Xt3Cr/uikvateUqt7YY/BeeDDUpciVSDN0
 oWGXuOPIFRj7oOKG3Y4z/s8YA8FdKbcI3vXpW9Ya8kRZsIpOaVbbw12QD2zJch4O1kVU
 BA7k0K6b5crlaW4Qc0e5jpIFzFJvMaHy25U1rt7t6LkhHFw08mQgPnRFSMxaL/LxnUG6
 8ixeojXdZuzUrXLH8sx3oGoBetnul4RHLPN6dvx9SDyXIaEjIfL2IDHD5uYsjVpiCXmG
 XUHHmVr48nZS1zlbDNFzUnVVgSylMD3owTeTSNMqwORrZMl8QbL6YV/DBLDh8gKFIdlz
 hLgw==
X-Gm-Message-State: AOAM532Mib5z/8Yp0Vj8PnwdRWRIYt2W+er69Trdp3Q8uKBZGmCjR06A
 hkOYXEGQlmcYZaS1Ot4vKDs=
X-Google-Smtp-Source: ABdhPJxTizocjyiLpUkMQHpza0KZfi6UD87JROOaYu6g90D2oE8vlzMFbteYnncNhmcxuCy/pcvHJw==
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr28388913wra.109.1633989657575; 
 Mon, 11 Oct 2021 15:00:57 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id l21sm678049wmh.31.2021.10.11.15.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 15:00:57 -0700 (PDT)
Message-ID: <208f05ac-461d-7c4f-b8d7-869c79fa84e5@amsat.org>
Date: Tue, 12 Oct 2021 00:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 8/8] target/riscv: Support TCG_TARGET_SIGNED_ADDR32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211010174401.141339-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/21 19:44, Richard Henderson wrote:
> All RV64 32-bit operations sign-extend the output, so we are easily
> able to keep TCG_TYPE_I32 values sign-extended in host registers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target-sa32.h | 6 +++++-
>  tcg/riscv/tcg-target.c.inc  | 8 ++------
>  2 files changed, 7 insertions(+), 7 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

