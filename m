Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53EB4D9A79
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:37:36 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5Ud-00079N-PR
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:37:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU5KU-0002os-5z
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:27:06 -0400
Received: from [2607:f8b0:4864:20::b29] (port=39690
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU5KS-00016f-M0
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:27:05 -0400
Received: by mail-yb1-xb29.google.com with SMTP id t11so4884165ybi.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cWu8xAmbfew/oIaaNAsSZR5yVgdTG+ofUNjzVgtDy5I=;
 b=PHOLhIYFUpZdXkWKOLeqZqcx5rh5yTjfMtwpBYI1f3/zV6KAd6tZ+JBVdUSrn1O16T
 WVjBepe+9aW23DRwHLxckWTD7+FrZ5Ite9aJ01ev8J4LHevOT+H/dCWpl3qcBD0pGdSc
 enC81ctA2aiInVdMZ7WffZujGvSMLbScrzoXBCkj7lDh0z4FDAvMUrBdHz7vFC6MRLg1
 nt2QKpAOQ/fO6KR+nk7tuR9haK+qF/Zx00RA7dlojKra+XkPPvi8vDTDX2l76WILeuS1
 aUyt64dx70JJQJH9TuExtSVPFmEDtOUT6Taorgd7kJ1qHp8SRcToFKNY1qqGJHXtIq7J
 85ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cWu8xAmbfew/oIaaNAsSZR5yVgdTG+ofUNjzVgtDy5I=;
 b=mSX+gqUK0z83mZAq7q3CS/FZsNhzuMxhrTTgk57ry/N/pTWY/XJgijyHIEHwCQQLHT
 k8zvCF4zIrdzJ21tIp8yz616YHsM6xSh5w6N8QE9qf/bhTA1msnrDy26UX9Zvhet9dWv
 JyqQJgXivL/QZeNyaO7tEFJXfutr+mD9/0m3qLFR6JVGDuI/FqS8kd2qhxNKBEjq4BbJ
 67GMP7vqdo905sKp3ifjeFl9KZXpVIb6oEvZkBqEMc4//7cXViPjcV4bvKvOJCVOgIkZ
 C19ct3DMNEtOw0yGMb5RpSZQBCKhkrNk9BJO601k8cf1aask7gkgfawkf87o7BMSiS8u
 +7AQ==
X-Gm-Message-State: AOAM533ny2LHyVrJGlb1YDNCWOQjSCO/G6bpeALYX9d6/Z5avvONRmek
 VkykChn/vcrvqY68bEfOgQvviiaMQ8dkBxedlAQ9VQ==
X-Google-Smtp-Source: ABdhPJwPkZ+9sLOGb5jRqP8H4FXDRIRMwvIq6xpE3vZQg83qnueDso8foFoRpS+MKSVuiKfHt3/1ENVF4d4Mcgz9teg=
X-Received: by 2002:a25:b11c:0:b0:62c:16d9:c028 with SMTP id
 g28-20020a25b11c000000b0062c16d9c028mr22825735ybj.288.1647343623716; Tue, 15
 Mar 2022 04:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220315061420.31910-1-jasowang@redhat.com>
In-Reply-To: <20220315061420.31910-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 11:26:52 +0000
Message-ID: <CAFEAcA9mnoMhfXXf6yrnGcx9UDijEMjW-04RNH+zs-vtoBOv3A@mail.gmail.com>
Subject: Re: [PULL V3 00/15] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Tue, 15 Mar 2022 at 06:14, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed:
>
>   Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (2022-03-14 14:39:33 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 12a195fa343aae2ead1301ce04727bd0ae25eb15:
>
>   vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-15 13:57:44 +0800)
>
> ----------------------------------------------------------------
>
> Changes since V2:
> - fix 32bit build errros
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

