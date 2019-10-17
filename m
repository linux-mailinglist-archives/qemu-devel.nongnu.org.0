Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F607DB0EA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 17:17:49 +0200 (CEST)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL7XA-0003SH-5W
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 11:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6cP-0007bF-Kd
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6cN-0004pE-Lk
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:19:09 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39872)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iL6cN-0004ol-F1
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:19:07 -0400
Received: by mail-pf1-x444.google.com with SMTP id v4so1756983pff.6
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+PnfRUr3ii8grp4UuOX7hxcBoqNCJXd7QrquHIgQS0w=;
 b=IATWTJ4n9Q8FKPNe/1zi00r3bw1Gaxe00vNe3PdSGXV6aTVO3FZ5Q7iCvic0LFsF4N
 TMNDsRU8qsjY2lrxh8gLbh/96pz4+V1uF+M3yMo/UXDBRajuqRdaFl0VgVTMFgo3FN1q
 uY/F0vfQwo8dyXaGvDVuyYcV7FZDWKDdevAE/n3jKVmLeaQp/hmeGTWgvIrnfjzxG4jq
 eTTvszYQ0/cpx/RPpvOGO13YTICyIihH5nFs77mZb0D1joX5gejMIykwDx1uRtWUlj4m
 DdX9GUcDmv5Aq5yRAUQxyms2N4HPvq5fO0NZKpSPmpMe55MvxCaTQonX0bQEHXOKQHdd
 Uj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+PnfRUr3ii8grp4UuOX7hxcBoqNCJXd7QrquHIgQS0w=;
 b=rli4OEedVIvhSTNK63KYo+bGbiGepGHdMT/1PM2d5mXNg/XfTGINbDUkCvGzKsDKog
 3Z/JVwBQj9T6O1um5AUJ7VHIxZHhrPJRs9GD6IYJ/RG5UCCn48h2yf+vDx5RfO9A9FRr
 2RGSSWRcJqzkVLpI+pSZmzXXUATLJaQOaqDIowQ9JikNd7A3R1mqDM3Mfd+CYZmQzB6b
 fLyYxfdGmWVSF+gYBUSKd13/lcnnUlNlKDAsnvazCLww5GJ1rD6p+OVwXr1MysQKmfrx
 cdQjBHFMIU+SzErhHSPR85YMC/cavXrSCOVprv2lJS+gN5swJ+zm4qI55zScNud3Y9jq
 NOQQ==
X-Gm-Message-State: APjAAAUHBTeUdRrjUDHUSdb+/nhGWYQrkkgN+/G60J05VNyN+UP1adIw
 fcdtiCIGUFk7oiXJDOaRnkPahA==
X-Google-Smtp-Source: APXvYqxbrMqFRm02BYoPfGf+e8krIDu43k+eFelRXT/HbGlqeqVO/pBlUUiS6C0LJnvBIWhpPyw4Hw==
X-Received: by 2002:a63:e249:: with SMTP id y9mr4379219pgj.383.1571321946513; 
 Thu, 17 Oct 2019 07:19:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d19sm2767139pjz.5.2019.10.17.07.19.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 07:19:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/timer/grlib_gptimer.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132351.4762-1-peter.maydell@linaro.org>
 <20191017132351.4762-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <83478c06-2bac-5623-add5-8250053c4481@linaro.org>
Date: Thu, 17 Oct 2019 07:19:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017132351.4762-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/19 6:23 AM, Peter Maydell wrote:
> Switch the grlib_gptimer code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/grlib_gptimer.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

