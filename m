Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877012BB628
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 21:00:07 +0100 (CET)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgCZc-0005zV-Os
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 15:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgCYC-0005XH-0t
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:58:32 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgCY6-0003C5-3s
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:58:31 -0500
Received: by mail-ed1-x532.google.com with SMTP id q16so10735857edv.10
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 11:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bKajmGaq1QPoUnri4RXHHzKKKoTiH9gCk9zb9xBqWGE=;
 b=F8S97VhmYTk88LIX7/3SHLGyBUErrbUGmmCRvg2/zfphxf9QSndsa4ODN1KQvOR7kc
 QNK6E+g3fe2kQqeDEWkUlkh3BdNQo378g0sflcLNlMMUM4mnAksnnlTsRedCmk5PA0qW
 U98PxnUP73ztY7u+BUippqIcSoUDFS2u3+ZWTvDG12D9OhZOssLMR8bLJC3OSfoYNGRp
 Z1551wGFcZP25cqpPOGn01vtEcyx18mhbjTLhFM2+C5k5wiB+8lbIR5oGMGDgECxgI/C
 TTBnE5xSMRGBubP+lP80Y7p6Rpa89Kt5jTNx1fu3jeRdsR7RdMNNMgz7rfupOYElqF0d
 rugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bKajmGaq1QPoUnri4RXHHzKKKoTiH9gCk9zb9xBqWGE=;
 b=ohUCGHnWNpg/oJ3auWzdQqcIJnebhvzZczok6/4zDWOXy5WMpcZk7DkWF2GKHlEY9w
 H91KkE2yl2ogsXt8I1AqT1+F+WZ7jzHaQCLyDUjFQS8Rom61STRizTYsxVoswHGQmLj7
 wY/hj6PB73j4jTmBEX3+xA7CnrRdqb6cnOZK1fz47IGVDwwhgbnVhIC6Qxwo88waKsYk
 9kJPt4wfwdHN9fRjrnU7cSPoFJUeWRUqN120bniAjH02FX1cMHSG2cKpzKFNRCLbRPmE
 qb74+IEtr16Kbj7UImC3pDVy2VlZ4l8pphYTgqVLIlMJYvRmaXHmaFhweZjGtW3Ysf+Q
 +3cQ==
X-Gm-Message-State: AOAM531HwjfBUIhExo73RKJDRL6EySK3QVec1hvtzTiKT80vCW/slvYo
 K6faC8RGFBqaIFk1Jx40vWX4qzrbgqWuZmFcE1R/vw==
X-Google-Smtp-Source: ABdhPJzF+HmIXlGbA/KV5YE/Ud7J+vxIjO/aWhpZkhsVVvW+bd08wsXxZaNEquSF5m4GVP80xtHEz8RYPZxJveHZToE=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr38885252edb.52.1605902304706; 
 Fri, 20 Nov 2020 11:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20201120171828.488611-1-thuth@redhat.com>
In-Reply-To: <20201120171828.488611-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 19:58:13 +0000
Message-ID: <CAFEAcA9u4V5mPBYme2N_cU8K1s7mZZja7fKwVien-AcAx1_FMA@mail.gmail.com>
Subject: Re: [PULL 0/4] docs + qtest patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Fri, 20 Nov 2020 at 17:18, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 7fbd7e710323c8f4c5f6a38a8ae0e6726b5a4599:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2020-11-19 17:08:42 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-20
>
> for you to fetch changes up to 88a8b27e556f5cb49a19d4c98a96590f61b74ed2:
>
>   qtest: do not return freed argument vector from qtest_rsp (2020-11-20 15:04:16 +0100)
>
> gitlab-CI run: https://gitlab.com/huth/qemu/-/pipelines/219170774
>
> ----------------------------------------------------------------
> * Some small qtest fixes
> * One documentation update



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

