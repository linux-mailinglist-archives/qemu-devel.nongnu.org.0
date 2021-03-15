Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D122933C8FC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:03:31 +0100 (CET)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvJC-0005OK-TY
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLvHU-0004En-U9
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:01:44 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLvHS-0004X8-6S
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:01:44 -0400
Received: by mail-ej1-x62f.google.com with SMTP id jt13so68918152ejb.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XyfXu0ei0n6vlDqlRKdSIVeeeNQG+8yEzNJTlBlsUZM=;
 b=icnJi51rVzEnRk5MmRdH6p0+IDnQwn9qMdAGRXGm2waXnYZGk82zVkYjVlBhbuabQt
 wVUzXqeX+lJYfeDzL6eX9RbHpfHkyDSkavLCXBzBpogNk2LQnAffVp9xZctTyKEarr4a
 wvxD1ltOhdlHM/CzEA3D5XmSmWNirirwq5VRJOPc8gJEvgPQs20tqkaJRjtQc98CkRmD
 LjD4qFUsdIux4AeUYqGkiNGF2TdhYpbXPqYs/c8ekjpRiLRNUETnrZshrZCIgxawH/Kd
 8D+fpn9jBYiPKsdwluYJViUss6QXw+slNEH9ub7HEcTZjT9UD+GEDL8/Ig+/+YxikY+O
 Y/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XyfXu0ei0n6vlDqlRKdSIVeeeNQG+8yEzNJTlBlsUZM=;
 b=rMhtjrdKAHyuaNMez5nin/u1VonN9dIe9Dsjc0pd9liLyHBIId+Oiy5bICIyKmMfhb
 CyE0rTZPb6ySCy4+6kEjgrSLCYyppTYTqKM3QDMBN5ZdaTRi01Tj0Y/JCQaYFYx208VB
 Z/ES05qI2I+neZlOgFUvl5LNRZ2iEVFbTR7mNy1+3aMSFsPl8Okhf7pWDW9wIONv3vPM
 r+fp4aHQRBrbgPFbFaHuMe+bqQs+dCw6ttPhOlzHp010Ma1GViRS8I20K4ZI7jdDvDeB
 CmcWlI/BBIhjTCIgr6hzd6yeQcKCkOEaaG4TJloYJhaROmIsuRwpY0oFH0CEl2V5AcAg
 yqgg==
X-Gm-Message-State: AOAM532Ftg6H8vDSw8iMX0ZXl66itcoDs0qkMKbogsLgPXK+NBswTLP2
 l0JgLDpviC6ovqxVWlsAo8b3Yhs4pQNcOUKKOH8NDw==
X-Google-Smtp-Source: ABdhPJyAAt3gCmmUdh3l4R5jxg1UsZ1WkkhxjJTQhy8wj4d47bJZCPRQfBbAr4vOrhM4YCVYAKwZ5QeC0kn9I4AXu98=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr15929885ejc.407.1615845699877; 
 Mon, 15 Mar 2021 15:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210315095110.110003-1-stefanha@redhat.com>
In-Reply-To: <20210315095110.110003-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 22:01:18 +0000
Message-ID: <CAFEAcA_Caprz=r5MkMt0668jJ6tEZWU4vvEcc29VUhbuABEqHQ@mail.gmail.com>
Subject: Re: [PULL 0/1] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 09:51, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-=
> request' into staging (2021-03-14 17:47:49 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to fb0b154c801e3447e505de420195fb7038695941:
>
>   virtio-blk: Respect discard granularity (2021-03-15 09:48:53 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

