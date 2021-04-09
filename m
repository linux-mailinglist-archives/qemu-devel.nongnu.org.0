Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F635A388
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:38:48 +0200 (CEST)
Received: from localhost ([::1]:58244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUu9f-0000LA-HW
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUtsm-0006gP-W8
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:21:21 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUtsk-00060n-N6
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:21:20 -0400
Received: by mail-ed1-x529.google.com with SMTP id bx20so6063355edb.12
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MsdJCIF452kw0KxEQVPo7BfyP3uU4VjU20ZAjy8X6uA=;
 b=HJUJSFyiLpoKLz3/nV1lT5OvOc48/YfhlRWgXnG22ovr0arVZG1knbznw0OvddsEx5
 h3eVoute87w0ba5d2t2VN6W1Lj9uXgs9R62Ug8rvM9Vl4a8+o8FFhJkjv5xlUVNYytoz
 Q8vykHMyn7xAeFMYGew/qbtWhxBsAgAB/BWZLvUQ8mMm5r4yjdap9+XTdrsah1Rg6qog
 ro/nAfJOxSxZ9NOtv+ZdQimfL7cwi7RtJa3o4dbH40rcMGL4kfmg5z7/c4ijrZU8XAD5
 0/D7ICxjISC+hrfkOc9YALCu4uHmEMuNjLil0F0mDZBb6FxXPRUVO95WRvQpXonkhyNJ
 8w5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MsdJCIF452kw0KxEQVPo7BfyP3uU4VjU20ZAjy8X6uA=;
 b=EYx9pfoqIYbuKksVHu7e3eEII3CRHgRRlSVXuDWvyB8SqzmflUP/eUQv2PdluiinDJ
 Tg9f/qJ3qedDa7Qw/wTERjHsq3Iw+Chiy8OVEQeRb0csIldQmxL/ZrarfHvOr08JjKxQ
 vNrVcjC71WIAI7DjzCa5XHRC4P5vUpn2bjUYWhWPNiUL+qEerY/i2VTkd7a6P7CQfLdB
 dYvLqVb1MFmE7I+DqYQYachRJBxLEZusjnr/UUtfNy3Pznjf8qxQfqI+vZJRzCn62DD9
 VMmpsrJLyWLdbijNdxD2dYjCDLy9mYkADO1eC0EIlaWybcZhT41ga6uZFWf9xDLbtF4q
 eJeA==
X-Gm-Message-State: AOAM53297YXuL4QCOKNDVBw1XMdM9czEyODQkBDxOJSuQ8DkJKPHvJqa
 9w3IVqIvqkrVfQhG8xWk7jkK+85Tyu/wqVkZTmilJg==
X-Google-Smtp-Source: ABdhPJxYZiv/w0mBuuxOy39p7KE3xjMJ+k7ctgks9wez3wXhtPpG62/C0RYxUdjDY0JTtCcBu/YPclWF3CUY26LpwUc=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr18090578edv.44.1617985277242; 
 Fri, 09 Apr 2021 09:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210409130931.382887-1-laurent@vivier.eu>
In-Reply-To: <20210409130931.382887-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Apr 2021 17:20:35 +0100
Message-ID: <CAFEAcA-AmDsEv+S1gT48sdzu4xnfX=HFBWi4p3i4ciyax8A0Zg@mail.gmail.com>
Subject: Re: [PULL 0/1] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Fri, 9 Apr 2021 at 14:11, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit d0d3dd401b70168a353450e031727affee828527:
>
>   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to 360f0abdc51652b06a3718ed43a8688562e69ca4:
>
>   linux-user: Use signed lengths in uaccess.c (2021-04-07 18:55:27 +0200)
>
> ----------------------------------------------------------------
> linux-user pull request 20210409
>
> Fix lock_user()/unlock_user()
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

