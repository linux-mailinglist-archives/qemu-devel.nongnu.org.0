Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB3838CBF7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:20:29 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8p2-0001Qi-Gd
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk8nh-0000dS-Ui
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk8nf-0001dd-5I
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/WwzV3BHtqSyYlFWGuIjPsEAe23NipHCwEmx9VGKk44=;
 b=bYL8wcX7VaeoHJYTas5pnqPag89fQ3n/j+IL784bIECHSREfmPuWMbzMZv+OhBkKmFuYZX
 CG6uk3aGiQAU43l0JStjiuNBbnn+uU9iP2mnRZ8922ZwkXAVxOlsxk5dY27AoXO5+JF8Fb
 nEPvQ3QkGgcX2HEQfQyJ/wdmCkgTg4M=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-4oTcdmDIMd2y_A4V5nVfkQ-1; Fri, 21 May 2021 13:19:00 -0400
X-MC-Unique: 4oTcdmDIMd2y_A4V5nVfkQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 i9-20020ac5cbe90000b0290200c541e86aso1127456vkn.18
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 10:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/WwzV3BHtqSyYlFWGuIjPsEAe23NipHCwEmx9VGKk44=;
 b=cMX4QEzJz0XoY+80OW1ZnOPt+cDM5puxmWDqu7DxyoJk0o+3a/A4ewJSTbldTbeiAP
 LjWeWazCi15CUl/g/yabaw+WITA16/Ro33XiAlxb7dcpqpAcKFeN4q9tJ8Q3yjL51Xd5
 ba03aOPHmr1555wpiiahWRqfwZKPzh4hk7J56565uJ8a1Gg9bPqe2it2wUhJLgEy9yFV
 tUKX+2Nn2OXC9WKxEdbhPlu9YgITsTp0WkWrnhHv4kv+oVeb0L1k/B5I6sO/itIFzxCI
 VXCSRAgEcdDp3miIRtHUf3Kh8XkKQvE2IE75hrbDOo6Pkx4aLpcKx6L+GD43F806m3k8
 ruAQ==
X-Gm-Message-State: AOAM532Nl/a6++m7/i7iC7yKPYAn1+AdBWiv4LD8CqzMAX66RaOsdFVY
 TEf30XHG3MVbHMEK86AKdJZ7aT832dDtnRCKGIK8897hJLgCyGzu6f7Bsu6so944+usKdwq2IpO
 LEc9xz8aHtkNwxO76rXiwuZvDZf6LJ4s=
X-Received: by 2002:a05:6122:124b:: with SMTP id
 b11mr11906013vkp.11.1621617539949; 
 Fri, 21 May 2021 10:18:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXKKW4YPi/H6ygtYS7yeW127CqJUB7pjBY21wUAbjytYkX66/CH9NvGBW4mFkELgehW6ljszhYR2fX6SXCGBA=
X-Received: by 2002:a05:6122:124b:: with SMTP id
 b11mr11905990vkp.11.1621617539817; 
 Fri, 21 May 2021 10:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-4-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-4-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 14:18:33 -0300
Message-ID: <CAKJDGDZX-hwQgcKhOv0ahPu8PRs4p6HBcEmz=gDPnTbE+SfA4Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/25] python: create utils sub-package
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 8:13 PM John Snow <jsnow@redhat.com> wrote:
>
> Create a space for miscellaneous things that don't belong strictly in
> "qemu.machine" nor "qemu.qmp" packages.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/__init__.py           |  8 --------
>  python/qemu/utils/__init__.py             | 23 +++++++++++++++++++++++
>  python/qemu/{machine => utils}/accel.py   |  0
>  tests/acceptance/avocado_qemu/__init__.py |  4 ++--
>  tests/acceptance/virtio-gpu.py            |  2 +-
>  tests/vm/aarch64vm.py                     |  2 +-
>  tests/vm/basevm.py                        |  3 ++-
>  7 files changed, 29 insertions(+), 13 deletions(-)
>  create mode 100644 python/qemu/utils/__init__.py
>  rename python/qemu/{machine => utils}/accel.py (100%)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


