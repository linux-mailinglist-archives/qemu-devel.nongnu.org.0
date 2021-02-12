Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F2B31A60B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:29:39 +0100 (CET)
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf4M-0002ua-2m
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lAevB-0000bj-SY
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:20:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lAevA-0005O5-6t
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613161207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gt59kqaEZ7xfhGCp5840Gc6/5TeZEEpPdfjQNFQnsNQ=;
 b=FcsMSIyXNeaLdwUOLHr7RrI9lZPous5eHyd39gM6X2tEOEfNCalbGIwKqErRBjDptbAEoR
 uAFEqPlYTzvBki/YxAzkzLdF3ugMcgCuNUHb6Hk4UimTbbnptZ+dgXdPAGVRr/pY/s56J3
 rBKuOPtvSLCwyc3LsSGf+dJQeRsbQMY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-ysL3x6riM6qXzBPqlVlCzw-1; Fri, 12 Feb 2021 15:20:04 -0500
X-MC-Unique: ysL3x6riM6qXzBPqlVlCzw-1
Received: by mail-ua1-f71.google.com with SMTP id s21so227583uap.11
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 12:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gt59kqaEZ7xfhGCp5840Gc6/5TeZEEpPdfjQNFQnsNQ=;
 b=M5H4SegK97LcWNHG0luMSMkdq6Q+OKQCwWxN+thRZDnPfGE++iezv+O6sXgd5nGuQt
 DwTedSV62R6sprIM9fya7w7I7Ibh0/ycvKbwcvf2gZqGaO3BnmidXdIvFycpmGL11UEY
 VA5bd18xmt4+PRDN9E2SWPmOUGFIbFwUu8yAlsFFuqu0NMJisJG5GKcoIj0xeOkJ+3Mg
 1qR1OVp9u+mNIipgjGDibj7yVtgDhYSioHCkoFaHUgSm8PGEkDud/jRAy2nTRLHqIoCb
 2K0mLeKyiyBfMTMB4NNdfhR7tdVtzdaLfd9fYSHpkVigrwI9CM0DbY4l9p8YXaOtTpG6
 xPZg==
X-Gm-Message-State: AOAM531lJluMWTGUf+y4Lxvu6nEOK/owWTJL+EjQRWWBMSMmNyv0v5lX
 FSicF1GmJ4nHCi322oWRNv2vNuXaUQsR8k48HRLOU+5iv+ZlDk3DHSvbLSYl8qk2A9Acl16Jaz6
 JjXuX6LzLsUpTM1qFMRZucNYKjJVNwcE=
X-Received: by 2002:ab0:23c3:: with SMTP id c3mr3380784uan.133.1613161204179; 
 Fri, 12 Feb 2021 12:20:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsb6Vr2cOVMsy790PmI9VuJMMbjUofvMTQWwHwTOv1FdXfdrZreFtlEFG5ZCNF1eQo4F5XaHB7ThXG4rpl+0Q=
X-Received: by 2002:ab0:23c3:: with SMTP id c3mr3380763uan.133.1613161204004; 
 Fri, 12 Feb 2021 12:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <20210211220055.19047-2-nieklinnenbank@gmail.com>
In-Reply-To: <20210211220055.19047-2-nieklinnenbank@gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 12 Feb 2021 17:19:38 -0300
Message-ID: <CAKJDGDZViLxw4DvKSca5V=fWcMuu+HVXpMxNWqWg9sgbCg_yZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 7:09 PM Niek Linnenbank
<nieklinnenbank@gmail.com> wrote:
>
> Currently the automated acceptance tests for the Orange Pi PC and cubieboard
> machines are disabled by default. The tests for both machines require artifacts
> that are stored on the apt.armbian.com domain. Unfortunately, some of these artifacts
> have been removed from apt.armbian.com and it is uncertain whether more will be removed.
>
> This commit moves the artifacts previously stored on apt.armbian.com to a different
> domain that is maintainted by me and retrieves them using the path: '/pub/qemu/<machine>/<artifact>'.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 46 +++++++++-----------------
>  tests/acceptance/replay_kernel.py      |  6 ++--
>  2 files changed, 18 insertions(+), 34 deletions(-)

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


