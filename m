Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49862434D04
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:03:57 +0200 (CEST)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCCC-0002LX-DT
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdBvv-0004Si-OU
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:47:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdBvf-0006cO-S3
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:47:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g39so15002774wmp.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R1T/tYl4mT67kjR3LPygkLEm7X+RJ2C9exJnfczCl7Y=;
 b=SrZU7ocTIhifGpsxTLonDYhWkg/05YhfkvshrH6MfZwIHWq7CvtanvLtVSWtb/TUgo
 Z2IZmjPl+uplfMMHGbIhi/oQWXotTa0itKm8UyNGmEcfJCvyOgWQb0t2t9ssopX2TprR
 yuIe6m1DomKUKokXvUnrpoT9kb7GsY5ePH7sAVYEwGrPoENl7KjcbUrGByZc/6qskDcs
 BvqOywlO99I5XCBGz823Ffje7hbcU6fJBYBzU/GFEJwPjx0/K0Iv9AWJnjTrRqHkM4tI
 PsLp9f4hlq89REMmRhvDAA8PpMtQ32HQbaxyrZfMJXlECVG+2V9/onGfWwWHZddKij/m
 GizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R1T/tYl4mT67kjR3LPygkLEm7X+RJ2C9exJnfczCl7Y=;
 b=Tfk5ZVMOQmNepZ0mm1M00pJ1RePur6twJhAA/KyRKvfqW/WBEN2CZ4MDF2cWske/24
 LJkrlsAYfDx5rGvEKZPr06uDm8Zwm6Qu0dbdUHrZqQirfujGamJXxrfXV7Ig7pTd4b5B
 8BFPtu8r+9NZz5pF+FTkOXxK6+2FBALQr70vG34TDYKtG1oO9fDp5fIH3NFF8Um7OLse
 9H7dxY48YyRZI1cqYPqUga+7gPiRLf/JlRTnZFLWkw41/Gv+UqM9NSKOUSGqtBPQsTXn
 PWvJXH7KLKEtpq0XR1JVeuJ+rfPhcfUKm62yvIsSQ32NWqt9aT5YCuUzD2a0KjK6lIJy
 CPDQ==
X-Gm-Message-State: AOAM5301SJyD59D1ae8Uc++LNiu1DlouNEXtQOoBrmkRAfPU0uLINbye
 /NjtIWgM8djziJWBhK5c2RKNSg==
X-Google-Smtp-Source: ABdhPJzIqbQrtqCejkdUjqQHcUhsTU+S+blHjQ9n3yz2+5vx2LoxlcCpIeGbsJUVgUBE2bNE0cc0UQ==
X-Received: by 2002:adf:f60e:: with SMTP id t14mr31964583wrp.373.1634737608641; 
 Wed, 20 Oct 2021 06:46:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n17sm2000579wrq.11.2021.10.20.06.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 06:46:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9EAE1FF96;
 Wed, 20 Oct 2021 14:46:46 +0100 (BST)
References: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
 <a0210fac-af32-8f1e-ae5f-237d773c32bf@redhat.com>
 <91370f34-5a37-1cb1-fa7e-c95e3b7521c4@ispras.ru>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] replay: improve determinism of virtio-net
Date: Wed, 20 Oct 2021 14:40:18 +0100
In-reply-to: <91370f34-5a37-1cb1-fa7e-c95e3b7521c4@ispras.ru>
Message-ID: <8735ovx0zd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> On 31.05.2021 07:55, Jason Wang wrote:
>> =E5=9C=A8 2021/5/17 =E4=B8=8B=E5=8D=889:04, Pavel Dovgalyuk =E5=86=99=E9=
=81=93:
<snip>
>>> @@ -2546,7 +2547,7 @@ static void
>>> virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtio_queue_set_notification(vq, 0);
>>> -=C2=A0=C2=A0=C2=A0 qemu_bh_schedule(q->tx_bh);
>>> +=C2=A0=C2=A0=C2=A0 replay_bh_schedule_event(q->tx_bh);
>> Not familiar with replay but any chance to change qemu_bh_schedule()
>> instead?
>
> It would be better, but sometimes qemu_bh_schedule is used for the
> callbacks that are not related to the guest state change.

Maybe that indicates we should expand the API:

  void qemu_bh_schedule(QEMUBH *bh, bool guest_state);

or maybe explicit functions:

  void qemu_bh_schedule(QEMUBH *bh);
  void qemu_bh_schedule_guest_update(QEMUBH *bh);

And document the cases with proper prototypes in main-loop.h.

While I was poking around I also saw qemu_bh_schedule_idle which made me
wonder what happens if a guest change is triggered by this. Would this
be impossible to make deterministic because we don't know when the bh
actually get activated?

My concern with just adding replay_bh_schedule_event in the appropriate
places is we end up with a patchwork of support for different devices
and make it very easy to break things.

--=20
Alex Benn=C3=A9e

