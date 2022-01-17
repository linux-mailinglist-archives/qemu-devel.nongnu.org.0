Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F644491135
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 22:01:17 +0100 (CET)
Received: from localhost ([::1]:57682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Z7r-00056q-EM
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 16:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9Z0W-0005sh-VS; Mon, 17 Jan 2022 15:53:41 -0500
Received: from [2607:f8b0:4864:20::230] (port=41893
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9Z0V-0008HP-AM; Mon, 17 Jan 2022 15:53:40 -0500
Received: by mail-oi1-x230.google.com with SMTP id q186so25355628oih.8;
 Mon, 17 Jan 2022 12:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i4qnazTiy3jdHJH09SN5eXFyO3PjqbHC9StEcF+JqqE=;
 b=SgD2+NQj2O57itzgpJpxvvUQelY+JuOESaLB/1pWS9K1/zECEAR7ycct7vjPXmh7oz
 GBJu//v8xR4JKgsC9T/L7G6MKG7ODuKlY+I3JijLQIl1O0qjWt+slHPRoRvic4bUEZcV
 tKB1hbOoY/XUrxPSvdahWk6VZHLF98d9C+46ijQ2pBXoCIXNJuDLLYz0mdglV/86HTTW
 D8Sx7I5eZqHhkSpLfUNCIwljc6k6v3gCRJ0f4m2yPPDhDFbueKQ1qSF4x8g6cPQwn687
 c3BueJesXKizMKZ51U+ZjGgEoWNwdd4L4nGkumkg7YgmkNN2eLK9QNb511ngJhwG3MyC
 bqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i4qnazTiy3jdHJH09SN5eXFyO3PjqbHC9StEcF+JqqE=;
 b=loEGdl+IFNkD3NZtuc+GV0xFXzDs9IANI5uur1C+PrcKbuhNnV8l78Vo8Ne4neuCtL
 NuxmVbjnWvRVqLubqtFuxgwGtH+Em/7UWBWDCAPZS2X2ehgdE1SPCI4j4TUk6cI0MGvi
 Zww22BHYZ5gggxkhZXNBL/LBDciF7BghWEVihCBUP08rqlPjoTA8eWMNxf6sSLhX05jp
 uXRxlmJWl25ZOAF/1EE88dqqeIuk/C8vMnhbyGVffEg4m6Hnhb1yb3tXLXG92kN/VRR+
 ZBhN+/GI+QacsTejxqhitLcxRp/c/zM/m7N8Jz326rm6C1ajs/B2S7NOKVwU0+Kv02tM
 xcSQ==
X-Gm-Message-State: AOAM5323zX41787DKLfiedBK01IsxonByQ//PWw2UN8sSrD+X9ksXnvQ
 /N17tyjh5kQqtl0Ak3nM+DE=
X-Google-Smtp-Source: ABdhPJy+HD5cPpZ7JOVdfG2VjUMYwvjLklEFLEvqr4M+Qw9Vrv4x3bOM6Qs8myCtHGfGPc3kBi2SUA==
X-Received: by 2002:a05:6808:13:: with SMTP id
 u19mr16181518oic.28.1642452817697; 
 Mon, 17 Jan 2022 12:53:37 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id a5sm1312105oto.66.2022.01.17.12.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 12:53:37 -0800 (PST)
Message-ID: <e08c04ee-012f-0310-8bf3-d9f939e83356@gmail.com>
Date: Mon, 17 Jan 2022 17:53:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] Link new ppc-spapr-uv-hcalls.rst to pseries.rst.
Content-Language: en-US
To: lagarcia@linux.ibm.com, qemu-ppc@nongnu.org
References: <cover.1642446868.git.lagarcia@br.ibm.com>
 <a24d2c260442e44aa99d4c18b1717f2f4a73529a.1642446876.git.lagarcia@br.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <a24d2c260442e44aa99d4c18b1717f2f4a73529a.1642446876.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/17/22 16:19, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---

It is worth noticing that this patch applies cleanly only if the

"[PATCH 0/3] rSTify ppc-spapr-hotplug.txt" [1]

series is applied first. The reason is that docs/system/ppc/pseries.rst being changed
here already has the ppc-spapr-hotplug.rst link.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



[1] https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg02701.html

>   docs/system/ppc/pseries.rst | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index d0aade3a31..569237dc0c 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -113,13 +113,9 @@ can  also be found in QEMU documentation:
>      ../../specs/ppc-spapr-hotplug.rst
>      ../../specs/ppc-spapr-hcalls.rst
>      ../../specs/ppc-spapr-numa.rst
> +   ../../specs/ppc-spapr-uv-hcalls.rst
>      ../../specs/ppc-spapr-xive.rst
>   
> -Other documentation available in QEMU docs directory:
> -
> -* Hypervisor calls needed by the Ultravisor
> -  (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
> -
>   Switching between the KVM-PR and KVM-HV kernel module
>   =====================================================
>   

