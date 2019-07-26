Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FA076BFF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 16:49:17 +0200 (CEST)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr1X2-0002pb-JT
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 10:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Wj-0002Cy-Bo
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 10:48:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Wh-0004wL-BU
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 10:48:57 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36650)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1Wf-0004tA-A3
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 10:48:53 -0400
Received: by mail-pf1-x441.google.com with SMTP id r7so24640121pfl.3
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JGG+6GSjniBgQfc0XQuvOZiWJplQ8Gy5+cpliYGgZ2s=;
 b=JhJjCHD10gsgmX/2XjtoOgFJef8Y65lBbTFsRrM70sYWF4vV4k5FEL46+Tea/hgfYr
 IDbmKvK5hWzs9PzEv0n65B6Y40IDybg6RDB8y46RtBP84fTJ3yBVv4tEjQ3OT5mlMpUX
 dRkXD3a9zQ1xlHP/G5pNteqFWX/my7RWBnhNqaJzEuPUUtevgVmcaIi68mdDxeYbqRL3
 oyeA0LCJaGi5Yw/flTECnj42Rnfi7QWBYbx3Yv++KeJUQRceV90lCI2Iqk/phNBCqXE0
 tOMCiYwVoDNrgdPjJ+QZgFwAD9ykFcQIYiEi3Hd8ku2mfmTRKZlY3ynWWPwYupNzdzof
 VGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JGG+6GSjniBgQfc0XQuvOZiWJplQ8Gy5+cpliYGgZ2s=;
 b=i6XQS2NDx9P2CKYorfNRIygxHmpJSQ9yy+gYiBqwDlJDUSdnjveoyo99VqBb9O3sHA
 HrCl1ALqlijuStzeAVP+Y2Rb7MeTMSYC6AfBfDqp1Futfa+KqrlGD94DKqE1dwbkdzgY
 JoqGbo9f18/KPMt573EmGTP0FzkNWT93IYwm8XwyOOo0CBs8yr8Mgw6cOsNsyf4pFiNr
 t9la9FEjf8+QR68p6Se03AdkqUp+xeTK/YrlUYqsl5sFJZpECEF2P87f/MBFqJxmpcMb
 jUf80fkPm10oIWtYOm4oopV657/Q6nZwyHF1D2q1X9Gv4GBoSVtF0hOYF8kpRN/AJ3Gn
 blbA==
X-Gm-Message-State: APjAAAUd87xDxyO1Vc49IIfB56Uw1e1ksXfcR+SaoEeOQ4Kaxb91JPee
 FsZzwVR93VNwpWFlBAx+CTN/ZA==
X-Google-Smtp-Source: APXvYqzL9ELBFHlkZ2Zw6UMoraOzMhzM/hDqxHfhCCDYDRDxotRZWSNE1KM0zV8pwMYH0CSWWA3bZA==
X-Received: by 2002:a63:7a06:: with SMTP id v6mr92713232pgc.115.1564152531555; 
 Fri, 26 Jul 2019 07:48:51 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id f3sm83570723pfg.165.2019.07.26.07.48.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:48:50 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123690507.53193@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b0d92bab-8302-4fe5-d7c2-16c7193ffd7e@linaro.org>
Date: Fri, 26 Jul 2019 07:48:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123690507.53193@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v5 12/15] cpu: TLB_FLAGS_MASK bit to force
 memory slow path
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, edgar.iglesias@gmail.com, alex.williamson@redhat.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, shorne@gmail.com, david@gibson.dropbear.id.au,
 qemu-riscv@nongnu.org, kbastian@mail.uni-paderborn.de, cohuck@redhat.com,
 laurent@vivier.eu, qemu-ppc@nongnu.org, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/19 11:48 PM, tony.nguyen@bt.com wrote:
> The fast path is taken when TLB_FLAGS_MASK is all zero.
> 
> TLB_FORCE_SLOW is simply a TLB_FLAGS_MASK bit to force the slow path,
> there are no other side effects.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/cpu-all.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

