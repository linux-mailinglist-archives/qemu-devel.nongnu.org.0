Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA2F344D1C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:19:09 +0100 (CET)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOCq-0007QL-5p
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOO5H-00035F-IW; Mon, 22 Mar 2021 13:11:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOO5D-0005v0-7X; Mon, 22 Mar 2021 13:11:17 -0400
Received: by mail-wr1-x436.google.com with SMTP id k8so17939307wrc.3;
 Mon, 22 Mar 2021 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oTW+Z//a68N0Xr5gnhZG6XtIp1Vets5QxepwxvFlKcY=;
 b=BtS90JIEH0EOZzcIgN31771+fSdfJFF6/KZvQfKbgZRgdHuuUD2LlHPMUzowrwAc1l
 MKVS/NpqXDi9lpPQlyk0cf6MLpMdFxqYxrxVk7M2RsdzJIeBWk5FW263mrex5lCWNy1E
 xu5ri3RKnbO8+O5UUt89rIZ0And1plq1uQ3KX9nyThiuDGnFa/dcAJGzIRXjbIIkuexu
 6shjaVPBOt75J+CUgTAB9GTZ83w0Sx2UUuXsbBnopeDkpLqiYkT08BnJBrkzvZfqK/WW
 wsyhdj7Fij3fVz7QYP5viP6f7JMIWLdWmcvNhAWkFKc4itB/tL1QWglc+e2EuFK38pf8
 fY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oTW+Z//a68N0Xr5gnhZG6XtIp1Vets5QxepwxvFlKcY=;
 b=FpExBknkoUD96ecKtkt86WcF2Ofi8bAI76+pJaxOYuL2hq7jqGF+g1Gr+JIvfUj6L0
 qOQyTJISSHuQ8OMshrqd65kT9pC/5V+HD8GsRQzb3iSqsRRt/MI4Np0uz7w3Tr5aYqub
 QTbfBDPOdQqKj/2PW4IyCVvAqMuGDy8EJNf9TCxGtN0DDSFEWN92k8RdHbN/sOcpVJnw
 F4V+XrWN303bjAd36RXO4b24HEeFsfk/Sfl6DpuixR50iloVOzbZVNoM+PUfwTNXGnU6
 93gUlVq8tuHHkylGM5QRMi79POkvUN5PuEyAutkI3YDEJ30zQpuk9o5tloCb7o+ioHHU
 gTIQ==
X-Gm-Message-State: AOAM532WwMy3y9kQWC9qfmH5mpLXA1N639T+mY2LVf0Oz3egUiI/fao7
 MFkR2mxs5yFNmSCGY+L99xuSOh61PjieWg==
X-Google-Smtp-Source: ABdhPJw/bxgqZl6UVcVfPyKXFCAtF5YldtKSGIQ7gAxew5xAVBVyDhKJrHhfVJtrOkIOiP1X4LIR6A==
X-Received: by 2002:a5d:63c8:: with SMTP id c8mr499552wrw.299.1616433072437;
 Mon, 22 Mar 2021 10:11:12 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t23sm21134138wra.50.2021.03.22.10.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 10:11:11 -0700 (PDT)
Subject: Re: [RESEND PATCH v3 0/5] hw/sd: sdhci: Fixes to CVE-2020-17380,
 CVE-2020-25085, CVE-2021-3409
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <20210303122639.20004-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ce81db0-e318-d7bd-7bbb-7281db85428e@amsat.org>
Date: Mon, 22 Mar 2021 18:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303122639.20004-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-stable@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 1:26 PM, Bin Meng wrote:
> This series includes several fixes to CVE-2020-17380, CVE-2020-25085
> and CVE-2021-3409 that are heap-based buffer overflow issues existing
> in the sdhci model.
> 
> These CVEs are pretty much similar, and were filed using different
> reproducers. With this series, current known reproducers I have
> cannot be reproduced any more.
> 
> The implementation of this model still has some issues, e.g.: some codes
> do not seem to strictly match the spec, but since this series only aimes
> to address CVEs, such issue should be fixed in a separate series in the
> future, if I have time :)

> Bin Meng (5):
>   hw/sd: sdhci: Don't transfer any data when command time out
>   hw/sd: sdhci: Don't write to SDHC_SYSAD register when transfer is in
>     progress
>   hw/sd: sdhci: Correctly set the controller status for ADMA
>   hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE register is
>     writable
>   hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when a
>     different block size is programmed
> 
>  hw/sd/sdhci.c | 53 ++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 17 deletions(-)

Thanks, patch applied to sdmmc-fixes.

