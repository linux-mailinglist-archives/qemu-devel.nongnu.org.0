Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E876A21D0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVd9B-0005oe-Ca; Fri, 24 Feb 2023 13:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVd98-0005oG-SO
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:50:18 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVd97-0006o0-8F
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:50:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id cb13so4946pfb.5
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SaGbIMcRjuJYqNdhNSqqCs6S4RhI2pSzuhENIrvauUg=;
 b=SVXSEH0eSMorCvt8yT4WfvVD57m3QdSlNhnoYLhHC94BNNaq3miPZcL/kbfpv7NfJt
 3zyYHGuLOfOQfVNdroQpceEcbsUofrIh/SavqQYo0M62myA1rFN0P3cjpNGI1SiybRq9
 4Di8ONMiB7L1sdWR4anbXrRlxCScmfi/LXp9NsUD50m+eQTCQgXSiDLpriYuu36sIHvm
 e3UncBc7Avn6h+uMA1HLU7ZfJiDE1u8IcgHoHSNZlE6TunohudLutmrnSxpH3YJ3Le3o
 EaD9U53WLtSUnrGCE7CLZd0MUlG+t3UtmeYfHiKgPkaBn8sfF0g7aWsBp+yG81lI3d6P
 YXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SaGbIMcRjuJYqNdhNSqqCs6S4RhI2pSzuhENIrvauUg=;
 b=aXwV4ZyaYfCeNtoNDg0yjvsLjAhNrJrNogsxfJg6aeLRqmFhKVdsGybryQb/PwVni7
 An1Fo71oxh9DFiugsMKPVtEDtk44woe1N5E84qqu7b1bFv+dIS+6wZk7QCQ2bZRLBVUO
 v5gTV/Madb4VSJf05Kr2oNl1BUwRqmc+M1qEPZE7r/eKiFKHg22HXYemseeTuh8m6E/g
 x8RvKORoXyunafvErH34bBlg8QnZQIlT5wZdD2GkK17ujnM+GR9s5UUqYg6qdFradm0D
 1O/9DN9+1JCQlc0ULKQtoSxuwHJHMFD9an4YlqYveK5kZoGmWw31Dm4rJ0IPJW3/GWKV
 CUjg==
X-Gm-Message-State: AO0yUKWCLdl1GYDv8OE19bPz/81GCHYDHaGGA1kcaFobZ4N7Pz+mrjEF
 KSTxJE87yclCGdI9XrRkJmj2etOdUIi2sXBPNBuwVw==
X-Google-Smtp-Source: AK7set/useS/Mk57flPL5E7sUMbnPyYS3Dq9Ei7CxBrE6RTo/ZFemOYqn+4NRZ++hQW4bUPMlski4/UV3BYuYOyI2uY=
X-Received: by 2002:a63:6e08:0:b0:502:fd71:d58c with SMTP id
 j8-20020a636e08000000b00502fd71d58cmr1848489pgc.9.1677264614638; Fri, 24 Feb
 2023 10:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20230223185146.306454-1-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 18:50:03 +0000
Message-ID: <CAFEAcA8uYhS=MoOuGpYo90uF7mCa1JH6fapy+qvW8iCsNMmBfA@mail.gmail.com>
Subject: Re: [PULL 00/29] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Feb 2023 at 18:51, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 0f385a2420d2c3f8ae7ed65fbe2712027664059e:
>
>   block/rbd: Add support for layered encryption (2023-02-23 19:49:35 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Lock the graph, part 2 (BlockDriver callbacks)
> - virtio-scsi: fix SCSIDevice hot unplug with IOThread
> - rbd: Add support for layered encryption
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

