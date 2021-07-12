Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082CA3C45EE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:00:16 +0200 (CEST)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2qrO-0001Ao-Cx
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m2qqE-0000KZ-89
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 03:59:02 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m2qqB-0006ov-OS
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 03:59:02 -0400
Received: by mail-oi1-x22a.google.com with SMTP id s23so8616106oij.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vR4VY4q+ArMNvpA8AnqJG1MPsMQpMVrQ9+wwc6gLI8M=;
 b=qy0k5WuAvxhHZliBEv8ZgA6REQlwzZS55tW+KxbtkYXbv5BcY6D1g3O11PkGY6lAp4
 P0SJDeeaHSSOtqr9yHVSvbMU5lk32EVjMbB6lc0CQoMjv5VIUsz6ILtU1PfKvSEEbMX/
 +Cch4WqEZr0VbAiorDDv7u/flZr0IP3ikJ4kVmR5t4IKuc2xM+OtuzhoLyx2D0ESDZV0
 O42x8EQcmMQQOjxgDM2LG2sbz2NBf/b367U4DyXRoXRSUbtWj4dpdhsKUbC+10Ko2rb1
 mlqOiXt6i6j556fAjG/mFTPZdZ2/Bbzst+wFEejpYAhvnYFWQ+mKp90lWuqgNDP5iGzC
 I2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vR4VY4q+ArMNvpA8AnqJG1MPsMQpMVrQ9+wwc6gLI8M=;
 b=P/8NslDu/vY49lPFfPUQcHMy6ehl4fC3FzQS/gJkbLUFsL6h5uex9PhzdPTJAnV1uk
 XgpBiU9XEYhxn1aEUixTEnzxJhN5yFsHpOB7UK9zWF7UwL/Uih8CH06YRXRfg+Nsr9Z6
 9P72KexaRuXdtCkBN6HHB7/m/Enq4+h7w5WkD6C5CAlYrQeiIVRnbjzY/rYeltBvMEh5
 rTPboVyz6kIpYahRB6geuI/rmKVU50n63uJBiZB1BqB15SLRVgITvpTnwVgXRuGnrqZh
 lEMQ8TCPgitXT9BBe9i/O/P/hhiQpuDXrUZDbSGz2mtqmpWCM9kIM4vsqQFu5KQ/pTMI
 nXIQ==
X-Gm-Message-State: AOAM533RD2XOHdsLHjR3TWqq6id0cj/SQeN78VXh5gVOkBSd467qokhX
 ZmDcJkNC0Fq/+naLyjm2xNyBkQ==
X-Google-Smtp-Source: ABdhPJw4tL76/+4KcXFYtn03M+vspbpJUnEuGpuKyJhs7wkl8lgrOHsqmogXGJ7+2l7/1SsiKEUZSg==
X-Received: by 2002:aca:31ca:: with SMTP id x193mr30572078oix.84.1626076737560; 
 Mon, 12 Jul 2021 00:58:57 -0700 (PDT)
Received: from ?IPv6:2607:fb90:e678:8d69:6680:99ff:fe6f:cb54?
 ([2607:fb90:e678:8d69:6680:99ff:fe6f:cb54])
 by smtp.gmail.com with ESMTPSA id z6sm2951656oiz.39.2021.07.12.00.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 00:58:55 -0700 (PDT)
Subject: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
From: Rob Landley <rob@landley.net>
Message-ID: <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
Date: Mon, 12 Jul 2021 03:16:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22a;
 envelope-from=rob@landley.net; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, peter.maydell@linaro.org, philmd@redhat.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 6:34 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/README | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)

I'm poking at the hexagon toolchain build script you checked into the test
directory, which boils down to (starting with):

git clone https://github.com/llvm/llvm-project
mkdir build-llvm
cd build-llvm
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$(readlink -f ../llvm) -DLLVM_ENABLE_LLD=ON \
  -DLLVM_TARGETS_TO_BUILD="Hexagon" -DLLVM_ENABLE_PROJECTS="clang;lld" \
  $(readlink -f ../llvm-project/llvm)

Except the LLVM_ENABLE_LLD part breaks with a standard debian/devuan x86-64 host
toolchain because it ONLY works with host llvm, and apparently only a pretty
current one at that:

  https://github.com/tensorflow/mlir-hlo/issues/4

(Devuan Beowulf only packages lld-7, not lld-10.)

I'm currently building:

cmake -G Ninja -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$(readlink -f ../llvm) -DLLVM_ENABLE_PROJECTS="lld" \
  $(readlink -f ../llvm-project/llvm)
ninja all install

On the theory that should give me an lld-git I can play $PATH games and re-run
the other build with, but my QUESTION is what does the LLVM_ENABLE_LLD=potato
actually accomplish here? Is it a sanitizing step or is there something about
building with gcc's lld that's known to break the hexagon toolchain? If I just
omit it (to avoid building lld _twice_) will I (probably) get a working hexagon
toolchain? (Assuming I do the musl and headers-install builds and so on?)

What's the _issue_ here that this config symbol addresses?

Thanks,

Rob

