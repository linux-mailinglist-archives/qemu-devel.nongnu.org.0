Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E023E408B5D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:52:49 +0200 (CEST)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlS4-0001tt-UO
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPl9B-0008D7-Li
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:33:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPl98-0004eF-OW
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:33:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso703540wmd.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6b2MOGpMv7/CdjOUGd+jAyuL9taXwTTGle66SrSDFuM=;
 b=LLsqSVLJ4WhXxy/WSPNygJ04rRkiCJBnjt0gRhwnILmy8lgma/pWUU45JZlCkRRqWR
 ou1LPvGDtvopMTycTbmR2KypvPNDVU4sJuVx5Dxk7QuFhl4BQQqWJo6EZFuakgaKxI49
 sOKj0qed66TJWVXSUByjn+rc8tageWjA8CNXeKgNnBD4J1z1IzY++cDe4QCeanE5Biy6
 LDHIgjc+ayvETL4a263UfZeS7ZvFpUjgxXgGZIV8ZPt9XU1IOsPG7EpRJ47pySn42WTF
 oRxCAEHdycA4f9pcmhb30oOChBE7teVuyiCD8gKFnXYxgbe1x003EvenHByq7fnC9CN2
 +NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6b2MOGpMv7/CdjOUGd+jAyuL9taXwTTGle66SrSDFuM=;
 b=xbd/KmFFWuNE3H29JWXGE35+9j95Ixj8kosp+w4D9xc3TeSOwRYmsbSbeQFpKpV9rz
 +aXZYv3QiNoGfIRBuiFPr0AcHmSu+P4z7Tgf4vUm2mEW6teNXWYgSrF9h5Va9bEgT2en
 aubxLEP1XS7YK3PyY9nXKSwT5PSsEqLEfJ+x6zp7a0PWCWVhxhK6evc3QO67JM6I3Zw0
 3FUWytVe3SJwo84ql/m1iRrUmvzjzffFAvWpvf+D8/iswm+6xEZJ5GAr7HGaVITQIjDK
 Yg+6u5KZtIJO+jS3138XucAAUBC93RoztWyZNcg3zxrn6BYy2i6YABe7xXL5xrZeRwzv
 PQqQ==
X-Gm-Message-State: AOAM531iTwJbXtjHj0k603kZg1XiJLFfzHUczySOI5Ty8MV1uiVCx2d2
 EJwsXYvefcg/oB5XF7X+2CIjUXnP2TJZFKo/TzJN2ZZT+mg=
X-Google-Smtp-Source: ABdhPJyqjLLTt4lUavyXVwcurJJHVQXn21cY65Dpv5TyrXwrILGrgFyZCTxT1ydDnVG/ul1V4QoX5A41Z9Nt7pKmVjE=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr11207686wmh.126.1631536393261; 
 Mon, 13 Sep 2021 05:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210913095038.3040776-1-armbru@redhat.com>
In-Reply-To: <20210913095038.3040776-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 13:32:22 +0100
Message-ID: <CAFEAcA_iTN6=DC8XMANZ4VC4pJ5Fw6v4AvYZnTKxh+80zTqHTw@mail.gmail.com>
Subject: Re: [PULL 0/5] QAPI patches patches for 2021-09-13
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

On Mon, 13 Sept 2021 at 10:50, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit abf7aee72ea66944a62962603e4c2381f5e473e7:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/s390x-pull-request-2021-09-07' into staging (2021-09-07 17:46:13 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-09-13
>
> for you to fetch changes up to 62f27589f8549d6cf1f7fe21ed55ce6f2f705450:
>
>   qapi: Fix bogus error for 'if': { 'not': '' } (2021-09-08 15:30:30 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-09-13
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

