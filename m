Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F734DE147
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 19:44:17 +0100 (CET)
Received: from localhost ([::1]:46738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVHaC-0001zk-M6
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 14:44:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVHYq-0000hI-51; Fri, 18 Mar 2022 14:42:52 -0400
Received: from [2607:f8b0:4864:20::42b] (port=37840
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVHYo-0004ht-OW; Fri, 18 Mar 2022 14:42:51 -0400
Received: by mail-pf1-x42b.google.com with SMTP id t5so10208083pfg.4;
 Fri, 18 Mar 2022 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7nS+8zHZoh7qurm6Qfs3DdLW71cU3D+xMS9aoS9PgyM=;
 b=HypWMTJ1jpK3p9c6R8IGgCcGDle68s0lk0yKaWS4bwAGMNbNYrCfcejxSQwpnY77A1
 FcuauD+Ksy2IXFwM00VkF19hgu5pXQeGJbhQQlgYj1N70z6FBNPfpcWEtqV7QPqwpLsX
 +TL5OjiSs4pffIVWTN4D2fNpIZOmL7nunkGdCGD5RtjIgir+cS1VOp/mOlZToS0Ne1fm
 WpcBIffNammCip2L49bRFiN5DgWL+6bvBeDbKL/zJmInx+XbOwU3KehI4tP9Rj3uEM1S
 7Sp3diUb0mMtdGQI3rxIvLTtUbg1o0XMoijItPum/5DcUqU0nN808RFMJQVHtMu6kokY
 jeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7nS+8zHZoh7qurm6Qfs3DdLW71cU3D+xMS9aoS9PgyM=;
 b=4dOMVtOfLQIQ+sPzY/DRnPZY6wZpRo3MT6N8ERTfRfxXoHJB3Kg7vpdJ2pRugtpVna
 9oQ4KDu1gkHmBpTA39JKn5ewZO4sQ3XtobYN1Y2J+iIPnfYopm6BUXXspmqLcztM4kUs
 FWUSWlbLa7K9Z2YkTrc2tOINizxCPGjwEBho5pR8kdzACJgy6xLY0KUEAUIsTQ9XmiKy
 gQDyqtPSk9PSfQOP7gAJweZhlM25gwFYr0OwFtSn6ws8YWYUvkh4OsKZXN3J2wLOhVGa
 HURbJ4rgBh/U56p1BAXj0rTmByfdC8kwuD/dXdra2YL+gMZOPE5CWQn4CpHNg6kaGKGX
 oUWw==
X-Gm-Message-State: AOAM531TXo9eGKTqVco8LXeGdBfUBNjSYm3MKa7sDCAo7w2dmT6VyD8m
 aE+B1GrKJEbLxG2mDoP3y0Y=
X-Google-Smtp-Source: ABdhPJzqod61CrXs6KXlOhmY1pTVBzuuvcWoCoczHhbKvDhyjBy12RQOdWkRp3kIFtXvekZgRsvg/Q==
X-Received: by 2002:a05:6a00:10d0:b0:4f7:5af4:47b6 with SMTP id
 d16-20020a056a0010d000b004f75af447b6mr11223197pfu.6.1647628968808; 
 Fri, 18 Mar 2022 11:42:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056a00168b00b004f7e1555538sm10723714pfc.190.2022.03.18.11.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 11:42:48 -0700 (PDT)
Message-ID: <24c72a93-0251-6bce-c652-2455ee642de1@gmail.com>
Date: Fri, 18 Mar 2022 19:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] Fix 'writeable' typos
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220318173038.3350098-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220318173038.3350098-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/3/22 18:30, Peter Maydell wrote:
> We have about 25 instances of the typo/variant spelling 'writeable',
> and over 500 of the more common 'writable'.  Standardize on the
> latter.

Amusingly I was looking yesterday at the difference between both.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Change produced with:
> 
>   sed -i -e 's/writeable/writable/g' $(git grep -l writeable)
> 
> and then hand-undoing the instance in linux-headers/linux/kvm.h.
> 
> All these changes are in comments or documentation, except for the
> two local variables in accel/hvf/hvf-accel-ops.c and
> accel/kvm/kvm-all.c.
> 
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/interop/vhost-user.rst    | 2 +-
>   docs/specs/vmgenid.txt         | 4 ++--
>   hw/scsi/mfi.h                  | 2 +-
>   target/arm/internals.h         | 2 +-
>   accel/hvf/hvf-accel-ops.c      | 4 ++--
>   accel/kvm/kvm-all.c            | 4 ++--
>   accel/tcg/user-exec.c          | 6 +++---
>   hw/acpi/ghes.c                 | 2 +-
>   hw/intc/arm_gicv3_cpuif.c      | 2 +-
>   hw/intc/arm_gicv3_dist.c       | 2 +-
>   hw/intc/arm_gicv3_redist.c     | 2 +-
>   hw/intc/riscv_aclint.c         | 2 +-
>   hw/intc/riscv_aplic.c          | 2 +-
>   hw/pci/shpc.c                  | 2 +-
>   hw/timer/sse-timer.c           | 2 +-
>   target/arm/gdbstub.c           | 2 +-
>   target/i386/cpu-sysemu.c       | 2 +-
>   target/s390x/ioinst.c          | 2 +-
>   python/qemu/machine/machine.py | 2 +-
>   tests/tcg/x86_64/system/boot.S | 2 +-
>   20 files changed, 25 insertions(+), 25 deletions(-)

