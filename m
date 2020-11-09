Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C812AC087
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 17:10:58 +0100 (CET)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc9kv-00058f-J2
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 11:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc9i4-0003qD-Jk
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:08:00 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc9i1-0002qB-Bu
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:08:00 -0500
Received: by mail-ej1-x62c.google.com with SMTP id i19so13026175ejx.9
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 08:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bwDAVQ5S8djItA/MFrTZKLl4BHskuqbf2B1rZ6RX0jE=;
 b=fQoUNAzgs+BTlF5BV9PMAjTgxZ1BrNp3BBQkgOf1kaU27pfwxJ6Lfly7FAaV0VdS70
 GuEv74MKSWEA3AcyULfjCcqvhWqXviHvCChRowEuYgkASM9iKK0MWm+yNfvaanzQ544S
 mt6j1DkaKUWHp7RfNMer2FEbqRVL+0r8NI3/J6GY7XA9LUdcKzioWpEeQKQ3KFFdVpk5
 s8ruJf9h9+LNWEpYSwpA/d8a3tZiAxO/UuBtWuzQ3RSvEUQQYudb6VOeQy9NPb+ySEj1
 dQ4T0ohrd/hdTL4u6rdn1DvHqA/KZmNqpG113zxSY6SZ3fKnoXoxoh+eb0M8lIYsc0iS
 ZjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bwDAVQ5S8djItA/MFrTZKLl4BHskuqbf2B1rZ6RX0jE=;
 b=rnyQPdejMaCh5lg5P32ZflaLMxJpwlkLrNEPclYoBDIpEgEXnTzDlqW4PrOOfhEs71
 6q5IBymMS9HJ+0QJh7+E8LQ6W8ImoTTFmFFTl45lnMEk35LR7JG/7B7maYhWuwJIUZ+t
 20ocLQIYliscBplMI8IQd7RVz6bDmoV/HLr68BHOyJWmFI9Ttf6O9XEBlGClsOBH131c
 IV+tw81hpr8FROxhGfBl7+dEYV/M8y06AuUaXudIA83Rvl+jj+UNgFhNxXfOOT5y0Ftu
 9lRIcRJewGILfa9zhXEvenu/olRixSEwG/ZWCtDDJShDpRPi+BzH2RD9heVJvpdholV/
 AVJQ==
X-Gm-Message-State: AOAM533oWUPjq4F5ypMaAsdErRBKRtxh7qILZh17kUZwP3Y8cWhsWRM4
 l2DrMBsv/vJ2sCBixIIlO3kOKJ2WDJX0sT6bG9gpEQ==
X-Google-Smtp-Source: ABdhPJz7mXhyAC7MrLwAg2J4rhNCt8vev+4Z4kBR0ZYaMidOMMz42sHGgey2K9fG1w+HBw3Uk66bzbBV9Ii59bHN6YI=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr6311131ejq.407.1604938075749; 
 Mon, 09 Nov 2020 08:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20201109090220.825764-1-armbru@redhat.com>
In-Reply-To: <20201109090220.825764-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 16:07:44 +0000
Message-ID: <CAFEAcA9Nb42H1=WpmQCVYFc5EpKN5QKUjzgh+RRkg-esJCGcwQ@mail.gmail.com>
Subject: Re: [PULL 0/5] QAPI patches patches for 2020-11-09
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Mon, 9 Nov 2020 at 09:02, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 3493c36f0371777c62d1d72b205b0eb6117e2156:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201106' into staging (2020-11-06 13:43:28 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-11-09
>
> for you to fetch changes up to 143d51e1792ecf2c8e5b0fc3a8c6022676c723d4:
>
>   block: Remove unused BlockDeviceMapEntry (2020-11-09 09:14:21 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2020-11-09
>
> ----------------------------------------------------------------
> Markus Armbruster (4):
>       docs/devel/qapi-code-gen: Fix up examples
>       MAINTAINERS: Add QAPI schema modules to their subsystems
>       qapi: Fix missing headers in QMP Reference Manual
>       block: Remove unused BlockDeviceMapEntry
>
> Max Reitz (1):
>       qapi/block-core: Improve MapEntry documentation


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

