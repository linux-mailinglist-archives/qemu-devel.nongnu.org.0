Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE8D1D82
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 02:40:36 +0200 (CEST)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIMVO-0000o6-2n
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 20:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMUO-0000JH-K5
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMUM-0001RB-Hj
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:39:32 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:41182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIMUK-0001Qp-LY
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:39:30 -0400
Received: by mail-yb1-xb43.google.com with SMTP id 206so1367352ybc.8
 for <qemu-devel@nongnu.org>; Wed, 09 Oct 2019 17:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sLTnFbZCpIgGeIi6dyjb1EhS2fZO48oPmcKPcfao7eI=;
 b=sU6SE2P7zgK3Wvw8zxSi7B2uTnDH2ntWHdJgqJ1dsOZ7OjlntOxDPkR5DPoRM5QaLz
 ZPQgsiyM0cQjw6cXWGl12PMxLa/YL4pfhIxVRwGU5R6CtU+iW9pXH7PWVKBvG4IXEYTk
 nKC2sUV7ldvYr8r7SbLpiTZL1HwRkx8iyiwUIAmbG3sCMFQ+yHHN88mZUDm59fWbqkX8
 aOPW96tBtrfDat0ZuHPry57KRnFWsfitAvI3h8Qb9qG0a6+GF0J+e2SMO4KKXfmex4q9
 K28SLN4dtJo2ed+Po6ktszy91ae1dGmmd5CL/JGfz8fT6UJRK/kbmaisC38jVcdrymi5
 s3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sLTnFbZCpIgGeIi6dyjb1EhS2fZO48oPmcKPcfao7eI=;
 b=BRd8aSW/z15Zsh99V+WbXw7t19rv9OzrVNZVKPSABGWIoKnC0o+zlTcuZE/5MdVW/X
 koB16YUHWYufNGtsGog5u7PsAVGQx5P9HrR+TaiaJmqW1VOseCMs4EJp/c8GhHxYV+H1
 TTNGJXpq9dFku77wlWqJi+P5giBHoVlYvzHDVundEQfP/JMP5MYRn7+2Du0xoE8bbZKv
 wm3ckPMbe8TBGwP5vKEhKTr5dEkFdpsBB0jXabqKwBAZiNQbFAvxDJchdpeNRznC1BY0
 aOnUOue/oXuGfgz5t4eIKvUdBlk6lLQoHPMDLPqnUomv3p3QOFLfECSF4fi/MLYybpNQ
 N2NA==
X-Gm-Message-State: APjAAAXcVzKDFrMRQb5QIV/VLjqlikgj6VvTI9ZarXnB59lZ9Kii24jQ
 FPt8UnVFPH0aLBVCr9CO6N3K5A==
X-Google-Smtp-Source: APXvYqxv9d4o6zmHoNFiW9D+nqKY58x2Aiq5BWQ9DuXf4AzCbJDygKbh+UJLLshBQmzUMVSsR9QYkg==
X-Received: by 2002:a25:5542:: with SMTP id j63mr4123772ybb.76.1570667965549; 
 Wed, 09 Oct 2019 17:39:25 -0700 (PDT)
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id 137sm993566ywp.64.2019.10.09.17.39.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 17:39:24 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm/arch_dump: Add SVE notes
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20191004120313.5347-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f23153f2-35be-f74d-ad7b-d9c324cba1cf@linaro.org>
Date: Wed, 9 Oct 2019 20:39:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004120313.5347-1-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, Dave.Martin@arm.com,
 eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/19 8:03 AM, Andrew Jones wrote:
> +#ifdef TARGET_AARCH64
> +static off_t sve_zreg_offset(uint32_t vq, int n)
> +{
> +    off_t off = sizeof(struct aarch64_user_sve_header);
> +    return ROUND_UP(off, 16) + vq * 16 * n;
> +}
> +static off_t sve_preg_offset(uint32_t vq, int n)
> +{
> +    return sve_zreg_offset(vq, 32) + vq * 16 / 8 * n;
> +}
> +static off_t sve_fpsr_offset(uint32_t vq)
> +{
> +    off_t off = sve_preg_offset(vq, 17) + offsetof(struct aarch64_note, sve);
> +    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
> +}
> +static off_t sve_fpcr_offset(uint32_t vq)
> +{
> +    return sve_fpsr_offset(vq) + sizeof(uint32_t);
> +}
> +static uint32_t sve_current_vq(CPUARMState *env)
> +{
> +    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
> +}
> +static size_t sve_size_vq(uint32_t vq)
> +{
> +    off_t off = sve_fpcr_offset(vq) + sizeof(uint32_t) +
> +                offsetof(struct aarch64_note, sve);
> +    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
> +}
> +static size_t sve_size(CPUARMState *env)
> +{
> +    return sve_size_vq(sve_current_vq(env));
> +}

Watch the missing spaces between functions.

> +    for (i = 0; i < 32; ++i) {
> +#ifdef HOST_WORDS_BIGENDIAN
> +        uint64_t d[vq * 2];
> +        int j;
> +
> +        for (j = 0; j < vq * 2; ++j) {
> +            d[j] = bswap64(env->vfp.zregs[i].d[j]);
> +        }
> +#else
> +        uint64_t *d = &env->vfp.zregs[i].d[0];
> +#endif
> +        memcpy(&buf[sve_zreg_offset(vq, i)], &d[0], vq * 16);
> +    }

We should avoid the variable sized array here.

It might be best to avoid the ifdef altogether:

    for (i = 0; i < 32; ++i) {
        uint64_t *d = (uint64_t *)&buf[sve_zreg_offset(vq, i)];
        for (j = 0; j < vq * 2; ++j) {
            d[j] = cpu_to_le64(env->vfp.zregs[i].d[j]);
        }
    }

The compiler may well transform the inner loop to memcpy for little-endian
host, but even if it doesn't core dumping is hardly performance sensitive.



r~

