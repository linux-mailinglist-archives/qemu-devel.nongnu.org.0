Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0E30A6BD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:44:34 +0100 (CET)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XdB-0000MZ-ID
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6Xbi-0008GH-Dk
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:43:03 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6Xbf-0005zH-5c
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:43:02 -0500
Received: by mail-ej1-x629.google.com with SMTP id r12so23821534ejb.9
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfriAA10hqqqVLLiWe+2eo7Jr7rPYnVPKjaEz+8XUqQ=;
 b=hJ4zlyUXHYVkTd3PaDEr4ISlHfpyKn2XIyhPmF5BmzxpEozjlcYFmJc1QpQrm8J0ZA
 +0nAvBxdQDQrlJakT1C7FsEJLe0MJcepx2s9vmsrWRlLd/8ezCiZ+/FW6uF7/S5AS2my
 eV+d8iVUxT9/Mo9NLqG8IWh8STByKX6n3Y2EmQ9wnzDjkQrNaDKnagZ3S46178z3pBsL
 iQNqlHw8bvi8lmVFjcvY6xaj2p9e0AYPSZAOAY4JxR/cXJ6CTEGlkCbPIxNkVs6ozdK8
 0bCfK6LzQ8Ai3xaAiBfVqCZikyAAtRfrvhBg/t0/5ur7rExh/NdruGMw0R87slk9bh7n
 e2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfriAA10hqqqVLLiWe+2eo7Jr7rPYnVPKjaEz+8XUqQ=;
 b=adcp6WnNgQnaVr6O7fK8pRGMGBCNF2hdjsyBPA+fwzXfhc+4D9lqRvXGE6RkpjzHA1
 TvbGbs/wbn0Tyi8Shw8rqCAfDaxAVIyzygIYfi6Sx0Obja2P3G+uWBmRFvW/lhm1+t1g
 tWAOVCgoOr6h6H9STjFVW5+aBSQcEAujPV90xJIimhRSj5Ag7L9l/hWE76lnbvY4LJJA
 ZkYuhCHXXERp3a3nnjyGy8I6M1gDxz3u2ktYD8iX0ZKLnZnF7zQemJUhftmedVjrgRK2
 Xvf8SoEaTqw1PiyI8VKS8sEJv3UuCe9aiNuwzaQ4r3e4aF0u8EMYl9JMW/lp3VUZhSK6
 XHQw==
X-Gm-Message-State: AOAM530lsR1jXqm9X1CmY4v0wy48pXslVi4ZjB2aEEAW1kikFeXbqNTl
 8qurZxH/m0ESIcMPMDxKUwKt/Jk45VkEIvN1Icr93Q==
X-Google-Smtp-Source: ABdhPJzuDG7Q2cHpFmEwDVmgomcUYuLnQxOhbtqNSLVTh4SMOkBYqMXFcgZDhuZPPgc4sKzzhcKpUn5FlpNVsKFO+rA=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr17484362ejt.56.1612179776123; 
 Mon, 01 Feb 2021 03:42:56 -0800 (PST)
MIME-Version: 1.0
References: <3475760.T70ipHyFzN@silver>
In-Reply-To: <3475760.T70ipHyFzN@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 11:42:44 +0000
Message-ID: <CAFEAcA8M29hEVu0XQAk0+fhDsmkDPu7foKAKP75ptEz_KFD+-Q@mail.gmail.com>
Subject: Re: 9pfs developers docs
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jan 2021 at 18:25, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
> I started setting up some developer documentation for 9pfs:
>
>         https://wiki.qemu.org/Documentation/9p
>
> Still quite a bunch that should be added (e.g. there should be a section about
> threads and coroutines), but at least it's a start ...

Thanks for working on this; our developer docs of QEMU internals
are very patchy and improvements and additions to them are very welcome.

The wiki's a good place for initial work on the docs, since it
allows quick iteration and collaboration. When you think the docs
are in a more final state you might consider moving them into
docs/devel/ as an rst file, so they become part of the developer
manual.

thanks
-- PMM

