Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20E231650F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:21:56 +0100 (CET)
Received: from localhost ([::1]:46690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nZB-0004Ky-Im
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9nWa-0002cV-1a
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:19:12 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9nWQ-0006gL-4Z
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:19:11 -0500
Received: by mail-ej1-x636.google.com with SMTP id sa23so3484133ejb.0
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 03:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n0DsEyQDuhTZ1rDB+sDoF82Io2GWg84RUZPdol2Q/EQ=;
 b=fCfqpXhOjgCtWppvRfPHRLOVK7ZOZk23+u6GSlF36fHNtVziRBlPxnGYzTvIrtV9Wm
 /eMAQTERGb4xCtmy201bPNn9tHpnYkvCbEI9Kaj5gk0zVY5c2zRDdc1bFtEewJuS5MNu
 N5FSWPp4xc9ZTLUoU8aqEiDyaysQvQDN3MkioZpZUshUQVrdImrstD/aF77bnY0IF0pd
 CfGmfLRbA2gC5R6X6yXUrkH4gJV1zugMytedBsxTqc+ihJg/rjb0pQonPJixDHgiP3qi
 JI9SmWVa1IVEpKMS3b4K6mrz4dn856tkN0DI9Ru77mcL7/LR/sc2ugUSJUAbPEtCeC9Q
 O9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n0DsEyQDuhTZ1rDB+sDoF82Io2GWg84RUZPdol2Q/EQ=;
 b=aCJulNLm9bmK2MAiwJkkOdHodwaV9RTaVLVuW7/LC3VLns3m44+pGJ3YtA1zx+cJZd
 fkngKNFN5351tbRQcJPlE2oebBoRVo/cpiDT4AWEg5HzqfG7XjjyR7R9sESq6QNiXtim
 gMpdvbliegCozE53Oscbkkb3ZaRaRm87VKbuopOlOegrM64h35RmJWF8SuFEQLlMJ9G9
 GjIt+OU/nu4a21abQ5aGJtPO0srmadp4e3UPmrDvYOIO3qsq8V1hyEJgeaOwfsC2tqlN
 FMEab6pIJ/XVKjTcAA9puXpFhjh2LHMfOG5xUmuUSrfGuDagp9huMo3mQIHrQc5sPmrN
 bwNg==
X-Gm-Message-State: AOAM533NYq6yOyPhuiDoga2++PAsl81OOBxVVFi49kDLc0ThaBFRCjn9
 DzMl0+Mt5TyuB/Wcyz90WwOxJO0/gKA=
X-Google-Smtp-Source: ABdhPJxEg2E2zCpy6g6T6WzI4+uUh5tsRvAz9K56bb7xvUTzu7yzjDOTPX4Sbw+APi3zl15B/WDSeA==
X-Received: by 2002:a17:907:35d1:: with SMTP id
 ap17mr2528596ejc.79.1612955939458; 
 Wed, 10 Feb 2021 03:18:59 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c6sm751083edx.62.2021.02.10.03.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 03:18:58 -0800 (PST)
Subject: Re: [PULL 0/1] tricore queue
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 peter.maydell@linaro.org
References: <20210210092955.124757-1-kbastian@mail.uni-paderborn.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94b43ee3-2b41-aa58-fbc9-b6cc99f766d1@amsat.org>
Date: Wed, 10 Feb 2021 12:18:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210092955.124757-1-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: kbastian@mail.upb.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bastian,

On 2/10/21 10:29 AM, Bastian Koppelmann wrote:
> The following changes since commit 1214d55d1c41fbab3a9973a05085b8760647e411:
> 
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-02-09 13:24:37 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20210210
> 
> for you to fetch changes up to 52be63523e80bc92b8192a1e445fe499650085ac:
> 
>   tricore: added triboard with tc27x_soc (2021-02-10 10:26:38 +0100)
> 
> ----------------------------------------------------------------
> added triboard with tc27x_soc

What about this series?

https://www.mail-archive.com/qemu-devel@nongnu.org/msg776774.html

> 
> ----------------------------------------------------------------
> Andreas Konopik (1):
>       tricore: added triboard with tc27x_soc
> 
>  default-configs/devices/tricore-softmmu.mak |   2 +-
>  hw/tricore/Kconfig                          |   8 +
>  hw/tricore/meson.build                      |   2 +
>  hw/tricore/tc27x_soc.c                      | 246 ++++++++++++++++++++++++++++
>  hw/tricore/triboard.c                       |  98 +++++++++++
>  include/hw/tricore/tc27x_soc.h              | 129 +++++++++++++++
>  include/hw/tricore/triboard.h               |  50 ++++++
>  7 files changed, 534 insertions(+), 1 deletion(-)
>  create mode 100644 hw/tricore/tc27x_soc.c
>  create mode 100644 hw/tricore/triboard.c
>  create mode 100644 include/hw/tricore/tc27x_soc.h
>  create mode 100644 include/hw/tricore/triboard.h
> 


