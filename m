Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946D9571118
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:10:02 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7Dl-0003se-Mv
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB74m-0002Ya-DK
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:00:48 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:56051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB74f-0000F3-Cn
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:00:41 -0400
Received: by mail-pj1-x102b.google.com with SMTP id b8so5125843pjo.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iDtLxISuV8hQkKVfpBZxAv01uNfB6alxvd3+KNVuOLc=;
 b=IT9UypbAec+MKPflCzA7ToPsFfhj9Fe9mB1pHONSC64zE2gNZWH0EG3m5ZtvKuMxUB
 tazaXMP+BHZIjdbZLqktwXa2hFnKVyP2qnLwj6B0vRReQgn0jPaRd+2jOYAPUO/03EqJ
 a0eNgdOwdUgPR5okXPZwmVtIZRXAHnfEDt5qh9edd4L/BhWWav7JH7jl3KKFql8wvjRm
 eKuuPjOGG7+2Tt5Pt/ep+PZI5RfNFYqV6aBtawkECaKbqs6f8xuaGRSYVDDp9Iyh5igE
 NIC2YwFRGcZqHI85utYxFCVi/gO2T2xPN1bs5/QxwuSerYbATCuvPrbHICyTUGqHPjpU
 DMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iDtLxISuV8hQkKVfpBZxAv01uNfB6alxvd3+KNVuOLc=;
 b=HOHGrdTIqCH6sgaQ1G5aleFwp1ouXG2h2y08igGQQyIke/uFUcr+f70B46R9TBS3o6
 WRXr+V6TdKYEIZIbTZX7XRoIyrMeDZZqFEqR1TgD+do1dJcHl1M6E2EHWlVtFiGRUEMN
 jBVpqv9ho4ZvvlQ9fKasW+LDR2MDxtt+A7HuXk4V/MNj6qGTO31O9M1DPk6IC4RB90GQ
 6B5WpU8HgJNZGjk+/4mCHo0Wdq3mQ2cQrqKHTJ1w2zW7Cti3tcP5mK9vFjODusBOsR1p
 gN5PE8vwZYUHl5Ic1Pc5KGoANSWEkbXVvPs2jQzNMER8RN7h1NOwP0jFSf1tM+OOtU/C
 AbWw==
X-Gm-Message-State: AJIora81QYxTTd/2qgw/R6p9xPgvF01FRpUQhy0XE+DPEC4Y8Eysm8i1
 V628tGZi8yBjuoGu40m6SM1Xhw==
X-Google-Smtp-Source: AGRyM1v1pUba5FiRtgDJxZ5hEtn2pz/wSnFU3b0uyeqby6SkMMoVivfhAwMgC/gsUtO9+JSS3VCQrA==
X-Received: by 2002:a17:90b:2c4a:b0:1ef:8f70:e125 with SMTP id
 rw10-20020a17090b2c4a00b001ef8f70e125mr2000008pjb.50.1657598434443; 
 Mon, 11 Jul 2022 21:00:34 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s137-20020a63778f000000b0040d1eb90d67sm4962734pgc.93.2022.07.11.21.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:00:34 -0700 (PDT)
Message-ID: <48a4d2cd-9353-5e6d-598f-cd1e137bb6bc@linaro.org>
Date: Tue, 12 Jul 2022 09:29:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 07/12] tests/vm: remove duplicate 'centos' VM test
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-8-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220708153503.18864-8-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/22 21:04, John Snow wrote:
> This is listed twice by accident; we require genisoimage to run the
> test, so remove the unconditional entry.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/vm/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

