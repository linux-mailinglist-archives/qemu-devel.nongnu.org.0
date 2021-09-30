Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3BA41DDF7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:50:17 +0200 (CEST)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyK7-0002HH-IL
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxk7-0001vl-7l
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:13:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxk4-0004cS-T4
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:13:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t8so10716942wri.1
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6nrpdzxj6tcLVw+s5eJoucaIzPWccTPColLALXDHFY=;
 b=wzX0fxHEI0O0Hipw8S95qbbVMaWdNHFJ4Bl42tpOF0vDpSXl9l7XSH3YqulMVMCL1Y
 CnrsqNiP52a+9Ge0hoGwohz2glWEE1393tWf2EhFTE61rIqVXmTgZ+GLeV+pd+QXL1L0
 clUWuEw0uzfJZx0/7vMzptOC37yw5/XrRwkNsY8DBgLej158dnpICNkDTPeC5ATAVASz
 gcGB+8zQBzi0NwILxVnuYn/ORV8a5dVXrH69KBRXtupT6hqHkZNx08aP1X8ttW2wsFOA
 3j23XuTK7kZNOZVnnxLhjjjxDyzntqUzDCMiM2vY/hf3lyr8aiPf0NwDsx/v8QGziZ2d
 6+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6nrpdzxj6tcLVw+s5eJoucaIzPWccTPColLALXDHFY=;
 b=G8aqRtvlp25siNIojPnsknVg2KKqg+HPGVFz132v8/INxCRJZcnT6HS40xt7kCmgmw
 fwZ8RTrLM1jh1dwwLYswrbHf6DvqjJ5eDCKd5OOzc6k9aM2j8/DNMhB04g9HSADAupSy
 QlwqJYa3gtDWQMHhL3xLIN09ZXx9RwtXNxJZuu5jR3v9IDT+hwqkrloUAJd5iNTbNvOA
 naBs19KBBaPslANtonLO1IhbJF0iCT99EitCznWuYkUd1Xe8gnAdYXZO3xcLmKUrDdcQ
 PTFumUZ4HUOoOs8KTEXrjNn4PL6CLDmZ9cIfos9nwX1ea0d2GgvygKRpJ7gb4nyRI1lQ
 B4YQ==
X-Gm-Message-State: AOAM530wZ4cgj4RhWh8k1vJPb+d0OuGo3mRgMOzqiq2NiYsVh7/3VKj8
 n/KeXFDBYM0NGGcLfiMRwV0NS5EQbWjeQ+Ahil/z+m9Tbpw=
X-Google-Smtp-Source: ABdhPJxu14BoZgWzGOJJy7UyUgw0NBv5oR+Npuj1w/PuEQm3xnoXWb51QdHDqaUCMVBxop/pSr5ESm4KWaG1/LAJn2Q=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr6896921wrr.149.1633014779077; 
 Thu, 30 Sep 2021 08:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210929211229.4163263-1-eblake@redhat.com>
In-Reply-To: <20210929211229.4163263-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 16:12:05 +0100
Message-ID: <CAFEAcA8u+tzZg-VhaXt9hRmOgtditxhyTGtHdH8MY9Xy_iq7aQ@mail.gmail.com>
Subject: Re: [PULL v2 00/19] NBD patches through 2021-09-27
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Wed, 29 Sept 2021 at 22:13, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 6b54a31bf7b403672a798b6443b1930ae6c74dea:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2021-09-28 13:07:32 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-09-27-v2
>
> for you to fetch changes up to 1af7737871fb3b66036f5e520acb0a98fc2605f7:
>
>   block/nbd: check that received handle is valid (2021-09-29 13:46:33 -0500)
>
> v2: defer problematic selinux patch; sending cover letter only since
> remaining patches are unchanged
>
> ----------------------------------------------------------------
> nbd patches for 2021-09-27
>
> - Vladimir Sementsov-Ogievskiy: Rework coroutines of qemu NBD client
>   to improve reconnect support
> - Eric Blake: Relax server in regards to NBD_OPT_LIST_META_CONTEXT
> - Vladimir Sementsov-Ogievskiy: Plumb up 64-bit bulk-zeroing support
>   in block layer, in preparation for future NBD spec extensions
> - Nir Soffer: Default to writeback cache in qemu-nbd


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

