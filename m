Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051715315C0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:32:17 +0200 (CEST)
Received: from localhost ([::1]:47024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDmq-0006ct-49
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntDkF-00056t-DN
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:29:35 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntDkC-0000uG-Qe
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:29:34 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ff7b90e635so93759747b3.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yg0Kqp9WJW+m/7/byLZWEiMiX8KxPZQGxzxbV3Ng59o=;
 b=qFgo7e/+keqmVN0hAnbxNCyUY/lRoCht43xu9W5yXdGs+xEdBtl27VgKLNLT6Kt7Ui
 lFVYRJkYNhEUrBmjpfPRuhvcu47BX1wXqufpFNowm2YUJ3BUy6FFATms1bv4Hm/YFJb2
 egGthVMPcae4FaTu11SZ9PqMZjDx5svgCjf+bwzksS/PJ+VJwZJAmJUVpMd0RcrpD/Ys
 lP0pelarmaeSYSfGXVZw9owW/frROQwPkJ30qUxZo9kj4s3U6BbqBv52QdMoFd4cu4sj
 yom6wVYrdpcoyT08/0cO2Xg5j4sFftJR5VN6gn3u47ZHd7hOyI2JZuA7CF3xkt6lgZ22
 f9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yg0Kqp9WJW+m/7/byLZWEiMiX8KxPZQGxzxbV3Ng59o=;
 b=BFNKwLy0BkV0BveOi45JxZG1ffRQi2ixx6eY/6aqfuMbzAThk7c88qGQZRCDzMMWZN
 C1D+qQFj/i1nyDkMsns6wuN28gkh2R0QMtHTI7thnrs42dFfDbPXFM+7G4jusbinKddn
 yh/mrBhKD8PBXmYFVJU/sAhx41f8wBjddqrJE7+lpdzdWuC4k0Fzk4bxTIVtqJsJneBp
 JITobBH4m6V/6/LrgGVHVrsGS3nE8SxsM99nUz0pb9C7YGD5M21ZG62NV5AGN5L1ARbq
 ff7UAWsPG+ybnFcaiB9sgkpBx35WNJRJud27jK9qn836TvkGm/YqMCyRd2TmsoAvGtg9
 egQQ==
X-Gm-Message-State: AOAM530pPd/YEkT5xypOn7AZ2C0myg8HNtUVTxt8iChSF+ZOHK8wNdQX
 m5y1D1q9YwvIc2iKmyB7Sit9y2mKH89QeRRT2CzYfQ==
X-Google-Smtp-Source: ABdhPJy3pFoAvqcx0bOXiibGZ81tHndVhEkk/e7IgWXEwVLRjhEmTWazLLZBwkcuKTzqFt+/kx8Vs6Tp2f+u0l4nSPU=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr7797531ywb.10.1653334171133; Mon, 23
 May 2022 12:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA80ABJ+RXFeoH4mo5yJk5oNh4Zc5QTBN35vVOL4eg0cNQ@mail.gmail.com>
 <a8f5f61a-c976-e48f-48e1-e87fecd61901@linaro.org>
In-Reply-To: <a8f5f61a-c976-e48f-48e1-e87fecd61901@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 20:29:19 +0100
Message-ID: <CAFEAcA9w218peNCfjUvT_QwUfAQTbcV5yP80kWMrXRtvYUC=YA@mail.gmail.com>
Subject: Re: proposed 7.1 release schedule
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 May 2022 at 16:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/23/22 02:53, Peter Maydell wrote:
> > I just put some proposed dates into the 7.1 schedule page:
> > https://wiki.qemu.org/Planning/7.1#Release_Schedule
> >
> > * 2022-07-12  Softfreeze
> > * 2022-07-19  Hardfreeze. Tag rc0
> > * 2022-07-26  Tag rc1
> > * 2022-08-02  Tag rc2
> > * 2022-08-09  Tag rc3
> > * 2022-08-16  Release; or tag rc4 if needed
> > * 2022-08-23  Release if we needed an rc4
> >
> > Does this work for people? I just worked backwards
> > from a final release date about 4 months after 7.0; easy
> > enough to shift it forward or back by a week or so if
> > that works better for some reason.
>
> Shifting later a week or so would be better. I'm on holiday from 13-22 July -- unless
> someone would like to manage merges in that period?

I can cover merges during that period, yes.

-- PMM

