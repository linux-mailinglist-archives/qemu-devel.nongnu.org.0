Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7C934D42C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:42:49 +0200 (CEST)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQu2S-0003RY-PZ
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQu0v-0002Il-TU
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQu0r-0006Cr-Qu
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617032469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B0tb3aSy9Sj6ZiYkz+VO7oSnpKkaIzhVR5ZrZ4wRWQQ=;
 b=Rl1uG09xL3RT4a1N4k5Zx+b50odWyvJ6z0QNxACBbX5RR3Gu0qjx9f3duYE2npML/W6M8X
 GNCdIixyjcnSUXIYIdzLx5gTzhdUKpN7f7uP41XU2O/xv1UfI3AyHS0rTR5xKMiiXzr8RY
 8qRGjkLkhICJJmSwya1AVKSY0XBiy9g=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-jf5BkxjIN8S8uvJEFTBsMg-1; Mon, 29 Mar 2021 11:41:06 -0400
X-MC-Unique: jf5BkxjIN8S8uvJEFTBsMg-1
Received: by mail-vk1-f197.google.com with SMTP id r1so4602521vke.11
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B0tb3aSy9Sj6ZiYkz+VO7oSnpKkaIzhVR5ZrZ4wRWQQ=;
 b=HOABn0p77AyL99fCJI6IdlNse9+l3fUzhKvotKK8zSbzzQR1mmDCOyn+tDPZigS/YY
 OGP79xX7rkDDbU6Vkce4VHKKVepf/jW2Bk797OkWp4FmQ0Vg5NoQBb1Vgdg1tsuBexLy
 UhC3UgA6Z9DaEnwwEONFpHkIVsUFcCXv2aQP7LYtJLDdSD1z4OVo1XnMMgUVvabEHB0j
 kF5tiNc+lG1tMgvwR4QM4ReAJl/4EFQj0US0/JM3ujVZfqhGXPLJj3nVzt5Uhb5dgQJ6
 waButajWBLTM/9GVVxDGZDYi6EpFJu8izrwuLrajC3P4AdptG3o0ez+rXOlhnmyhTj6X
 JLhg==
X-Gm-Message-State: AOAM5325KdPJ86A8UC7hbaYVuLpy1JkiPj0wU2jm2DMVPYGcdfpJbanh
 w97h6iOdaFqJCFaEUfMWq3FtL3r4bYGyfdGAqYo5T2KPHCvcthPDDNxh4mq+AcYOVx+UJM4XiRA
 8b7KVx9QW5VNjpx4eearWgbsqS4YLIj8=
X-Received: by 2002:a67:8702:: with SMTP id j2mr13757468vsd.50.1617032466132; 
 Mon, 29 Mar 2021 08:41:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/MTQXHFtGhUuHw+wXGhjLSHF0DPswd4W7Avffgn7fR2PmOFp/Q5Mhq0D5Nl6J995OnQU22hc+3uqaD5IM3pE=
X-Received: by 2002:a67:8702:: with SMTP id j2mr13757459vsd.50.1617032465988; 
 Mon, 29 Mar 2021 08:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-5-mreitz@redhat.com>
In-Reply-To: <20210329132632.68901-5-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 29 Mar 2021 12:40:40 -0300
Message-ID: <CAKJDGDYWiaFH88HxxzsKb=ovAghUk6aJLeZsT729a9im9mFeqA@mail.gmail.com>
Subject: Re: [PATCH 4/4] iotests/297: Cover tests/
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 10:28 AM Max Reitz <mreitz@redhat.com> wrote:
>
> 297 so far does not check the named tests, which reside in the tests/
> directory (i.e. full path tests/qemu-iotests/tests).  Fix it.
>
> Thanks to the previous two commits, all named tests pass its scrutiny,
> so we do not have to add anything to SKIP_FILES.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/297 | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


