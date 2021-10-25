Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACF1439655
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:28:56 +0200 (CEST)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mez5z-0004lN-Go
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meyy3-0004oZ-J4
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:20:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meyy0-00016q-Qo
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:20:43 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e12so12486049wra.4
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BPbqZW84fmuxmXayForUqJ+RoBwE49fXDUKoO4Fml7I=;
 b=U71D9eUaRSu2Sje+6H755nSMTC9P4v8JDFMdcdIN9sD1JqyYuvn/YNtzEfdmp1zT3D
 mc7Jr5XVtvC8j6zw/RpngHRmIRTTpFzhpvuInI0s3PhWFJCM99eXKb6wJrXUEK/qmOtA
 kiZUQr5SxndkhB2fOdwQpjcp8tuqpVpNfG/3vXyb57SJ2dmCvYAzdRR/w9QEdRH7PJNz
 2DW5NTKL1b0SxVQ89tku0fw9Ko9QPFDNiY7reqObd1KAH0NOCRyqEOp3HCxR/G+iO3jw
 8PCrwOK+2B/mWqHowOmzjIaxOiS0XHKENP54PjAIU5kTy/vd08nBjuZxWU53Asc7aayL
 SptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BPbqZW84fmuxmXayForUqJ+RoBwE49fXDUKoO4Fml7I=;
 b=m1/AX4dAxxUxDTgSGmu1bACY3mGFkctSVQBBrKVpVnQS0zijt8oyaz5nJWq2jKfhSm
 zs+2ibqnk1QNrXX71pethU20oH1b0FWVllWlUe0PVFeyLRqso6Zpg71x99FDXe+5U2TC
 A5Lx5tc4dRLF4L5GOJd67h2lbZBrZvmw4ARI1MOvv8XeXiq9jrB8WT4hpXppYggV1LrL
 jKkc/i5h3Urcv2bTBXztFqKk8MUFA6JXUBtaAld8PdXAArV+59nS1GjU7/ZOINljTiBD
 yRgYyfDGJLWQCBN8FK0PJyjLI9894PoHdOSoFZQNwqxDjUC6043AJiaVWNKa42HEjZRX
 yT9w==
X-Gm-Message-State: AOAM5327s1XHBahLIkfodipv6J5MgM1guqA2fkbuK4lHBhIC7simckRw
 Zaq0FJSXHBDu/tM2Qtd80UI=
X-Google-Smtp-Source: ABdhPJwq7bCNuzF1V05VhWgMRG7Xel6xQkIdCtl9VxbfwJKkW15p1lm/siCF8HM2dSQ5P4Yjz67Zdg==
X-Received: by 2002:adf:f211:: with SMTP id p17mr23313979wro.37.1635164438029; 
 Mon, 25 Oct 2021 05:20:38 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id s8sm16329537wrr.15.2021.10.25.05.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:20:37 -0700 (PDT)
Message-ID: <6f955022-ba0c-5dbf-05bd-cb73d910a40f@amsat.org>
Date: Mon, 25 Oct 2021 14:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/4] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635161629.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <cover.1635161629.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 13:33, BALATON Zoltan wrote:
> This is the same as posted before just omitting the two patches that
> are optimisations by caching the func0 and avoiding QOM casts which
> could not be measured to have an effect but these reamaining patches
> are still needed to fix USB interrupts on pegasos2
> 
> Gerd, could you please take them?
> 
> Regards,
> 
> BALATON Zoltan (4):
>   usb/uhci: Misc clean up
>   usb/uhci: Disallow user creating a vt82c686-uhci-pci device
>   usb/uhci: Replace pci_set_irq with qemu_set_irq
>   hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts

Thanks, series applied to mips-next tree.

