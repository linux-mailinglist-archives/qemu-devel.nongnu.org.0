Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268DF68A977
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 11:21:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOFeE-0004Qw-S3; Sat, 04 Feb 2023 05:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOFeD-0004Qh-NI
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 05:19:53 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOFe8-0001K6-7t
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 05:19:53 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 hv11-20020a17090ae40b00b002307b580d7eso3584649pjb.3
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 02:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GsaZHqOe2GmCB4zqu2Au8Mavi8/B97mcwTmc27S+kfY=;
 b=aKkWzgMApuc2CUR99P8IVl0RjkfZ+1NuXumFOQCxaWw2Atm7s+7b3uCB9LmDonxYnt
 Ai6bPzDcFUAd0CjMV3Zvd4jkJARuI179JtwfInSazEYdJ/DwcqOH/fp92090rIRnh9Ot
 qhioxyYRgoQfJ9i0+uOiYhlzz4ww18nIj5ADIIzOSB9L11yTXllxt99gPKTU4X8dbBzP
 Ceu9DcxxmAdPtWlCTf8aEmyhlPj1roydWd1rhBndTKAZq3MTe99Zg99+CykygAYjHI2c
 AJaVwM8PG0s7u0nBe9QniD3tcu7BZrg4WUihf3Q8+CwkUDFgmb2KLLej6Ppf+RWLEax0
 M06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GsaZHqOe2GmCB4zqu2Au8Mavi8/B97mcwTmc27S+kfY=;
 b=gA1gX7yayTvXu09IP1gYd8VAF5TmL6uEIVpqCLTSDhkbhKlt+9apOG9O1P6RO41pks
 8hbBLpElV0fUDogI1c/bXBKNydfw3g/iZXGhQRWADA9Yt7BmshVQ9MArPUAnvCzELxor
 6ShbEiyTWy1+vGzUe3QRGKf0dPry0DLd8ZJRcsN2B4fdna7tU4UJ0vIudQ7HEYjWQMWe
 V71GyF0gkY2V1znY5itUBkuQGNXu28N5biCeENmA2jUrqV604lAacGtWy/N1Yb8DXtLp
 vXhQvLaLKSsujs909f0HtD8qe6BsTGaqNIZ+EDrA5tJzu/7he/8mZvyX/zZggwg8zAwp
 HwKA==
X-Gm-Message-State: AO0yUKWBvXFlOrox/+Bn2OfLfDUVXpX2qO5DF8z9h7IZZjBuKSRV6Dxt
 EA6rum9Q8bGWeyRawc8FcHDpIgEFd2F+e9/bD74yJg==
X-Google-Smtp-Source: AK7set/lYOzrZHEJwTd0d/jR5q/RjxaARO4h+6RMhoRobO4Pg1kPZOyOi2MaW1nOTBv/1N0NDl4VKXUUDvRe9WnjOCw=
X-Received: by 2002:a17:90a:4eca:b0:230:7d5a:3926 with SMTP id
 v10-20020a17090a4eca00b002307d5a3926mr835703pjl.137.1675505986477; Sat, 04
 Feb 2023 02:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20230202160640.2300-1-quintela@redhat.com>
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Feb 2023 10:19:34 +0000
Message-ID: <CAFEAcA-dvzgGWxoXYkD-1Vv8k4oajPQVU+nypX5pKSN=iS+BqQ@mail.gmail.com>
Subject: Re: [PULL 00/26] Next patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>, 
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 2 Feb 2023 at 16:07, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit deabea6e88f7c4c3c12a36ee30051c6209561165:
>
>   Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2023-02-02 10:10:07 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request
>
> for you to fetch changes up to 5ee6d3d1eeccd85aa2a835e82b8d9e1b4f7441e1:
>
>   migration: check magic value for deciding the mapping of channels (2023-02-02 17:04:16 +0100)
>
> ----------------------------------------------------------------
> Migration PULL request, new try

Fails to build on anything that isn't Linux:

In file included from ../migration/postcopy-ram.c:40:
/private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/include/qemu/userfaultfd.h:18:10:
fatal error: 'linux/userfaultfd.h' file not found

thanks
-- PMM

