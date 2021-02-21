Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A532098A
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 10:49:48 +0100 (CET)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDlN4-0006jp-T7
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 04:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDlLo-0006Iq-Gd
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 04:48:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDlLn-0006HJ-4V
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 04:48:28 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a207so11682384wmd.1
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 01:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KIkUNGKjFgRAtm3CW5II8dXypGo5GUJ2gbJo4V+XEYk=;
 b=nMvPVH+fAHLOe2NmrASJG30PeHDp/xVQheBx099VSGxRdJmKR19WxgaBn0yBaOLRqK
 hgQ5ah++TnZngGs+Bp8mG8+DWqEJGdAteAP8noXljTc2U+8UPYRg+NlRHQI3a/0+CLlZ
 pGy1fNaUuiQQpplFhfEjrlTiugh/tKgD9nrEL7QbhHF7sBtlv014EdirazW88xgbMSQf
 yXIooD3yC+yJpN/gnPaL4xxv5BHAVjWHmhP1RkwByHl/VnLhJRc2eXwMZZqe4bCxlzf4
 8pD75XvOgTDnv5Y7KEPctyLQ2nOhhyGW60F09k/bE3oUM7y9auN7qgIrJvyIEMjMOThl
 2nAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KIkUNGKjFgRAtm3CW5II8dXypGo5GUJ2gbJo4V+XEYk=;
 b=eS8172WD/MsvqQDQ5MRXmjvFkhxAUhTK9XG0fYiLcQExVS/g3/C4fD9ew58hEnrXgO
 5RHf2IOcA+YHoTwotbW13vVkucKy6NRE3xR+4zgqhrZJ3me1XwniwvSqGjvpS+F1owOX
 w0vl45/p9NwFATit7NJCbDaZFkDJzePX9zsPQoQTBUBpafpQfs+zqHuM2PMGMBq5di7z
 ljFkixX3RopmP/fzd8VlH7Uw4pbxmPEedtrJKmN4v63g2e1SDg8AzBrlVPGmLOKTlinM
 nJTJO4fhIyfWZ4KqY35idSWrMGs+tD7cgosUNMHSsvK5s4FsK2JJPVEeqNK2vSf6loCG
 HUkQ==
X-Gm-Message-State: AOAM530kqprMaspxEnQGIjK87qMfe6wtk5ySzhJ31N02aqXXOPTD4xSP
 ip1LeqP8q4p1BgBV9oZ7OPs=
X-Google-Smtp-Source: ABdhPJyPoRmzcUujIUAc7PW3nOxG897YBNV9WZohd8k1nIb9oWCBZsiTG63Lc3VYsGcPDdeYakVBEA==
X-Received: by 2002:a1c:e142:: with SMTP id y63mr15588695wmg.163.1613900905422; 
 Sun, 21 Feb 2021 01:48:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u137sm21910779wmu.20.2021.02.21.01.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 01:48:24 -0800 (PST)
Subject: Re: [PATCH v2 00/13] vt82c686b clean ups and vt8231 emulation
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <30177f37-e114-342a-feed-e37b4b8e04be@amsat.org>
Date: Sun, 21 Feb 2021 10:48:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1610223396.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 9:16 PM, BALATON Zoltan wrote:
> Version 2 of remaining patches for VT8231 emulation addressing review
> comments:
> 
> - Split off making vt82c686b-pm an abstract class to separate patch
> - Use constants for PCI IDs
> 
> Regards,
> BALATON Zoltan
> 
> 
> BALATON Zoltan (13):
>   vt82c686: Move superio memory region to SuperIOConfig struct
>   vt82c686: Reorganise code
>   vt82c686: Fix SMBus IO base and configuration registers
>   vt82c686: Fix up power management io base and config
>   vt82c686: Set user_creatable=false for VT82C686B_PM
>   vt82c686: Make vt82c686b-pm an abstract base class and add vt8231-pm
>     based on it
>   vt82c686: Simplify vt82c686b_realize()
>   vt82c686: Move creation of ISA devices to the ISA bridge
>   vt82c686: Fix superio_cfg_{read,write}() functions
>   vt82c686: Implement control of serial port io ranges via config regs
>   vt82c686: QOM-ify superio related functionality
>   vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
>   vt82c686: Add emulation of VT8231 south bridge
> 
>  hw/isa/trace-events       |   2 +
>  hw/isa/vt82c686.c         | 891 ++++++++++++++++++++++++++++----------
>  hw/mips/fuloong2e.c       |  33 +-
>  include/hw/isa/vt82c686.h |   3 +-
>  include/hw/pci/pci_ids.h  |   6 +-
>  5 files changed, 684 insertions(+), 251 deletions(-)

I'm queuing patches 1-9 via mips-next. I'd rather see the last
4 patches go via the PPC tree or via Paolo's misc tree.

Thanks,

Phil.

