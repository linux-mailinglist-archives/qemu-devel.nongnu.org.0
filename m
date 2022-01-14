Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348A48EAB9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:30:32 +0100 (CET)
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Mf0-0004Yu-RP
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:30:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MXK-00070k-CG
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:22:34 -0500
Received: from [2a00:1450:4864:20::432] (port=44831
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MXI-0002jt-OT
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:22:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id k18so15544505wrg.11
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpCJcdfrLKqNtlqlNpQkl2GOld+EZGvTCm28pDy2AHo=;
 b=g/7lZB2IJBRSh7MsX1G9/5wdZ8tEnTPBO+AsAoTH8eP+9uJqAlJJDy+UNqDTv0cPMP
 mGd/R/U3eSW7+H4Dpd5UJE0A9lzhqRPWxcO7KqTtPGSHq9QXUpsbru5HBddHGaGEbMz9
 UHw5kwvdzmhhiVzUdKoFXbHYjZxQtD2eVt/AiGTr3igF+7OfLlYiuqFTwpvr2QJfsu9M
 B3w1H2kK/VAqijdD86AanlYQBbgVt8qXf7H4QoV2eVQcue2t70ek2Np3bzJAr3jI1f9U
 ZPPeJh7/k/SWRU3vD4q9Q3rBQMLUMAKnTeidZgnkOEbHcjqIjMIHQOOhTqp4fJ7xQvTr
 Yayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpCJcdfrLKqNtlqlNpQkl2GOld+EZGvTCm28pDy2AHo=;
 b=8KPFvFn5T6e5MRDMj/CtVWSr3dQWZ2vd6nE0WsO0JPwZEmpkJpFtLTsFAF2EncB0R3
 oyD/IXvRgwnv70fwAXdEWMLIoBUhwMYwibDzMrBSQbNCP51l5GL50I/z6Bf5/moOR0rD
 nzoGU8UhGfndM1EbQPJb+ktj6gEu+eEAJPDfxjR/14IamUJam0Q7eBjc9ap/4fxYLjbI
 kfdYrzlgiYkEtG5PTdJXfvNtlpdPhOix/mD7XeJ8BWguzUhYgqGtRfScxe1PTr/zeADH
 UFAZuirPFtDDBuwAx9GJVTFpVQuTGdg4izzsY7o0r6WzGIMNIJoSO9MQDba6pZobDSyT
 Tt+Q==
X-Gm-Message-State: AOAM532m3T29RT8kFSL+q3vDIYqdWqs/ULtPNV/p9/BHZWFeyg15OQCp
 QqISeWrlOVwOaJp/8v5ej3fChnpAZYR2xp/MzXOUBQ==
X-Google-Smtp-Source: ABdhPJxc8CSCWZXb7472Y8HujlrTP9t/PGLMn7X+NSPFgS/mqv/LOYieP4ZeGzYqbG7VrcnjaeB/NYhlUxlzXCVLTEQ=
X-Received: by 2002:adf:e907:: with SMTP id f7mr8267985wrm.319.1642166494516; 
 Fri, 14 Jan 2022 05:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20220112171402.112183-1-stefanha@redhat.com>
In-Reply-To: <20220112171402.112183-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:21:23 +0000
Message-ID: <CAFEAcA9JiMc7O1HQAzT_G-gsr03i5bHzzvhTVo84SVT2aHdD9A@mail.gmail.com>
Subject: Re: [PULL 0/6] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Garzarella <sgarzare@redhat.com>,
 Peter Lieven <pl@kamp.de>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 17:14, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 91f5f7a5df1fda8c34677a7c49ee8a4bb5b56a36:
>
>   Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging (2022-01-12 11:51:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to db608fb78444c58896db69495729e4458eeaace1:
>
>   virtio: unify dataplane and non-dataplane ->handle_output() (2022-01-12 17:09:39 +0000)
>
> ----------------------------------------------------------------
> Pull request
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

