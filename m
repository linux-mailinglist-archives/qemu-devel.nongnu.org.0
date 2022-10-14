Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA65FEC8E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 12:30:15 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojHxF-0001jk-I3
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 06:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojHsV-0006fS-2F; Fri, 14 Oct 2022 06:25:25 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:41756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojHsC-00071i-Oh; Fri, 14 Oct 2022 06:25:09 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-132af5e5543so5320495fac.8; 
 Fri, 14 Oct 2022 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SRL8NuJOWEY3H/pfocGcV5LK9Gidr0nRueYkOQnSl94=;
 b=JIzPg3MZSm+nYQ2RWIkSKCwDoYrtM0sQHFFfkObbFhzBd2z6Naxuzc25xBkcAkhmsn
 w0dWg/L1DzwzSLXSjdP0XaPIys7qs24LMuVljRWR7dDF6CyOKZsjBjK63qNQn8NX6hm5
 a3agCotNIqVwFjKk2oR32OvYhKR/WF9BlMT4cmHAWnfqA2N7y7Of/Mub3zkPzQRBQQD2
 zIuJA0QxPFfp/BJuNd4TMtwp8W78PRvKdzno64JgAya0wh5pq27IvOKzB3/YsCzKuTB/
 i9jQ8iJfpkMPblwqxZ4GF/nmGQn514Q0SU1WxW27vZUCm//XWUb8XngAf//Xtwq63zKr
 7mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SRL8NuJOWEY3H/pfocGcV5LK9Gidr0nRueYkOQnSl94=;
 b=yLLy+V1mxCAJ1ofql8yzqUnG3qLqQd+zcP8VFYBwXWxeXiZSAUaO52CIaPJgZevIeo
 F6l1xVSeBYNPrP4L6Vya5wdXyklyVRTd0Ka1qHLGF8SaZAk+BivbMXE14WOk5WNppMaZ
 GlXk5ZLYRTCjIDNu4R7IyHxSbBolRn6gXs3wcyvcArv7USnqPUSWmd9vCl+XIuNIkod+
 P4viU39J07AQKi0VRK5kmH7Sq9d+UwV/UJSbos84nbY28jJfG85ozVcCw7c+wvTTGfVn
 HK5BXci1A7vsqJXEzndIyqarFUXOex1QsGuTSlEdouBGiN4IlqhCeIRAKHwc4hQ4Z3CD
 72eg==
X-Gm-Message-State: ACrzQf3/HHNCm7cWB6Ai2j8Jwt/J0YfY0auRfP6YpjOxnwHqIIlEvXvF
 xMGa3DJ8ivdIH4Sex4aNKCNfq0YKo8c=
X-Google-Smtp-Source: AMsMyM4hBcorg+T92XfUzsLVfGxkwT2jzHq3+Oe1KY2mTf4q+S18j3WU0nn7POMCRLoQrUkM7KWWUw==
X-Received: by 2002:a05:6870:970f:b0:132:7415:6799 with SMTP id
 n15-20020a056870970f00b0013274156799mr2253266oaq.5.1665743098407; 
 Fri, 14 Oct 2022 03:24:58 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a4a6254000000b0047f89d8c7ebsm729552oog.46.2022.10.14.03.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 03:24:57 -0700 (PDT)
Message-ID: <9992a83b-c36b-8cee-86b5-95f7f461ca82@gmail.com>
Date: Fri, 14 Oct 2022 07:24:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] MAINTAINERS: step back from PPC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220929180946.848721-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220929180946.848721-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 9/29/22 15:09, Cédric Le Goater wrote:
> I am not active anymore on the PPC maintainership, degrade my self as
> standard Reviewer. Also degrade PowerNV and XIVE status since I am not
> funded for this work.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   MAINTAINERS | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1729c0901cea..40f4984b439b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -267,8 +267,8 @@ F: hw/openrisc/
>   F: tests/tcg/openrisc/
>   
>   PowerPC TCG CPUs
> -M: Cédric Le Goater <clg@kaod.org>
>   M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> @@ -392,8 +392,8 @@ F: target/mips/kvm*
>   F: target/mips/sysemu/
>   
>   PPC KVM CPUs
> -M: Cédric Le Goater <clg@kaod.org>
>   M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   S: Maintained
> @@ -1365,8 +1365,8 @@ F: include/hw/rtc/m48t59.h
>   F: tests/avocado/ppc_prep_40p.py
>   
>   sPAPR (pseries)
> -M: Cédric Le Goater <clg@kaod.org>
>   M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> @@ -1387,7 +1387,7 @@ F: tests/avocado/ppc_pseries.py
>   PowerNV (Non-Virtualized)
>   M: Cédric Le Goater <clg@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Maintained
> +S: Odd Fixes
>   F: docs/system/ppc/powernv.rst
>   F: hw/ppc/pnv*
>   F: hw/intc/pnv*
> @@ -2321,7 +2321,7 @@ T: git https://github.com/philmd/qemu.git fw_cfg-next
>   XIVE
>   M: Cédric Le Goater <clg@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Supported
> +S: Odd Fixes
>   F: hw/*/*xive*
>   F: include/hw/*/*xive*
>   F: docs/*/*xive*

