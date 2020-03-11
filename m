Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91585181067
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 07:08:03 +0100 (CET)
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBuXC-0008Uf-MT
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 02:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBuW9-0007MD-QZ
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:06:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBuW8-00085u-V4
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:06:57 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44505)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBuW8-00084f-OF
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:06:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id 37so572504pgm.11
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 23:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CytbE9dzD3rJXx061tUzRHbGW/x0HK1aaXwJ3VFdKvk=;
 b=LVsVp792eeJ2rIDGSC8bT1aa2d3v9luY40unA1keAL0nC19Zr3R2rL3IqgSsuh/RwA
 9WEYHJJjEVhMjD8L22vU8qVGnaJjtbJJOOTIs2cdMSFYBnthKMFIApRoPUzEDO1gFhyG
 iCR5CaMxeXVEfZSPtdAg+Fjm8e40OIFXNpDEgqhyfgaB2i6DcrHzEjFl4wYq8wiGMRn2
 4vwfdG/TZAtVB/e/42SA+YhDnVpegSxNEOJ4eWF6xJQs7ZBsCWBhTrKEyUtxYQq4Txbb
 iOZm8o+smUrjxGDur2gz/CcTze+DiFnFTUUQhqzpWl3OSO+HJGcLPUaMv1Br3xoQWebD
 peiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CytbE9dzD3rJXx061tUzRHbGW/x0HK1aaXwJ3VFdKvk=;
 b=YDChsegZITvlfCRgGTdqg7NcauHh/ektKzZzVylJ3LZdRjTyTDjdg7vjQtnRiULvtr
 VirhLdl1udTM8xmLCCoidq1n2pOHDCdENDWEYeWj8vdReD14zXYl7xCSz1as9H1x3eDR
 di/VOdcWhQZ7GQuU7HUXV1oBodwNHEo9MZB59h6FiXBmEKGhT14nkhX2FvLmb9woZlFP
 11GX3wnD5xwa9c7xAWpOhcqPKLOeNJQ4Q7BsrUUQ2/lf4AdEoHajHUwlx2o9UDuDKAni
 yOxeSZCotzXIuoUoPMSysA4GzuNy+5rk52nlksFYmHXZeTQbQbTRZ2YOhUc39TlfXI+i
 5fZA==
X-Gm-Message-State: ANhLgQ3eZ8IOIdOKWn8wl019fUB7vlpklnsMb4hGV1Btkp7a/V1lv7VH
 kmLJGCBkWjXh0nbmPH6wMRzyxw==
X-Google-Smtp-Source: ADFU+vtRiQQX/zFuI9gdKT1rlSs8wp7QaiV3FGt57FzvDrVAUYYyo2sRzs1e+gmeyc6PBiBJWC+2CA==
X-Received: by 2002:a63:c445:: with SMTP id m5mr1286081pgg.194.1583906815801; 
 Tue, 10 Mar 2020 23:06:55 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 i5sm31350210pfo.173.2020.03.10.23.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 23:06:54 -0700 (PDT)
Subject: Re: [PATCH v4 03/18] qapi/machine.json: Escape a literal '*' in doc
 comment
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200309154405.13548-1-peter.maydell@linaro.org>
 <20200309154405.13548-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <091a8a4c-762a-e699-8e14-217cecf5c58d@linaro.org>
Date: Tue, 10 Mar 2020 23:06:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309154405.13548-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/20 8:43 AM, Peter Maydell wrote:
> For rST, '*' is a kind of inline markup (for emphasis), so
> "*-softmmu" is a syntax error because of the missing closing '*'.
> Escape the '*' with a '\'.
> 
> The texinfo document generator will leave the '\' in the
> output, which is not ideal, but that generator is going to
> go away in a subsequent commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qapi/machine.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

