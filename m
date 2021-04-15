Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BEC36123C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 20:39:40 +0200 (CEST)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX6tv-0000lS-9T
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 14:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX6nf-0005Y5-RC
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:33:12 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX6nd-0005H5-7C
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:33:11 -0400
Received: by mail-ed1-x52a.google.com with SMTP id e7so29204443edu.10
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MbGNe8xVn4kiM2Wi/WaRgSqabfbhn+M2GR/5aukW1w8=;
 b=giclkvwz7f9tnO/v0Vrik4aL0+bEZoDKTFcPy87T7Zo6zKA5KHNByykCK+ruwjRI0R
 pl5ZLkYxoBoT5mniVq8+6jN9tyfHweZ6XUUL7vNK1g8x7OetnNvI4yI2PcxAQOeGM6Wf
 1fmQNsmzR9aDRKjG7fEHjnbhMhDIG4nGIO+MJkESReOUXIg5TrBCLOxmU0uaNrtqX3Eq
 T2aFBXXkQJKdWmXSbyYnmM0mt3ZWOSgMrHtQ6+tFfQgN3qERu2qK3xHYl/nl2D/Cnhav
 2T7TuavKCCoMNxvbm3565INM3dU5hyawbk4O2JVlwOL6iXbonYbp9uyea9SSAJrrGHHt
 NRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MbGNe8xVn4kiM2Wi/WaRgSqabfbhn+M2GR/5aukW1w8=;
 b=VqhNOYJo2MALb3e+XylPQGVq8VfuUrTKPq3/K3vSlPkBbIbl6kgqnqltLGVMe0E6DC
 tzx/H27zwmhv6r7hqHaxXKXOhAkxb/zjxHAKsxggby5mL7SqGwCS0ptoUt9BjkwaZuG8
 D9kE1qXAKyR3v45YQBN4R+qJt1bvF84EgNsNgqigh+Wj4UkRszbw/3v8VGWE6NErNR/m
 3Za3eBzKGdPz4TLdyQwoK+/9ymJT5mG3oOtx4NNpYYdawhevrky4CiZwvmvvbi1/DSRV
 g86WIIj8ZuIe4WqR3mlFduwKOdRvigUVPEy473A3JNFOtL/UA9Obgzq+G+N2dSMLaEba
 Q8YA==
X-Gm-Message-State: AOAM531q0MQ+xWK3af/p6SlYgHvGjlbfqQqyNoxBida8IF2MtqSm7CJR
 rnwX2ZCf/DLneWjLc0Ma5uHPAKfHph5k9it4JVAsVw==
X-Google-Smtp-Source: ABdhPJzHQRNbTld7r2E+FMY3ANrmOeHSrv67XB91WrMwRMgmXgaKxzBehBJB03EcghgEvJAoVStPybutvTEuWtmfT+8=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr5918351edb.204.1618511587491; 
 Thu, 15 Apr 2021 11:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210415182353.8173-1-peter.maydell@linaro.org>
In-Reply-To: <20210415182353.8173-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 19:32:20 +0100
Message-ID: <CAFEAcA-zaAKyXXw5XHQ=zm9nY8GwYWjd-=fYcncNnnF-mqQAKw@mail.gmail.com>
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Give SSE-300 its own Property
 array
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 19:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> SSE-300 currently shares the SSE-200 Property array. This is
> bad principally because the default values of the CPU0_FPU
> and CPU0_DSP properties disable the FPU and DSP on the CPU.
> That is correct for the SSE-300 but not the SSE-200.

Should read "correct for the SSE-200 but not the SSE-300",
of course.

> Give the SSE-300 its own Property array with the correct
> SSE-300 specific settings:
>  * SSE-300 has only one CPU, so no CPU1* properties
>  * SSE-300 CPU has FPU and DSP
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

-- PMM

