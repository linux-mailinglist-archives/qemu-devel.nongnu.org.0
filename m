Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9630D7BC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:40:00 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FZo-0006Ma-1W
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7FYu-0005lG-Gr
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:39:04 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7FYs-0004tM-A3
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:39:04 -0500
Received: by mail-ej1-x62c.google.com with SMTP id jj19so7158894ejc.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 02:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wi8aKt0V7pdEcjvlO9QHe7lGYNQbKLWBMyA8ozU72r8=;
 b=kUIZCsDFb06c2eI3avKBG9a2FFtQ4mPzUS2ow3CCXhEA4UoIy7zpLRVa7ymPs6WE2q
 hcvex70uw/JGiZITSKSJAGc/apUg0XGTpOE6kEUK71zQGRSnv8lckHSdIO+AeZwIxeMH
 JOtm4GC4d4EdZ5B+Mba4HPr45DOPk0xSJjtYd1cDauFrXHk32C1G9scrWmorNeedQ/2B
 0bAdA8Zxst5yzOGptQUMgcjBCYCc7Pqu4Rhdh3N9qJOkbLggtHEmy64HB2pxQBVWumCJ
 mUzAnUD7xRPTNC9QeE00BFaeo4FgJEyIABp6bTXEQQ2CBPwXBpQDCkCnUVRkapplwBPC
 R28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wi8aKt0V7pdEcjvlO9QHe7lGYNQbKLWBMyA8ozU72r8=;
 b=gQt4Aq3+y64Fe2po/bjsxkwU6K7wzas3PbqxOWYy8n8X4Mkk3QEqFbPd5OcYhJLskV
 j0CmyCgeXQvf3L/WwBlIjuaKz6Iw6fqBBXCkm06rzGEA9QuhTxnto4v0+WsSmwR1mV7E
 9HRkGIiYr95ArvEx8GzjTwWyx5NEOUqQX4juKjo0wjmn28bQrf/unZEii36F184R8J7M
 GbMEdbZoPOc7qF7zI5r+hqs2bw7e1DYpbnuSqZqzP142HKOQWpfC1iw8UcmVyIJqZxov
 OUw1usW83+ibYHI4fSFSIl9OQvDb0A/8/K8XJWlLjmxDfY6c1VPfo18SFEDEqZ18qT3D
 NCdw==
X-Gm-Message-State: AOAM5308VJ/jGw7zn5G+kbJmo9aQz29pmVkscs1wTdCfpmjO8axxiHL/
 F+4wPZebKpv64mau4zCvfnnFbbAFzvbuz72B3btqMw==
X-Google-Smtp-Source: ABdhPJy0xzwkW7nF1BpidsjaoLq/SSXMdTRtEiFboeC8bZLHcSsID+oujOo6beGuAD5RdPnxAUkwb+kuFhghqJM4tRc=
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr443883ejd.4.1612348740502; 
 Wed, 03 Feb 2021 02:39:00 -0800 (PST)
MIME-Version: 1.0
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
In-Reply-To: <20210203102758.GC2950@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 10:38:49 +0000
Message-ID: <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.com> w=
rote:
>
> * Philippe Mathieu-Daud=C3=A9 (philmd@redhat.com) wrote:
> > Cc'ing migration team and qemu-arm@ list.
>
> I'll have to leave the detail of that to the ARM peole; but from a
> migration point of view I think we do want the 64 bit ARM migrations to
> be stable now.  Please tie incompatible changes to machine types.

That is the intention, but because there's no upstream testing
of migration compat, we never notice if we get it wrong.
What is x86 doing to keep cross-version migration working ?

thanks
-- PMM

