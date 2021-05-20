Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE7838B748
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:19:46 +0200 (CEST)
Received: from localhost ([::1]:38476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljoCv-0004qF-CU
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljoB7-00042f-Ez
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:17:53 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljoB5-0005Zk-4D
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:17:53 -0400
Received: by mail-ej1-x62a.google.com with SMTP id z12so25555682ejw.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YVOD5U5K/Ym0hQh6uTgsuID0KZZtCElpNEjCs7POiPc=;
 b=ivutPcDutSknbcGCchuXxIReKxM9jnPQdZLhn9p2+VR7oiEztVHuSDop4qlQAoBmrG
 roKL7sPQ3cpsSFqg2828wIIRms2kD1ldqVxomdxYEw0GQ0VSyxbzlCnfg0jWozwoKZu9
 2JJKvYYDdnUw9teSJZlYEkyWGn865CET2fmSKSKhOy7PIXJqixMOUPXqDjO5HqLbU69X
 7vxOLQhEB/24Jy42ktfzxvrdiAt+gsFhwk12jZ8Z+eGM/xDyw4SiiYLrHavJWo9gVrq7
 BB/EinZlHLAyfAREnbaM/AHueuP8FR1lR50d8kPs5kBVCakxUxU7+mZnFAoAu310ZrkC
 ssFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YVOD5U5K/Ym0hQh6uTgsuID0KZZtCElpNEjCs7POiPc=;
 b=g1DOmnB3VT/BLmR/Un0AKGimqjK81vt3XUw4vSlnhvkGzSo/9UddnxIVpk/11iZv4k
 YTo423TYhin8FAlBvjdUYy/qhAGshw+D3xRk9dpxBNpFaPNnmiKaLdt7INQKXTFBB+cz
 rb3+ymskE39xD8tjC7MyqRaCdWqRCCTl0l3ExUErj/7DCPk1ac03xIl7WmnL0pKCMUnK
 3nVs+TLDKYcXC1KEq1uJQy6q/5JOUefFGu2XYJnB/uHyQALC/y5+ounxj1kuRB2OqmfP
 8797oGAbWQsUTMViDzACV6CxYR7rL1XeMK2Hk//kk9tJeYrqY4GzOANtasODEbxKi/1X
 9/iQ==
X-Gm-Message-State: AOAM530nrJfaKGNskM7Zuj03Io2d/0KcWPfNdOf3R1hWzEVd9MHz7q+5
 l4GmEoSymC4NW3aRoP2Uk/frxh0oYUO3NFWkj8TtSA==
X-Google-Smtp-Source: ABdhPJxQKjgim7lbAjdQq+FsmlKj25TJ9yu+Ejif3NBxop7E/+fjaZJ6Mdej/KRGqw7GkShORo7fXiwraufEhZpi23Y=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr6249291ejb.482.1621538269320; 
 Thu, 20 May 2021 12:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 20:17:30 +0100
Message-ID: <CAFEAcA_Zi3sYZ15R7szGd+Gghm=X2Qg3DwT486_deqsM8os5xQ@mail.gmail.com>
Subject: Re: [PULL 0/9] scripts/simplebench patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 May 2021 at 10:01, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>
> are available in the Git repository at:
>
>   https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-simplebench-2021-05-04
>
> for you to fetch changes up to e34bd02694026722410b80cee02ab7f33f893e9b:
>
>   MAINTAINERS: update Benchmark util: add git tree (2021-05-04 11:37:26 +0300)
>
> ----------------------------------------------------------------
> scripts/simplebench improvements for 2021-05-04
>

I couldn't find the gpg key you signed this with on the public
keyserver. Could you point me at where you uploaded it, please?

thanks
-- PMM

