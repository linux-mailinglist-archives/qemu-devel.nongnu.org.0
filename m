Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3E35E810
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:13:52 +0200 (CEST)
Received: from localhost ([::1]:54772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQM3-0006Jn-8V
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWQKl-0005gW-4j
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 17:12:31 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWQKi-0006pP-Co
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 17:12:30 -0400
Received: by mail-ed1-x531.google.com with SMTP id e7so21035336edu.10
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 14:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mlN7w5BiEZtLPZkFT8gjDMlE7tacVp7FJl6WXwauOZQ=;
 b=A4bYBjuPGiBZ+1QlusGmMapXRVqv7ngBYJS+FNZB4nRq01BqvSNNgoPTy/+L62iNIs
 5FifpsyTFLEo+f5gRNLIvQEpEZYEJKUvMkLLTjuxH4HkruTQZspvM10TNp+ylVnIhL5a
 5qGP0GWm+h0k0dcUtcpYP2DBBFapOhfB4Lc+69t3wNWlUY/j3ppHi1aYVBHo3YgspPq9
 4sDE6rILHUt9Tc1fvzkRFyZMfEwISkOtp3pRkaIA+Fk0og6GSDyTYDEc3Gy9wMoEV/oo
 f9XG60tUh8csBW665s6JJVWZBcULPHtemLUuAGJzhw44xRanZx9XcFnPdJMHEQqmFDPG
 ZImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mlN7w5BiEZtLPZkFT8gjDMlE7tacVp7FJl6WXwauOZQ=;
 b=szPfjWLYcyz/CluAYCeRxKrg3ounf0sPPENA5JkGOxU5MfWE52+Zi2XJBhH/Zumzz8
 BrkcYo8lurJiAcuyMa0eWC9nLwEknyff+4fX+GQECR5nGmAUDoiDYARlsmp6gnsUXXvx
 JuSmvhAHaV78Kmr78WEHTUvxg/KNeQTmmAxyWzk8Fh+HgbSDsmYtGnfhZROK6SL2G/JW
 2QWCU/vZsX0uW25MDnxpzg7VYGb9VFxrcXelp897i7L2jLBZJGP2o3h7rVytNU0kujCs
 sh4vQzkaKtTdAmo99KfOhKdJf+Zt09by3PkJTP/A5dTfRYGrEyN6mi25lly8GVFCcJOU
 FHZg==
X-Gm-Message-State: AOAM530iuw4XnWXPi/JrEi58NQK6oh3cxPX0mAjcBA4tUtA3Z5np7sCW
 ZQga4oDP74MpUIkmkdMOv4jRDx9R1XA9fL/DrzH6yQ==
X-Google-Smtp-Source: ABdhPJyaIbtoAcKmuH5B2x+HmHHcAcrZB2ycwfHTCSY+hVxlGpNnmY9DPwuzLv5IX5Gd8+BcvYh6Fbw53K8QDND2arY=
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr37640667edd.146.1618348346288; 
 Tue, 13 Apr 2021 14:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210413133903.545695-1-mreitz@redhat.com>
In-Reply-To: <20210413133903.545695-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 22:11:40 +0100
Message-ID: <CAFEAcA8L7Ob4GQrQ9Dwyxw1qNNbTGsrPkhPho8PnsbHBFEwZpg@mail.gmail.com>
Subject: Re: [PULL 0/1] Block patch for 6.0-rc3
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 at 14:39, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit dce628a97fde2594f99d738883a157f05aa0a14f:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210412' into staging (2021-04-13 13:05:07 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-04-13
>
> for you to fetch changes up to 0267101af64292c9a84fd9319a763ddfbce9ddc7:
>
>   block/nbd: fix possible use after free of s->connect_thread (2021-04-13 15:35:12 +0200)
>
> (This is the patch for which Vladimir has sent a pull request yesterday.)
>
> ----------------------------------------------------------------
> Block patches for 6.0-rc3:
> - Use-after-free fix for block/nbd.c
>
> ----------------------------------------------------------------
> Vladimir Sementsov-Ogievskiy (1):
>   block/nbd: fix possible use after free of s->connect_thread


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

