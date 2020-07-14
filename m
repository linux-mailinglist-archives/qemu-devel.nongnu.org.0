Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBEF21F2CE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 15:40:36 +0200 (CEST)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvLAX-0004Xz-PB
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 09:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jvL9I-0003Ec-HF
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 09:39:08 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jvL9G-0000xd-QQ
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 09:39:08 -0400
Received: by mail-ot1-x341.google.com with SMTP id c25so13043302otf.7
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pEyi+cJZDofxTNdzqoAuA+pJLcC12uxaOX5ZXU5YcSE=;
 b=TCY3a+v85TYINN7n4iPO7acXCpIE8wD260vMlfps86+keec9nujUp7NSs0n1YuJMfq
 YjZhNuX3MegJCXLz8Zsp5fgbSXKQJiu2gi7tJZ+UywglGyY1Y5UYPvuJvl2JzFxw3B/U
 2yafWRo0wzetUOePDct0Pjaa+2NHCGcuAzSTL7PaFlZW0Amk+V3cYNkZYMjiF81l6Bxr
 iPnOxPVkrI3sNGtO1BraqSGcrUqc55LdTug/VJU7zPpMFsbO8xoAn1A9/cQXKnKydIN7
 4/yNuNrmQdiiNNvm0Mw1T1oPtf9aLd7IoCcnEAztLrlCIhBdTR+KDBW1NMdzB7S3quNd
 oH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pEyi+cJZDofxTNdzqoAuA+pJLcC12uxaOX5ZXU5YcSE=;
 b=QeunvmFkUf2UfXfxz2e9pp0CwrUxn4BQbNoyOrIwifZz4T5o/VJmnqwBTTI1GNxIMa
 3NPoKocUMjxwciZCmPZPvWpJDZ5fv8OIBRv8S1OQztWCZRiMfYgJG8jIuAvBcDgSyxcK
 s3Sh9B3ikqdIftGHQO3T/tuZQ2EFVPdMdOqFWV2T9bansLllrh/tJduwcsMqZS81O6BL
 Tv1J+7LZNJRVtxAiAzuJWarPcyrBv1GknTcwoxg6DCeFA0W03nVx7NkRh5HAMnaO9JcT
 rt9NS3yVI6hlnsJNPWpgi273WCbcZjiTtQpS2KXZCJRlQ5Phzy8OX5B5J9f1CcX8m5r8
 FnGg==
X-Gm-Message-State: AOAM531tGysJ+E8rNG9NtmpQ5o1occjDFpSXTs+h8wRKkjFLp+2mOLbK
 HGVsqurAgZABuTNeD0KlDPQnr2aH38IX3HT7dX6DIQ==
X-Google-Smtp-Source: ABdhPJxjdtic6Uy0N08DZAwoRQf9Iimjadjbav/zCiODPTsJSGRHww1XiE9Vlai0MXVh9gUDN5M/lTgUx7oOjwqH06w=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr3903504otk.221.1594733945272; 
 Tue, 14 Jul 2020 06:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200713142106.261809-1-eblake@redhat.com>
In-Reply-To: <20200713142106.261809-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jul 2020 14:38:54 +0100
Message-ID: <CAFEAcA9=TdQ5AuXZfLvBj7Xi5cKLq7+N=91Jfrh64fu=Dd9TAw@mail.gmail.com>
Subject: Re: [PULL 0/5] NBD patches for 2020-07-13
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

On Mon, 13 Jul 2020 at 15:34, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 00ce6c36b35e0eb8cc5d68a28f288a6335848813:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-07-13' into staging (2020-07-13 13:01:30 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-07-13
>
> for you to fetch changes up to df0e032b6196934b2b12180a6a05aa8b7e6553fc:
>
>   iotests.py: filter_testfiles(): filter SOCK_DIR too (2020-07-13 09:01:01 -0500)
>
> Patch 2 is a trivial patch that isn't really NBD-related, but which
> has been overlooked for too long now, so I just included it.
>
> ----------------------------------------------------------------
> NBD patches for 2020-07-13
>
> - fix off-by-one truncation in corner-case name display
> - use fcntl correctly
> - iotest cleanups that enable testing an upcoming fix for NBD close
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

