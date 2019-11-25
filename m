Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76941091C5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 17:27:19 +0100 (CET)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZHCo-0001ri-SC
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 11:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iZHBD-0000gO-2j
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iZHBB-0005gU-Vb
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:25:38 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40552)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iZHBB-0005gK-O4
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:25:37 -0500
Received: by mail-oi1-x243.google.com with SMTP id d22so13632737oic.7
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2019 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2o5dn9CDmuryJjJvkA+wySeSwVqDnxWVEjoE8J0ses=;
 b=BOXk8TIw979+gfnqmhH9XcQLyj8wd5OW3jDgY00MGhiwWoor1M3TA2bNVfYxOl07vl
 a7SvM1aS5EmwjdNsRlog28j25kN+EQ9ADLZ0SOqxull4DQGUpCbHWzcZwYEn6xLNJxbP
 GJW3CoNbb39MfrFo1W+6NnIH/rMpji+dKTZJBXxlkiReOcyfkVyH5E6d46aEjDngEEJm
 ZWVKlYjvu3bzohlyFTk5nHWR9s9HXFZ+KUE0Dno6r6dv4EqdYP3B/170pM1w6G1Dl0Co
 DemAqkYo74UVDkN2mZVflwhim6NkmD9rjX8nuCv31Gcd3eYCfxbH0by1B4YTw+i+ecfr
 1jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2o5dn9CDmuryJjJvkA+wySeSwVqDnxWVEjoE8J0ses=;
 b=pjeidLOI7/K4ucZlHp0wNacC2Kr/b4FDQaTwve3DkhBiStDsNS4D9OBgjEQyXvEI4V
 kAaoO93W2TXEfXz8VGynZY7G8FKgI6I4u6/jim2PrJ5NmK8Te5hYMgJxOeoWBWIWJEQH
 w+KyLpvLxXlCqaEL8qzb1ds4JfgUOrHkFSUMmmiO1WfL9ygfEKAIyiof9ArtRC2EADq5
 shwMllkZzul2rVvhLiL5PooC/oDth0rZPYLMKKkWqqU0h4qHv5aeOv+8N0nJT0yIGAhI
 aUszRUJ9DBshOurB7zWQqsihGId7iKfvbcl2YWPKUock9KUKHuBopZYNJhcQQL7jU7sU
 MAwQ==
X-Gm-Message-State: APjAAAXAqov3WxHtLAMZY+gEfhLQNsfXd8wwCV9eze8bKcLHJb6aloSQ
 ci9EbwSVSbLd4mHJL2H6sHbAk9W5/jqBToFEWpeNeA==
X-Google-Smtp-Source: APXvYqwSE+UyLEihxzN46wJE7i0gOjS8JG5zQmJTx7PIX3ZvAF07rcASY6rTX7rj9x+1dO+XIHQ9+/lCdOBxXxdmeFE=
X-Received: by 2002:aca:a9d4:: with SMTP id
 s203mr22619908oie.146.1574699136767; 
 Mon, 25 Nov 2019 08:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20191125084403.324866-1-mst@redhat.com>
In-Reply-To: <20191125084403.324866-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Nov 2019 16:25:25 +0000
Message-ID: <CAFEAcA-gvN350vLf6x8S6eKM9wVZFUPfEwOk0-5AiqYpT5Ri=Q@mail.gmail.com>
Subject: Re: [PULL 0/3] virtio, pc: fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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

On Mon, 25 Nov 2019 at 08:44, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 2061735ff09f9d5e67c501a96227b470e7de69b1:
>
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2019-11-21 17:18:40 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to e48929c787ed0ebed87877c97ac90c3a47ef7dda:
>
>   intel_iommu: TM field should not be in reserved bits (2019-11-25 03:42:58 -0500)
>
> ----------------------------------------------------------------
> virtio, pc: fixes
>
> More small bugfixes.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

