Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139E2A27A1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 11:00:40 +0100 (CET)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZWdj-0006zE-7o
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 05:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZWXL-0005n4-SI
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:54:03 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZWXJ-0008P7-Vo
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:54:03 -0500
Received: by mail-ed1-x533.google.com with SMTP id dg9so13672033edb.12
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 01:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+mFSaNGC3IpJtZ69XWI1Ad6afA43c6xIC8LgQetABNU=;
 b=Xif86ts82k+JVJkj71pfzR1GgrJev8JwHqPkt7CNRttRDNua+sGOZS4mQXieuRzkGo
 8a3YPbKlwFzSjVjyRYmRjqAu4uCiDHmroaaIMmO0OfCwk/fb9ozVQQtoP2gXVgHq2KSA
 fpZXOsFlnhpa+7Kpu3fRpA/WpOjwEcZJFBk683e4+7qNl3kK8GYUVa+3UOvY6noCXWyI
 eUB9GILphPUKi6k1D45VoLumzVjfJnqCnjIakAoSLlC3ju8CL9Mgfnk0xDfDsLvN+mjy
 nX6ZTBoUh33NUMMjWosJfINhLi8S/8KIVRPPY/OlQDB5Xed0OEiThd+bNHfv+cTODh43
 spUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+mFSaNGC3IpJtZ69XWI1Ad6afA43c6xIC8LgQetABNU=;
 b=EPLPpezo8FK2Mh2lHmWBAMbu68NEct/Lyj/sw0OdXjUMI5wOTD/zLRZlv0qMgFeDyd
 /qF72X4IF6Igw+RoWfCj7t0AtIBDdl8JfsZA7Y/unnG+tPsnwfmHp+yst7S+NfIqdn9h
 okpLPwhWiVhz/qfjyBy8E8qY7c8MaOKnGYxuPaXCfXhuzUoylRy9NbEq0l1VLJfayyBP
 grJh8jfLKWTJ0ByOprnPJ2t5mnt9h4XQFeHLKLOgM+67oh/lNLBxhyFT3B3xEPrQr+36
 /TcQAA10THbaQzVKATS/Ooo91t5vLeKhcE28UHsYI3SmoxtMHxAZoGt+9KG5TO4IRVh0
 aSOg==
X-Gm-Message-State: AOAM531ouxRk/GuAVLQMXLbnb8Me7IO+eXf3PC6rYn8lZQIWj/z8LcIG
 oE7YEM1xR4MdMbroLds7m7AeenmwGyXlXcrOjrootQ==
X-Google-Smtp-Source: ABdhPJyMtSJULu8D1lnOau8uNkmL9WszdkzJ2/9fKsRxfHX9bSykDHIc/4US/JeHfR2EETiPPMh9xKlWtw987GPHGTI=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr16230846edb.52.1604310840144; 
 Mon, 02 Nov 2020 01:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20201030203231.107486-1-eblake@redhat.com>
In-Reply-To: <20201030203231.107486-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 09:53:48 +0000
Message-ID: <CAFEAcA8in_GJAYG7N+RAant=DgvJMVgvt_V36EwM-tmmckEKeQ@mail.gmail.com>
Subject: Re: [PULL v2 00/12] NBD patches for 2020-10-27 soft-freeze
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Fri, 30 Oct 2020 at 20:34, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 9a2ea4f4a7230fe224dee91d9adf2ef872c3d226:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-5.2-pull-request' into staging (2020-10-30 15:49:35 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-10-27-v2
>
> for you to fetch changes up to dbc7b01492371e4a54b92d2b6d968f9b863cc794:
>
>   nbd: Add 'qemu-nbd -A' to expose allocation depth (2020-10-30 15:22:00 -0500)
>
> v2: Respin to fix compilation error due to semantic merge conflict
> (only the changed patch is resent)
>
> ----------------------------------------------------------------
> nbd patches for 2020-10-27
>
> - Tweak the new block-export-add QMP command
> - Allow multiple -B options for qemu-nbd
> - Add qemu:allocation-depth metadata context as qemu-nbd -A
> - Improve iotest use of NBD
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

