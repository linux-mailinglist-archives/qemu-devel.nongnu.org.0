Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3F356609
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 10:05:53 +0200 (CEST)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU3CC-0006Lj-W5
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 04:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU3AV-0005pd-K0
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:04:08 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU3AN-0005jh-H5
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:04:07 -0400
Received: by mail-ej1-x630.google.com with SMTP id r12so26135727ejr.5
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 01:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1g+ABtK5yFN7G2RyTfOuomOrLvYsPyF7UpJp+L1JJ4A=;
 b=Whl+MoT1QskzF6qzZV92nyIftDwLiKGaB+wtoORfByJX9reaxjl6rKGCloUUD6G+CU
 uWgFrn2HmExTbC1Oo5gC3AeLF3DIN4TsdQgN8qtaXDK5JP9e171wy650XrPq60eh05Lf
 vK1+oiGs7270L2Gq3Pl1blBC4Qw+s/IeSYxoypISG0dx7H4QPG0CcpM8QfIMa30vRjfb
 JQz5zvLSg3EhCUbk1ghtVzxpmxr9Re/xAfw4GeZlUeK+R8yXwAgXR7cwuZa5BkuZ/jdv
 Dy9zreHgpbnA65nefwAAw8pQWEvDdkRSqMaf6ZpKVohNIZFvHY03H2h9rG7XNbOv2kFT
 h51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1g+ABtK5yFN7G2RyTfOuomOrLvYsPyF7UpJp+L1JJ4A=;
 b=qdo7BnesxPOtDM8YJPb4DQonxMsYtzKBhkQjmr5PfnoEcsF52ZtmklqvK1rW3oSJKU
 R2yaVtOLtZq2UKNWa40iAJBFlug0XcZMSVFRQBfIMne/rhW53bNhed75HTC/RVuCWoU9
 5eSTQ4MfMFAT036Eb5VAvCRmkq0itITNcERG4OT63cy/S4+bisRPpa6QEEk+gKZGcA7l
 0HbsmYb+v+tjRBOxBGah0eWl8qpREhMZtNtvKAvUvnMSSSXbZ/TtVBNoKa0hszH+Gmim
 xQL+8WGvmeUapIWz4+BPXhULhDwarPj1MNrDAFKQkXlk+zAZP0Gg2l1Hpy/Nb2w6UV7e
 vHWA==
X-Gm-Message-State: AOAM531n4zEUPe3NbiVTm0D5apJxPQXyhmisPlJi1jW9YVJxQth8RsII
 BcWv7TMe9OgFfi+UTvvNEtaLdMDqReQ7RJAP2CfdWA==
X-Google-Smtp-Source: ABdhPJyRSkbmKFFhgwliC7G8FQYe/ihad32lr9yEwr0YLuL1DJ6rA/f54p9tUXLywgKHVoCQSzmt5PBmTdTvMEFvjso=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr2290056ejg.482.1617782636929; 
 Wed, 07 Apr 2021 01:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210407054635.189440-1-its@irrelevant.dk>
In-Reply-To: <20210407054635.189440-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 08:03:17 +0000
Message-ID: <CAFEAcA9HsqCJOUsL9HwNHqr5MEkRfCw4i6fc1T2hkN7t4QgpdQ@mail.gmail.com>
Subject: Re: [PULL for-6.0 v2 00/10] emulated nvme fixes for -rc3
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 06:51, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> My apologies that these didn't make it for -rc2!
>
> I botched v1, so please pull this v2 instead.
>
>
> The following changes since commit d0d3dd401b70168a353450e031727affee828527:
>
>   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-2021-04-07-pull-request
>
> for you to fetch changes up to 5dd79300df47f07d0e9d6a7bda43b23ff26001dc:
>
>   hw/block/nvme: fix out-of-bounds read in nvme_subsys_ctrl (2021-04-07 07:27:09 +0200)
>
> ----------------------------------------------------------------
> emulated nvme fixes for -rc3
>
> v2:
>   - added missing patches
>
> ----------------------------------------------------------------

Hi; this semes to generate a bunch of new warnings during 'make check'
(not sure exactly which test is producing these, due to the usual
interleaving when using -j8):

qemu-system-i386: -device nvme,addr=04.0,drive=drv0,serial=foo:
warning: drive property is deprecated; please use an nvme-ns device
instead
qemu-system-i386: -device
nvme,addr=04.0,drive=drv0,serial=foo,cmb_size_mb=2: warning: drive
property is deprecated; please use an nvme-ns device instead
qemu-system-ppc64: -device nvme,addr=04.0,drive=drv0,serial=foo:
warning: drive property is deprecated; please use an nvme-ns device
instead
qemu-system-ppc64: -device
nvme,addr=04.0,drive=drv0,serial=foo,cmb_size_mb=2: warning: drive
property is deprecated; please use an nvme-ns device instead
qemu-system-x86_64: -device nvme,addr=04.0,drive=drv0,serial=foo:
warning: drive property is deprecated; please use an nvme-ns device
instead
qemu-system-x86_64: -device
nvme,addr=04.0,drive=drv0,serial=foo,cmb_size_mb=2: warning: drive
property is deprecated; please use an nvme-ns device instead

thanks
-- PMM

