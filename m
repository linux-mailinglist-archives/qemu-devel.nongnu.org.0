Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2759221463C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 16:00:06 +0200 (CEST)
Received: from localhost ([::1]:37782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrii5-0001V5-67
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 10:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrigz-0000zJ-Ib
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 09:58:57 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:37326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrigx-0001N3-I4
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 09:58:57 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id t6so651834ooh.4
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 06:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=roPmFj/MHa9XcMi36uEUDC4w2/kiKrQp9m5RoT+8vZM=;
 b=JRQJqtHtvx472kVV+N3WOpX1pin3v6jiaIsYb8//Dn2V8yLJrMh0wrcl3q6y+rSKN1
 W87BN5WMcVPGs0wJnvdigSJU9Y12sGRhqpFnrW+069NrmDbE8XmfWVXWn9pAV8wQi2oR
 bkFbEmrkaIn2wt9ya5GbJu8CeFaol7BtTBlGWRzniMPOnaBMm+O7XxYfh8zHJUXHWCYy
 yZFnVtlXQYz2LgX34ukch5Z6X+y8ooT8f5XhnzDuy1oblPI8Ao/Us/KcESsAoDOZ4kIy
 71eajh3jsq543yGQlY38hr4OCPQ9zk/TNwmjQeHCnfAE/YVmfrn5cJdwPuKs1OpU18ow
 pHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=roPmFj/MHa9XcMi36uEUDC4w2/kiKrQp9m5RoT+8vZM=;
 b=hlmfOw5Ob6MFLaBN2SEbsfHdRN6U5G4alzbLJWI4ZgFkrSz29wnRYxvtfWIfnd31ZL
 X4Ubpo1wXPm6WAN06IPwOXVHM9L/ENj2svbBjItWAmKXaC36RT43VRPqYubnL+fNh6S9
 W5ap7GtIrl7H7uILZJdSTBWpQEH2Sr3QEzHUI/tYJxZPh77JUwzSbtkgY0YlkRmwQRn4
 SJCcNrGHtbtrmpCIQUhyi2Ph7Fx5xfm/Bj5HOrFaD27qu9YLsCYUeYUYoKxVeYK5Nubb
 A/lJs2rf4GX2glsXa0Zff8VMGRsQpRVhAcL4I2Ed6CQdEHw7ZaO3JzBy7mYgD06eIcEv
 +dzw==
X-Gm-Message-State: AOAM531b+vt2GELXrzyM+2SYtcoGTZuvpTIEH4PGW3IVv8TaIRP5xyW0
 ffIe4lJ50xbvsC5N5T9SDCWB8ygMIbONCMenHAxW2Q==
X-Google-Smtp-Source: ABdhPJxkfrq+ldSMoN1oWQaEkMG3e3EfYTfrgC622K3g2xjMzgv1J1+QV2+f0IpqqeCljm1yCxHaww8NaBN0rxfuhoM=
X-Received: by 2002:a4a:2f15:: with SMTP id p21mr35366712oop.20.1593871134140; 
 Sat, 04 Jul 2020 06:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200703100650.621212-1-cohuck@redhat.com>
In-Reply-To: <20200703100650.621212-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Jul 2020 14:58:43 +0100
Message-ID: <CAFEAcA9ERZ-TokGtXRKF-iB=L1rBc8easszGRu5vpy7sF2fMzA@mail.gmail.com>
Subject: Re: [PULL 00/14] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc2d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Jul 2020 at 11:06, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 64f0ad8ad8e13257e7c912df470d46784b55c3fd:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-error-2020-07-02' into staging (2020-07-02 15:54:09 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20200703
>
> for you to fetch changes up to f196f6a8c7cca5e8bd1d6d37995447e1d6028223:
>
>   Merge tag 's390-ccw-bios-2020-07-02' into s390-next-staging (2020-07-03 11:17:03 +0200)
>
> ----------------------------------------------------------------
> s390 update:
> - various fixes
> - cleanup in the s390x-ccw bios
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

