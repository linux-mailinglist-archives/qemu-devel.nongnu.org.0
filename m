Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928585847CC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 23:42:17 +0200 (CEST)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHBGq-0006p4-3D
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 17:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHBE6-0004fY-GG; Thu, 28 Jul 2022 17:39:28 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHBE5-0007IH-0Q; Thu, 28 Jul 2022 17:39:26 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10d845dcf92so3885774fac.12; 
 Thu, 28 Jul 2022 14:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8l+S4QlLQ8zxU1HMTKEhFAH35d+PyqAlLtuQMK1u3sk=;
 b=bcXNCX3zF6U0m3gY5VH9CIcnej0I/3Dazsw8KOoV01rufzxvg48SWqcoN1eM/avhbS
 DHtKXv729Tw9N17L0vZZrHTmBEl9b7H2Qynx0G2OQ+7Y+20HPuFccG9JvR6Jfa3roEdp
 SGyTnvt3PK1WV5yDkxWGkb4Xz3Wqy3t7v1/0zZSzI5UhC2A3KY+W5wIQ6F4WBs1y+80P
 y04NjYcz6jSFOQToC4bno1KRq2uSHh7ytC9nTAFtJ3S68elxFIwlpvnu48ccFk97t6t/
 AN6eatOj0NDKaK6hdcMwl8r3DQ8Yo5Fz2MIlW6Ab/jVMT1VM1WMr4R/Poq5NZ58hb2B3
 m5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8l+S4QlLQ8zxU1HMTKEhFAH35d+PyqAlLtuQMK1u3sk=;
 b=le5V0tH4seOnBx/oLzNV7SWKLvxyQaJas+T9b4dc5MFG7UIS1G9XZQ9GbjO5/gSi3q
 KCNgT48BTvuByYF/cyl2qCf6JrPF6W8oyF4gyQ3PD06oJIXzcgdAsBmtPMhMnlKvuL9S
 tKgbXhG8iqKaiJgYTqS7nOmC/JrnFi7N7roXGdYwV2a11Di+PxjvAHJI4DCyq6t+IlNt
 LW2VVQWiPRd78mctO0Wz2y0YJrao6ElvIQ3INuzH9K11FFkH7ZrJddisXjVCwG6vFls3
 eZ8r/ckbfT1z/D+Jni3pi9UCyVajtIJze5DKuEkPGHYyskMB73MZN9fYKmrnUjkEzgaP
 LFTg==
X-Gm-Message-State: AJIora+4wtTrJT4McWFpWzr12SmbfOd2EG2kMt8upmKVz80f3KnS78s6
 IQeO2zXgIp4jXKoqb7BXv5g=
X-Google-Smtp-Source: AGRyM1vgUJTXWve0vXhu6GLQOn09cWnnZIOuUe2Do1xN+0sDMg7JAQrgaNTl+OSPxVaoKV1zSFwocA==
X-Received: by 2002:a05:6870:14c7:b0:f2:c44c:d054 with SMTP id
 l7-20020a05687014c700b000f2c44cd054mr320891oab.70.1659044363057; 
 Thu, 28 Jul 2022 14:39:23 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a056870899800b0010db1a8d931sm951036oaq.28.2022.07.28.14.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 14:39:22 -0700 (PDT)
Message-ID: <222e2084-3090-517c-170d-ae098a79aff8@gmail.com>
Date: Thu, 28 Jul 2022 18:39:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ppc: Remove redundant macro MSR_BOOK3S_MASK.
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org
References: <20220728201135.223-1-luoyonggang@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220728201135.223-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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



On 7/28/22 17:11, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/ppc/excp_helper.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index cb752b184a..7550aafed6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2015,7 +2015,6 @@ void helper_rfi(CPUPPCState *env)
>       do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
>   }
>   
> -#define MSR_BOOK3S_MASK

The tag was introduced by a2e71b28e832 ("ppc: Fix rfi/rfid/hrfi/... emulation").
Even back then it wasn't being used.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Laurent, I believe this is qemu-trivial material. Let me know if you want
me to get it via the ppc tree instead.


Daniel


>   #if defined(TARGET_PPC64)
>   void helper_rfid(CPUPPCState *env)
>   {

