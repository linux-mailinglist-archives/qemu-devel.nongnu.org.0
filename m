Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C2831D80B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 12:19:10 +0100 (CET)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKrN-0004y2-BJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 06:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCKo3-0003sq-OX
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:15:44 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCKo1-0006Ld-PW
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:15:43 -0500
Received: by mail-ej1-x62e.google.com with SMTP id do6so10991771ejc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 03:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zK3AITACjHaRnsAyW99zENI777gG4goMLTGrT+lPZOU=;
 b=w0i87Dy5B9G8sT/nkcvVio4SzMv31CIrWtPsmJHhBPRSbHfk8EKYwx3i4nlL1b+oqy
 wmbWTBpCM+MYwdI5IjlzYJl08rm88Re9xdiQkyI2SKk0hTCiifWcQ4EKzRoBogNiZBnV
 nTudCUc2DgAcTg8/WBqsX1pJgcF0nQyJCnFpKHJ+5TUljvM/2wHrxK58YuRK/1cWzbKo
 hJI2mkB7JUY++SRBSGVjnMIPx3Vya261HESfwbp7dS1p6f5fRwgjaAJNP4MgU6IcXq0M
 XCQd6OvW2sKd+4VHS+jR2qNR8Pn3LSNQZ2FzhnlKVE7113zjYsjimyR+HIVAc0oSAGKv
 UK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zK3AITACjHaRnsAyW99zENI777gG4goMLTGrT+lPZOU=;
 b=bUM9a9l5hJEpioUsg/8Egos3a+fEiQ8Hz7i0w3AzTUH7Kdw+z58nsFtsNdzVLACIx8
 LmQu4sWBK8drpXelMwsvS2hpO02t2eppCXzo/WMi9YB6lyV87Di7S8KJGCypzASYRLRz
 zltzaWNubcijNjNm9Pu//v/Q3mFBUp6okqx0Z/YLTPBtqXKuv0bZndJAfJYgdo5I2Uq3
 spUgUtp+52T61KnoEhY/jemV/YOVevFtoDOgTKH9BYFA8HcloV6r8FnAMk50lCHGkyZ7
 qqjuGgX8avTa72VxNuUWz8QHfNT4qJXFQgD3Qxi4sKxZnjpw/5HOvvgB3ToINHMCI+im
 Rccg==
X-Gm-Message-State: AOAM533m1r9SwOjU+0eexfktfiVobXlcUpIvNTDBUO94jpce77yi9qro
 MAMpbVDN3zGKUZNLvTR14LME7gWy1la23JLyIRuu0A==
X-Google-Smtp-Source: ABdhPJyxurLTOnzAFp/n/d1N7vznagGbpqkBzuKqwg+YaC23jlQQsK+fDcNV/YKDAUn8HJgz5xtWeRdGEm7q3up4gkI=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr25194048ejh.85.1613560540297; 
 Wed, 17 Feb 2021 03:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216154010.3691880f.pasic@linux.ibm.com>
 <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
 <5c37f1f1-5538-cd06-55a2-e266cc9a972c@linaro.org>
In-Reply-To: <5c37f1f1-5538-cd06-55a2-e266cc9a972c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Feb 2021 11:15:29 +0000
Message-ID: <CAFEAcA-sgkxazKcR8tbLdj_B3F5bwg2c4TqkNd7gCSCQ5BYQEQ@mail.gmail.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Feb 2021 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 2/16/21 8:15 AM, Thomas Huth wrote:
> With
>
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 1376cdc404..3c5f38be62 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1622,6 +1622,8 @@ static void tcg_out_tlb_read
>      TCGType mask_type;
>      uint64_t compare_mask;
>
> +    tcg_out_mb(s, TCG_MO_ALL);
> +
>      mask_type = (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32
>                   ? TCG_TYPE_I64 : TCG_TYPE_I32);
>
> which is a gigantic hammer, adding a host barrier before every qemu guest
> access, I can no longer provoke a failure (previously visible 1 in 4, now no
> failures in 100).
>
> With that as a data point for success, I'm going to try to use host
> load-acquire / store-release instructions, and then apply TCG_GUEST_DEFAULT_MO
> and see if I can find something that works reasonably.

This isn't aarch64-host-specific, though, is it? It's going to be
the situation for any host with a relaxed memory model. Do we really
want to make all loads and stores lower-performance by adding in
the ldacq/strel (or worse, barriers everywhere on host archs without
ldacq/strel)? I feel like there ought to be an alternate approach
involving using some kind of exclusion to ensure that we don't run
the iothreads in parallel with the vCPU thread if we're using the
non-MTTCG setup where all the vCPUs are on a single thread, and that
that's probably less of a perf hit.

thanks
-- PMM

