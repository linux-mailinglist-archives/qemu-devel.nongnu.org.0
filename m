Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C642D3B1610
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:41:25 +0200 (CEST)
Received: from localhost ([::1]:51866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyRo-0005gD-CB
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lvyQa-0004tX-B6; Wed, 23 Jun 2021 04:40:08 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:47001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lvyQS-0000J9-9E; Wed, 23 Jun 2021 04:40:08 -0400
Received: by mail-qk1-x734.google.com with SMTP id f70so3101457qke.13;
 Wed, 23 Jun 2021 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GcgvlX6s7qp5uavNKXdNgky5KbSH+W2ptbaa0mkRtzE=;
 b=sXcfeA3F2QE3wql2E8baWmdtJusqP94xLzMnmyXiO5dKQ1tfQgUXU6hqOn88lkhD1v
 0ltFeNneW2ak37dkDShqjq3Q2ulDWCEQnuBQrNztiR6QTXehXlhQGsPJciy+NFlr7zWb
 HGn5Pgwu3CjciVqVjxIe40ff4AjJw88OsHVsycDQcnca5xxWe6XseZ1HXKv1GTWdVEg2
 X9OQrL3xItSmDP+OWviLyWBsjmnQiRaSjTltIFr7d4ccP2ORIZyU321L4TMmYNb1JBQF
 BHOWzZJUCHVdwR0zZJx/5nt5eV3+ORVWAMH/rYgyMjjbPEW2qwWbcIml0+bWfnYrKfh9
 eYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GcgvlX6s7qp5uavNKXdNgky5KbSH+W2ptbaa0mkRtzE=;
 b=UFrUu/m+jebBz8fFZzQD33b55quWsUlXCe/zpGXzBexstjcy6pXq90R1QO3Ib23Qfy
 nWtkjtytIvxhFvyewl2EIKOYZscJ7GPkjBKoFItmPDmBT6srpbeLvPqCqxHcCRcj4uJp
 q+1z4OfNXPVY21mcMKcS2taS+ScNY7bb5USLBqgzCZzVFRVuw0DePRl+1d0DEvavojTW
 ds+Ul3pYmm2RU0YhEaTE0gsQp4aAfyeUyyP8Rry/cAqYgrP6/1T0r4X1AZ/L/YJvttux
 tyUoX6LXtiRv0sb7oqEbcHWWEhNEP6Qe63ZPXqsxTM//xZR1NLpFPdn+oU5OL74cCnlY
 BIfg==
X-Gm-Message-State: AOAM533gvlKxGhZN68aQLSe+4TxPV+4MKF3LMp3h5pYpSwbYesxKRmg2
 Mzhc+2UnKC0StNNfGvWpVfjVkjbofN+emQwQ7Cc=
X-Google-Smtp-Source: ABdhPJxVHMDkEKJ7XonImWtTh6jaaZYbKRlEtJpZ/xQ0m6KRVrXujm5z+htTOa9vC1qKs4m754TV1Y8Vx+IMU4LuP3A=
X-Received: by 2002:a25:b8c:: with SMTP id 134mr10653574ybl.332.1624437597227; 
 Wed, 23 Jun 2021 01:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210623083004.245894-1-clg@kaod.org>
In-Reply-To: <20210623083004.245894-1-clg@kaod.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 23 Jun 2021 16:39:45 +0800
Message-ID: <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
Subject: Re: [PATCH] sd: mmc: Fix SET_BLOCK_COUNT command argument
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 4:30 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The number of blocks is defined in the lower bits [15:0]

I checked the physical spec v8.00 and it says bits [31:0] for CMD23 argumen=
t.

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/sd/sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Regards,
Bin

