Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB5B35574D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:07:08 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnII-00039t-Ol
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTnFr-0001hI-Iu
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:04:36 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTnFn-00077h-E9
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:04:35 -0400
Received: by mail-ej1-x62d.google.com with SMTP id e14so22456043ejz.11
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pn+rPcmQfW0n844Vlg42k0UMYdToOApPE0Zte+7a2lI=;
 b=R1BNtq52h2fuy1YTQOBSVn+iyX9mRBnP0whVqF/srLJm6B2v8fjVjHXMQgbhKAYzZU
 MHPShhwTydxUwqo+o+lQ5MYmm4G8W4iWFHKgJSDDQJ75V3XP0fTuPHiSej3LMtNKbPMJ
 KxtOw6NpN/ePUdmpwRS/OkqXUjRWZjdX3GAMo7ngDYUM8cPAEtwJ1ntALqDh94vz3d1t
 sSelhqKEE1sh2E6hCPJdpURaFxaTMxk/i4C9MLblssOQorqvZotAUi7iNHtNpeqa8DBT
 wyni0YUptUgU2c66jwLS4CUc9KFdup2rWCicYe2gwWPFtukWyrKTa05OuinIRWcvIcer
 VA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pn+rPcmQfW0n844Vlg42k0UMYdToOApPE0Zte+7a2lI=;
 b=H2wXhQ9S1e6LGXVN/2NXHJUiUBnZPEbvdaXYfs9pBBOr9ZiJuelI+1XmxlWkzN1ReO
 SlSNATGA3T9N+LLPykctRJw1MgMPAWlzIjt6jN5OeRAivfZtWy1U7fR8dXid829Qh9ve
 j4X9Weh0gtPDU8eU6upDfrPcC4PUQBkukVgIVhPJA3d2qJXf90RI408eJI13wTmFhu0D
 cd1vTGVzTnovsWsWZtDKV+piwGFhUUs4kB9qLtASx6aaE71HgDCPas5QFdNd9kFcpL0w
 CCovY0a8ioiD36qrX4EnIRzApW8bcCOU5E0J1TK3nOCRlndnFd5DXzYyQ89C8dTjLOyf
 MSuw==
X-Gm-Message-State: AOAM5305SPqXLvOpsBXhso5AkJNpKWChIuPb1dr1ZC0zz/kLTvLhbgd5
 Qhst2+0CQ8QaXzlkXtbHi9hUQX0Xad6f3crJibAJyA==
X-Google-Smtp-Source: ABdhPJwZ2QkwXnXZxwTc5jc/208aLPrMHtQWF5C7QYQW1dj2zbLQ455FpJemjdyxwskC6rZzlAkwtuGm2HdPQTElzCM=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr35026220ejg.482.1617721469814; 
 Tue, 06 Apr 2021 08:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210406111359.302193-1-mst@redhat.com>
In-Reply-To: <20210406111359.302193-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 15:03:51 +0000
Message-ID: <CAFEAcA8na1=bQoec90aJC03HDKsf3qGbc7FJqocGeY+E84x8rg@mail.gmail.com>
Subject: Re: [PULL 0/2] pc,virtio: last minute bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 12:14, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 11577d85b1a6939380bd16ed9a861653194de044:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-04-02 11:53:19 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to d83f46d189a26fa32434139954d264326f199a45:
>
>   virtio-pci: compat page aligned ATS (2021-04-06 07:11:36 -0400)
>
> ----------------------------------------------------------------
> pc,virtio: last minute bugfixes
>
> Two last minute bugfixes. They are both designed to prevent
> compatibility headaches down the road.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

