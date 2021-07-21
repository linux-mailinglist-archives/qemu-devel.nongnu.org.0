Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB303D136D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:12:06 +0200 (CEST)
Received: from localhost ([::1]:56486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EpJ-0004q6-75
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6Enc-0001tV-2f
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:10:20 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6Ena-0008Uo-MU
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:10:19 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nd37so4067223ejc.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JoUqhKt+5ij+HSWo7x7w9V48Y2nfbxP5/1Gu4LZ5B+M=;
 b=cDo60IbM3lAJNYG8uy0j2D26ZSHtzR96d7Cp3n4spK0hAHrHUdxk+E8l1eSaTnRdZR
 krN065gT2C4PuFauJ7nNeswC3Okxk3+bAk5eQaGEQrvlOlODLi+XsF1mbHFnQnlJkRgH
 M2ZaKJMTUlkm++F5yJv/PSXORhMHOHq3LW5RSR/InWMDUEHilsA+nHa5wtMXk+HGjxlx
 PpkvwxvipEnJrRuUZNtwnXoUQmxQETT56ht4rNjIKs9MMjJULtcFNYXNk9O3IrLvmczs
 b5jjW1GmEPjuGV7jZMN/Q95M7rUjMe0UgUeiBuqC5WTuGIvkJdMQNXADa7DZy+hiV4/t
 dQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JoUqhKt+5ij+HSWo7x7w9V48Y2nfbxP5/1Gu4LZ5B+M=;
 b=aN+QJaj1MLOjEEXtmlVUhwONXrNAYq0Ea9xM5RujaAmF0QntU/05aPjE0CQsq/o7CK
 GZQKaos5NnmaCycgMlixXrJJhPWU8bUNk5md5Uzij1sE7ynENUxRtruMe/u88KG8dMKx
 Hl9kgpynpFpN9DkhJIgcJ4ZorWCfYe2KTJS7/3MuYKc8FdlXnNsi7WS60DUxQtZGgAtT
 qaeVMg/ohqGUmmU0vibZat8fjjpkuAJm3KOeFdp6AJVPUqAqC1AUSN1orXn4B6lhYpdo
 k2h4A2LFAu4SN0xCQRMhLiSHwq0Wsfc8JBXUaoQ4bia9iP6scZz3LaYzuEjqfM5w0W7e
 tVfg==
X-Gm-Message-State: AOAM531V0zB4SNqurbChb9iaazD2DEp4n4ZiiACBT+r+h//fIkS5cEjj
 q48p57UEJ54JO9NhYkbbWNaTzYHdkBBnbF/oUhZr0Q==
X-Google-Smtp-Source: ABdhPJzlQoFWx6cmVilVW0FUfF228WFLFgcopTPMnCFTrmUS8NgBLZ8tlR741IIqnkRIO3Ud77wDDLZr6MVEuE7gL9E=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr40065688ejd.250.1626883815634; 
 Wed, 21 Jul 2021 09:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210721131253.275821-1-stefanha@redhat.com>
In-Reply-To: <20210721131253.275821-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jul 2021 17:09:34 +0100
Message-ID: <CAFEAcA9D=r37jwz2mYVZJbzH0vsf4E2tDoCav4oV4OWiM6i=BA@mail.gmail.com>
Subject: Re: [PULL for-6.1 0/3] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 at 14:13, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 801f3db7564dcce8a37a70833c0abe40ec19f8ce:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/kconfig-20210720' into staging (2021-07-20 19:30:28 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to d7ddd0a1618a75b31dc308bb37365ce1da972154:
>
>   linux-aio: limit the batch size using `aio-max-batch` parameter (2021-07-21 13:47:50 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> Stefano's performance regression fix for commit 2558cb8dd4 ("linux-aio:
> increasing MAX_EVENTS to a larger hardcoded value").
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

