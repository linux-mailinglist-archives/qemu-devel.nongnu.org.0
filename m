Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8C3E4DBD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:19:14 +0200 (CEST)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDBjt-0004sv-QT
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDBj9-00046Q-4Q
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:18:27 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDBj7-0007ah-0j
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:18:26 -0400
Received: by mail-ed1-x533.google.com with SMTP id t1so22574edd.6
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 13:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OLB5nZz7MVUTXaNVIe7rKCoUtQNd0nFqf0e/3C1/eSs=;
 b=MdhKA91E31+OS4fW7RC9pVAT5+Soo9RGRZwRdCbfbRxMXf7Qk3NhWIfdJ83krvLc/W
 FVlkSbogu5rTOKQa8qDr0CbcDskC7p0IpS/0Ff4b4tBoP93F+Iu8c4fE0B8iBqeq1xx3
 7v0C/wuYlAi4tZKFy7PwlIAh/IfgLVHOn++WCxXk3rOcSeABFS2PCX6Zg5WUYGLw3aPu
 o4eh6peXmW6Uzkdw7PCxbsJv47T0fP6tS++uDqntuWiC7wKJEgKiJMvh1tIR4nfdH+uv
 YIrELex8wqMGQtpCFhwq1SErUZ2qafWDPDI+aCatQ2TPe4G9HSyYYpaWGkbvzI3spEmf
 UkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OLB5nZz7MVUTXaNVIe7rKCoUtQNd0nFqf0e/3C1/eSs=;
 b=pKRciswo2q1+Tb/H08DMxIgX9HTDJeifHAmXixO03nkV+vNbRzyoaOUi2ogs645fzB
 TqMF2I+lk6Ipcb4qGW6GE8xK6ICuFT1VATy9+FgHaWLHzLHUuSfJq1a3wfa6pH4ynRv6
 f1Vj24gzsIx8NqyhzGbMRCzigBes8DClCfhqiVX6FHDNkyCOqVXLW8gIseuofexfYe1B
 Iwej5leZxvvm/Dnkrsn+G/JMZ5DQlGVaeN4RIW9CH6vbusZhjsRfMH+9GEy4Quzs4WeB
 OROXI4kbIQcFw5TLguBJDru9bddB0WlGJvzmPtL2iUzCHTwFUQHfAnBPi03K/zblA6Ag
 AYyg==
X-Gm-Message-State: AOAM532TbzJ9MSpWDmR3u0KTgbLlRIzbYxl+J9u9IaEr1gkTqoLT/9Jn
 pMf9hlxQdDDs6ETm/DiHn/SVQwUcL48zvUk4OxrG9g==
X-Google-Smtp-Source: ABdhPJxHrSiOpB4WGfVS5K8tG63IP2UIyOPdyEBSak7KHE9DaPaQbbqHhyqlNFB4fjL6f8JN7vZlDLxk5gDwxl6fqTw=
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr124249ede.44.1628540303263; 
 Mon, 09 Aug 2021 13:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210809170319.740284-1-hreitz@redhat.com>
In-Reply-To: <20210809170319.740284-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 21:17:38 +0100
Message-ID: <CAFEAcA8SUJTFBCy-ws-qswc5mKbko+HuS7W1R2=r7BpRTjgfJg@mail.gmail.com>
Subject: Re: [PULL 0/2] Block patches for 6.1-rc3
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 18:03, Hanna Reitz <hreitz@redhat.com> wrote:
>
> Hi Peter,
>
> Let me prefix this by saying that it's me, Max.  I've changed my name
> and email address.  I understand freeze may not be the best of times for
> this, but it looks like I can no longer send mails from the mreitz@
> address for now (only receive them).
>
> I've tried to create and sign the tag as Max, so I hope this pull
> request won't run into any issues from that perspective.
>
> (For the future, I'll create a new key and hope signing it with my old
> key will make it sufficiently trustworthy...)
>
>
> The following changes since commit 632eda54043d6f26ff87dac16233e14b4708b967:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-08-09 11:04:27 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-08-09
>
> for you to fetch changes up to a6d2bb25cf945cd16f29a575055c6f1a1f9cf6c9:
>
>   tests: filter out TLS distinguished name in certificate checks (2021-08-09 17:32:43 +0200)
>
> ----------------------------------------------------------------
> Block patches for 6.1-rc3:
> - Build fix for FUSE block exports
> - iotest 233 fix
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

