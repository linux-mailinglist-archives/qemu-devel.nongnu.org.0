Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97462573DA6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:12:15 +0200 (CEST)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBiiU-0006ey-Os
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBif2-0003uU-4K; Wed, 13 Jul 2022 16:08:40 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:44644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBiez-0003aP-6X; Wed, 13 Jul 2022 16:08:39 -0400
Received: by mail-oi1-x22b.google.com with SMTP id bb16so908839oib.11;
 Wed, 13 Jul 2022 13:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UEoAVGk6GyP/ekwjkGdtR7H4o/tk7yGUtWyoWmJfuPk=;
 b=ONr4TkbN0B9p1KMDYhrWbxB/A0gWD99WZ+DIwXnkHJFcwKbtJ0+PHNcBMXcyACoHoB
 SBFayXWoIZt5tFbu2FkEiOQecJdKLjNvP57lDpJ4w8PZWp0Qo5GhAdZ1J0CGIV3z5oBY
 R7qPFWow5EMTRpZi9CZqpjrbuwB6LE8jsXe45jFGxScPsTra6eesHl6f0ZdCu+SxMwPO
 haIfrlpE2IrN/9N5+1/+ZcN4EpDQKZtW8+RS2b7ngxjX2JExEHUtAyFyDYbkl7iN0pZ7
 51Y52HP3o8rNxmsmApgnZNDTqGhjEP3N22aIGbjnt5+hFAaqxTN7idBtGDRPg3O7nl1D
 JxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UEoAVGk6GyP/ekwjkGdtR7H4o/tk7yGUtWyoWmJfuPk=;
 b=CCWqtpBI+q09KuB6AnL9h9/wEw1bAtW+3GdE+hbeOhPl3V1RocwOaf5q/VIwddNwcV
 hA0qImTp7TUmKO6/tGjUnALpwDvsbZ0grGLTiV1LoIespcjdCEILxA0GKlekFFmNBBNK
 tWCZXbIMWefplKtz0lq/M5rIngUfAQ9cTYba8mwqjWFGUWN7qpdenXHFIvMS2tYHCI8/
 G7xryMw7JSrPDV2/ZhAERUr6z0TO/ycA4NDILO6aYOxRPXSOWGpq3ImvYzeDNYYBZwko
 APde7LSV8gib5j3ThNS/GHf9vYfcAKM18A5n1Xn2SLeBvW2XSdR2sPP4Tedr6G3wjHKY
 yGcg==
X-Gm-Message-State: AJIora8YXFPOQDrca1lEJPHlPUXLCSWAPpby2ExshmWX6CPqGdNKIM9I
 urGa20amGiphcvVKjNXq87k=
X-Google-Smtp-Source: AGRyM1vJVviroYtG/rbYfFZTzEW2SO9sEn2UDCFpXN0t2AhgxHFyLi/yBU131yDoOg2WNgASmtIDYQ==
X-Received: by 2002:a05:6808:1aaf:b0:32e:fec8:b67c with SMTP id
 bm47-20020a0568081aaf00b0032efec8b67cmr5845458oib.118.1657742915740; 
 Wed, 13 Jul 2022 13:08:35 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 y7-20020a544d87000000b0032f7605d1a3sm5692239oix.31.2022.07.13.13.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 13:08:35 -0700 (PDT)
Message-ID: <bd97a38f-0b4a-1ead-d339-b0b8d9170260@gmail.com>
Date: Wed, 13 Jul 2022 17:08:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] target/ppc: fix exception error code in
 spr_write_excp_vector
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 farosas@linux.ibm.com, laurent@vivier.eu
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
 <20220627141104.669152-7-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220627141104.669152-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 6/27/22 11:11, Matheus Ferst wrote:
> The 'error' argument of gen_inval_exception will be or-ed with
> POWERPC_EXCP_INVAL, so it should always be a constant prefixed with
> POWERPC_EXCP_INVAL_. No functional change is intended,
> spr_write_excp_vector is only used by register_BookE_sprs, and
> powerpc_excp_booke ignores the lower 4 bits of the error code on
> POWERPC_EXCP_INVAL exceptions.
> 
> Also, take the opportunity to replace printf with qemu_log_mask.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 30dd524959..da11472877 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -907,9 +907,9 @@ void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
>       } else if (sprn >= SPR_BOOKE_IVOR38 && sprn <= SPR_BOOKE_IVOR42) {
>           sprn_offs = sprn - SPR_BOOKE_IVOR38 + 38;
>       } else {
> -        printf("Trying to write an unknown exception vector %d %03x\n",
> -               sprn, sprn);
> -        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
> +        qemu_log_mask(LOG_GUEST_ERROR, "Trying to write an unknown exception"
> +                      " vector 0x%03x\n", sprn);
> +        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
>           return;
>       }
>   

