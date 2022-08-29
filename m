Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928C5A5785
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 01:21:48 +0200 (CEST)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSo4g-0000o6-JY
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 19:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSnzt-0006AJ-QP
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:16:50 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSnzr-0000EM-MO
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:16:49 -0400
Received: by mail-pg1-x531.google.com with SMTP id r69so9081460pgr.2
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 16:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=hI57aimQyYduvsWSZTenqEH+b4loG1jK5vfu7twYFLY=;
 b=d3NMJNr3cW0TupdyU2WhRGKi0VJKQShUIqWVHqDpWBd1hKDqxaq2bsKIVj5f3UhRh3
 7bd+tzIPk0zpjBayMGv3AeCE7ewFUvE/crEGnUhMQuL68YhXU6U9HmVnyJSETUCkhu+N
 HPnaWlEOaSt2WQIxWjcIFtaynJylQ2+OqTH+vlipJYVDsAYwk/8GrK+DdfxFSr9J8WMg
 19d5YwkY6pkMpubA1aTN+bWczMcqIdpbpRIWKrIuftkuLxt1JMYQV0hPRoSXqgWWn5hm
 iuCE3zrFGvPNczfs27xam3n7HgkhIULppG+mavdbkNTVotP7RWdz8RWes9sFWBiUPQk7
 3pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=hI57aimQyYduvsWSZTenqEH+b4loG1jK5vfu7twYFLY=;
 b=P9WOwByaXiTK0ZaKe3F5uh39W6v/n+gzpg/VNI/KMg+81oxb1ibR+0OKMMMg7IVr0a
 N1YcGsrjzoFjh3hCirOB2Mjj3z9xrb/0/S/LzreSE/CJkIAglWzAikUA3eMF1T5A6p96
 VadZFMbSAUCdGsmPgrA2Ki4E9Z8Wnm6G+z3hZ0XIPu6nVYMGyx0AeUJlS5g/PwZnjr+E
 mkWkBrISfIc2DK6sKhcJERkepG5tIMJI67kTSNkiLRiX8Egc/Cw3Wt287P+dOnUe+dtB
 6qtvXT+jc/k5So6dgqGQq+FExf7mP897/eG9bZsPU85m7LVFFtR7ITDzwl6MflAxtScB
 KMtQ==
X-Gm-Message-State: ACgBeo0PKUzmo0bRdqf5L5ovEsAG+Xf0yaPVcExz8vABt0EzmcjrAJ9r
 Hrnq5Taun+nBAK1QZF/Rc6Y=
X-Google-Smtp-Source: AA6agR7r8HAjthgqDffz/uECt5t7Q2n/05Xtaq+SR89hnXlilIqNHoi2k29p+WuUkfglfEtUZYePOA==
X-Received: by 2002:aa7:8e4b:0:b0:535:da7c:c2d with SMTP id
 d11-20020aa78e4b000000b00535da7c0c2dmr18735633pfr.86.1661815004265; 
 Mon, 29 Aug 2022 16:16:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 36-20020a630b24000000b0042ad3214a88sm226649pgl.74.2022.08.29.16.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 16:16:43 -0700 (PDT)
Message-ID: <5bd08d1d-c590-3542-e66c-f0a4f4ecb69f@amsat.org>
Date: Tue, 30 Aug 2022 01:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 13/25] gitlab-ci/custom-runners: Disable -static-pie
 for ubuntu-20.04-aarch64
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-14-alex.bennee@linaro.org>
In-Reply-To: <20220826172128.353798-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 26/8/22 19:21, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> The project has reached the magic size at which we see
> 
> /usr/aarch64-linux-gnu/lib/libc.a(init-first.o): in function `__libc_init_first':
> (.text+0x10): relocation truncated to fit: R_AARCH64_LD64_GOTPAGE_LO15 against \
> symbol `__environ' defined in .bss section in /usr/aarch64-linux-gnu/lib/libc.a(environ.o)
> /usr/bin/ld: (.text+0x10): warning: too many GOT entries for -fpic, please recompile with -fPIC
> 
> The bug has been reported upstream, but in the meantime there is
> nothing we can do except build a non-pie executable.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220823210329.1969895-1-richard.henderson@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> index 3d878914e7..85a234801a 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> @@ -16,7 +16,9 @@ ubuntu-20.04-aarch64-all-linux-static:
>    # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
>    - mkdir build
>    - cd build
> - - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + # Disable -static-pie due to build error with system libc:
> + # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --disable-pie --extra-cflags='-fno-pie -no-pie'

Shouldn't "--extra-cflags='-fno-pie -no-pie'" be handled by the 
configure script while processing the --disable-pie option?

