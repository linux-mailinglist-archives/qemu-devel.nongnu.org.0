Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F6430AB5
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 18:26:14 +0200 (CEST)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc8zE-0000GD-Ve
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 12:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc8wy-0007Ct-JG
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:23:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc8wx-0007ml-71
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:23:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so36776242wrb.0
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fsucXqs6CLImagUaMLqrKH5/2E3Ejo6Xa5YgqTTmKvM=;
 b=H5oR9N6E7L/c3uvb4mxfVZCT1oILbFRBOTJV5LvCdMte07EOfp0IRE+cby21ufNEWQ
 qdEnYNEiByo5AQ7V2JI5I9laBHHgJo2LT0RnpAuVkXkVoUal98QIgFYXkh0+KRtsV+TA
 Vhh0d8of/7eCRs3KgvaLLH11fohI0rsMAI3T2TXBZfGTDPwF742lrUrcV3LaOVGkIb2r
 +aKpF/dyBiBASAR69+T0N09qDdAR/GqgqqQiFVJ16nhlKo3xAJUDQEhibM0vHqQu8Ode
 NxsMOaRxVrWhiTsZ170VDZH2Gxp0SYB/5ygL7ym7J3dCx5UAbXOiDMzcVibjazymXkrd
 xH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fsucXqs6CLImagUaMLqrKH5/2E3Ejo6Xa5YgqTTmKvM=;
 b=vLK5snhZxU+KoIVvN5hL8B4x+Ylt2d1eErYJGuqvdyeU7jbLUrRdtnS2aUyyCX2cX7
 1TRtL+m+tBCK6c9Y/FUckteTYYI0Rg5i8pOsE4N/kzSDbiMr3jUV2B57Xma1USqSK1UY
 wc3oWYfup3HQTAlHJJZLNKW/SixDkM9s4XoBLrPzhnhto+utW4gFAnsSltub4h/s+2Ot
 /rhqniOj0VKpvFsyLxVsA5fp6Ov34eOcXLJwkA1NglvgR7RTychhNQtTHPn8PofYqqFk
 ibl3E12x+SpGIwEgDdTBr9abYxEKpkLLIkU5s82u/XIJdoC7HtWUAPu+Pyh797P2swHD
 5fiQ==
X-Gm-Message-State: AOAM531DKBDeHNnmi4dWQq3+VDFRyuULcgaY/IQYpUDth4uiZ3Q9XSxH
 jTIdq3cED2SNCR1ejaDRAEU=
X-Google-Smtp-Source: ABdhPJzINvBywL/vZq92aMLuJXg3meHPSIoSvn7MY0dA3CY90W4MdtGCnSiDIsGpyAeMnHAq7dZjOQ==
X-Received: by 2002:adf:bd8a:: with SMTP id l10mr29482362wrh.159.1634487829813; 
 Sun, 17 Oct 2021 09:23:49 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id l13sm10209272wrn.79.2021.10.17.09.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 09:23:49 -0700 (PDT)
Message-ID: <59b984ce-2e03-210c-4c43-e8a841e54c15@amsat.org>
Date: Sun, 17 Oct 2021 18:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/4] vt82c686: Add a method to VIA_ISA to raise ISA
 interrupts
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <778c04dc2c8affac060b8edf9e8d7dab3c3e04eb.1634259980.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <778c04dc2c8affac060b8edf9e8d7dab3c3e04eb.1634259980.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 03:06, BALATON Zoltan wrote:
> Other functions in the VT82xx chips need to raise ISA interrupts. Keep
> a reference to them in the device state and add via_isa_set_irq() to
> allow setting their state.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 10 +++++++++-
>  include/hw/isa/vt82c686.h |  4 ++++
>  2 files changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

