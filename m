Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F6B2E318C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 15:34:35 +0100 (CET)
Received: from localhost ([::1]:59158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktX7y-0001li-99
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 09:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktX71-0001DG-7K
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:33:35 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktX6z-0001Rd-Lp
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:33:34 -0500
Received: by mail-wm1-x32a.google.com with SMTP id g185so7052471wmf.3
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 06:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Sd1Dr3AHOUtCy9WhTS5faYG+mua+vHWf2SWyGVcrx8=;
 b=OqdlYwWQ2EQvsu7qpAxt6bD3btYV28Gqt3sS34ybhIhJPiw8Rl+z0WVW0ZsH/vKxtH
 6T0/BwVU/2ak/g3yPut8Pws6Lau21baUaipRcZKibAXLICGikL2q97WrABFeYCNLHYoZ
 N4x+9KaRdBswm2Qb4HcDSJjt2qSnd9wESKMAecHVVv+OcyZTKs2NDFax2Q+qaf2xQz1s
 /mX/gc0u6qNR1sKhRZSJGKicnSmiP6heaFVHiwcNW7WCYPJN56uVYyCKkYYXD6idCj3j
 MQcROHrKsmunqZUoJH6mxsAgVUOzte76f4bJPGMThszE2aNi9UHGr/DMxmWhawORNCF1
 7qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Sd1Dr3AHOUtCy9WhTS5faYG+mua+vHWf2SWyGVcrx8=;
 b=eYOOEQ61WMD33foJyqtshrwTcWcSrJvsGrCVdTIY9iZY60C3zgj63rUeyTg4DWrpYB
 RcNSwBoogiljrAO9WY+qPoppNLWRUfFDcy28BgMksujrF0wrnEHIEamoJ3wdQt65nEyp
 nSCy79on/hEHgDkYgABCvYgrpQl94vqiTUedlzXtv+FC53MwpyUdVfEFR9cCx71llaDW
 vn9mFtbYvFUkqDgwSb9JBGkHF3NNFI/58CF0MQepkC/A8U+Ixze5c9SiedamBWhUHXV0
 ZLoOEiO/WwI4OeazXXaWDbsh1QYWaEVN3aYjnOvbAOrMr7n3nRsPwY+0Udoaa4MEZHYD
 jNjw==
X-Gm-Message-State: AOAM532K7kNWhiT+ToodGcw6jhEtz6O9zXfGO1YfWWL9MRyHx+wrOAle
 t3d4MDRtD4iZSbuzR3BewBc=
X-Google-Smtp-Source: ABdhPJzEYqzbCe2HCiMoGv9g/TpP11CjiUG2sXjbAiw3CQtumMbwu+q+lWIoXLqFo5+ScAXQJOuHkA==
X-Received: by 2002:a1c:b657:: with SMTP id g84mr16673098wmf.181.1609079612070; 
 Sun, 27 Dec 2020 06:33:32 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id z6sm53240245wrw.58.2020.12.27.06.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 06:33:31 -0800 (PST)
Subject: Re: [PATCH 03/12] vt82c686: Remove unnecessary _DEVICE suffix from
 type macros
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <f4697f5ba4c8bae032234f48a91e074fb3d62a91.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b9ae563c-5780-6d97-4873-46ebd4c7cfc0@amsat.org>
Date: Sun, 27 Dec 2020 15:33:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <f4697f5ba4c8bae032234f48a91e074fb3d62a91.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
> There's no reason to suffix everything with _DEVICE when the names are
> already unique without it and shorter names are more readable.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 48 +++++++++++++++++++++++------------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 2a0f85dea9..1be1169f83 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -49,8 +49,8 @@ struct VT82C686BState {
>      SuperIOConfig superio_conf;
>  };
>  
> -#define TYPE_VT82C686B_DEVICE "VT82C686B"
> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B_DEVICE)
> +#define TYPE_VT82C686B "VT82C686B"
> +OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)

Can we name this one VT82C686B_ISA?

