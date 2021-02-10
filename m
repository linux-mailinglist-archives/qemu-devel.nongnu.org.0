Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5EF31739B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:46:36 +0100 (CET)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yFn-0003yH-VN
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9xz8-00089d-Qe
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:29:22 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9xz7-0001uv-CC
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:29:22 -0500
Received: by mail-ej1-x633.google.com with SMTP id lg21so6985617ejb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qjIEaiwBMpLjh3/rP+pFwqipFV8WMF0NfeqyiiIxdPQ=;
 b=Uf62KzKka+PgUndMTXI/4TxSkPQjKVXdVq4npbMrAmB8Ze8szGrxadvMwBq6n2Rz75
 Pni7cVXCAL0R8naa78DA/+UJgO1WW1our3PNzH1NV/p7RWQgK/TqWevUG7yfG2StQg5N
 4Z2QqJKuIbPkorV3/J6gbCDDuZlVPLV7QVVXF5agSeIeNyNruRlKUTVOeTJpj69cu6Z7
 e3GK+hLKei5WSiR1TcpRi+wLGzb76agU+jz6sBG8lCoHFAg/MrGLoM671hoLDQ1u7h95
 oWxRJtbJ6M2K9GWiGf9c3Q/e1rrlUqvZhLgSaGEmhfEtORuAiYsM2zoIMRDTMAggTdNV
 Wg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qjIEaiwBMpLjh3/rP+pFwqipFV8WMF0NfeqyiiIxdPQ=;
 b=e4q6N/L7BK8ckFCKsDJApNIQlZZbsC/n16dYJ88skKWqsDpJGtuseOkOltc3wK9dbK
 1B4422V8o6WAA/Bc/KlpTiUT/nZk+MaSpp1V9saIllGntka0Xe9cNAsqoecdVrPrbC47
 MJH40LcoX0VUkPmXpRlmWQmFCRwpxax3OaHfVrGdMJJGuwJBAB82HUKALc7kmdlT0r6g
 53SAwuOOPtQv1av1gMzWq/gNnvRLn8FLC5UnGpeGWTK7PCC+w5TPm1cVKAXqiE2J5CwP
 UNXX+I0rrhaar5tsgV+pwE7IWoCYiVXnV9TZQinMkaNAwbfK/AqXH6dC9rUGjXT1HzI5
 9m7Q==
X-Gm-Message-State: AOAM532E0b+UTWPNwZRMUAauERJ4tGcUWPnER4K2l1nLViQVH4zBvoKL
 hUjfRLUDlAxpEajBfnkmw2w=
X-Google-Smtp-Source: ABdhPJzApEtpmX40I+FfP7kYcX8ZzMrCSdaVOIiWeBrh4T6xgGBOlihf3UlBdxMohcYVS9NYAS+WAQ==
X-Received: by 2002:a17:906:4712:: with SMTP id
 y18mr5184473ejq.529.1612996159865; 
 Wed, 10 Feb 2021 14:29:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i6sm2304135ejd.110.2021.02.10.14.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 14:29:19 -0800 (PST)
Subject: Re: [PATCH v2 02/42] esp: rename existing ESP QOM type to SYSBUS_ESP
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4f9a7d33-51d1-a8f2-b694-0f86a1d28aea@amsat.org>
Date: Wed, 10 Feb 2021 23:29:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> The existing ESP QOM type currently represents a sysbus device with an embedded
> ESP state. Rename the type to SYSBUS_ESP accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/dma/sparc32_dma.c  | 4 ++--
>  hw/m68k/q800.c        | 4 ++--
>  hw/mips/jazz.c        | 4 ++--
>  hw/scsi/esp.c         | 8 ++++----
>  hw/sparc/sun4m.c      | 2 +-
>  include/hw/scsi/esp.h | 4 ++--
>  6 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

