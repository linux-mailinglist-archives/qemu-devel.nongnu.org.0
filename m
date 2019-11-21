Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C577C1059F7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 19:52:45 +0100 (CET)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXrZM-0005T7-G3
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 13:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iXrYG-0004XV-BK
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 13:51:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iXrYF-0004C7-BB
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 13:51:36 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37583)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iXrYF-0004Bh-52
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 13:51:35 -0500
Received: by mail-ot1-x343.google.com with SMTP id d5so3908238otp.4
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 10:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Epocb7Eh/+gij9//rfLDiM12+ESYjbJ0a4MVbKJwdK8=;
 b=R26xbWpecLUWfPhjsQL834vBfuNi0gPOx7bO8YTZjRmKSwO1weCfjmTDblGLCMBAwk
 /ZL+7FK0cb+6jaKkHR1BpOw4UhFMw/2L7/gF5PakXo9maOoNyX1B0IK729hNQXh5T8tE
 cAKdj2zXgtrqTu1PdELGN+7viFj4OC9r0oTX29mQkGppfCgzhrfcemieG2NvMca0zhNA
 ydxF639aFeOoyM1NaTRUbR6A6335OCjB0GZhvaU6y8Eq48LBZ9rF0NUbQaSbDVlx5ljr
 VGhQ2j2lczp5d7+ax/YP5f619TxNi6mGKs5EmDeuGl2tIwLH+R71cPXIdyHEjnx3ksgC
 NE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Epocb7Eh/+gij9//rfLDiM12+ESYjbJ0a4MVbKJwdK8=;
 b=RqS9p8rkg1aDSSC1FTdYsVrzZW4DzZMYtIH7rxTAXSNvze5/2pGM0uUkw7VBi1M7Ot
 HIOoXSKWmlmDmiwapstQc6VfZ+DHq4ByhGLgligbM0/ne0rujKuaeEALr/A4CmzqjRJP
 sBEQmBb9KVgNv4jvDhzRKIe+kVzbokbyREQMRrhW12C+HptRGNjRLBQ1KHjiXN7SZkW6
 U3odc12OYZTFiyEgNX7OfySkiHAVG/hDEEW5SqYjdCtqzrmqYRQJrMsReAY2d6r3FW8S
 4glsZXb2t7PAs65piVSdGITjBUixhJPQzvWJccDslaYtPqu619+0ez6oeei1hvN7yKQi
 oBfw==
X-Gm-Message-State: APjAAAXHD3eexHHNCaphHgUL7TytQHitklA1t3uopbsOVl8xB8gDK75d
 6WUoDy0NxSMdAAcufmaTqxQuoYvpAEMvNMUI+Hg=
X-Google-Smtp-Source: APXvYqx6RBrjR48gNRZw1DsK/X71CPGMAY90kfMAeXFghNG3qhBZM5mr0ViPfhNS9J/tJ3GhmOtMtCNLq04DZ6ZvqV0=
X-Received: by 2002:a9d:1b3:: with SMTP id e48mr8008417ote.341.1574362294187; 
 Thu, 21 Nov 2019 10:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20191120145724.GA15677@ls3530.fritz.box>
 <CAL1e-=jqoV0v0NdpeL3NUTOfURNJ9qmD6FcCjV30pXsdBeCD=Q@mail.gmail.com>
 <CAL1e-=gOHZOTnyB0=HOAqzqS4gBF1YkB7x3yQYGJvi5qWg20Kg@mail.gmail.com>
 <015ab947-57ba-6d73-d99d-2e3263226c02@gmx.de>
 <f7f4ff93-fad0-3d72-a224-c19302dff9e0@redhat.com>
 <CAL1e-=hHFfkJ3bmOLhk5bBCExvnazA4NgmoCJtN+X3KQ8=9Pjw@mail.gmail.com>
 <32d6aa36-3240-7a80-89c1-5cba13bbc022@redhat.com>
 <CAL1e-=hDgLB-n2aOdB_ZOnVC0f3x3SGvQDUCcBWSobme7JSV4Q@mail.gmail.com>
 <e0a8faac-b02a-2787-20a3-97f451c9d798@redhat.com>
In-Reply-To: <e0a8faac-b02a-2787-20a3-97f451c9d798@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 21 Nov 2019 19:51:23 +0100
Message-ID: <CAL1e-=h2jtGAJWH3Wz4oZ=FRXX0DywK-DC=JjjzWc5DJBUjDnA@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user/strace: Improve output of various syscalls
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >     Ahah very easy indeed :) Not noticing it shows how busy I am with
> >     firmware world than I forgot linux-user can be a simpler/powerful
> >     way to easily test stuff, as the Hexagon recent port also demonstrated.
> >
> >
> > Hexagon port doesn't have anything to do with this patch and didn't
> > demonstrate anything new wrt linux-user. I have no idea what you meant
> > to say.
>
> I simply meant to say, if your port can run linux-user binaries, it
> simplifies a lot the testing/coverage.
>
> Hexagon is simpler to test than AVR.

OK, now I understand.

