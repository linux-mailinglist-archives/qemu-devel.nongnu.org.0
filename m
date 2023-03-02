Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79AB6A8452
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:43:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXk8S-0002Ux-2a; Thu, 02 Mar 2023 09:42:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXk8P-0002Ss-Ii
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:42:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXk8N-0005LQ-Qy
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677768134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXVHmIT0NVzS/nzPhxgKDoqSFBAo5SFr4JP59PeKt74=;
 b=Jqz9I2gAGoxtMngsV/+MO2yJzc+RyA1WhyFQJJAnWg4K7Xb4cS8mnhmPZjdayhmsQDNBlR
 2GYRNbamtQxeDb5OPJxwKtJNxBmcGj13QBtuYYpGa/hy40BY9xQm/fdJVZ5Z4gTcL4xd91
 kVUsFxeCNoGVBH/DLqsZ3TbVRvuZlis=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-L7LuOIC0OByKf-8g4WItBA-1; Thu, 02 Mar 2023 09:42:13 -0500
X-MC-Unique: L7LuOIC0OByKf-8g4WItBA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so1171292wms.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677768132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXVHmIT0NVzS/nzPhxgKDoqSFBAo5SFr4JP59PeKt74=;
 b=34bDsIXugEGIiUuXjsvDTPlW5NpNeK4EDwRLudlTMQKIcyLW17XAmOqD+LgjaZgm+b
 pc3auYu7vsrK2ipCQCQxwWBt+8SUsnGM8LBjp+AbE7qhZxo0PKxv69wF6L4X98gIvExM
 y2Pkd1N39AY3p+lCjZkfjAfGkDjsd4m3OjFD7goKiJwbG+hvAJ0j4qga3nEpAY+qxP99
 1nUiIMT42gq26B6lGboN7TcVJFBNXCqR6C1oiaIRMg+jBVAnfIwv9b/VQ2Sv8WHVMR4y
 /jN2V83Do/Z8twSNUoNvX9/JbVLkRQZSYqI10naABk/VO2rQpsPUlZxMIV3kRa9yMXql
 MRhA==
X-Gm-Message-State: AO0yUKXQNqRleBwquNoh/XfdeJA86s7Pth7Gdk87ikv9jF9g+2G4rZlA
 Rol0F2ToqjlpW+ZKQ0HgLM82pj7iJL/8L2S3Kbf+bfNnUSKq5kqIgRVkuN6GkfHk0PwTwAd5hAI
 dGMXvA06U0HxY50k=
X-Received: by 2002:a05:600c:4aa7:b0:3ea:f6c4:5f25 with SMTP id
 b39-20020a05600c4aa700b003eaf6c45f25mr7980426wmp.36.1677768131943; 
 Thu, 02 Mar 2023 06:42:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+RBv1hbyj6VAk3vGx8YZRl5yQiPHFosd0d0jUofOK6j+mWA4BhArTwYwWQPPW4SIaXv9ww8Q==
X-Received: by 2002:a05:600c:4aa7:b0:3ea:f6c4:5f25 with SMTP id
 b39-20020a05600c4aa700b003eaf6c45f25mr7980415wmp.36.1677768131679; 
 Thu, 02 Mar 2023 06:42:11 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b003e2066a6339sm3158547wmb.5.2023.03.02.06.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 06:42:10 -0800 (PST)
Date: Thu, 2 Mar 2023 15:42:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH 2/3] hw/isa/vt82c686: Allow PM controller to switch to
 ACPI mode
Message-ID: <20230302154209.4eda6225@imammedo.users.ipa.redhat.com>
In-Reply-To: <78bc4dd9-f713-3824-1d87-74f3011b019d@linaro.org>
References: <20230129213418.87978-1-shentey@gmail.com>
 <20230129213418.87978-3-shentey@gmail.com>
 <9611ad50-1c60-de0a-e8e0-85b487950888@eik.bme.hu>
 <78bc4dd9-f713-3824-1d87-74f3011b019d@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Feb 2023 09:00:37 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 31/1/23 15:54, BALATON Zoltan wrote:
> > On Sun, 29 Jan 2023, Bernhard Beschow wrote: =20
> >> Adds missing functionality the real hardware supports.
> >>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >> hw/isa/vt82c686.c | 18 +++++++++++++++++-
> >> 1 file changed, 17 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> >> index 2189be6f20..b0765d4ed8 100644
> >> --- a/hw/isa/vt82c686.c
> >> +++ b/hw/isa/vt82c686.c
> >> @@ -37,6 +37,9 @@
> >> #include "qemu/timer.h"
> >> #include "trace.h" =20
>=20
> > Why does=20
> > acpi_pm1_cnt_update() take two arguments for a bool value? Can these be=
=20
> > both true or false at the same time? =20
>=20
> No, this is a one-bit so boolean is enough...

one boolean would be fine unless they were both false?

>=20
> Maybe unfinished refactor from commit eaba51c573 ("acpi, acpi_piix,
> vt82c686: factor out PM1_CNT logic")?
>=20


