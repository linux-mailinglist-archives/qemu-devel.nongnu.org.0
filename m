Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C43CB769
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:36:55 +0200 (CEST)
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4N5K-0000UA-8k
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1m4N49-0008AG-5j
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:35:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1m4N47-0003YT-NH
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:35:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gp5-20020a17090adf05b0290175c085e7a5so1690005pjb.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RKsDzibicase/QJZhbgUQWuL5OWy7oP45ftlD9H0SAQ=;
 b=OYSxBb6wd9x4CXwH9h0CrUTgyoUjLuRBy/9WyJhlG1vQPGDXLuGNlxRr0/3Jo4srxn
 iwRkg11MknGtPEDYsHqffiJXqV+jliaWihH36qKK92x5KJRoyx8Ex5+x6fcYhzHMeUgi
 WzFr9fvnuoIX6gEXhZ7dtC6P4yp/miZ0PP8TE3zTBnR52qh6QHT3ZWSqsHsS8WO77UvO
 P8enrQhy1XNg8YEECFoYynZcvk6nGofycZQYOjnxRtZYT/0+Nhh+loQXZFtZ1PYDa6RD
 3kj0/rsaLkomDozEDqHS3ZoHKdB+XgCUWMZKewCNIdesCZQFqe1G//7OZwQPslTJIPuM
 96/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RKsDzibicase/QJZhbgUQWuL5OWy7oP45ftlD9H0SAQ=;
 b=EUiFQ2gVvfN2YgISLif/aOYhtzm407IGRv4/1cHpI/B/V6lMT47viGOYlE95Zkd96A
 3zsoqEIkQE1Ec5KWPr+UhSr9Yyhmzl9HcNDwt9jsiBufeJik6mD9jtDfUOTuVcRIBHLi
 6Np2tczmw3qmRHSx1nHIBoGuDfwFqJgbwc/9T1FjpdBL1xjDVccVrbJYVLesM0HLoPk/
 tz/WxFdkt0p8+NwQBG2zJtiwbqb739D1QpdbSrLV2LpBCs3t2rJHCNq50cMRpAXHRKar
 fb34J1ONddrqANT8e0RG/j7WtM96b3Gza+95wb5t0MsDJUCmiHFsDo0vMdpOAO3Hj7Bh
 6P6w==
X-Gm-Message-State: AOAM532qrfSO7Cb6hS2LklfJUN8UZ0FuVmSCmPe5rjmeqYAVTp4LTxKS
 +5UKQrOh0wLSgWLC+sR7B/8=
X-Google-Smtp-Source: ABdhPJz+CuY3siCWcKIvIcDUSs3RRTArf2lFoL6+W6eGYaefaTdhtwDNl/rZLYvtYOhRngNGIsYqyQ==
X-Received: by 2002:a17:90a:8404:: with SMTP id
 j4mr15433750pjn.66.1626438937484; 
 Fri, 16 Jul 2021 05:35:37 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k25sm9887723pfa.213.2021.07.16.05.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 05:35:36 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 16 Jul 2021 20:30:54 +0800
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
Message-ID: <20210716123054.a2xvth24mukdpmu2@Rk>
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <CAFEAcA9PSZaHkV-qL9jvXX_MFKwYJJTSQ4FjQJfwyRi7GvJvWg@mail.gmail.com>
 <20210711222033.tb3paw53ayxrkagb@Rk>
 <20210711225032.smu6kxhqvt3xniwk@Rk>
 <CAFEAcA9a-PX_xaFF7AB=1DqUL-Yn3qqSYWmw4uSedeuGhKTaRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAFEAcA9a-PX_xaFF7AB=1DqUL-Yn3qqSYWmw4uSedeuGhKTaRw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=coiby.xu@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 10:39:50AM +0100, Peter Maydell wrote:
>On Sun, 11 Jul 2021 at 23:55, Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> On Mon, Jul 12, 2021 at 06:20:33AM +0800, Coiby Xu wrote:
>> >On Sun, Jul 11, 2021 at 04:53:51PM +0100, Peter Maydell wrote:
>> >>On Sat, 10 Jul 2021 at 14:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >>>
>> >>>I've noticed recently that intermittently 'make check' will hang on
>> >>>my aarch32 test system (really an aarch64 box with an aarch32 chroot).
>> >>>
>> >>>I think from grep that this must be the vhost-user-blk test.
>> >>
>> >>I've also now seen this on qemu-system-i386 guest x86-64 Linux host:
>> >
>> >Good to to know that! This makes it much easier for me to debug this
>> >issue.
>>
>> Which i386 image do you use for the guest? Could you share the download
>> link? I can't find a suitable i386 qcow2 image. For example, [1] is
>> outdated.
>
>I'm just running "make check" on the x86-64 host, which runs tests
>on qemu-system-i386 (assuming you built i386 targets).

How often can this issue happen? Unfortunately, I can't reproduce it in
the past four days on my own laptop and two Openstack machines every now 
and then,
     git clone git://git.qemu.org/qemu.g
     mkdir build && cd build
     ../configure --target-list=i386-softmmu 
     MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))} \
       QTEST_QEMU_BINARY=build/i386-softmmu/qemu-system-i386 QTEST_QEMU_IMG=build/qemu-img \
       QTEST_QEMU_STORAGE_DAEMON_BINARY=build/storage-daemon/qemu-storage-daemon \
       build/tests/qtest/qos-test

I've also tried running the whole tests using "make check" or "make
check-qtest" but the results were the same. 

>
>-- PMM

-- 
Best regards,
Coiby

