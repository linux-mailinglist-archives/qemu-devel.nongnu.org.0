Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BB021A24B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 16:41:08 +0200 (CEST)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtXjX-0002wf-Hd
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 10:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtXie-0002Rk-4g
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 10:40:12 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtXic-0003iF-IH
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 10:40:11 -0400
Received: by mail-wr1-x441.google.com with SMTP id q5so2661884wru.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jul 2020 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IN0fSDj5gMbLxaDAYvzJbCqnwI0k+DhswuWh31WRjbA=;
 b=llmSFqCjl0RChGdMO6lBva5ecMyTw8Dn6afoTRuYrk3R8BKKe1t8SfZQE8AZP+G4Rk
 hqZuqpclACo+x7dLxck1ffTuS0soYbe1yazvr6xKtMTUhrbqv+ukcIOIb/MB1w8Fcxl3
 cXc7OMuck6/jsEyxcgYqYwD3B5zp3KMB9foiXoiP8tARzOJG91HcAh/UTt8yLXt7IlM8
 QWMpj966MLb8PGSvXtTcize9n5nIqQDhKRJXkux7bArty6vRbMSMNotMk57Ashij/X4R
 /nmt4E4Jj73D7t+VrB1/QuY1rapXGw8tYAUWBdKagQH3DVvtBhuWNGzFQY5kwnlUbTN+
 t/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IN0fSDj5gMbLxaDAYvzJbCqnwI0k+DhswuWh31WRjbA=;
 b=kL9m8R2itmxtMR4sRQVNiPpG6kB8bph+Uu0tdtLCO0mE0ZH3Vfd4Jni9xCp28vT8Jz
 PgNzUnyr33V7V72T+5sDQEc4ZtxGdJAtx/pEtSOMjFI1Z96KxW3iJj1uJmHdzVXXCwsh
 evMFB8QPHBLUNMBPq+ydYo79SCj1tXwODJS1sYA1eM0U56hq8VI2n2j21PHp2TINiFZL
 S1qZ487BOqZCcED485PxvPUXBaIro6HLlhEkeGOurv+errAxfSPmpyzWsPxk8wOS/yeB
 X7fdQ0feZtDnnugxVN5Roe2VEssmIw/ZL3WLS4vcZKqJdPmSxkpdPEMk36GwAjGay+C/
 dWvw==
X-Gm-Message-State: AOAM531zlXE2kt8bUJigmYGINqVs2ive7z1nj6HqtUwwrZKJY2v9LtOX
 d4T8TYj/qWMWLdxUsGRSLE0=
X-Google-Smtp-Source: ABdhPJwhXgTGukVpkrV6+UpcHFMoctxXbodPk66C1jV8BFlSWGk6YWrjmF/Sp74dXE3IYhvfObkGMg==
X-Received: by 2002:adf:fe85:: with SMTP id l5mr60479300wrr.333.1594305608950; 
 Thu, 09 Jul 2020 07:40:08 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id a3sm4736630wmb.7.2020.07.09.07.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 07:40:08 -0700 (PDT)
Subject: Re: [PATCH v1 03/13] docs: Add to gdbstub documentation the PhyMemMode
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200709141327.14631-1-alex.bennee@linaro.org>
 <20200709141327.14631-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <32361282-285d-b9b8-0efa-1d45922eb3ad@amsat.org>
Date: Thu, 9 Jul 2020 16:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200709141327.14631-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, robert.foley@linaro.org,
 richard.henderson@linaro.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org, peter.puhov@linaro.org,
 kuhn.chenqun@huawei.com, aurelien@aurel32.net, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/20 4:13 PM, Alex Bennée wrote:
> From: Jon Doron <arilou@gmail.com>
> 
> The PhyMemMode gdb extension command was missing from the gdb.rst
> document.
> 
> Signed-off-by: Jon Doron <arilou@gmail.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20200601171609.1665397-1-arilou@gmail.com>
> ---
>  docs/system/gdb.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
> index a40145fcf849..abda961e2b49 100644
> --- a/docs/system/gdb.rst
> +++ b/docs/system/gdb.rst
> @@ -87,3 +87,23 @@ three commands you can query and set the single step behavior:
>        (gdb) maintenance packet Qqemu.sstep=0x5
>        sending: "qemu.sstep=0x5"
>        received: "OK"
> +
> +
> +Another feature that QEMU gdbstub provides is to toggle the memory GDB
> +works with, 

Maybe start a new sentence?
Otherwise looks good:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> by default GDB will show the current process memory respecting
> +the virtual address translation.
> +
> +If you want to examine/change the physical memory you can set the gdbstub
> +to work with the physical memory rather with the virtual one.
> +
> +The memory mode can be checked by sending the following command:
> +
> +``maintenance packet qqemu.PhyMemMode``
> +    This will return either 0 or 1, 1 indicates you are currently in the
> +    physical memory mode.
> +
> +``maintenance packet Qqemu.PhyMemMode:1``
> +    This will change the memory mode to physical memory.
> +
> +``maintenance packet Qqemu.PhyMemMode:0``
> +    This will change it back to normal memory mode.
> 

