Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD21D30AA38
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 15:50:35 +0100 (CET)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6aXC-0005vD-2B
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 09:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.streetman@canonical.com>)
 id 1l6aVo-0005TI-BG
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:49:08 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <dan.streetman@canonical.com>)
 id 1l6aVl-0005ds-Ot
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:49:08 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dan.streetman@canonical.com>) id 1l6aVi-0002cO-Ok
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:49:02 +0000
Received: by mail-io1-f69.google.com with SMTP id f6so1539425iox.13
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 06:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VLoh9WY6fdyzxtIrjzxG8lWbpmP/zoJvqEY2Hz0+sEE=;
 b=DegKcPBS1ecMO2jHZyDjpWABpTBgPnkAssgqx0doL5DcWYNk+gVXyEK5RbX4ZvA8SC
 qpAHxBhywPnZHVPB5IvQTJZr2eiZ8WCeMHVRNerVLtZbOZ8EXi/p0KxgjaiFPLN8607U
 1CNs6uoLmBf0Kr1A851Mt6VxXj6E4NIVVWm35j7GIOXVsKbWp1H6zkQfZaldwXSH+npP
 3zWCOea/BduJ3s8hqGgnflbmMQKfMUNsLb9wp0XfiVD87ZRPr2p9EiSCj17enJceApBG
 t3F23mldsVsbo8tZWEFK1qE17rEBsrc6z/Ox7X8y7t7nyOQKbrrX9I0pUnIX2ZZPgVgq
 aZeQ==
X-Gm-Message-State: AOAM530v5jheFnrS6uT7LcC7DQyGg8VRZBOJ8K8PtsKdy65MwhBPnx/1
 hzuQbISurHzuJ/wRkINHPYcDOLBSYrnBqdFZVgFiBXkf+s/UIUXEliZ1BFfpLxEjIMb46nceYOY
 mByu4G3F0yYizfJJo07vixMLQEJv7ChtK5rx299qWq7s5orcd
X-Received: by 2002:a5e:de04:: with SMTP id e4mr1257029iok.122.1612190941746; 
 Mon, 01 Feb 2021 06:49:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt6G+FGikHGOYBxIhHiquCy3Frawkewfsvv48Llb+RYmvcct5vuSiRJbLVfKrgGL2XywVCz5BwUpRbDdASvDY=
X-Received: by 2002:a5e:de04:: with SMTP id e4mr1257010iok.122.1612190941454; 
 Mon, 01 Feb 2021 06:49:01 -0800 (PST)
MIME-Version: 1.0
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
In-Reply-To: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
From: Dan Streetman <ddstreet@canonical.com>
Date: Mon, 1 Feb 2021 09:48:25 -0500
Message-ID: <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
Subject: Re: Makefile has local changes that will be overwritten
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=dan.streetman@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 1, 2021 at 9:23 AM Programmingkid <programmingkidx@gmail.com> wrote:
>
> When trying to build QEMU I see this error:
>
> error: Your local changes to the following files would be overwritten by checkout:
>         Makefile
> Please commit your changes or stash them before you switch branches.
> Aborting
>
> What I do to see this error:
> ./configure --target-list=i386-softmmu

Sorry, I don't see that error, what commit are you building from?

>
> I did some bisecting and found out this is the patch that causes the problem:
>
> commit 7d7dbf9dc15be6e1465c756c2c5ae7f1ab104fc8
> Author: Dan Streetman <ddstreet@canonical.com>
> Date:   Tue Jan 19 12:20:46 2021 -0500
>
>     configure: replace --enable/disable-git-update with --with-git-submodules
>
>     Replace the --enable-git-update and --disable-git-update configure params
>     with the param --with-git-submodules=(update|validate|ignore) to
>     allow 3 options for building from a git repo.
>
>
> My Info:
> Mac OS 11.1
> Arm64 CPU

