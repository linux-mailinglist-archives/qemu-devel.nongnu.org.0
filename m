Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D91322505
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 05:52:11 +0100 (CET)
Received: from localhost ([::1]:32890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPgA-0007l4-7S
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 23:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEPf7-0007Hy-NK
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 23:51:05 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEPf4-00024U-R8
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 23:51:05 -0500
Received: by mail-ej1-x630.google.com with SMTP id j6so5516043eja.12
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 20:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eyV0i+C+/h3drfKQYSgn5N2vYzhLCJd5VmWoT2VkEoU=;
 b=pzVLXKEKzvs2zueS4b8VZnt0B2A1VZQiMUTosGz2+LxDz2sOSMm+4do8amPtPwMInW
 RTNppoTFhwerWxvd4vhBVP+eccc8gKnbIsswMJkxxtgERcS3nh5YFFdYuC7ppTAghvUI
 GHspGWPEUc0tGE4oLfW4Oxd4aiB4rw9ySmsHad/Yf3U+TrO7ezR2NHXuZVcz1IM0gJQb
 XuITgLxiNTVC8HZ/14qhgD5HqwSjUDKAiPErn2GV2VZZKpWxSC/B4hDsNoI3R7dQqEyT
 HcSxTeU6R2eZL+FKcL8uuWWDx0cp67PYw2T1lAsCaz48ianIB3zX7ptpgkpadRjKovCS
 jERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eyV0i+C+/h3drfKQYSgn5N2vYzhLCJd5VmWoT2VkEoU=;
 b=XTh4z23xbUD2c7fvvpbU7VB6jsgJ7Swia2cXkAC4Ewogz5kbZl56GczC9PAaroqEt7
 TDdhbM8vXKwjrhsSTohl8+QFbnM6BQVuM4gLGyOOvdAk52Lbx7r3BkV5ygSLOEx7pDeS
 tUQYsQnWYuPajOHu+ELPNOPrrjMwbsx3vzoiH2jfZeW9McqOWcb63OX37HUzLKdSEvHL
 42+bAJ2bGBEbE6p1sy+6/4I35lnr306VdL5VRkDdjw/kITPsHKgbRgtTT+wLSfU9ckPr
 Hs2vjeq9thQUdMTysc6kpyInnQoCKEq05TQg0ejXBfh6uF4ieQzNwxy17wRlf5dUjSca
 Fsww==
X-Gm-Message-State: AOAM530BjA6f0l+cIHsQYReKyyGOmcw2lvU+qo7uZso1r8jCNjdtiEe6
 WgVa4esggKikzkWL9bLmvUzMhuVRUiLtN1mE56g=
X-Google-Smtp-Source: ABdhPJyEsVXOt5ffezeXVPCwJHnmQ5QdmAVNmzijrNpdiNHtBYNLyYXnrDbjRFz4rLHU+fbg3MyG2RTIHwjDpj372Ck=
X-Received: by 2002:a17:906:3856:: with SMTP id
 w22mr23918943ejc.77.1614055861541; 
 Mon, 22 Feb 2021 20:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
In-Reply-To: <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 23 Feb 2021 13:50:51 +0900
Message-ID: <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8822=E6=97=A5(=E6=9C=88) 19:57 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Sun, Feb 21, 2021 at 10:34:14PM +0900, Akihiko Odaki wrote:
> > This change introduces an additional member, refresh_rate to
> > qemu_edid_info in include/hw/display/edid.h.
> >
> > This change also isolates the graphics update interval from the
> > display update interval. The guest will update the frame buffer
> > in the graphics update interval, but displays can be updated in a
> > dynamic interval, for example to save update costs aggresively
> > (vnc) or to respond to user-generated events (sdl).
> > It stabilizes the graphics update interval and prevents the guest
> > from being confused.
>
> Hmm.  What problem you are trying to solve here?
>
> The update throttle being visible by the guest was done intentionally,
> so the guest can throttle the display updates too in case nobody is
> watching those display updated anyway.

Indeed, we are throttling the update for vnc to avoid some worthless
work. But typically a guest cannot respond to update interval changes
so often because real display devices the guest is designed for does
not change the update interval in that way. That is why we have to
tell the guest a stable update interval even if it results in wasted
frames.

Regards,
Akihiko Odaki

>
> take care,
>   Gerd
>

