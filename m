Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8C570AD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 20:35:19 +0200 (CEST)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgClK-0004Lz-6C
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 14:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44115)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hgCfQ-0001QH-Sm
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 14:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hgCfP-0007tS-S8
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 14:29:12 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42645)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hgCfO-0007s3-Vw
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 14:29:11 -0400
Received: by mail-wr1-x442.google.com with SMTP id x17so3855701wrl.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jun 2019 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rohLCCH3DW1wIMS2KSOyep/+sdviPpS4gXS+9OPP1N8=;
 b=Ji0IW4CpZ7Zq6k1Z3xqZ7x/2mfnDJ6tdBRRwNqjUCouFyfgFcVPc+vd+YGQMEeZh89
 /aHYTCwco0fE+/KxmX9h11+LsxObtpVprs3vcBzXRkDFHrIlLtshksZBT/HBElHNdmIr
 VlbdHoSHTIcqVik2MSA+GHhc1jjRC6MKeYVbN9DNhA6L0iuDOOrdW9cETsXGBGJ/Ls5A
 Q6BjYKok8cdz0WDbfKe+WMkax9rD80JvhTcGSOjuEJIyMH3fmUsrPl0OBw8DrQenV82W
 AH/6bt1x7OAPuRcROO2KeJ2c9aYAUGoICimk+fY75w5SJm2sxfusoprve6VrIKrqJgDP
 hvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rohLCCH3DW1wIMS2KSOyep/+sdviPpS4gXS+9OPP1N8=;
 b=dVbcCnL6RKmdiVDDSxdi4V39JtUjtrIhHduY2rCzdm/CeJn6UW4pjgBPhszmROrAuQ
 DgQV7Leb+oJ9wW8UU/UD6dPc9UR5EQ5V1Fkv7sTchczUCZGavUryJcC78KplacS7pvPI
 bqpptAL4lmxyeXNxGO2NnkHhP5yfZumg9sq7AQLga1Zx279zsi9COwP73mzd3Y9YQqst
 OI74BIgBtXFL3eo1H8gi6/wgFLAPjdcIHB8Zo8v2SgtPEixTuyKw+Ph8HguIc8oAjhrM
 ypuDp/3mUK5/qpXegiXL1z05Gcv85RqyDfvp2/pq/KXZjwCSWw0Ax5gph0QMEoKm6G/+
 awoA==
X-Gm-Message-State: APjAAAXMrnj2R3tU8lwFZWNA0gMnJ/xOlGMN4N9yX6Z29i7TIx/WHgUj
 YwZqpGMMV7dCS0FTT29QkCr5oQ==
X-Google-Smtp-Source: APXvYqxOuB3Yv1CpY6A/6jbfqjkiLxoPkphA5kSh2Of5jlQ7YmpVVZqLh3zzg4ZvLwoubFbXAR+Ofg==
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr4454827wrx.200.1561573749365; 
 Wed, 26 Jun 2019 11:29:09 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id a84sm4264284wmf.29.2019.06.26.11.29.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 11:29:08 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-12-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bd43a392-18a5-b04c-9a52-d4113ab1e5be@linaro.org>
Date: Wed, 26 Jun 2019 13:09:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-12-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v2 11/14] target/arm/kvm64: max cpu: Enable
 SVE when available
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
> @@ -675,6 +689,11 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        /*
> +         * KVM doesn't yet support the sve-max-vq property, but
> +         * setting cpu->sve_max_vq is also used to turn SVE on.
> +         */
> +        cpu->sve_max_vq = ARM_SVE_INIT;

Can we support this value with KVM_GET/SET_ONE_REG on ZCR_EL2?  (IIRC KVM
requires VHE to support SVE, so the host is always EL2 and the guest is always
EL1.)

Or do we need to probe this via normal userland prctl?

Or am I getting ahead of the patches to follow?


r~

