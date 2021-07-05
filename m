Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE583BBF6A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:31:10 +0200 (CEST)
Received: from localhost ([::1]:50858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0QYv-0006Y6-Uc
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QW5-0004MH-LE
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0QW4-0008Tu-41
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625498891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQ3LjR4pmXWBlcJZO2dRD0RCOurJjxMBvFr2sZMV5QM=;
 b=DAJR6EpzF0LFEIGbMPzXC8Am0UctWYhwPKZ7WZcZ7+9YPL9fTE6JVtibs2heI/vy9iGQZ2
 PhAzxzhpBknVI6tK5ptSArg5bqdrtyfwQHI3UyIZZt9EO2MLXNYlX0JhSskmyKc/1GcgFF
 Ws+BhD3j5sEMQVaUZhh5hY6QofzGTO4=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-tB_yRJARMx-9AXqeo2mekQ-1; Mon, 05 Jul 2021 11:28:09 -0400
X-MC-Unique: tB_yRJARMx-9AXqeo2mekQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 x9-20020a67eb490000b02902819ed23415so4224036vso.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FQ3LjR4pmXWBlcJZO2dRD0RCOurJjxMBvFr2sZMV5QM=;
 b=eSwxW+iDaKAebQf+JS3J5xkZOXOjukyXN0vCjqUodbQPQ7Z+68pPN/xwhmjpTl0w6P
 8k6AEyVSHqHSI6/CW4ng8NkTGLbDuaT/f7mQ0fkmyyHRxglEJWYz+z5pxKjXPeD4IKzf
 393BrTsG7rDKc5xpz6soLS5+1/U5Jc0fjbAvaM/HnNtZVWmEN3QijhfevdcwovWuo667
 LwnRD4rh7VVR1XtyqqG2uhyUVTug/loGakEYeWhVvvY+divECwZ2gjyZdnRDrX+eoYvV
 bVhn5CU1HmP1+zsfzmFu/0nBkIOczcPp+tttc2xwF7w8Pn/WYfmbFIbjxLnIfBuDR4sI
 mOsQ==
X-Gm-Message-State: AOAM533wLKmdMA4OaD/zdf2KMsHFXLgzzwhNvFgn1txix/ovBlD2Rba+
 uMfDCLFYUhK+9sZ/VO6cLUvn3UoFVKSrxcL44MkRLkeynqRYewEjF+nBQQLS75lNW0XbF169Jfy
 E6YGKitEjZNr/iPyKqJXYQ/C8TGqEKic=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr10008773vsq.45.1625498889470; 
 Mon, 05 Jul 2021 08:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz59BRfFDhRwBSfKcek2aJPeDd5xJ7I51wXqTjcEWMNY6ivChhPFiC4xrscFLHvqv2jjoRX4YkFVIbsPCXlpNc=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr10008758vsq.45.1625498889286; 
 Mon, 05 Jul 2021 08:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-5-f4bug@amsat.org>
In-Reply-To: <20210623180021.898286-5-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 12:27:43 -0300
Message-ID: <CAKJDGDZOFXjZ2uF28xwxPUWe+zSHNpOpv3eB_rvUT_jt2MaKNw@mail.gmail.com>
Subject: Re: [PATCH 4/9] tests/acceptance: Extract image_expand() helper
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel <qemu-devel@nongnu.org>, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 3:06 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To be able to expand an image to a non-power-of-2 value,
> extract image_expand() from image_pow2ceil_expand().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


