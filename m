Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE706A21CF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVd9U-0005wo-BA; Fri, 24 Feb 2023 13:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVd9P-0005v1-LZ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:50:35 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVd9O-0006vi-3x
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:50:35 -0500
Received: by mail-pl1-x629.google.com with SMTP id c1so449877plg.4
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ykDhmjCYd+/vbU/AG0r2b87Iy2NxUaE0YVfM/AKfcfI=;
 b=cVt96yE6QPsegR+DidVcbgtt+RuajeKBvLPbkUd2WDduzEZHNumIg8Uel11xR5vv+w
 y0doFSqiKGJS3JAutyKrDa97wLK/Us4UID1aG3eKIUfXJTgnYOpBbNdgajj6Pnkv1yGU
 4YEKNYQmJGVgRy4f5Rz3xuoNpvDXWTyYM3pHASjttX+UqCYjFS8pK0A2r1axSxpiHFLe
 mxLQ4+OW9wzeasjxZNZChRstruKaPgq5WvQoUt12rG/R1C4eDAKrtcU8Wkbfm0BKPR5Y
 +kKvu5tc47ymC1/h3UUQs9dRucKBK4hBkalJhFwqkGbiyLQSktue+/mqZfDP4CDeVFse
 9mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ykDhmjCYd+/vbU/AG0r2b87Iy2NxUaE0YVfM/AKfcfI=;
 b=HdoWdP8uVCew2E7jzuVvjjZQgBy7wANINGiSL8LicLH+yHPVuq1roJM3kZTvEQJaBe
 fkntZuky9Ti/NEb2VHgBjrvSH1HGeF9n/qgmEG7CPLe7HdYG3cp/GqafgV1Ejx+DMq+A
 1futf5JrxCQZAhTCDqvHt5ysOext61jc50kFUYmksVv6B8UP+3BRSA+v1MhStuOGq9vg
 KYqKfsBBYsjmyHwnZm1vtRyNPxKXAW1RjuiefR7T+U4l3JLgwyJbMytTeLXIfyieLdR8
 jh8ATNlY3D5+mOO5+hQDRSMAeTwkZWbwkimTMuXqPo0QO6RE8iReFTH8dM+yKfD8uORV
 OLXw==
X-Gm-Message-State: AO0yUKVARs2XVBaL42WrnnpvmJG1yj3z6Z1qrnEQOdTvlXU6zMoTtor0
 AnqQrYqChu+UQpdNcZHClUxoQ03+RHA6ngqr79wKvU9Lriolkg==
X-Google-Smtp-Source: AK7set/sxDBuCKdpIsDP/OAoehQqkTbzZEGvHS++EQU88KYYCoT8+2w6xMDhStjZ1+kRPSMcQ3rSt4D39toT1eEfiTg=
X-Received: by 2002:a17:90a:6f21:b0:237:9029:c29b with SMTP id
 d30-20020a17090a6f2100b002379029c29bmr1187393pjk.0.1677264632516; Fri, 24 Feb
 2023 10:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20230223134626.2107382-1-armbru@redhat.com>
In-Reply-To: <20230223134626.2107382-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 18:50:21 +0000
Message-ID: <CAFEAcA9kpW0ZA2g2o2TjUah7P4MW=SAYvCuR_G5HG-hq5jRO=g@mail.gmail.com>
Subject: Re: [PULL 00/12] Error reporting patches patches for 2023-02-23
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Feb 2023 at 13:46, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-error-2023-02-23
>
> for you to fetch changes up to 1178710247017ee4f570b16a186ee48c250a18d1:
>
>   rocker: Tweak stubbed out monitor commands' error messages (2023-02-23 14:10:17 +0100)
>
> ----------------------------------------------------------------
> Error reporting patches patches for 2023-02-23
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

