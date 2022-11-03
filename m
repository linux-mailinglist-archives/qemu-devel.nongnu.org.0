Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D20618BC2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 23:44:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqiu0-0006Hp-EU; Thu, 03 Nov 2022 18:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqilN-0002Di-3y
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 18:32:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqilK-0007S0-QT
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 18:32:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k8so4817138wrh.1
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 15:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Qw6m8qKQPRpagCcZkmgrQopMNLbRlskPbKimTe0cOc=;
 b=EIOcHYdp6wV/QkcACd4mBXYt9o8Oqd8pFzOkQN35lWa5PjG202iB/Ntw+1CxPxYYz7
 u1IIZGR6OmcngQG/bflVZHaLWBLxpQy1kBpoajKy7dpwODsHRKEDmRnp61Dv+JfJQ/DM
 zX+zwk3/+nh78GEHfHsdMSRiH4+zIpzZR6hMCj6nqmrseR/ko4iDf0gwbCQpn31Vh5hn
 IIN4S4s139qyaDzlJ0lXeD2gt5eAJK1Dwl2FIY3LjBu54iBCqbsfKcUQ8mYarVaMREkC
 Z8GX0hh5qsbRQ4oGgLaBGJbOnprpant6XMhmIn75YvEWiFkEebLO2fE7bwDY/9SQAuRl
 2rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Qw6m8qKQPRpagCcZkmgrQopMNLbRlskPbKimTe0cOc=;
 b=WhR77nkpkvR05ku+2UnByPwrFnxVjE8iWc8Jel6RN+fKzP6YezckfB0p418996Bm7Y
 +DNyGZpgymKM5vdXFupCRw+1XBpQBwKTYvTIQ5jzYKrqMRJ4+qrVXrdWZIt/a9PQ74zB
 DAAs2GVpSlJZe68Lp19/WYG0MLeMpajSPe1mrpz3ZLhvDp/ovQoOf6dP1JOqt3AUC0of
 Je/GpB89JI0mYOd/BPHWGXx0aWHkV6kCJBHYglitQX+v8+Le2a1uLikcqRQJ2osvCpXh
 lIl0t/cZhls9QtZxxUW+Qd6SwATp5sPqucm8IpXqxGzTBKGcYmPrymfrfK4FIj80e9rB
 5GNA==
X-Gm-Message-State: ACrzQf11Qi0sQXaZKwMaj97SaZQGPMipR73EQ0l1H+6cwVhT0980c/4w
 tMMfZxnMHYR2oddwguEE7dxBFg==
X-Google-Smtp-Source: AMsMyM5y8FsaB1O28rl+bGU9iELZnvQhZ3eHThXgK8VPYdtmkKJornxm84pooraiQxB6QVLjuy1GRg==
X-Received: by 2002:a5d:5a14:0:b0:236:c206:f1f9 with SMTP id
 bq20-20020a5d5a14000000b00236c206f1f9mr17299180wrb.694.1667514754044; 
 Thu, 03 Nov 2022 15:32:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a1cac03000000b003c6f3e5ba42sm919252wme.46.2022.11.03.15.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 15:32:33 -0700 (PDT)
Message-ID: <e188327c-9afc-db4b-4a83-e88ac31cd353@linaro.org>
Date: Thu, 3 Nov 2022 23:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] gitlab-ci: split clang-user to avoid timeout
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20221103212321.387738-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221103212321.387738-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

+Richard

On 3/11/22 22:23, Stefan Hajnoczi wrote:
> GitLab CI times out when the clang-user job takes over 1 hour. Split it
> into parts that check various architectures.
> 
> An alternative is to have one job per architecture but that clutters the
> pipeline view and maybe there is some sharing when multiple targets are
> built at once.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 11 +++++++++++
>   .gitlab-ci.d/buildtest.yml          | 18 +++++++++---------
>   2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 73ecfabb8d..38b055e139 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -81,3 +81,14 @@
>       - du -chs ${CI_PROJECT_DIR}/avocado-cache
>     variables:
>       QEMU_JOB_AVOCADO: 1
> +
> +.clang-user-template:
> +  extends: .native_build_job_template
> +  needs:
> +    job: amd64-debian-user-cross-container
> +  variables:
> +    IMAGE: debian-all-test-cross
> +    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
> +      --extra-cflags=-fsanitize=undefined
> +      --extra-cflags=-fno-sanitize-recover=undefined
> +    MAKE_CHECK_ARGS: check-unit check-tcg
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 6c05c46397..116fce4e8f 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -323,16 +323,16 @@ clang-system:
>         ppc-softmmu s390x-softmmu
>       MAKE_CHECK_ARGS: check-qtest check-tcg
>   
> -clang-user:
> -  extends: .native_build_job_template
> -  needs:
> -    job: amd64-debian-user-cross-container
> +# clang-user takes too long so split it into parts
> +clang-user-part1:
> +  extends: .clang-user-template
>     variables:
> -    IMAGE: debian-all-test-cross
> -    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
> -      --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user

We can exclude these targets which are a bit redundant:

 
armeb-linux-user,mips64-linux-user,mipsel-linux-user,mipsn32-linux-user,ppc64-linux-user,sh4-linux-user,sparc-linux-user,riscv32-linux-user

Alternatively, instead of using the exclude pattern, we can switch to 
including the targets which do have tcg tests:

$ ls -1 tests/tcg/
Makefile.target
README
aarch64
alpha
arm
cris
hexagon
hppa
i386
loongarch64
m68k
minilib
mips
multiarch
nios2
openrisc
ppc
ppc64
ppc64le
riscv64
s390x
sh4
sparc64
tricore
x86_64
xtensa

Although we have 'multiarch' :/

We can also drop check-unit, but not sure if it saves much.

> -      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
> -    MAKE_CHECK_ARGS: check-unit check-tcg
> +    TARGETS: aarch64-linux-user,alpha-linux-user,armeb-linux-user,arm-linux-user,cris-linux-user,hexagon-linux-user,hppa-linux-user,loongarch64-linux-user,microblaze-linux-user,mips64el-linux-user,mips64-linux-user,mipsel-linux-user,mips-linux-user,mipsn32-linux-user
> +
> +clang-user-part2:
> +  extends: .clang-user-template
> +  variables:
> +    TARGETS: nios2-linux-user,or1k-linux-user,ppc64le-linux-user,ppc64-linux-user,ppc-linux-user,riscv32-linux-user,riscv64-linux-user,s390x-linux-user,sh4eb-linux-user,sh4-linux-user,sparc32plus-linux-user,sparc64-linux-user,sparc-linux-user,x86_64-linux-user,xtensa-linux-user
>   
>   # Set LD_JOBS=1 because this requires LTO and ld consumes a large amount of memory.
>   # On gitlab runners, default value sometimes end up calling 2 lds concurrently and


