Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C252A20B3B3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 16:37:18 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jopTh-0001ef-NH
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 10:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jopPd-0006KV-EY
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:33:05 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jopPb-0004oH-OL
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:33:05 -0400
Received: by mail-ot1-x342.google.com with SMTP id 72so8812422otc.3
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nX6X95UqvlMI7EQX5jPP5U8M/5fPDmbMAURaJJ6lOLc=;
 b=jECW8HyGK5owBpVJAvP64CR7uOKXbeVQ4xwt9Btohk7lH0d1VYnRYdKjqO01FtL5vl
 LitWMyifixj9l3YniwkMj/5QOOiB9wh2zEB9rYIAcZRzK6kJBi3hRsbZbPkIrzLd8x4x
 xJYCwoItua43uDzjVqKQNi1KlqugiwnyeqnMR6poc8jLy34Wt5dA9J6yDPaJ6BSOIQdh
 EgSv3twfOUHlRLP/PewG342ktLthCCjAMZmWDYCI5INOp5DYjg+PNHbIVN4jvNnQm3vN
 j6b8Jh0mWLFmRoWi7L85y2zHD7EkZ1uIcw5K52EVK7hhEd7DM2czKCG8EaVeDWfDuoY6
 C3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nX6X95UqvlMI7EQX5jPP5U8M/5fPDmbMAURaJJ6lOLc=;
 b=XXJt76eKFXHbULRMiROXzEO57JHi9QTgxGv6x84j1Cmdt9lfmu+EzrqwbD2nJvGhOK
 3b5uI2UK/sFI5hq3c93e08EjNJHSIaYJ4dkUZkjyo27hPjgkgivG3kX41T2kqtKm80I1
 K5szkY7VZRr2ppt/J7pgBbtznSb9w3sQ2WH/8K/nLAG+e2D9EfxXtyo+KYvf0A73KMxG
 YogeyZvxa0OyQomSj3KC4wN/8I3QYDgYVJmBQgq6bLf9MtYW0RwdrXwB8+d+SN4MGJTx
 +Rqg8XW4C7UqA4OwRP0+ON0MDiudpxh3lON9llydPbrw1PueDPT0cYq5/l1f+vXvLgar
 hlTw==
X-Gm-Message-State: AOAM53100kUHRcTm5LqC//ZM+zJbW7y7KkikJ8XNCF3ytF+5hk7r6dh4
 B5TwL7I3ekH55uhE7iJjEqFJn76geeJaTUQXqlhesA==
X-Google-Smtp-Source: ABdhPJyzxen1/ysk6PxS3uaywQeWXbYvd5IEKaIrKO3y1qHH6nNOz0v/LXRjqF5T6Pp1JEksicenxSCyEJSZ0FYAPRs=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr31007ota.91.1593181982365; 
 Fri, 26 Jun 2020 07:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqwDLw2BJ9Cf0kEyUW+J+rTPOOvebRPPkBSiWdD50wct5Q@mail.gmail.com>
 <CAFEAcA8mpiPcwgz9-7c0GgSWz2hujzegOBvHn5qasCBtuyG8ww@mail.gmail.com>
 <CA+XhMqwyRmQ7Dtawm4tMEMRJ9EEfxep8WC6qSRCEC_WyUptG-g@mail.gmail.com>
In-Reply-To: <CA+XhMqwyRmQ7Dtawm4tMEMRJ9EEfxep8WC6qSRCEC_WyUptG-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 15:32:51 +0100
Message-ID: <CAFEAcA-fj++yDKCbvfXWduVxTPsAhSkFKpEHcvcCvpdO8H0Cdg@mail.gmail.com>
Subject: Re: [PATCH 1/3] haiku build fix second batch
To: David CARLIER <devnexen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Jun 2020 at 15:10, David CARLIER <devnexen@gmail.com> wrote:
>
> I sent again minux the ones already approved.

Sorry, I intended that you should send the whole
series, including the ones which I've reviewed.
(Where I gave a reviewed-by tag, include that
tag in the commit message when you resend the patch.)

thanks
-- PMM

