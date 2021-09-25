Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F77418121
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:56:18 +0200 (CEST)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5Lt-00080T-Fz
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5KV-00079A-8G
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:54:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5KT-0002Hb-LM
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:54:50 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u18so35269578wrg.5
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6KbRmkzKZPgY823MayQ7fCX7q8Xa9LTeTFNT1Dfj464=;
 b=PVx8WDNruU5rMIakEtbsBtJKEomBVZfDalRgTLCW99jnt2Kpi6EHfoBHX3jhFB1GJ9
 G0+UZDWy9meT3KhGUQ71Y0gpyijgED4HO5uD+JCKAE3nO9g8W7nRcyOvuADjTIf74MKw
 Uq6ThUUtRyhxbPNYdBKCT8VeAdpHeIujIAxPZ8hwTpWpCuf9rOLPgki1GrWAzwMJG8wB
 vG59rQjyCmpPFzTQH5DDudLwzWQTGqooSbik+nfRvv3Uk+u6iHNgQ4PQrNsiB0FuaWX5
 WaaRYQXpeczRn4vx0QENbstqfNjZWds/zUjYwEtz4NgmjuU/JP+UNbydhzn4EpDWNAPm
 2m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6KbRmkzKZPgY823MayQ7fCX7q8Xa9LTeTFNT1Dfj464=;
 b=4KTWPSOnTeLg1rxsgtRepQQ7Y1ocuK6hXzpOxmS4DBoghyMt1r4UypYMSiBV5fAGmF
 7dUhBcsUzrufbRSljYNOU7xFcFmi7kE2lFqnIPBdjzqrzanMWcuZNxJZU4Fns9OyyB1u
 iUxchijJh+JVhomiGCKwKgFvKrqdeVXuLpwTQRxb/S5xBjfVsiIKAVDt8aOvQRuI2tv1
 2yUq8TYGIwuH3nKQaEDfUF2NVRwaVG5tx2t9Zt+WkgythFHAVw4qhjpcAzIgtLBdivo6
 A1WrrTXipljVyEHsGsy088bOJ+xTWpYGNY0GWL0MSNK0uMbcNobe6EU6UCmwj+XAmQms
 judQ==
X-Gm-Message-State: AOAM533h6DCRrl/MJAAP8ewfeWN69FDh60Xw+h4TpJFx5j+NK1iPYRyr
 2hZLG1+maRCJZH2XcptVg6A=
X-Google-Smtp-Source: ABdhPJzrKvOWjP6z1IGE0fuRSU90IuwMzpEPXKjDMMixA6DIzjnTD0MLAvaNaVqT9SZll852cB4FRQ==
X-Received: by 2002:adf:f188:: with SMTP id h8mr16231194wro.269.1632567288374; 
 Sat, 25 Sep 2021 03:54:48 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f8sm10687826wrx.15.2021.09.25.03.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:54:47 -0700 (PDT)
Message-ID: <55d4e540-0894-b9c7-1e1a-067ebfa6fe3b@amsat.org>
Date: Sat, 25 Sep 2021 12:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/9] bsd-user/mmap.c: check pread's return value to fix
 warnings with _FORTIFY_SOURCE
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-3-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922045636.25206-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 06:56, Warner Losh wrote:
> From: Mikaël Urankar <mikael.urankar@gmail.com>
> 
> Simmilar to the equivalent linux-user: commit fb7e378cf9c, which added
> checking to pread's return value.
> 
> Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index fc3c1480f5..90b6313161 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -174,7 +174,8 @@ static int mmap_frag(abi_ulong real_start,
>               mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
>   
>           /* read the corresponding file data */
> -        pread(fd, g2h_untagged(start), end - start, offset);
> +        if (pread(fd, g2h_untagged(start), end - start, offset) == -1)
> +            return -1;

Missing { } for QEMU style, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

