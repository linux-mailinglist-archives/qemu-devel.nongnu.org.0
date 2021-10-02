Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434D41FC66
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:01:33 +0200 (CEST)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfZz-00021B-Rz
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfYA-0001Ey-Ux
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:59:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfY5-0000Mm-G3
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:59:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o4-20020a05600c510400b0030d55d6449fso2132637wms.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=21tf+Mo65Jau/x14mvWof3x+ZeuDEJY0oMlL39A2dKY=;
 b=pZY48Itnqr94bNZ1cwS8I7lIdg+wtlFRALPtnQY4NVal0jj0OiGEMRNboUvX21I6Vb
 K49HEZWpl5K/dkfqmVKkf9bQAf5mzjbApPnnbIVF1FlJRVnPeTOi0kjTPrL9hgY+kk74
 arf8QUjTrjFGxwXA6TfG5flr5MDOjWql3vtP/YKEvYXvOos0mXEblGi6FZInD8+NvjgC
 kJ07SjmK2unBaYN9P+X5Z/qgYqer9Qv08K/eHpDrmaULRpn9GslPzWxhQixA8lIOTjIB
 5YGPVbuCUmNCHHVP31MjUeRmcjx3jC2BTWgIq1WjfhFzh4APFBXtZ/czDNXjeW4pPyTF
 H4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=21tf+Mo65Jau/x14mvWof3x+ZeuDEJY0oMlL39A2dKY=;
 b=NDxj4dKDR89KilrFcFNPaROJTmYRLpo3A+SWlDjMMPpn/SqgOCdNx1pn/jxqrvufl9
 e5uP6aJx24A63T1FfB18g/YnIlAOuSDB3DlaWvh6R5Md7JlNS7I7mYn36p9lEzNRBgVV
 aBppsWbkCmDREH2AUczo5CSS2SN44iK+qsXFc9u6pd6XWOtxRTspImGtYRBVKvajcNcH
 OecTZyzwc7lyg+Mv3y+xK/p2OiWKYcoXuEd0LuA/L2a4jPEq+SH4G/s5JbLkI4t+Xymb
 dkN6y3YYpF0Jc7pk19I8OG+X68juwvmT7IApZNFW4tMiE/k8gW4eug9aWyajwxUiR0Kz
 b/UQ==
X-Gm-Message-State: AOAM532NUvA/aGJaqoQvpRKwfgIjyTbYbm1p/TiCsZH6k9/FFnj0g/td
 SiFQsMtRur+70PXh6lBR/gk=
X-Google-Smtp-Source: ABdhPJwG2T3aMz8RXC7d3WeA/U4144hnEACkZqXH/vHqBImxR+7WHpnJwfR0mWpdyd1wBzN7ldCAvQ==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr2271428wmj.1.1633183171814;
 Sat, 02 Oct 2021 06:59:31 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 196sm478768wme.20.2021.10.02.06.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 06:59:31 -0700 (PDT)
Message-ID: <19526d2b-dbe3-9aac-472a-e46eafcc89c5@amsat.org>
Date: Sat, 2 Oct 2021 15:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 04/12] macfb: use memory_region_init_ram() in
 macfb_common_realize() for the framebuffer
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002110007.30825-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 12:59, Mark Cave-Ayland wrote:
> Currently macfb_common_realize() defines the framebuffer RAM memory region as
> being non-migrateable but then immediately registers it for migration. Replace
> memory_region_init_ram_nomigrate() with memory_region_init_ram() which is clearer
> and does exactly the same thing.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

