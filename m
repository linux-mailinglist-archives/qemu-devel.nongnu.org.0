Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C184057E3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:44:16 +0200 (CEST)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOKLe-0004v1-Eu
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOKKT-0004B8-DJ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:43:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOKKR-0001Jt-NW
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:43:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id b6so2624030wrh.10
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T1cqji9pzCVFTWkNsrflRdtkayJyzExmIijaClC5+Hs=;
 b=CcsAXDGzjf/L6Op0x/5xWSruHs2FqACW7qwHdfgBAcwCCmd396kqxPVewCDLZWOnu8
 MymmviT8ttZjhlchiqsN+VWscjMuRmCjI6WiNLk/N3ftAqB2V88ayKgb/Hij5DiGmtXd
 WZ/4rTtBuba+yAYG43Tw4dtFGUZo4LVCma1LQssJi/2kDR6MxbNhQXJPn8HbJl7qmrKx
 kURrdUaLGhnp4oemlq5AhV9nu57Yu9BblB7qgSx6o4gzD/LT6sKVOyUaVpmAU18vNbIv
 vtOvQpGKO5Rnu/PkTPetdLXojbdiwF/mYTYkA8MG7qL8YPujQTlE6FBBjYeWwNgVQtHR
 MYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T1cqji9pzCVFTWkNsrflRdtkayJyzExmIijaClC5+Hs=;
 b=LJWfKbw678s1XqdICSls2GPO4NiEBsVgIn6AlHEx5eOeTk7l8Q6OWxV91mT8P0lO+F
 fRtqwP9DZbqvlzG3FHbCVhUFCqDjhQTWaymE2cwcn/ygWo3CMug7l/e5Q5jEghnmepDt
 2ZJYEJWi9qMX1TJ9qeKF/W1StdJGqUnK+AmT9NoxuMbQz2Z9CtC2Y5XG3eFQoMIZ9D4t
 d+dcm9TvsN1uMcTXq3H0wSa7bKdAw27r+PUH5TYn6fOtKtUj/uf6bjUfy1GR3NCAKkXh
 5rSpsDbgXnTe+H7MffCgah2AJtP03W3aqSnN51jqtN8VZRPQdkQtcD26Q1AZUrPhxBJ/
 yuiQ==
X-Gm-Message-State: AOAM5322grAKCkt6u0YF6g7mD5k6SR5knZp7JtpFscI0KaxMk5PThtrK
 NDIQOMWXDD+t6I2qHDYzX2BSiyzbSQX7V2o3Z7BMag==
X-Google-Smtp-Source: ABdhPJxYsdf+bzRQoEiXCCeLtzoDBRx2DLGYKRlfCQpnl0VBQGWhRCqUdW3qlG3xbM7vbWeVOYROTWB+9Qm+lJeUyr0=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr3715225wrs.149.1631194977926; 
 Thu, 09 Sep 2021 06:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210909103346.1990-1-quintela@redhat.com>
In-Reply-To: <20210909103346.1990-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 14:42:08 +0100
Message-ID: <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
Subject: Re: [PULL 0/7] Migration.next patches
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Sept 2021 at 11:36, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210908' into staging (2021-09-08 11:06:17 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/juanquintela/qemu.git tags/migration.next-pull-request
>
> for you to fetch changes up to 158cced72cb2b09b0e8b523a5b15cb10889f99d1:
>
>   migration: allow enabling mutilfd for specific protocol only (2021-09-09 09:30:55 +0200)
>
> ----------------------------------------------------------------
> Migration Pull request
>
> This pull request includes:
> - Remove RAMState unused parameter for several prototypes
> - RDMA fix
> - give an error when using RDMA and multifd
> - Implement yank for multifd send side

Fails to build, FreeBSD:

../src/migration/rdma.c:1146:23: error: use of undeclared identifier
'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
    int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
                      ^
../src/migration/rdma.c:1147:18: error: use of undeclared identifier
'IBV_ADVISE_MR_ADVICE_PREFETCH'
                 IBV_ADVISE_MR_ADVICE_PREFETCH;
                 ^
../src/migration/rdma.c:1150:11: warning: implicit declaration of
function 'ibv_advise_mr' is invalid in C99
[-Wimplicit-function-declaration]
    ret = ibv_advise_mr(pd, advice,
          ^
../src/migration/rdma.c:1151:25: error: use of undeclared identifier
'IBV_ADVISE_MR_FLAG_FLUSH'
                        IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
                        ^


-- PMM

