Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A15324C21
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:39:41 +0100 (CET)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCBQ-0001q1-TV
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFCAg-0001P1-Cr
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:38:54 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFCAe-0001el-Hc
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:38:54 -0500
Received: by mail-wm1-x334.google.com with SMTP id i9so3626315wml.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 00:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n3mg/OYkNJTieDbn3P87OeCV9BqvZqzJzRyhMz4QlbM=;
 b=i6vO4TSy1oF3PB037aZDNmX9xOmU56kyIW7iGHH8WL800pViMSHUSG62rsO6aM8zOU
 /uZuPjcZQdeGl9EYtv8zt80ePyoyPrnOAaXRR2OJRj3xoRW6QiBCiO981qLB16ZTG3V3
 8M2DeQ1Ynv4Affb6H1U+VdB13IM6XzVKWrmL848sT+a+1JOeCYNcQd73G2G11fP71Ei5
 W5QTXNVAgE2eH81dOdEbht6xKVlDwrKnr78w9bFkIBBLuslbHKhNGwgn3zfdt2o6gu+f
 OKYiAPOyyGizeE8WHM6tJvEdlXQfRJu9mFxuHPM/E8u/KaepnMw/2OFy9SdQcWgj4ivT
 /BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n3mg/OYkNJTieDbn3P87OeCV9BqvZqzJzRyhMz4QlbM=;
 b=iuMq84CYUckMX7wpPqZc+zA3B9hgpVyW5j3aSydZkYQqY6AZiKhSYth6O9mNhMjUv/
 LovEQ5helGeF/zmfH5F48tbTSr5WBDExPEpaNhHFYk2MY9LJ3wQFf3m5w/7tApoUX1W/
 oYZy2aNRJgVsJgdovS4zw9Uls2OmFhhf3uJ6yuTceUE926lwPLnzUqfQ+cATfiyEkMRL
 HmfxAYbBy4VcaMmK3rUnL99Yxu0dnCdEiTClbd/W3xeOVoXgioONXPFXvKH0qqu8SQB8
 qdoI8d19k5o5gIsa85RM9StF8OnbqjriO/ZJhAsTI8xh24K/ePueXfJcpZRDQHpehmw9
 nSVA==
X-Gm-Message-State: AOAM531z+8mq88wNgkYqR0wwfE/CD9QAhiNrUlqN+4oB7CSigYIhjciK
 KoXvMxiEYTbLNT6m2QvF3H+dluszo4ZcQNA3SYE=
X-Google-Smtp-Source: ABdhPJyKjpiFI1RKCmSOPBOGJiDaYkYlpt0Z/1zW+ILr/VZW/kbr5UzRxqOEARho8AVawC3g575uGTLdpmqeKYQDaVo=
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr2112357wmg.53.1614242330829; 
 Thu, 25 Feb 2021 00:38:50 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9E73_a0hEMV+jFm6YbcOz=hFR-NyYKa_Roisw_MR_cNg@mail.gmail.com>
 <20210222144012.21486-1-akihiko.odaki@gmail.com>
 <20210224112307.vfz3qz6bgrboj627@sirius.home.kraxel.org>
 <CAFEAcA-whQcik9-jx_ZSHJ8dyQBM5FvQFZKn9xkeBnOZfj7DCw@mail.gmail.com>
 <20210225080156.ifg2rshiagwqck7j@sirius.home.kraxel.org>
In-Reply-To: <20210225080156.ifg2rshiagwqck7j@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 25 Feb 2021 17:38:40 +0900
Message-ID: <CAMVc7JVC1dck7ximr2jEHDF+C9sd_NnERr2iacigzfZE2MUBpQ@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix stride resolution of pixman image
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8825=E6=97=A5(=E6=9C=A8) 17:02 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Wed, Feb 24, 2021 at 01:08:22PM +0000, Peter Maydell wrote:
> > On Wed, 24 Feb 2021 at 11:23, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > On Mon, Feb 22, 2021 at 11:40:12PM +0900, Akihiko Odaki wrote:
> > > > A display can receive an image which its stride is greater than its
> > > > width. In fact, when a guest requests virtio-gpu to scan out a
> > > > smaller part of an image, virtio-gpu passes it to a display as an
> > > > image which its width represents the one of the part and its stride
> > > > equals to the one of the whole image.
> > >
> > > Probably not limited to virtio-gpu.  Wayland rounds display framebuff=
ers
> > > to the next multiple of 64, so when running -- for example -- 800x600
> > > wayland will create an image 832 pixels wide.  Other UIs had simliar
> > > issues.
> > >
> > > Patch added to UI patch queue.
> >
> > Could you add Akihiko's explanation to the commit message
> > for the patch in your queue, please?
>
> That _is_ the (v2) commit message ;)
>
> Akihiko: new versions of a patch should be sent as new thread, not as
> reply.  It is less confusing for both people and tools like b4
> (https://pypi.org/project/b4/) which help with patch processing.

I didn't know that. Thanks for telling me that. I'll do so next time.

Regards,
Akihiko Odaki

>
> take care,
>   Gerd
>

