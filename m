Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B925C0E7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 14:25:46 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDoJF-0003vv-7x
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 08:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1kDoI6-0002hK-Ef
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:24:34 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:47088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1kDoI4-0007B4-Rq
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w9hrvpzqnyeIQhaIvofE8T8cpLFEGTKwPc7qME0LCww=; b=Os85d5tGlby9XcVqTmoku7kO8D
 58DhQmUaMZv7PuR5giJHIrBl50bDKdjc1XoIpUPpunLQd+ozBzQwY7a7CYdTsJTltGdiAiK+3AA8m
 5Qek3WjPzIewbu/h26r8EoId2Bb22Itp+0AT/oi5mSoHphkn9MHqPfiOTGQ4Sm7qSN5I=;
Received: from [2a01:e35:2e3e:3c40:11ba:4ea9:f771:23c2]
 by iserv.reactos.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <hpoussin@reactos.org>)
 id 1kDoHi-0003mM-Lx; Thu, 03 Sep 2020 12:24:11 +0000
Subject: Re: [PATCH 39/63] esp: Rename ESP_STATE to ESP
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-40-ehabkost@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <d0867271-1587-7f70-320e-0bc5ad24ef0e@reactos.org>
Date: Thu, 3 Sep 2020 14:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902224311.1321159-40-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=hpoussin@reactos.org; helo=iserv.reactos.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.403,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, berrange@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/09/2020 à 00:42, Eduardo Habkost a écrit :
> Make the type checking macro name consistent with the TYPE_*
> constant.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: "Hervé Poussineau" <hpoussin@reactos.org>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: qemu-devel@nongnu.org
> ---
>   include/hw/scsi/esp.h | 2 +-
>   hw/dma/sparc32_dma.c  | 2 +-
>   hw/m68k/q800.c        | 2 +-
>   hw/mips/jazz.c        | 2 +-
>   hw/scsi/esp.c         | 6 +++---
>   hw/sparc/sun4m.c      | 2 +-
>   6 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>



