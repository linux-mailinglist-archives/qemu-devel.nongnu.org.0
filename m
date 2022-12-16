Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A264EF40
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:35:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DfB-0008On-EQ; Fri, 16 Dec 2022 11:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6Df7-0008NZ-Db; Fri, 16 Dec 2022 11:34:17 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6Df5-00038k-Ig; Fri, 16 Dec 2022 11:34:16 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 x44-20020a05683040ac00b006707c74330eso1651946ott.10; 
 Fri, 16 Dec 2022 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P2e7AtmItaDVcZaaxrpoeObvU+3azD/QhwCEZ5e4+FY=;
 b=bc7oZhD4qn6w5YgbGlSb0r/KBfW+eMLS1ApsLfGNPDBjMZc2OVWb031cBzF2Ol4Kl6
 OjtcIbuGUXhUuHDWIgkDVU6w4oMeL1iAUe5HfhJr6ZtcJ+3//QZYGi9SPbSpCtGaw8NO
 +kbBdIgxDvlCnrIl/iazViJzk+cXpCASQtcu4n6i2h7tBR/jOFgjLWV0Ibua7vUIhv60
 Xrk+3lpVF3kuuAybLft6gpc3HY1emKDRZju2B/AYIW47oAGGWnPTttZ6g8np/3dTSNRN
 X/A1H0CWgtM1y51Ywg0GfqHzc0651fq+fZQGYkO7qAj6BY1JhROOxYWTTteLXgk/v6ag
 t0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P2e7AtmItaDVcZaaxrpoeObvU+3azD/QhwCEZ5e4+FY=;
 b=K6Y5cN3DSfPhl4h/IeFjkRpOfXWVveEWcw2N+gdzxlATMfvrYEWgTifZevldhx4taf
 KnQGTgJ1TiDlQpyNRgCnnHyd0tpgWMgSnH1RKyMh/tDzIuEzIaxPUnS+Mvn5C3eLujd0
 3GsbVHDPP0LdV4IPhDVVPQljpq6rdxT6JsXyCVlZ8Gr1QboXM5O0aV5FLns/yd+3A3yr
 cSYu4PigkOhoPgy2GRCaPTnsp+WY0F/OnLOQImslO5Cpoj374+AWIuY4fUDvUlGY9zWC
 /2TFrErv8iQnLA7PaPrSCjFTn7s6jOyYkxl7e4cQcsjYuJcduOptp9Q9zdk3WoDqRheR
 niCw==
X-Gm-Message-State: AFqh2kpmCaBlYI1qd7UCJWVwjf5S3Pl8e4LGHa0BKQJfr9kxcthbtUJ7
 qcLb+dNTRXqcXVAcH2RFPRs=
X-Google-Smtp-Source: AMrXdXs+2OkfmuHGpgYpx2jvQTw3h72iszdz45Si5eBCPO21IKfn1pl2Yxs2wuJ228X+S+ojkxAyxA==
X-Received: by 2002:a05:6830:93:b0:676:1802:661f with SMTP id
 a19-20020a056830009300b006761802661fmr2048378oto.25.1671208453875; 
 Fri, 16 Dec 2022 08:34:13 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 u19-20020a0568301f5300b0066da36d2c45sm1022445oth.22.2022.12.16.08.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:34:13 -0800 (PST)
Message-ID: <667d1c5c-19fc-c5f0-2474-519230ae8a94@gmail.com>
Date: Fri, 16 Dec 2022 13:34:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 3/4] hw/ppc/spapr: Reduce "vof.h" inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221213123550.39302-1-philmd@linaro.org>
 <20221213123550.39302-4-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221213123550.39302-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/13/22 09:35, Philippe Mathieu-Daudé wrote:
> Currently objects including "hw/ppc/spapr.h" are forced to be
> target specific due to the inclusion of "vof.h" in "spapr.h".
> 
> "spapr.h" only uses a Vof pointer, so doesn't require the structure
> declaration. The only place where Vof structure is accessed is in
> spapr.c, so include "vof.h" there, and forward declare the structure
> in "spapr.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr.c         | 1 +
>   include/hw/ppc/spapr.h | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 66b414d2e9..f38a851ee3 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -62,6 +62,7 @@
>   #include "hw/ppc/fdt.h"
>   #include "hw/ppc/spapr.h"
>   #include "hw/ppc/spapr_vio.h"
> +#include "hw/ppc/vof.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/pci-host/spapr.h"
>   #include "hw/pci/msi.h"
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 04a95669ab..5c8aabd444 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -12,7 +12,6 @@
>   #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>   #include "hw/ppc/xics.h"        /* For ICSState */
>   #include "hw/ppc/spapr_tpm_proxy.h"
> -#include "hw/ppc/vof.h"
>   
>   struct SpaprVioBus;
>   struct SpaprPhbState;
> @@ -22,6 +21,8 @@ typedef struct SpaprEventLogEntry SpaprEventLogEntry;
>   typedef struct SpaprEventSource SpaprEventSource;
>   typedef struct SpaprPendingHpt SpaprPendingHpt;
>   
> +typedef struct Vof Vof;
> +
>   #define HPTE64_V_HPTE_DIRTY     0x0000000000000040ULL
>   #define SPAPR_ENTRY_POINT       0x100
>   

