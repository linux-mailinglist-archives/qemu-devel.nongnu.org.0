Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9254D54AE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 23:37:36 +0100 (CET)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSRPb-0006a0-49
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 17:37:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSRN7-000563-7X
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 17:35:01 -0500
Received: from [2607:f8b0:4864:20::1034] (port=46073
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSRN5-0003x0-PK
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 17:35:00 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so6504447pjl.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 14:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dIplSjvjps7QKRgvAhxJyax1/RX0iCGI4bJAoHNIXQA=;
 b=qN9xTzTvdkj8FIc0iVSOVVTGuExdmHAVdoehzQGfsTrMeAC4/BimeCgZTeMCCsP7gI
 8+JzU1U5DXIueUVl7ICR6Et8+1Bgg3VltzrubDusa5SrkqsZw56WTBqQPUFfgu1PkStd
 rdXimoVKLe7H62VULwfZXmeCvbUuZR4U9yXHliOqR3eqLnBHlF3JA1mtALAVsfIzdttN
 KCEOVOah7HhPR3GuFgfya4Y7Id9Ft6LZIhy+PFV5cSxRgMbGRzG0AdJ8F18Of4PyA2D1
 Iwn5pZs9ot9+ywy64LnLgChmUO17dI/8D0PAHtG8n3iKjLyTXNUVmGCiJ5OrPBX3iIAm
 Tn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dIplSjvjps7QKRgvAhxJyax1/RX0iCGI4bJAoHNIXQA=;
 b=rqQ7vsFsVZsBkpkbY+YbLp+4ilKGAPLfjlEg/x5WXM16nGl5CZR7y0QMygB2hZiDci
 K13rzmQuu/Yql9Xr7F44bjE4aRU/z5zOvPfI/U5Mt3xaXmDenuGgEbBspQcHY72DoA61
 WFtB73k1C2neIGSKXcl8ZobOa589q+d85gX8mX4dkV2TthlgcWpf1cXNKGoid4CCYEYO
 SBE8ee5FxRhLtjbEN3UvMpqlOHdQ//hoCyBxYVMbha5yV9KcY9/SA8GI0tyl3KmOTW42
 StRKzUdnBB7LbGw0MibGkPhfJmUb38WdywqV+lWQUgPUJht/6568KOrIsZ11ebPWxh/V
 CslQ==
X-Gm-Message-State: AOAM532IGWB9loCheCBiXpmBcxu7uRnEqr6yMu0Wo6kUkNxQv2zUAv/e
 1OsBqT2v+nJVAKAKzIm1B/M=
X-Google-Smtp-Source: ABdhPJzz+7pD5o1H+n45ZHvZdv8lyhWgubl0JPOFBLocnKvLyIeppg49YmYv45ceA95uCv6hAh23jQ==
X-Received: by 2002:a17:90a:4f0b:b0:1be:e31f:bd38 with SMTP id
 p11-20020a17090a4f0b00b001bee31fbd38mr18644045pjh.76.1646951698024; 
 Thu, 10 Mar 2022 14:34:58 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 w27-20020a637b1b000000b00380437ab89asm6549619pgc.50.2022.03.10.14.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 14:34:57 -0800 (PST)
Message-ID: <186013ca-4423-95cb-4b90-c4cc9c43faed@gmail.com>
Date: Thu, 10 Mar 2022 23:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH-for-7.0] linux-user: Fix missing space in error message
Content-Language: en-US
To: Patrick Venture <venture@google.com>, laurent@vivier.eu
References: <20220310192148.1696486-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220310192148.1696486-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fergus Henderson <fergus@google.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 20:21, Patrick Venture wrote:
> From: Fergus Henderson <fergus@google.com>
> 
> Signed-off-by: Fergus Henderson <fergus@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   linux-user/elfload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 9628a38361..c45da4d633 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2504,7 +2504,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
>       addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
>       if (addr == MAP_FAILED || addr != test) {
>           error_report("Unable to reserve 0x%lx bytes of virtual address "
> -                     "space at %p (%s) for use as guest address space (check your"
> +                     "space at %p (%s) for use as guest address space (check your "
>                        "virtual memory ulimit setting, min_mmap_addr or reserve less "
>                        "using -R option)", reserved_va, test, strerror(errno));
>           exit(EXIT_FAILURE);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

