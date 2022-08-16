Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7974594B35
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:21:38 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNkKv-0002HP-Rs
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkJG-0000Gx-4Y
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:19:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkJD-00026l-N4
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:19:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id pm17so8322089pjb.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 17:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=LSNs2suskeVcv6xjvbNkoxpZWj7BhFg4rDsfdwyreiM=;
 b=JORocseVRGXaDTSaAyNK4z7SPyx2VxF3NgNVZF+3Uo/0eRlJE3jRKn4RdMtSPlxiaD
 u43e6gly4bAWUAfX/YRhGFbQPlQwt+UdXc3fBf10NChZRLb+rfHFafUWMc3bJPL4YWY0
 gUsP2q/UajSOCiIJEznIVpO4ctkxuE2jTGucAiVswmo8hT+25WF+QUWPqL7s/EXm2Y+s
 TTdvnIp1JR8nJ1QT98G3X/rSOngz8ts3Y2Ws/ZqJwCwjtt6tQEBpy+I4IYwgn54mGnRa
 k3ftnVxFpOfoOPaFjFR1xuJGBz6fpiT6kEaopkaMP+MnMRY8sWKsr9K7K7xO0+LiH7r6
 Pcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=LSNs2suskeVcv6xjvbNkoxpZWj7BhFg4rDsfdwyreiM=;
 b=3uwGgiUeAxpOOOqPjQt6YPjOx1MD3MYU7pWXS+zzQCwLRCh0zClx0y2Z7ND3pKgC3F
 KodYhl/SarMOVnrxOrT44sugQ7+Nt7CsqS53a1TELQ+VnrVXOqW/B7FVL0VFdLqTGqIY
 mAUNaDiDLVVMU68GEi2Uv97n4dO+9mcIJ6hv3LHERZBoUp9PcMDfI8qaIm9T3X/oQIfn
 YDp/flw7mogr7NhQAUsZri9YZ/HVjOSa/Bo3K3BSJkUOB5KXc2RKGJdssEjoqsksJK3G
 bs7odmkRBg3BZgO3823bjl9PcLZTbIp9fj5H90V3gEIgM2qNoedCOwMYtvAgzLluNNdR
 0ZQg==
X-Gm-Message-State: ACgBeo3yZApXZ08fyfgGf1G1v9M8axMFTWebFhKNOwf8WMX548Xw3wn0
 xl2u/IorZ5vykYQgacI79cc=
X-Google-Smtp-Source: AA6agR7MAYjuNQMMBiY+EUzJe73WBBlxzTIr7IfPsGyDiVVr6TuY49d6vVweAHw1pZ8BCvZ2iF0ujg==
X-Received: by 2002:a17:90a:ac0f:b0:1f5:555:c37 with SMTP id
 o15-20020a17090aac0f00b001f505550c37mr20652911pjq.37.1660609189727; 
 Mon, 15 Aug 2022 17:19:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k29-20020aa79d1d000000b0052bf6789f02sm7299916pfp.178.2022.08.15.17.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:19:49 -0700 (PDT)
Message-ID: <3f3c773f-3400-861c-04f8-4826f3c3d7be@amsat.org>
Date: Tue, 16 Aug 2022 02:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 04/20] disas/nanomips: Remove helper methods from class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-5-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-5-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/8/22 09:26, Milica Lazarevic wrote:
> Helper methods from NMD class like NMD::renumber_registers,
> NMD::decode_gpr_gpr4... etc. are removed from the class. They're now
> declared global static functions.
> 
> Following helper methods have been deleted because they're not used by
> the nanomips disassembler:
> - NMD::encode_msbd_from_pos_and_size,
> - NMD::encode_s_from_s_hi,
> - NMD::neg_copy
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 322 +++++++++++++++++++++------------------------
>   disas/nanomips.h   | 144 --------------------
>   2 files changed, 151 insertions(+), 315 deletions(-)

> -uint64 NMD::copy(uint64 d)
> +static uint64 copy(uint64 d)
>   {
>       return d;
>   }
>   
>   
> -int64 NMD::copy(int64 d)
> +static int64 copy(int64 d)
>   {
>       return d;
>   }

Does that build in C? You are declaring 2 functions with the same name
but a different prototype... Shouldn't you squash patch #14 here which
rename these functions with the return value as suffix?

> -int64 NMD::neg_copy(uint64 d)
> +static int64 neg_copy(uint64 d)
>   {
>       return 0ll - d;
>   }
>   
>   
> -int64 NMD::neg_copy(int64 d)
> -{
> -    return -d;
> -}

Ditto.

