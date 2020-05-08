Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311201CB290
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 17:12:06 +0200 (CEST)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX4fU-0003LC-Il
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 11:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jX4eD-00026h-6P
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:10:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jX4eB-0003kD-Gx
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:10:44 -0400
Received: by mail-ot1-x344.google.com with SMTP id m18so1685871otq.9
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p2Yzq4gLI/K5s4vRhVGkYMwv2US9cSjHREK9IoRTnSA=;
 b=MEp/kfMgZ/ceyv7N1Nw8FQAIUa2I/1cy45HP/h8GMVh/tQHf2+1gZOOnP7ewil1u9V
 v8EnOCk8TVE87IK6s5tXRj0zy7Oqf6O8O8IrSOhzebFjODatgIiCvJt0MGOTXsUVUrxq
 Fe0/x6Lh8Fmlp4eyYOw/n9srba8pu1hk+2hzDYPHxEaVTqtk8hP4WV3+BzZKN0/v7lwL
 FPHnsX2o9uwiEnngBsipD6QN+IL0x9cUpVhoRgNhlkeRiFsql9FyUe4ThBUjQbobjJ9u
 Lg8u2SfPQgUpady5yYh0HGHvFiSutg+aQ/OB6LWVEbuA9bOnLUM0+PKEN5ZJEKlXCT4v
 PniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p2Yzq4gLI/K5s4vRhVGkYMwv2US9cSjHREK9IoRTnSA=;
 b=Ym4uflI2QFgpmiDzJ3XcUdMCzSPMu0/2Kw6cPU4y6vcmawtyQVZ2/1KyP9ST4TggxD
 wWwwBaiiHfvsWM7D/saghx37ZqqDizomId3+adS1zkNj5U+xElNHUbgHD8TxvLiS2YK1
 3lpP1Vsbj7vlYbax7eoVouPBefif1VG2FZWfF5Vr9m1bnMKOBqTO1+MPFAreyjYuEbu/
 CbkZqlmFIVQx2tNXbk8ZySvLjN+8ZRSq5g+8DtwiL3j8UQOWDz+zS8HvNDqjTRFmGr44
 cXPIl+qNrObJBHp+WGh++k31dM4wR2yj8M64ZiclZ6n4EqIb/JXlKy9/BOO3bo2JwAdJ
 Ggcg==
X-Gm-Message-State: AGi0PuZVjitc+u05ZSuCGJIN1/WdJ3irhhUVzpm4ewv/OOICbvfOWGuu
 EbcfhqW1BV1L2q08kc4agACMmHVFHJZAM20SCptiOA==
X-Google-Smtp-Source: APiQypIjt7WctderPSnmTVseva3WpR5IFnvKM5i6GQKQVdqLUxYoy6f1J69Hl6dbFvFwwG46bTnS9TzxrsmgT7YMlEM=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr2500058otj.91.1588950641110; 
 Fri, 08 May 2020 08:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200508124135.252565-1-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 May 2020 16:10:30 +0100
Message-ID: <CAFEAcA84KC=OpbZ3ALY2b2tMO_xUULOsWJ=2ostorVnuCB70wA@mail.gmail.com>
Subject: Re: [PULL 00/30] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 May 2020 at 13:41, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 1b8c45899715d292398152ba97ef755ccaf84680:
>
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20200507a' into staging (2020-05-07 18:43:20 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 47e0b38a13935cb666f88964c3096654092f42d6:
>
>   block: Drop unused .bdrv_has_zero_init_truncate (2020-05-08 13:26:35 +0200)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - qcow2: Fix preallocation on block devices
> - backup: Make sure that source and target size match
> - vmdk: Fix zero cluster handling
> - Follow-up cleanups and fixes for the truncate changes
> - iotests: Skip more tests if required drivers are missing
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

