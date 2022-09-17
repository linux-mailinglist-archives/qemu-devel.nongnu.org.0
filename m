Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5785C5BBAA8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:21:15 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfFS-00084N-FH
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfBU-0003JT-IO; Sat, 17 Sep 2022 17:17:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfBR-0005Nd-Ii; Sat, 17 Sep 2022 17:17:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id c11so41321991wrp.11;
 Sat, 17 Sep 2022 14:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=JTwqgp6jWEzgCtPAZMvHM/99Jb7Ps91Tm+KrL4ud26g=;
 b=RBZOn4XN8GPBWB8FZUTUtXwpEPUmd4YchfKVlSOZH2hX6CSCrLPKBlWT2+GLDi7CaF
 HWwgWr1RVktNyJ2lgRTcODETVsvifAygOqjLCXg+wOpFEgQV0C9Npsw5QLFvVSSGac9d
 DPpx37nPiprOBfHLBORd7SfyXeCxuzkeriGMoxKijsgh/tWWh1d2BZvUMCr8HP0pSlp5
 4GK9poURU9pcyVMfYpV3eGznOrgJHlJE2/xOl6YqVNcdzr0fx8H4YTbqqMCufL5xv77C
 iWgff4xJkH4vdbJmmvKzJBVvcoGLWqY+Nijt8EoiB+eOhIS2ZKZ5ZV5nqwZMHrqbtU30
 j0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=JTwqgp6jWEzgCtPAZMvHM/99Jb7Ps91Tm+KrL4ud26g=;
 b=3f+X7RNz0fbQpLy063g7AHyUzo2zxOmC5ebl4tfP7GV3N6gOEJwFlN40RxWUlpPta/
 vyMfBw0MTYSWHqhzEtrw6Z0uud4PNr2nn/2nRHhnCEySpEWHCEBLaa9xVQrIfhtY6v4U
 GwnaOjB1DdMtzofRD8JyvkjOQaGJpZL+x8DVaSVCh1SIYIjaimqPz7dHIP8tCSg1Xz86
 b5xGJsNbdbSpZt6x+eepAAVyJA/IwvUj/elHEsCRFPbSNWDBxC7ROIdPME+BNZp0VRhh
 Dw1tm5c2Y03o++qGs5URXzx2qjx7KR/PoR+NwY6reQ/R7XZLGbRnlD+d2DT2SnglK0pW
 Xhhg==
X-Gm-Message-State: ACrzQf3T8KeHv2q5iTKGqVlfKmZaZisIzjeMzY6cMT8EHBjlwFUi66gh
 hcrgKGPQ96L1Y823/6/CVmPa10VVtos=
X-Google-Smtp-Source: AMsMyM43uI+LRWgdTBFClaNXJnPSZkEcOcS4wfKq10+45w5kQIVaLQ4nW9yqJrPAV5ZjS3gJBVyeJw==
X-Received: by 2002:a05:6000:186d:b0:22a:f6ce:72d9 with SMTP id
 d13-20020a056000186d00b0022af6ce72d9mr912768wri.426.1663449423635; 
 Sat, 17 Sep 2022 14:17:03 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y1-20020adfdf01000000b0022a297950cesm8757824wrl.23.2022.09.17.14.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:17:03 -0700 (PDT)
Message-ID: <4550e3c4-08f8-430a-8858-042e4b291517@amsat.org>
Date: Sat, 17 Sep 2022 23:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 07/10] hw/ppc/mac.h: Move macio specific atuff out from
 shared header
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <3fd567b3162f70414fcbb7d074e3a7731360f6e4.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <3fd567b3162f70414fcbb7d074e3a7731360f6e4.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 17/9/22 01:07, BALATON Zoltan wrote:
> Move the parts specific to and only used by macio out from the shared
> mac.h into macio.c where they better belong.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 26 ++++++++++++++++++++++++--
>   hw/ppc/mac.h          | 23 -----------------------
>   2 files changed, 24 insertions(+), 25 deletions(-)

BTW Subject: "Move macio specifics out of shared header"?

