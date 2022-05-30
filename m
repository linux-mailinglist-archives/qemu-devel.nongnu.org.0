Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8E537FA2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:20:40 +0200 (CEST)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgG8-0000p3-1P
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgCw-00060G-99; Mon, 30 May 2022 10:17:22 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgBT-0005qQ-Nc; Mon, 30 May 2022 10:15:53 -0400
Received: by mail-pl1-x633.google.com with SMTP id n18so10438808plg.5;
 Mon, 30 May 2022 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BeR/EBa5CLDEb/6lOX09B17u5yGihJlg0E5dXFOSID4=;
 b=URSRbLFq+XP7WcZgOnoROV2EV/1IZ1qp+lHlHQlCi7I8YLE8S1oyXPeJ0yoWV6tAHn
 OsRETXM+R0Sz+4X/A6oC8cMjjxmGn+xqZjheK68TMk6BjTAFbJJLrnXEuAPoJsIyS2XQ
 Y3o0TYgqXDk9rKNFN/NEX5p8o9KCoxC366AEUBpyTCJik2DeosRcW8MP58H/r4wQsuVN
 rNflo4Tid26ktj+N0JJtNmpedRLtCCcdN1Snex00xH8w2fjKmQxd5QCR2tRap7jCxBUQ
 UJkHQw2CkEO7kpt4EIlB50/x9HlmHccwdvap8lZKiCEr67e1bXi+Lwg86YUzRhrfPRVB
 7ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BeR/EBa5CLDEb/6lOX09B17u5yGihJlg0E5dXFOSID4=;
 b=jxGbCrGdQN3UyvaXl7GHHFMo+y5N9jYYpN4iiuhH1VQXl8+qN4p84FHonUFz2pXBij
 tsNPJyikFVj2IGuK8ANIuv9EM7LWzqSxYe6xrRHvGnvDo6nCNpodrMnP5E9xY0SvAfQP
 wbIhyEkGvUV0uZKFdVh5mQ8OnDn6ZajHgb6fJd0/iJQjFUvJ7WKW+gb9+vabuZwkyFso
 tEoKnOo9SsMamY4vgNs+5cEwqhT5LFEE7+qqgVErTcK0AZ3SRuypWaFbMgKwiEqOAKK4
 erUDsbtL1TwPqpmddCPS/THUsWspBfNN7ZVAIo9Hw5roL+Mm3wtjjvQEZNy3s3PJvc2/
 BQRg==
X-Gm-Message-State: AOAM530DMw0Aed4U5tP98F7GfvQZ/oXC9FjPardtwFyVjG6S8DFSFNvh
 Wr7H25Gu03kg1xwSnraIC9c=
X-Google-Smtp-Source: ABdhPJzFbXoZXbfImsm7uUjtLYHAwLS8QbyrOPT+BYMMWpxiHySbHCpD/6k7rxRA/Sb36tRJdln8WA==
X-Received: by 2002:a17:902:cf4c:b0:161:e3aa:2708 with SMTP id
 e12-20020a170902cf4c00b00161e3aa2708mr52714082plg.127.1653920148195; 
 Mon, 30 May 2022 07:15:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ck20-20020a17090afe1400b001e0a8ef9f84sm7190808pjb.26.2022.05.30.07.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:15:47 -0700 (PDT)
Message-ID: <0a6f58f4-007b-94ff-00d3-cde752f6a41a@amsat.org>
Date: Mon, 30 May 2022 16:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2] hw/block/fdc-sysbus: Always mark sysbus floppy
 controllers as not having DMA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 qemu-block@nongnu.org
References: <20220505101842.2757905-1-peter.maydell@linaro.org>
In-Reply-To: <20220505101842.2757905-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/5/22 12:18, Peter Maydell wrote:
> The sysbus floppy controllers (devices sysbus-fdc and sun-fdtwo)
> don't support DMA.  The core floppy controller code expects this to
> be indicated by setting FDCtrl::dma_chann to -1.  This used to be
> done in the device instance_init functions sysbus_fdc_initfn() and
> sun4m_fdc_initfn(), but in commit 1430759ec3e we refactored this code
> and accidentally lost the setting of dma_chann.
> 
> For sysbus-fdc this has no ill effects because we were redundantly
> also setting dma_chann in fdctrl_init_sysbus(), but for sun-fdtwo
> this means that guests which try to enable DMA on the floppy
> controller will cause QEMU to crash because FDCtrl::dma is NULL.
> 
> Set dma_chann to -1 in the common instance init, and remove the
> redundant code in fdctrl_init_sysbus() that is also setting it.
> 
> There is a six-year-old FIXME comment in the jazz board code to the
> effect that in theory it should support doing DMA via a custom DMA
> controller.  If anybody ever chooses to fix that they can do it by
> adding support for setting both FDCtrl::dma_chann and FDCtrl::dma.
> (A QOM link property 'dma-controller' on the sysbus device which can
> be set to an instance of IsaDmaClass is probably the way to go.)
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/958
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> Changes v1->v2: remove now-unused 'fdctrl' local variable
>   from fdctrl_init_sysbus()
> ---
>   include/hw/block/fdc.h |  3 +--
>   hw/block/fdc-sysbus.c  | 16 +++++++++++-----
>   hw/mips/jazz.c         |  2 +-
>   3 files changed, 13 insertions(+), 8 deletions(-)

Queued to mips-next, thanks.

