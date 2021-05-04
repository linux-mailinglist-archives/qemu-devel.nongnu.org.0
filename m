Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E764737292D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:46:12 +0200 (CEST)
Received: from localhost ([::1]:37226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsZA-0008N2-22
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldsY0-0007u4-LY
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:45:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldsXy-0001Lt-Um
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:45:00 -0400
Received: by mail-ej1-x636.google.com with SMTP id gx5so12393389ejb.11
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLd/JZlLGkqXDtJQ8ubSzWAd/BtXFfPcPbkZYDireKs=;
 b=S9iekSrrGIUolfoZSJRlMyBm82EE2RNSRbfx8IjZpIXOBDphJ1gTYO4NGaMtr8uiif
 SDE9pm1wT37hF/j5Sl8GMUtgOXIzh1TtJjJXfvtpiF+0wWv3gYdGi29B7DObg5m9KsVU
 4nua52WTqlpCuIy61pWT5UCFnur7B1voa4jbMR8tpE+h7XON+AVVhwjM9tsoYgulzdEf
 yIQ3KurRJy1fGtD9kdeRLQtsLgNgbIa8KxmwddLLaYc4w9KzZpes2cJl1ueGFy3oMGrp
 4xmYp6hKb6TeyKPQCZnZmvxstWX8V2lJ82a1Thnh4W8aKsVkqRPKv0Bt1UW5vrue5g8n
 5tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLd/JZlLGkqXDtJQ8ubSzWAd/BtXFfPcPbkZYDireKs=;
 b=rg+224zkSkyNJkjnj+ceEXzdbHgG+U/U6uAYnbT7gR8pSjWNYPVhSQRR+/ADoJrfwk
 CGveXfS+m/JpFR+z/OfZUgQEjvdHN+WMOVmGblWnFVhLPgxu7li0rQ3+ZRUfp2thbIsI
 J3yE+f3kfIs3JZXYd8ZnAi9nSX+40cq7e9tpmxxr3cspOKcB70Pe9RMlQ4kh915mFmbK
 goqsbiy8reVQfvYWgdPDalBXAOKDKIkAiD4rJWXff0Jag2bA8yxBaJSXSDmYJHJC99sY
 fwOjgBhO7zALmpmXs/Da5UdMvMgonWqesAiXt5KvFiyur9RM8VPKvlE1V3XaV7nwYgOG
 ZjyA==
X-Gm-Message-State: AOAM530uOCsXayte6qUUYHO4vQzxXhWGJ7ehJc5iZXbzCIornPsO117S
 McCq5QH2/8sNU9Lb03N53GBX7wB1DpOrTZ9rY6LsFoASleY=
X-Google-Smtp-Source: ABdhPJzb5p7M3Z0ZqNJ4RKGnrjoYsENZ9LOWz6UOXwlzNYjIc/BgLa6dudHVO3eZMwke+8rFnNTCx5o3CGgRJToDLr0=
X-Received: by 2002:a17:906:3115:: with SMTP id
 21mr14430683ejx.482.1620125097431; 
 Tue, 04 May 2021 03:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210416135543.20382-1-peter.maydell@linaro.org>
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 May 2021 11:43:51 +0100
Message-ID: <CAFEAcA_tYx3OuTvz3xW+mgPqH0zvyeOtS-i3CFtg7HSvO=b=GQ@mail.gmail.com>
Subject: Re: [PATCH for-6.0? 0/6] extern "C" overhaul for C++ files
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 14:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Hi; this patchseries is:
>  (1) a respin of Paolo's patches, with the review issue Dan
>      noticed fixed (ie handle arm-a64.cc too)
>  (2) a copy of my "osdep.h: Move system includes to top" patch
>  (3) some new patches which try to more comprehensively address
>      the extern "C" issue
>
> I've marked this "for-6.0?", but more specifically:
>  * I think patches 1 and 2 should go in if we do an rc4
>    (and maybe we should do an rc4 given various things that
>    have appeared that aren't individually rc4-worthy)
>  * patches 3-6 are definitely 6.1 material
>
> We have 2 C++ files in the tree which need to include QEMU
> headers: disas/arm-a64.cc and disas/nanomips.cpp. These
> include only osdep.h and dis-asm.h, so it is sufficient to
> extern-C-ify those two files only.
>
> I'm not wildly enthusiastic about this because it's pretty
> invasive (and needs extending if we ever find we need to
> include further headers from C++), but it seems to be what
> C++ forces upon us...
>
> Patches 1, 2 and 3 have been reviewed (I kept Dan's r-by on
> patch 1 since the change to it is just fixing the thing he
> noticed). Further review, and opinions on the 6.0-ness, whether
> we should do an rc4, etc, appreciated.

1-3 went in for 6.0; I've now picked up 4-6 to go in via
target-arm.next.

thanks
-- PMM

