Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3EC364B19
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:23:00 +0200 (CEST)
Received: from localhost ([::1]:49196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaQ7-000632-Nm
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYZgZ-0008MJ-Rz
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYZgW-0008J0-8Q
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618860951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ev10w6+tWgOOgZDrVXuocF4yKptTqy1/dsiI/LxuVlE=;
 b=eIuIfCrTtty0UzWM+6noBG9bnZGSEWNKCuMANAhyggH84VxI2ZoukFKdd4qT9WxI7H0TbX
 9e6im+avRYyJFKBqwxTr9Q3XqXu72FNOkf38MaXlIS+Ye3twuFM0jZHwrUfUI5YyTGUThX
 smQlhnFJA8CWZQoi50UUFPqgnTi06Vs=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-ucQf5KisPU63TGKqUMnOag-1; Mon, 19 Apr 2021 15:35:49 -0400
X-MC-Unique: ucQf5KisPU63TGKqUMnOag-1
Received: by mail-vk1-f199.google.com with SMTP id
 y70-20020a1f32490000b02901df8c87c514so4952333vky.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ev10w6+tWgOOgZDrVXuocF4yKptTqy1/dsiI/LxuVlE=;
 b=tAjhY/o4UcEyfnsSnDu8XgSqZVHrcPGJltKBNJHWgmiMCWx2Ds8OELXT3c9jiP11pD
 UAocvGnlIz1VNfktNI/itr3MYXA23HD2aKpzCLHFTnR2j3Az025mpQNx6v/jt0vj5iP1
 t0sFS1fAEiIBkRffSkMvjFmBAObOiguFNBJlCjrSXzXX7xrUpAQbeuRIB03d5JdQF+nV
 KZ4oP9mRFvQgPPoT/8kuR/brKwxthjwvMp1X8WZrpGK4SSxB4WoBT+H7h0Fk1qDcvKLC
 pqlsKKdyLjL7L+ClccXuNPnkbN6/5fjvwyNd2W0N8zxdq2c4i9yWBfKvZPPw/oFNSxq/
 ctLA==
X-Gm-Message-State: AOAM533Egba+HrcfY9f91JVc+u4SfnVODvINT6duaxv+AdDxfSZQFk8k
 zJx52xoGTCR1tjJVI244K9QfULfYvOTleQ2REx0BZa5EgogHbB2neqrYaMqMsWRDxxaAy8Tv0h8
 dC2STNj/Qk7KpaSlSrmgNiXI0NURlXOw=
X-Received: by 2002:a9f:2069:: with SMTP id 96mr9527784uam.110.1618860949144; 
 Mon, 19 Apr 2021 12:35:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTylWLOFMgKBz/1PFyR16ohEnc+q1mcz+FFbn4r+HxdB/jowcI3aLHMNxlDwpPbjxC81tk6twaCnuTL6ypzWU=
X-Received: by 2002:a9f:2069:: with SMTP id 96mr9527764uam.110.1618860948965; 
 Mon, 19 Apr 2021 12:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-8-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-8-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 19 Apr 2021 16:35:23 -0300
Message-ID: <CAKJDGDZnyHyoMrn31f9pQ7rqFai3TGKtzCBVV1VKx+rP+318mg@mail.gmail.com>
Subject: Re: [PATCH 7/8] tests/acceptance/migration.py: cancel test on s390x
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Auger Eric <eric.auger@redhat.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 6:52 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Because s390x targets it can not currently migrate without a guest
> running.
>
> Future work may provide a proper guest, but for now, it's safer to
> cancel the test.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/migration.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


