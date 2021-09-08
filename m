Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA0404089
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 23:30:30 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO59I-0002hX-CY
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 17:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mO57W-0001Dd-02
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:28:38 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mO57S-0004V5-P9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:28:36 -0400
Received: by mail-lj1-x22b.google.com with SMTP id s12so5863398ljg.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 14:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=YW/0mJPWy19mQSguklwIe99ZpI5Nejw8NDARNmZhHJc=;
 b=UGSsJuQUH68rTTnfXvz0ieoYtAQR0jQJuT3DP5w7VCM1MAHQSEm3Vf5IxfuiXTFfME
 IXOFtaDALaVoNc16O59JUa/5jBrR4LJX0DSH7W5DMOFPBFk2EqDYA/Fdr2TPrfpg4U9t
 ToCopwjfe0xqyen/2L6X+DYckEVJzAzmrT4OVf6tJYYIuthw8hdEX8M9pU3uF5m8aXr1
 eM/RgAdKKxzXWKAcjLzDS/yLmYeOIp3ls8+pangh7udZlrabhiCyeKtAc60k0kMDEhUE
 KiVZYdSQzFJcKcpZIyQnhl5DhDJdj8e9cCATQEVjAPERsWaBikX6EDvlPuDmPpP4qt33
 086A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=YW/0mJPWy19mQSguklwIe99ZpI5Nejw8NDARNmZhHJc=;
 b=1FgDPRQ9Nh5ip2NlAa6Kyh6z/zYYw1qGTaZ+0cTU1spjyRbKq/XhM+YDzfF0s0H4yc
 AY1x4t+ggh8QeY3CP8YwpnlizdhWkn7L+jTgkBo1ZyQQVsJGjCYqZlowa8V297S1AqvG
 4cdxXOH29Kh6TwTSEcZdAAgOtuWyf3zJXbw0zBiMUU5R9fu0ODXTBO6O8URk2E51ZHw0
 WX1YKRWxPad4fotgSu26UmymV2W+dTg+mXLWAOKrCd+U+sEC6MWUa9g5kEorzxWsMCQ3
 k2ngF9xp6KGrlh5mEfFvCiNTZm0klikkr5R6eiONNiwjtbW50SIa6gA7yWJFDKIxM/vC
 Vd5A==
X-Gm-Message-State: AOAM530mHqElLdc4t5IEydrwaTp4AY6+mBKqR6+GdikI+j36KcL9iFSZ
 Y3aLJh+MqhNt7FSp97pkkb2JIQ==
X-Google-Smtp-Source: ABdhPJziZDnysyn3f6J1ZL8o7mStO5OLPjwlMZOwJguVofJRY1XgC+yS+HUyuFfM/vLTrzH33LIwtA==
X-Received: by 2002:a05:651c:a0f:: with SMTP id
 k15mr264083ljq.231.1631136511762; 
 Wed, 08 Sep 2021 14:28:31 -0700 (PDT)
Received: from 192.168.1.7 ([2a00:1370:810e:18d4:6011:88a9:c1bb:af5f])
 by smtp.gmail.com with ESMTPSA id x33sm24362lfu.8.2021.09.08.14.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 14:28:31 -0700 (PDT)
Date: Thu, 9 Sep 2021 00:28:28 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] elf2dmp: Fail cleanly if PDB file specifies zero
 block_size
Message-ID: <20210909002828.5261796c@192.168.1.7>
In-Reply-To: <20210901143910.17112-3-peter.maydell@linaro.org>
References: <20210901143910.17112-1-peter.maydell@linaro.org>
 <20210901143910.17112-3-peter.maydell@linaro.org>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Wed,  1 Sep 2021 15:39:10 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> Coverity points out that if the PDB file we're trying to read
> has a header specifying a block_size of zero then we will
> end up trying to divide by zero in pdb_ds_read_file().
> Check for this and fail cleanly instead.
> 
> Fixes: Coverity CID 1458869
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  contrib/elf2dmp/pdb.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
> index b3a65470680..adcfa7e154c 100644
> --- a/contrib/elf2dmp/pdb.c
> +++ b/contrib/elf2dmp/pdb.c
> @@ -215,6 +215,10 @@ out_symbols:
>  
>  static int pdb_reader_ds_init(struct pdb_reader *r, PDB_DS_HEADER
> *hdr) {
> +    if (hdr->block_size == 0) {
> +        return 1;
> +    }
> +
>      memset(r->file_used, 0, sizeof(r->file_used));
>      r->ds.header = hdr;
>      r->ds.toc = pdb_ds_read(hdr, (uint32_t *)((uint8_t *)hdr +

Looks good.

Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>

-- 
Viktor Prutyanov

