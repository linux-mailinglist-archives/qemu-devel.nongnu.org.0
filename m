Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E33DB01C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 02:02:44 +0200 (CEST)
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Fz9-0004aO-GS
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 20:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Fxr-0003sr-1H
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 20:01:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Fxp-0003l8-EN
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 20:01:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id nh14so838700pjb.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jmfaji+9M/QC/wTT+8FBRce+Fu/vs2mWCLqtmeZ4Wrs=;
 b=T1fohr2z3qw+DajeU7gQdW2GaaZVIWM11rbVQKZTG6iRDv1IsC7tSk4Bj6VJvxo+fB
 zKSFMxpbNiKIhcAywviTiuwVucnKPMQy72HVwESKK3QM/5PlE4ZpTxLuCByJcmU2J3w4
 85KCG17EaPOjnjcmulVyYqQJ7OZgc9Cf6E1IS9MPpBnQNgQsTfCLRZd0lzxUf1qdGorV
 70l8FtFM+rFRqnL83MmKFPFxRPxmTOsAwrO/mxow3oE2JvyIvGI5KwT4qOZTE8vP8BdQ
 B5CgD4t2yipeFTX79+fTb5Notzlo02/fJxaPTKyNwu0xOelkHGGN1A/oBISgkYyFb0kl
 O2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jmfaji+9M/QC/wTT+8FBRce+Fu/vs2mWCLqtmeZ4Wrs=;
 b=PsH6+5IY7Fow2djFidoLq2HkNMzBOvETgTeNNnZjajK9xVi+kiwCyfrmNNNdDT/p63
 llVji3J+lnfYjdeeQpZxNT/QOfowoEHaPMok+JscCdxWa3JT5YtwABj3Ys25FAnym7zy
 c5sVK0AUWrrtfpH6Co8a4q49+GMdONQ4EYySodlA7tqqBbUO61beThwadZmDR5kN8MuI
 2ScxdKN4cFCpsKtUyQM/9SRW6hJkEtONNQDsGbP70jdy6HlGTlBovxbEx4+GNtvLIMea
 z+RBfoAu89bFo0SPIv1KaRMLDXqyAOV+Dd0FUtOtIpYghI2elKfiLuITICvs8EknDK0z
 NE2Q==
X-Gm-Message-State: AOAM533fD57NpnkaZJ2MLq3LYo5p1xEu2AKvKZp0K5SpGqucoGQnzBbk
 N8ESePSnMDyMgDIWM7txL79aTQ==
X-Google-Smtp-Source: ABdhPJwyqPqyYEh2SmlifUi7S3yQPUra5Yhe6ehxK8XCdihQ23k83OMJot3HyVh4dsDP98vIy/NTZg==
X-Received: by 2002:a17:90a:d18d:: with SMTP id
 fu13mr7268pjb.206.1627603278888; 
 Thu, 29 Jul 2021 17:01:18 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id x26sm4828346pfj.71.2021.07.29.17.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 17:01:18 -0700 (PDT)
Subject: Re: [PATCH for-6.2 12/43] target/sh4: Implement do_unaligned_access
 for user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-13-richard.henderson@linaro.org>
 <CAFEAcA9yrj7OZPkeZ2jUqAV4+ULVYm4++y6kXeK2_MC8gR3-bg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3318f1ba-0963-155d-4fe7-3de9bf7ee0f6@linaro.org>
Date: Thu, 29 Jul 2021 14:01:15 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9yrj7OZPkeZ2jUqAV4+ULVYm4++y6kXeK2_MC8gR3-bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 3:52 AM, Peter Maydell wrote:
> sh4 kernel default for unaligned accesses seems to be "warn and fixup",
> not SIGBUS, unless the user changes that by writing to /proc/cpu/alignment
> or the process changes it via prctl().

We will still need this for load-locked/store-conditional (MOVLI/MOVCO).

It appears that the sh4 kernel fails to decode these properly, and will do something ugly, 
like interpreting MOVLI as a multiple-store instead of a load.

There are also other instructions that the kernel does not attempt to handle, such as MAC. 
  I suppose we could begin with turning off TARGET_ALIGNED_ONLY for sh4-linux-user, then 
re-enabling MO_ALIGN for the atomics (at least).


r~

