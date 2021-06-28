Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325703B6697
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:20:27 +0200 (CEST)
Received: from localhost ([::1]:42928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtzm-0002qN-9c
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtpM-0000PK-5G
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:40 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtpK-0001vN-84
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:39 -0400
Received: by mail-ed1-x531.google.com with SMTP id w13so20757415edc.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/bev5peMyece0Rfy9fUaAxN/cpHl1LX/bzOMelBw64Q=;
 b=BZ6rcjuRAdCHdB/BZGFs86B4T4Nxipj5/QrD092v6lCjxh7R0ZaiNIFmsi86lfSKVJ
 K+qLl0A4GZrey2BOTqzuDoPIeo7YGD6SCSWK5tJoY/sQ24ZxxlJ5bs6osccjti9d+iYr
 ysx9VgVOguvRkcNlqb8NE8TDF240TSvemP3htnthR6ah/zDlGU0/ZmmsRn1BK1IulRJM
 1m6EZVjv/8nm8ojYY9pfF4AbRbfe8sSV+ZL58oNjO+zToog2i+epJg+bSmtJP9s0X0X0
 QWvRIytSEro5zArEER5xeA/je2QzCb0lE9DLr5nVXU+6kgToxFTmLDhFZqqCCYZo0YXO
 FtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/bev5peMyece0Rfy9fUaAxN/cpHl1LX/bzOMelBw64Q=;
 b=QgcM2iyjLYEvTz3Oq2NGQiod2nZJpMkDhEh5ym4G46ZfK6FAQ1XjWne8qcFBVaf+FR
 avByPvF/1Xbd53KxZshrT0r1k71wn2tlXTJNmqfBps4MElEMQbHVItRrNDVTri0K7RZA
 0+gckOg4RFiTVKOCFDseVdJjGy7QKK34t9uBMJ/h/4orKTQhLdFLjvYZ5kuF2jqyYUIy
 mYh4Y0UiRaNdmyu9zRz/8zMCBenQqBmxmIQoIwuDhhAVX8FkyLajGaYSJ0WIOWjyPiM8
 yevQHuf6ZJ48VV8YWCuDL5Eantf51sKXV4f3fjP0J2cHm2oqFRMhAkhlI80XYBItLw+F
 1yzg==
X-Gm-Message-State: AOAM532m85IMcl1SHArB6VF+2WXMJGjTN2R9idMMTGBcTopOAxeYQSyr
 cr/dFY2yOSTc7gV9I/Dz4pWWFIGUZhbFttvc3ZH3BNhMtrqemK1O
X-Google-Smtp-Source: ABdhPJx0cN+TF8jIa5mRmTjn6yuYua8ZEB7q0sYdNs4DsvRf6WUdBHw7Ti5BRx6ZLmPZCJJ8Kj0Ijk0DGri2u/cr60o=
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr33698335eds.251.1624896576833; 
 Mon, 28 Jun 2021 09:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 17:09:00 +0100
Message-ID: <CAFEAcA_j+vQt_a5zYYghmBdo-+G+_sq3yV40w2CQSJ27+Py8Eg@mail.gmail.com>
Subject: Re: [PULL 00/10] Block Jobs patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 14:00, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> The following changes since commit e0da9171e02f4534124b9a9e07333382b38376c6:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210624-pull-request' into staging (2021-06-25 09:10:37 +0100)
>
> are available in the Git repository at:
>
>   ssh://git@src.openvz.org/~vsementsov/qemu.git tags/pull-jobs-2021-06-25

This doesn't look like a public git url. I'm going to assume you mean
 https://src.openvz.org/scm/~vsementsov/qemu.git
(the remote URL I have on file or you) since it has the right tag/commit.

thanks
-- PMM

