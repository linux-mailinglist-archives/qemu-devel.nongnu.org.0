Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C954E4489
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:50:59 +0100 (CET)
Received: from localhost ([::1]:45086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhik-000144-Tz
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:50:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWhhH-0008Iu-6Y
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:49:27 -0400
Received: from [2607:f8b0:4864:20::530] (port=37450
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWhhF-0004mK-MA
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:49:26 -0400
Received: by mail-pg1-x530.google.com with SMTP id bc27so13026867pgb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JmfhQdsGQ7vsHp96PngBCD8Y7rG4c07+Z5Seq9tTlZk=;
 b=bRk8C+ewE6ZA/JMnIjSGxN3vG8wSxM9NwMw8CLBtHCqUPUkn+S5wusGoSxKuFWGMPS
 YXvXnf5kyJtqgKVf8OKGIYo4qnzOg5+y4lu3o6Uy8c0QWfJ4lIFUo+XJx7rRSysjnwpz
 dYkerD/ZpRe19A9Bpd2PcouJTelxT7qKv+7MbL9wSGcjVKnZNpbEguaADqhYPcTkZQlr
 SXs0miW7qGBOzcLV1/K5L2aMP0Nj3Ibt9UCHNnozUsueniQbdwQaz4sZENw+gdFB9WF7
 gTTBO320rIop4oYWFTDN8+v6O0IcXp4u8uli/o7nvA/xhScle9cwbDUYEOQ6oeGRZMVm
 6cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JmfhQdsGQ7vsHp96PngBCD8Y7rG4c07+Z5Seq9tTlZk=;
 b=gXxPhTIqR3j1WxdRN295WfJpWLkA38Gr7Qyp71x6qaTdjHwi5J0shh4/9rMN+hNdqA
 TyugC4Zt1iWWpejbc+pqhGyRenVr9fUQsCdcs4F8tHA0pof47Prw9Nl46wxzp2Gt/Myf
 7hg4CP84IGPyNI5uTz+V8otGpQ259NdAJlnNZJeL5Axcs0k5OYdpQMLVYnmSwRVYJU+D
 FFOAMPaTiDMcaMG2sEjU5svqndNGYu7qcI+DL30LmmmKnOIYegaO+IVJ583ZtOw4mx6u
 DpGGqyKUJAvd0u45oCEQNKomNkxS48ah9VZkgWvoq92Rjth1poPsnYAMWqXyEx4EZavr
 Tbmg==
X-Gm-Message-State: AOAM532iSXbGrV34O4ByNW4azbghJVyq1XPKkx9BoBQh1qB2WDuwhM5G
 1mrOPCKyHOwW+uUyFEvD7k2mZA==
X-Google-Smtp-Source: ABdhPJwPyvxb3QbR67mBjN4HaQ4kn/Lbu0CjQlhNCxZDUhGMEMq97jGpP/55FRWQr4392qOuOnNLeA==
X-Received: by 2002:a63:6b83:0:b0:380:102:8779 with SMTP id
 g125-20020a636b83000000b0038001028779mr22852405pgc.42.1647967764254; 
 Tue, 22 Mar 2022 09:49:24 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a636c06000000b00363a2533b17sm17785592pgc.8.2022.03.22.09.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:49:23 -0700 (PDT)
Message-ID: <be27ed3b-cbba-3ccf-63ce-813457cafb42@linaro.org>
Date: Tue, 22 Mar 2022 09:49:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/8] tests/avocado: update aarch64_virt test to
 exercise -cpu max
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315121251.2280317-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 sw@weilnetz.de, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 05:12, Alex Bennée wrote:
> The Fedora 29 kernel is quite old and importantly fails when running
> in LPA2 scenarios. As it's not really exercising much of the CPU space
> replace it with a custom 5.16.12 kernel with all the architecture
> options turned on. There is a minimal buildroot initramfs included in
> the kernel which has a few tools for stress testing the memory
> subsystem. The userspace also targets the Neoverse N1 processor so
> will fail without additional v8.x+ features.

Maybe better as "would fail with a v8.0 cpu like cortex-a53"?
The way it is worded now suggests it won't work at all at present, since we don't 
completely support all features of the neoverse-n1.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220307172249.3125779-1-alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

>  (04/32) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_virt: PASS (3.66 s)

Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~

