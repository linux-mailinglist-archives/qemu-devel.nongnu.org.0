Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD23504953
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:35:18 +0200 (CEST)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAg1-0003jt-Mk
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngAAC-0006r4-9O
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 15:02:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngAAA-00073k-If
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 15:02:23 -0400
Received: by mail-pl1-x633.google.com with SMTP id c12so10822271plr.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pYquUpW532F3pDIjglL2V4aAtkM5em3xI/BEoyPiwzc=;
 b=qrn7MI4dHeUHkFZNxpf+KuwVWC4sx1F8N5hBdqMI1wI7o8NdXNJ9KH8ufqZgtMkgtk
 izPsGDxdNg65SQ6ZilB98bp+PS1hIQObM4wSSkn33rog6JOzVC07JYoYioXpYfG+yVO4
 1EVz/rpI6C9iqmfAY6bL/8P/z1SBZFaX99hGglZA+Ax1z/bgMrrWzM4oFY2IjW0b/qA6
 /AhCqgpnFDUd7HwB+GtVuLvbttiqxeSQMVuOoYPzth4/RCly77Ui+fmcW4viqrR5ijzT
 CpCWWhjyPsC2gUuy9Yss8TWg42HFQU9G2Rm053s+VJNUaD5+AAd1jNz25QsGBf91RWi2
 /8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pYquUpW532F3pDIjglL2V4aAtkM5em3xI/BEoyPiwzc=;
 b=oZlwXjuriw60H6CAIYnuLv4KAICT63y+vGTL/obZZ2tflIKXeSp6xYeiNCWCEv5jzb
 UZcNsZGf1LeT9YTz/ZAR0CceZ5SZ2DUtrVrG2U11IVEmSxcrIN425AeSLqDs/i0YH49n
 3tlMqWfUTZpxefvv7101EkSOS0YR65xZd6aSvP6CtsR6jnaw+6/C0joaE+d8EU9ZxNVg
 oOeSHUbHR2fh/5DZYYycdLzFYtWVKVkyFDylT/i4RDzNAxRqJqfDZ+ntiODNYksdcNp0
 eRfDY+Efzy2wY9BRMMVe12XX/JOKX2E5c4DVLeGRwwCInQ8hPl+2l4vhoQqCZMm6Xj6V
 C6kA==
X-Gm-Message-State: AOAM531rCrS/pcFnIr2MMwxtnauAOJY8mz9oS2XD/VjqHlgrFTX98hoX
 VzvlZnu+sBkuES1kZ/81zO6tmw==
X-Google-Smtp-Source: ABdhPJyuTCHzRNoUDcq2mNT3OgQ7QrccE55pCfOD/VmoJb3g+WP5TMyZZGXitnIn3c64SH9J3IVw+g==
X-Received: by 2002:a17:90b:4c4e:b0:1d2:9f85:66b2 with SMTP id
 np14-20020a17090b4c4e00b001d29f8566b2mr1133162pjb.128.1650222140702; 
 Sun, 17 Apr 2022 12:02:20 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a637e10000000b00382b21c6b0bsm10628517pgc.51.2022.04.17.12.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 12:02:20 -0700 (PDT)
Message-ID: <d1b3eab2-8d70-030c-3f37-d5a147a33d71@linaro.org>
Date: Sun, 17 Apr 2022 12:02:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 30/43] target/loongarch: Add gdb support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-31-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-31-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs)
> +{
> +    gdb_register_coprocessor(cs, loongarch_gdb_get_fpu, loongarch_gdb_set_fpu,
> +                             41, "loongarch-fpu64.xml", 0);
> +}
> +
> +int loongarch_read_qxfer(CPUState *cs, const char *annex, uint8_t *read_buf,
> +                         unsigned long offset, unsigned long len)
> +{
> +    if (strncmp(annex, "cpucfg", sizeof("cpucfg") - 1) == 0) {
> +        if (offset % 4 != 0 || len % 4 != 0) {
> +            return 0;
> +        }
> +
> +        size_t i;
> +        for (i = offset; i < offset + len; i += 4)
> +            ((uint32_t *)read_buf)[(i - offset) / 4] =
> +                helper_cpucfg(&(LOONGARCH_CPU(cs)->env), i / 4);
> +        return 32 * 4;
> +    }
> +    return 0;
> +}
> +
> +int loongarch_write_qxfer(CPUState *cs, const char *annex,
> +                          const uint8_t *write_buf, unsigned long offset,
> +                          unsigned long len)
> +{
> +    return 0;
> +}

These functions are never used.

The first one should be called from loongarch_cpu_realizefn.  I'm not sure what the other 
two are supposed to be.


r~

