Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA64D2B9B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 10:16:33 +0100 (CET)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRsQn-0001fm-O0
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 04:16:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRsO1-0000uJ-Q6
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:13:37 -0500
Received: from [2607:f8b0:4864:20::112f] (port=33460
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRsNz-0003pj-UY
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:13:37 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2dbd8777564so16137917b3.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 01:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WKpsg2xCGgdebHv0xukRBU9wgJIBuzglAj25nafU8LI=;
 b=N1YDnlVjIOfM5ofl1cBw0GvTVfPON8lIqexgyXFB5xgyD5BnPrQxTEx9mk7ZNaLWJg
 JlKG/RwOcvwjmgzrntIfs92DczD0AQ00QajTySdxpbFZRqXUrUpgsJCVNJKpLdsxI7SX
 UUIcEStuT/+4xLTPd7t/r62feQrF9gYkCXVLwfiawR/+gpVFnUNTf85LKvwG1cOlS3ki
 hz79rT4fPRBg1jed3+73g2ddhUSXorOTh5Lsr9xZzF1PzUR9TtM06hLa5Cor5lnfiWQK
 TzcQrZ8Ntrp3x5mbHgBKPdYZORZVjEyszvAvJCk3o537Gj6WpQlyfuCOrPhhg/devsv2
 MlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WKpsg2xCGgdebHv0xukRBU9wgJIBuzglAj25nafU8LI=;
 b=mHvVP958011+i/PAuajrzr8h1tkVL6Yv7J+l3aRhzATuKcHg+/Wa0x9AozIPtZrqv/
 AxNoVv/KMu7xR2Hom251nnwYkTpomN6bHu3BUW/4ARHIHivq/Fyi3nW1tktzRkrl6btC
 PDWVatof/Iqq0i+2WrZedAn7B5uoRHB8OnN/uXYQYqjKKpsMofTWBk8FjTqnCmPanKpa
 vz030XPMJ9Eki0kUh+u1OzDk5gj/9E2ApUh3h2fJJ1iiCP+JLMIzZMrVY57DE3YWelu9
 0bw1E53+5IcVz29qsCtmdgdyINGvHuJDMI0i6C+OWApsPc23Jqn3wA+DztdLjqBCjR5U
 nsEg==
X-Gm-Message-State: AOAM532BMlhYo51445GCeuCAjERNLfrgeMsavYePEF2czfotMhc76AzD
 W+XUi+AJ0lCB2C6Qk/YHzIPIC43osxrMWLOE4JDR7g==
X-Google-Smtp-Source: ABdhPJwex+mSAOicrTYLLNn/TDkfAM0gwq308LwFMfQtUfB8FpVBIZwhZJTNrK/d0C2DXDVotAmaJlir2SINGIrrZVE=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr15775309ywh.329.1646817214684; Wed, 09
 Mar 2022 01:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20220307224357.682101-1-mst@redhat.com>
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 09:13:23 +0000
Message-ID: <CAFEAcA8LDD_r892R8bN1T0gJxU6ubk_b=KeJPULR--wHoZ8FCg@mail.gmail.com>
Subject: Re: [PULL v4 00/47] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 22:44, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 128e050d41794e61e5849c6c507160da5556ea61:
>
>   hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-07 17:43:14 -0500)
>
> ----------------------------------------------------------------
> virtio,pc,pci: features, cleanups, fixes
>
> vhost-user enabled on non-linux systems
> beginning of nvme sriov support
> bigger tx queue for vdpa
> virtio iommu bypass
> FADT flag to detect legacy keyboards
>
> Fixes, cleanups all over the place
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

