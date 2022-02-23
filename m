Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C24C0FC4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:03:05 +0100 (CET)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoUC-0005yL-Ma
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:03:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMnoe-0007xp-F5
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:20:08 -0500
Received: from [2607:f8b0:4864:20::1129] (port=43070
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMnob-0003y9-PA
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:20:07 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so147989797b3.10
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nXCLXxB6HCrscA7vtjaiHnkKr4QrAkuVD/lkEVxIKbQ=;
 b=UaQxdwj5S87gVF8hhKphMX9feVRNS3B/SQYGSeSld9mFvZyTcbDJt1S4aD+ZECTuby
 tiUxdGddedY2/AyxRLqRVVqNZQkoj+vonwzSq3ahQKVvy15C7VBkrUxKXq2xdr19yAfb
 PjMdJbeV58AS30Iy/nc7uX3wpEN0lWQoWtcX3O0kvBYPry27zv6qz42neodsQ2F9huYC
 z8xaXsbiJ1O2G4xV9wM4vuOMhP0KZPrjhhezTl764reuLyvc6sKG6QoF798rKO7iFTSk
 LzQBRyAWYIwGXlVSMzdeJNWkBNT+4Hn9qupAMyVB/rjjy4Xq5y0YNN/9sI7vWE7iW7u0
 yhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nXCLXxB6HCrscA7vtjaiHnkKr4QrAkuVD/lkEVxIKbQ=;
 b=Wf8nCdZeiLddqfutOzSSWpF/R/i/CwM6F+5ymf+yx7TKcPHjINFqCb8eMCZl/IUmO/
 /83gZApXzxGNU+vjBGrxMxPXAWEs/GcFkgXpnphZ4ic4I0eGJZxarNOV2KkHNw1khZM8
 bzMPRdizsL+qNkQV7h35BR/GJwMhPrFOgIT59Zzk6nVXcoHt154ebHJFWhd0fDEwFZAj
 5wa6LAwdR9oAHMWKN+cYsLpTTeSzkvbUoQsAUvinRhQvRGHqEnT9NaGxOB39yAhHa6ug
 FQd2OtGG/5j7Pym+q2rCew08+aT2rrZ+LGffWVchm+Hjx1pIYwGkuV/txpZc1WMizrsn
 JZgQ==
X-Gm-Message-State: AOAM530gIJOmDAhUuFZYrZw1/Cjgj/EcCtw/RVHvOxHH+i9mY+fTe8Eg
 cI/JeXWXlQ36g/vHzW/yGu2qy2uk9tJJ+4svgWeFjQ==
X-Google-Smtp-Source: ABdhPJxDgGmwRBqn1ahZJ0PCC2VvSxMzsYtzf26mSUSYz7qFYhAWXzEZL9V2rTXOh6EmJtJNzX6KEEg6ubNXVCJDfb0=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr28274883ywh.329.1645607994047; Wed, 23
 Feb 2022 01:19:54 -0800 (PST)
MIME-Version: 1.0
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com> <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
In-Reply-To: <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Feb 2022 09:19:43 +0000
Message-ID: <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Oleg Vasilev <me@svin.in>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <cleber@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> We need the DEBUG profile to ensure the bios-tables-tests work.
>
> If you want to boot a guest using EDK2, you should use the images
> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
> not these images.

Do we have any other images in pc-bios that are silently
"do not use these images, they are only for a very specific
test case and nothing else" ?

Also, "make install" installs these EDK2 images, which doesn't
seem like the right thing for "this is only for one test case".

thanks
-- PMM

