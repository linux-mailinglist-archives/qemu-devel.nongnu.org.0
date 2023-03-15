Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A356BBAA9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:15:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcUhD-0002fN-Ce; Wed, 15 Mar 2023 13:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUhB-0002f3-FD
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:13:49 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUhA-00041j-0B
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:13:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso1540716wmb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 10:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678900426;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5lchT2DbiabcwgLayd4AYMkiyp9y+U7zQIaVG54/GqM=;
 b=eMOV7/U0gh+VrjuCoMXlgxxYAxrkPaMblio8aBVj2IODxk9v+W1wlB5r3owYMrpIDk
 KVUS98937q9BrmPrN7NsW7zeFPstqsVu00wsna6koVKI7FGc8UINwICUwgFxDecexgnS
 FuQgcuVLB6LYh9GeuBlrqAerq5KOzYDHbIj++EoW/fE6Et8LySxtizKoSVYMgPU2ld4V
 kcaXf4nebuA0ik3AbTo3hY9ON0z7RQUNR32k2yhYSFfUkPaKVxoN8RjrS327TCFGooIH
 /qFlbXIbZCK9adplz3M0dwXVZujdKDcWOW6+Odoq8dwfUc8o89VthC71ZmYxU5Q4vAkt
 UmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678900426;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5lchT2DbiabcwgLayd4AYMkiyp9y+U7zQIaVG54/GqM=;
 b=epTwV2dXsKMaO752Ik9JzAUn7SbYnD4n5S6oXILKejWUMdgzFXTve2vnPQiwvc7dzX
 T0o4I57W03SRCcpgOTtblLVdyXuA+2uIBQwpwtxO4nrlsA5a2WEaVbhssJU4ZbjMCs4m
 5PyzPKFmyfKrHVfexcHFOrDcucfJ0Z/cV0g1Q7au1W5jA5E7fcvDd6LtlA+aX1GEqjh/
 ckyt9nD3fCVALF8z1swhKUIeSHvQTrmHlVYD+Pa4bKsHGvcJ4c9+5uCG2XwzLRyc/13I
 q91kmuVV92VJj/w8og+Vi4sCBmDOspxiu3CUmZHJkR+DT1CaUppEUJioPeCdkP73MFnk
 Z+xA==
X-Gm-Message-State: AO0yUKXrY2SxOXzXK6yLSoQX3/3q5CAxfu2sfn/F3aAxsOtaQ9RfTsIS
 sahVPYIEwkJGVeAYTizc2u75/g==
X-Google-Smtp-Source: AK7set8PSNtK3HogwmTCi16UfLr5wfuiI37xMBtmIx9VjqF/nV3OWTprna8oc2n1tFhasan8MotnHA==
X-Received: by 2002:a05:600c:1c28:b0:3eb:3b7e:7b89 with SMTP id
 j40-20020a05600c1c2800b003eb3b7e7b89mr18537512wms.3.1678900426369; 
 Wed, 15 Mar 2023 10:13:46 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o5-20020a1c7505000000b003db03725e86sm2511622wmc.8.2023.03.15.10.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 10:13:45 -0700 (PDT)
Message-ID: <84b1cd46-50ef-0bb5-c00c-9cc5a23fd688@linaro.org>
Date: Wed, 15 Mar 2023 18:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/30] include/exec/memop: Add bits describing atomicity
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216025739.1211680-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/2/23 03:57, Richard Henderson wrote:
> These bits may be used to describe the precise atomicity
> requirements of the guest, which may then be used to
> constrain the methods by which it may be emulated by the host.
> 
> For instance, the AArch64 LDP (32-bit) instruction changes
> semantics with ARMv8.4 LSE2, from
> 
>    MO_64 | MO_ATMAX_4 | MO_ATOM_IFALIGN
>    (64-bits, single-copy atomic only on 4 byte units,
>     nonatomic if not aligned by 4),
> 
> to
> 
>    MO_64 | MO_ATMAX_SIZE | MO_ATOM_WITHIN16
>    (64-bits, single-copy atomic within a 16 byte block)
> 
> The former may be implemented with two 4 byte loads, or
> a single 8 byte load if that happens to be efficient on
> the host.  The latter may not, and may also require a
> helper when misaligned.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memop.h | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


