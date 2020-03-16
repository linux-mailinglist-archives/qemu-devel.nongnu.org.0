Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0591C186D4B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 15:40:06 +0100 (CET)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDquS-0002ly-7H
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 10:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jandryuk@gmail.com>) id 1jDoV8-0006K7-Co
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jandryuk@gmail.com>) id 1jDoV6-00080d-7Q
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:05:46 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jandryuk@gmail.com>) id 1jDoV5-0007am-Sz
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:05:44 -0400
Received: by mail-lf1-x143.google.com with SMTP id n13so11986970lfh.5
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 05:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IlGC7B4jnHNjSqOEhEhR8gkJ98rxAyaLxAdpSwneecQ=;
 b=LVpPmvL+z1Q6J8pn3yJY+OQxH2L8qw00kTkvUIQOmYj36nhcJt4EzfkRx2muQIAJVi
 lvGymN618LDk8dfP00BAHvsAoLjN3dCCPHO/FvvOcfVoka/kJQt9QzzdqUndVZJe7cz4
 HPm0bR3IgSGq3RAyGgOuM6vqHQHzM4ApqypMHwhtgKy+xTKogYNsV4REBFOuHGtibw59
 GR4fbc+5Zolb7+Mk9DrVtwWB48iq4L3eVA9FyIxjWiD2EzE+8OW+CPUYUG34bd8jir2v
 T0AtpcLavqDwRCKkxC0/1vbI+HYR6Iw5JZWO8siG0+joNO5lzH/t06dcCru5bK9OyXuR
 pw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IlGC7B4jnHNjSqOEhEhR8gkJ98rxAyaLxAdpSwneecQ=;
 b=MhYmVAEH4GocgDJQir39yfupJlRz2/a+bZwBAX7/MceNYeeS4XBjKcpK+Qdh90beC0
 T/ZUWthopjLINMGWbJxnjjRZqgT7kznSMI56BC09W7Vc/DevVYqhWPdUh5TalTBz+W/u
 VEIUyTKOD8NnqKfP58/chsf8w27vVn6HXOPaMKKhkoNEBuNBNoOl/460Gu55F4MGQrWV
 2eWAwQA9liF+PI+OjQQ2Fc6HKOO1xJ+TYViI83Y8Q7iRTMsvFMJkTT/j/vff7kSWUY1s
 eWT3VZ7/sfhaECZu8JCtqUhVDf4hpP67F5+DBouJNTf6XQKHre3fJabLttFpf/YILO1e
 /sdg==
X-Gm-Message-State: ANhLgQ2uNbyTT/SpW2Axwn98SDHeDbZTDxEU38IhXY/yT/gu0R0IqLNO
 olpjbh3hXIv4L11URmX3XZFUI/yZFeKbPDWJw+0=
X-Google-Smtp-Source: ADFU+vv7bYPKITQKLd/iiQYPvugROIy7NxtVqtsQAhzMIGS+rcMp851LwU1PuvKUi1hlpcuBNtU+TGNInXoMG3q4MqQ=
X-Received: by 2002:a05:6512:1116:: with SMTP id
 l22mr16784787lfg.70.1584360342008; 
 Mon, 16 Mar 2020 05:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200312125524.7812-1-jandryuk@gmail.com>
 <20200312125524.7812-2-jandryuk@gmail.com>
 <20200316114007.a4aie3vszsplkttq@sirius.home.kraxel.org>
In-Reply-To: <20200316114007.a4aie3vszsplkttq@sirius.home.kraxel.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 16 Mar 2020 08:05:30 -0400
Message-ID: <CAKf6xps+Eadf+7U_XhzK9Hw-Xc87sENYcDuM_M199ftuHDFFag@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb-serial: Move USB_TOKEN_IN into a helper function
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 16, 2020 at 7:40 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > +    if (len > s->recv_used)
> > +        len = s->recv_used;
>
> scripts/checkpatch.pl flags a codestyle error here.
>
> > -        if (len > s->recv_used)
> > -            len = s->recv_used;
>
> Which is strictly speaking not your fault as you are just moving around
> existing code.  It's common practice though that codestyle is fixed up
> too when touching code.  Any chance you can make sure the patches pass
> checkpatch & resend?

Sure.  Will do.

Regards,
Jason

