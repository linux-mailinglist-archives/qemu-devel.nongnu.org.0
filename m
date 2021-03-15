Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF06133AFC9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:17:16 +0100 (CET)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkHj-0005WA-W1
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lLkGC-0004Xg-1E
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:15:40 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lLkGA-0001yp-83
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:15:39 -0400
Received: by mail-ej1-x62d.google.com with SMTP id dx17so65207431ejb.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=quAVwrRa60B4j0GoqD1Kc9OFafCgtVxFFwjTt/6A++I=;
 b=CJJ+YMb6eZVU1BNOlYzELIa5tyH/I9NrlPUEodZA+uNHksEWVtaBYdQI41dWOoxkie
 DNvewVQm5L3Pkky9oHQ/sE/SabW8KPJGLyhfHWnGS5AjKMOzQXfhsKVBbbkj8O+giNVy
 9rChpGpAD7GLGUtQ7PHb6CUppNwli7H/OuG2LDxUpv/k0V2esrXbtl5egmZJEqjBifON
 zF4txbdahtKGwanevOxTA7eI3J3MDGns07ApJhi2KxoxgqP1ZBoZsrB8DpYCbHJJi4YW
 foe8Yp+9ti/5HngtXm4mvHUX1PyhDxCx0kusNh9ZDFuMbPj0YJzDO6k+e7WwOHrl8FKy
 ddSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=quAVwrRa60B4j0GoqD1Kc9OFafCgtVxFFwjTt/6A++I=;
 b=MT26ZqfyLabf4d9/ibNqpEJSaMgLmjgGjf5bikkAVr/XkA6ycZao6Y4u5DMBbr3dso
 2gQYjZ/bMIVRUaCgeQ+GH4BBBUfGMCFC1eITAvxhTArxmN03/zcgs7tuSojiVk1Amaw5
 hd86FjBk3OaOemYXaBBVt4ct/f9KiQb5SNAht/kVR9OxUPI02zHyKWgrdDkeoPB9TP1F
 St45WUkyYbSmkJEzaM3B1D5bxq0qB9pYitN+/+gzQiyzMW5lW81vxQYqg2k96WyYbXgx
 KQUW8ueaWmqTwkFqwXAaoPO5AnxBRp0kGjIPNmOAAnHqESdDq7cJmQgRygBS+sRXfZ79
 J2xA==
X-Gm-Message-State: AOAM533JP7yw/l8pjZ3f8QXK3WUwQNvFm39oRvKXQsI9KNcFn4b7ciu+
 xmh8vcLk+rce/TAgp/pO99fHYr5bJP4N/HBpRow=
X-Google-Smtp-Source: ABdhPJyY8lBfiRauRW/BiewhVww2IU9yxO+WrubwfBl3gxS5a7ZaA1o0Rm3bLUAivZiVx+dpGCXG3T4ETe2V3qJhXKo=
X-Received: by 2002:a17:906:fa0e:: with SMTP id
 lo14mr22372425ejb.263.1615803336916; 
 Mon, 15 Mar 2021 03:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210314070147.34731-1-akihiko.odaki@gmail.com>
 <20210315073233.edxuqhu7m2lmxgzg@sirius.home.kraxel.org>
In-Reply-To: <20210315073233.edxuqhu7m2lmxgzg@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 15 Mar 2021 19:15:26 +0900
Message-ID: <CAMVc7JWu-Hp11X48Fe71A5dYcHkn0ce3wRr27mqyj9gPcJt3Lw@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not raise keys before QEMU resigns active
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62d.google.com
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
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=8815=E6=97=A5(=E6=9C=88) 16:32 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Sun, Mar 14, 2021 at 04:01:47PM +0900, Akihiko Odaki wrote:
> > ui/cocoa used to raise all keys before it resigns active to prevent a
> > stuck key problem caused by key up events it does not see while it is
> > inactive. The problem is solved by checking -[NSEvent modifierFlags] in
> > commit 6d73bb643aa725348aabe6a885ac5fb0b7f70252, which is better
> > because it handles the case that key *down* events are missed while it
> > is inactive.
>
> Well, I think it is a good idea to virtually lift all keys when the
> application goes inactive.  Does this cause any actual problems?

No, but ui/cocoa already has so many states and I don't think there is
a room for extra complexity, especially when considering the code
checking -[NSEvent modifierFlags]. Keyboard event management concerns
iothread mutex, different handling of modifier and normal keys and
some special keyboard shortcuts. -[QemuCocoaView raiseAllKeys]
introduces exceptional behaviors to them just to raise normal keys,
something ui/cocoa didn't before introducing QemuKbdState.

Regards,
Akihiko Odaki

>
> Worst case should be that we send an extra keyup + keydown if the
> qemu goes through a active -> inactive -> active cycle while a modifier
> key is down, which you probably wouldn't even notice unless you log all
> key events inside the guest.
>
> take care,
>   Gerd
>

