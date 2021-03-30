Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B634EF62
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:25:35 +0200 (CEST)
Received: from localhost ([::1]:34622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRI7S-0006xb-QE
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRI3P-0002PG-CK
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:21:23 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRI3K-0004N1-SK
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:21:23 -0400
Received: by mail-ed1-x52e.google.com with SMTP id l18so19120718edc.9
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 10:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qg9M+9QFMczToKu4h4LqcQnzDJ+o14FdYvleiw8q4Js=;
 b=vd4dtOXjaNtiKeXqbZU93i3PoRNjkp9luq5xrsPI4UfkDwrQ7MBEPYeSkc8J46ki41
 kZRJkoupZFVAOQvyXWkYlbqC7vgFJgiakWuY9+CYDEXdf744GN7sJUFqUrzK2CIadCQr
 ON9HBi0XquAG3xb7h1XijqwHmmvt5kEoVkgcvHNA9BEGW4BiV+J29dJtxEFUvtAoKwI3
 ucKosh36RCMpj737LDrnBHv00r0Kj/OJPuX0YpVPlSTOu9t/DTB4JNq6Eoihidh5stM3
 4pZjzthuNiISzrK2cl0Jvrz7d3Fvd950Who/hzF05X/DZ8TGuvZNWFDw1EA3wDROwNSF
 MRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qg9M+9QFMczToKu4h4LqcQnzDJ+o14FdYvleiw8q4Js=;
 b=iW7wkNxq1fdy+ZcJjm2zUQKUSWp7IEe6cjwd+1lRwLSROIJgTueZHoE+qs/FWzNTOb
 J/hd7BKHT0vtvnLFz5sWYPLp/GTxp9QW5NQ0+tEZMGeVdrhDlYGbmgUhvpVJcMjdGl8/
 VlZFtiJTtl/KTOPLepcHN0FUoDjSKMvJKSLbUf2ZccvnSebCu+m7ES1mcLr4NJv59YlL
 mg8iKoir432qOeVi0NYLY6vdz4saGkv7w44e0N896Kb4XCEwcexNSNjb1PAudpe28DbP
 YbapX3LRNGcxZH7SBmTr5bDTiC+ActVSnks8ou6WLqG0xABKysvLb35tYPKHXSuOB9go
 ejDA==
X-Gm-Message-State: AOAM530Ey0NmoQLlezDDwW0zA4D94fq/IfpFHSNwQ2RPHR5mVKvf+FlG
 iuR4+SReWUEj8NyaIa5dKK0Xfhiz3SVc372Z9ZwWiA==
X-Google-Smtp-Source: ABdhPJzWI4b3c84BTj9mjIo2PScAHe+kUjeRlUT/8J2DKDYqqkBywpYqtsIDpx5Ho9GzBt+L3EfNwbFTopJ/derbVdE=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr34510100edt.36.1617124876520; 
 Tue, 30 Mar 2021 10:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210330143846.721955-1-laurent@vivier.eu>
In-Reply-To: <20210330143846.721955-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Mar 2021 17:20:45 +0000
Message-ID: <CAFEAcA_jKdUsqjmFG4OAPO5MD4KGoDmXfx=g3=_jthp07i5T9Q@mail.gmail.com>
Subject: Re: [PULL 0/1] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Tue, 30 Mar 2021 at 15:49, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit ec2e6e016d24bd429792d08cf607e4c5350dcdaa:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-=
> request' into staging (2021-03-28 19:49:57 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to 13e340c886679fb17df02a35e7d82cb8beb6e9f4:
>
>   linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if its length is 0 (202=
> 1-03-29 21:56:18 +0200)
>
> ----------------------------------------------------------------
> linux-user Pull request 20210330
>
> Fix NETLINK_LIST_MEMBERSHIPS with NULL/invalid pointer and 0 length
>
> ----------------------------------------------------------------
>
> Fr=C3=A9d=C3=A9ric Fortier (1):
>   linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if its length is 0
>
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This didn't quite make it in time for rc1, but it's only one patch;
it's still on my to-process queue and I'll apply it tomorrow.

thanks
-- PMM

