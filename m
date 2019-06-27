Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5AC587C1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 18:55:29 +0200 (CEST)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgXgG-0007Kd-Ct
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hgXaC-00018T-IJ
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 12:49:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hgXa8-000857-RC
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 12:49:10 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33706)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hgXa7-00081X-CI
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 12:49:08 -0400
Received: by mail-wm1-x342.google.com with SMTP id h19so7499066wme.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jun 2019 09:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KxaezKipBS23o61QK8eZk3AlZTmXnPtWw+JObqAW/p4=;
 b=vpRMsVUV/nm5/ml4RovtUjO6KoxNioiuu3WDSg3Zz0mtcjxZozEt+IBRZVmz/tr4De
 ZzMi1YVoazraEr7yY8VcE3jHaifK3RjFOYsrn4qVQnc5LivN8hxNXjt0MOPaTj9H+bYc
 lNT+6CN0MtGoMN7p0T1zyiTjoDVHZLAHLACILdP3l856Rkr9TCM9d72kpXcdTf9yAB3a
 U+7on4Vl6UZPS7TVYCVKqNpRJRcE2oOsfgvCJ6eAs19R2HsEv+/3SFmbOdB19kjL/iuc
 LtbxzA+EjhtzCvv/ilrFgYRwQSng0SCBbYiHQs4FhqOPufclliwjnBG+V2TpOw11RjHb
 DItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KxaezKipBS23o61QK8eZk3AlZTmXnPtWw+JObqAW/p4=;
 b=Ksj/prHoB/hBNXBeMo/aQS3mlEqqVD8ByXvCbPSarFglI+ThDf8fyqeCZqvux9c0rE
 UpWcnDx0nDhilIwWUfBSzGl/te/xx665UzUKWBeDCf/aKQ2Tgj+Vv5uFQKkicjipAKdt
 3oxG44+ws3XknifJUKhsSfUZHkmovXAkboSIFrP9q6u7bkhJKlT7PZ0voJVdynvq3eM0
 GPxWm5yRdmX0136dkU08qLptz+dXnxMP7XsFffAkKHLAg/WpgeDPNVy9JeKZngRrlhSG
 O1DZuGHAiuRUcP4vdjypKrBdHqiOLqGTlNRdoWUsLtATNOWZrUVXW1lpOvJsqL5XRwK/
 V3Hw==
X-Gm-Message-State: APjAAAUMMlV2o/HTLmtZsdENkwGAg6BNxocsd0EsR/D0Kjbi7u+m20QD
 kmRpuvRbXmwjOpsvbp5kz8d02A==
X-Google-Smtp-Source: APXvYqw0dXcQ6SMbSTw0LaOL66eawMY2BJ3g6gMKi1zpD6dVL7zhuHJY0y3a9H8TpaOjRphG12Mdaw==
X-Received: by 2002:a1c:c747:: with SMTP id x68mr3923706wmf.138.1561654144652; 
 Thu, 27 Jun 2019 09:49:04 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id h90sm3796163wrh.15.2019.06.27.09.49.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 09:49:04 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <be805987-250d-93a7-7d11-5204f0e16e7b@linaro.org>
Date: Thu, 27 Jun 2019 18:49:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-8-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
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
Cc: peter.maydell@linaro.org, armbru@redhat.com, eric.auger@redhat.com,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/19 6:34 PM, Andrew Jones wrote:
> +    /*
> +     * In sve_vq_map each set bit is a supported vector length of
> +     * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
> +     * length in quadwords. We need a map size twice the maximum
> +     * quadword length though because we use two bits for each vector
> +     * length in order to track three states: uninitialized, off, and on.
> +     */
> +    DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ * 2);

I don't see that having one continuous bitmap is more convenient than two.
Indeed, there appear to be several places that would be clearer with two.

> +static arm_vq_state arm_cpu_vq_map_get(ARMCPU *cpu, int vq)
> +{
> +    assert(vq <= ARM_MAX_VQ);
> +
> +    return test_bit(vq - 1, cpu->sve_vq_map) |
> +           test_bit(vq - 1 + ARM_MAX_VQ, cpu->sve_vq_map) << 1;
> +}

Neither easier nor more complex w/ one or two bitmaps.

> +static void arm_cpu_vq_map_init(ARMCPU *cpu)
> +{
> +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ * 2);
> +    bitmap_set(cpu->sve_vq_map, ARM_MAX_VQ, ARM_MAX_VQ);
> +}

Clearer with two bitmaps.

	bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
	bitmap_set(cpu->sve_vq_uninit_map, 0, ARM_MAX_VQ);

> +static bool arm_cpu_vq_map_is_finalized(ARMCPU *cpu)
> +{
> +    DECLARE_BITMAP(map, ARM_MAX_VQ * 2);
> +
> +    bitmap_zero(map, ARM_MAX_VQ * 2);
> +    bitmap_set(map, ARM_MAX_VQ, ARM_MAX_VQ);
> +    bitmap_and(map, map, cpu->sve_vq_map, ARM_MAX_VQ * 2);
> +
> +    return bitmap_empty(map, ARM_MAX_VQ * 2);
> +}

Definitely clearer w/ 2 bitmaps,

	return bitmap_empty(cpu->sve_vq_uninit_map);


As for how sve-max-vq=Y and sveX={on,off} interoperate...  I wonder if we can
just remove cpu->sve_max_vq.  That might simplify your code a bit.

What if sve-max-vq=Y "expands" to

	for (X = 1; X <= Y; X++) { sve(X*128)=on }

Then you've got a reasonable in-order definition of how those two sets of
switches interoperate.

The uses of cpu->sve_max_vq within cpu.c and cpu64.c are all initialization
stuff that you're replacing.

The use within sve_zcr_len_for_el can be replaced by AVR_MAX_VQ.  Your "select
supported vector size not larger than" code goes at the end of that function,
such that we select a supported maximum no larger than the raw .LEN values.

The use within aarch64_sve_narrow_vq should in fact assert that the given vq is
set within cpu->sve_vq_map.


r~

