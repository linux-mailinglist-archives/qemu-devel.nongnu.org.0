Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F93AE033
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 22:21:31 +0200 (CEST)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv3wg-0004Uw-Mh
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 16:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lv3vR-0003i1-Hg
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 16:20:14 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:47043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lv3vO-00035O-Vq
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 16:20:13 -0400
Received: by mail-ej1-x629.google.com with SMTP id he7so25094156ejc.13
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 13:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yn+DCPGD6prQTWAwCJMwFvQZxXLzFP8B/Gge8g1TRR0=;
 b=NfCYFG6t3jT0sF7tRMjPm3pJh7ddNPEg+2EiXOtHLyyKXU7rCPMp57E2fNep2+8jRE
 8h8TUpgneR41ROV4LP8yo4P0OyRPcQW+STi7RuBMEjftERUPxQUtizK5EBIxQnaXkqpl
 rckEzqlRt1qVp3n2zz4Ce3nOtj+mMpWBe9aUxE8bVABiPZGGJLuEbbi4ukuTodL9dKQg
 jX2a65/fVvYmVq7uGGnHgYKa7ThEeyltU71dnKg/5jmMgin2hxL6cg6XB8zA4kGTb5pj
 yOrCAP77WZQEhGS/wnLqIMrClLzFm1YLEz5Yx1Ife9iPCXYeU9TNWGfLf/QebabaZaeu
 UEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yn+DCPGD6prQTWAwCJMwFvQZxXLzFP8B/Gge8g1TRR0=;
 b=O9R8R3JedydlNn53eUkMKPQXYFOdTPeNhpBS9Cm3jCLm1f3KVyY1jTZ/xe1cZEfjzJ
 f7lDE/Zas/MgR4TjZNLUIFvFFk/ZODCGfzNp9RCjSJaLmAjNOXN2TNmvtILV6WkSvQG0
 Tc0u3wQ+C024puNmfQiBFnjkx3i0XeMYNTNQF5I97F7TlXY4zxmH7Xv1Xl81qDo0R19v
 WrL3IvrUjyHJTd/2dwVDDX/P2ZanywqUdcuyF+2PG0Jo3csARWNe/kBV1XVsMUsI0iUB
 KEIZQgKc7LW2Nf8WFylmg6kGNZRpyUvlPnjMj7a0uGcsHKJy5I1k8SG9Y7KQYHNMDmKo
 DIww==
X-Gm-Message-State: AOAM532hpFow8Ns8f7f557G2AHNmJpeTY0wACE4euz/g+exDvwvXXS0i
 Mu4uOmgJAn61zgg0FC6PQGbW+UyK4CvE2bHv948AqA==
X-Google-Smtp-Source: ABdhPJzDFMbgi56ZOPARHXjUlAUn/3530pK/kZ7gEVrQPo2nsCUcCknbouZtVx76m8hBBVHX7gonekBsdJ5I1F67soY=
X-Received: by 2002:a17:906:a38d:: with SMTP id
 k13mr21688082ejz.250.1624220409578; 
 Sun, 20 Jun 2021 13:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <162403041204.1793226.16018359908572247606.stgit@omen>
In-Reply-To: <162403041204.1793226.16018359908572247606.stgit@omen>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Jun 2021 21:19:33 +0100
Message-ID: <CAFEAcA_bE3TJwHvVP8MTCWP87Ss_WejCQ-Bh26eh5FfvmABNww@mail.gmail.com>
Subject: Re: [PULL 0/3] VFIO update 2021-06-18
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Qixin Gan <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 16:36, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20210618.0
>
> for you to fetch changes up to d742d064c1f541ac8ad6541e248a97f2dc502721:
>
>   vfio/migration: Correct device state from vmstate change for savevm case (2021-06-18 09:10:35 -0600)
>
> ----------------------------------------------------------------
> VFIO update 2021-06-18
>
>  * VFIO migration documentation (Tarun Gupta)
>
>  * Fix SaveVMHandler de-registration (Kunkun Jiang)
>
>  * Fix vmstate change transition (Kirti Wankhede)
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

