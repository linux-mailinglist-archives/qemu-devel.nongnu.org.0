Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B6691FDE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTaH-0005PZ-FX; Fri, 10 Feb 2023 08:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTaF-0005Ol-PM
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:59 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTaD-0007WS-BT
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:59 -0500
Received: by mail-pf1-x436.google.com with SMTP id a5so3457590pfv.10
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y1hvwz+Dd7g4NTUiEn0Fi9gkNfu1niBnmphBxaTmbeE=;
 b=wbzvFKDJ063GVWDXHGuvjTPH08+tUKtV1IYKid8qgQj5B8h8rLHAKunSCSd4i5UDY8
 d3MNQna9S2K8A6v8ihzLuYz03ABNA6IUo9moq50Actb81PtNW5K5/4dGqmJeiqku5k5R
 XbMT/poux916s6Meu73bQYgvQzCgxiW9QzMi5DAjEmXNH+cAUlG+QEBDNyULZ3Z+8LYa
 MZcuuZ4r1oTiXNqe7DfBJ2d3+uf/LtPUj4lcFzABtChoJAPdq8oAEfkF+0opytbgJPk0
 9RCeDOoQNNcUW5PKYoM/h8t1vHksk9XX3miuV+W06OLsUB2PPboO+dryAUgTmvAJVqF9
 eckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1hvwz+Dd7g4NTUiEn0Fi9gkNfu1niBnmphBxaTmbeE=;
 b=cbahQXyWsvh8AoYYaVzOwpEHnrlXHiQxJjprdsKQ+p6NKhwps9TSDYbo86HCcdz/kP
 GC/+Y+jWvZZc1+hg+qljTK0ZD+BweNX3N6DlWieIF8XkW9O+vkaydStq8C7b13C84sDt
 vQNX7sudM9tKas1F/3Erw4iyBklt6ONZ3DpRG3t59EN0fqS3BxScfBJtQ7ARenjnn/zx
 e32zUsiJv2SCyLb5V3svA0LriPz0woigHF4a0mr3w3TCZu7Z7PX8rHt5WyYTW5wTh+w6
 HkGXhHcgyZ00NIgxDHQG+q9LB6t82m1Jch4WgB5DUWtieO2Xj7dEi4eSRWJFhRXhQGwm
 w/QQ==
X-Gm-Message-State: AO0yUKVIFGS01tOVGMl6RmQ7vb+rwrQ3wdei1wJ+HonaFr88b1XiQo+l
 vLdAe38paM8JkuF3cWF0AaWJTlQC96C2a0NJGEQl2g==
X-Google-Smtp-Source: AK7set91fxjLP0Z6IdnoqL6bdxVfHUXDwSG+BpftJFg+3ONvnQi2pDNnqQ7w7zYDKuWrH0qoX1HJ2RmknADhNEZ/n5g=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3326129pfb.48.1676036215644; Fri, 10
 Feb 2023 05:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20230209233426.37811-1-quintela@redhat.com>
In-Reply-To: <20230209233426.37811-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:36:44 +0000
Message-ID: <CAFEAcA-qSWck=ga4XBGvGXJohtGrSPO6t6+U4KqRvJdN8hrAug@mail.gmail.com>
Subject: Re: [PULL 00/17] Migration 20230209 patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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

On Thu, 9 Feb 2023 at 23:35, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>
>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20230209-pull-request
>
> for you to fetch changes up to 858191aebda251a4d1e3bc77b238096673241cdd:
>
>   migration: Postpone postcopy preempt channel to be after main (2023-02-09 21:26:02 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request
>
> Hi
>
> This are all the reviewed patches for migration:
> - AVX512 support for xbzrle (Ling Xu)
> - /dev/userfaultd support (Peter Xu)
> - Improve ordering of channels (Peter Xu)
> - multifd cleanups (Li Zhang)
> - Remove spurious files from last merge (me)
>   Rebase makes that to you
> - Fix mixup between state_pending_{exact,estimate} (me)
> - Cache RAM size during migration (me)
> - cleanup several functions (me)
>
> Please apply.
>
> ----------------------------------------------------------------

Fails to build the user-mode emulators:
https://gitlab.com/qemu-project/qemu/-/jobs/3749435025

In file included from ../authz/base.c:24:
../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
or directory
1 | #include "trace/trace-authz.h"

https://gitlab.com/qemu-project/qemu/-/jobs/3749435094
In file included from ../authz/simple.c:23:
../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
or directory
1 | #include "trace/trace-authz.h"


https://gitlab.com/qemu-project/qemu/-/jobs/3749434963
In file included from ../authz/listfile.c:23:
../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
or directory
1 | #include "trace/trace-authz.h"

etc

thanks
-- PMM

