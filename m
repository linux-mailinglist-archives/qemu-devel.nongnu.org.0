Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE44F69DD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 21:28:33 +0200 (CEST)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncBKS-0005SM-C1
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 15:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncBJ9-0004lH-No
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 15:27:11 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:38131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncBJ7-0005UI-VI
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 15:27:11 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2eb543fe73eso38189717b3.5
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WJBP5m2z2MhmRchsOSWuAaKPMD3eDACugAft8e4h9/s=;
 b=mAT/QPO4ilvmd5RsfolcuxqGVu+xWFQ0rV3HeGDVzLQwju/S94axy1o6CREsIA6hCq
 NnCZSBsj7zsQpRuJH7XTR1Yh0ppy+JG3lbSfG1Y9wrki2eCYLhjwt+Xx6q0b2cvYZie/
 m6o/YCQ2knosI5jWlzUEEzALF2GGyqXXdiWWuzt2k3JPnD/kh/7+tYZWoYyG8R9kZGje
 v8yvJ84j+R/OJ3iuYRf1fGYoQsZhGxdsoJQ5QDkd6iUPAiNUi4TqRIXWs1gfWB8KELeF
 STqfcLe5kCT/P2bxcWwqLiYsASrdthFy4DQurr/TUngbMUsW4D8NpmBbSJtnZDIWnWn9
 0I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WJBP5m2z2MhmRchsOSWuAaKPMD3eDACugAft8e4h9/s=;
 b=sx7CxNDkQ64j5/U2SGD1NBFCAAnaYsrhx9Luwwbdwl5Oabpc5nu6uyf3v0xccDaelI
 n4Utm+OnRiDKhaO+58jgWtq+ct3ZaW674w1wvsyF5kmX1X0dE+JMi5BuxRuZmkrMhikG
 n7mEBJYIQ7zFGLjLQhZupYviYdHKh8FiGa1f90Yd5MlV62QgtVCHAizncXmxJN+AZsry
 R1sRq61FYWU++az8AZd5WS5LTWKMQIizXNxpDJ5sOHHFzSYMjXTEK+LZGtuFurRuAgCO
 jJoAsPHScjDNhXs5wKBnUKNqcqzahDInh11r5vtq+TVwf6DN0HXo2E4tuo2OnEHaxFLo
 LbaA==
X-Gm-Message-State: AOAM530rPfvewQxgrBDr0Kw/zXWR5LAKvqJTJKQdeitJZRxORy27V5J6
 Qtcud/9pHhiSLDKDZyCWNcWrCYU3b57CibGunib49w==
X-Google-Smtp-Source: ABdhPJxW82KTyI+6f6IgQwS9NcPQZKrfVzoC3COX1zGvPpbkTwU9wHTBOssFVaZ3s5bLSHz93VoDciDzNDi0MD0p870=
X-Received: by 2002:a81:1592:0:b0:2eb:5472:c681 with SMTP id
 140-20020a811592000000b002eb5472c681mr8495810ywv.10.1649273228506; Wed, 06
 Apr 2022 12:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220406173356.1891500-1-alex.bennee@linaro.org>
In-Reply-To: <20220406173356.1891500-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2022 20:26:57 +0100
Message-ID: <CAFEAcA-iFROkDQ=myCjbBxo5jJKqwCjQb_3tbANYdeNk=YizLw@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest: properly initialise the vring used idx
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 18:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Eric noticed while attempting to enable the vhost-user-blk-test for
> Aarch64 that that things didn't work unless he put in a dummy
> guest_malloc() at the start of the test. Without it
> qvirtio_wait_used_elem() would assert when it reads a junk value for
> idx resulting in:
>
>   qvirtqueue_get_buf: idx:2401 last_idx:0
>   qvirtqueue_get_buf: 0x7ffcb6d3fe74, (nil)
>   qvirtio_wait_used_elem: 3000000/0
>   ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: ass=
ertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>   Bail out! ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used=
_elem: assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>
> What was actually happening is the guest_malloc() effectively pushed
> the allocation of the vring into the next page which just happened to
> have clear memory. After much tedious tracing of the code I could see
> that qvring_init() does attempt initialise a bunch of the vring
> structures but skips the vring->used.idx value. It is probably not
> wise to assume guest memory is zeroed anyway. Once the ring is
> properly initialised the hack is no longer needed to get things
> working.

Guest memory is generally zero at startup. Do we manage to
hit the bit of memory at the start of the virt machine's RAM
where we store the DTB ? (As you say, initializing the data
structures is the right thing anyway.)

thanks
-- PMM

