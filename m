Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03FD5A3A73
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Aug 2022 01:21:15 +0200 (CEST)
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oS56y-0001QF-EB
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 19:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oS55C-0008T5-W0
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 19:19:19 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oS55B-0004ks-4r
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 19:19:18 -0400
Received: by mail-qk1-x72d.google.com with SMTP id m5so3772209qkk.1
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 16:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=VHlOSf2KDp3OjuZwxD4thdD6mysvmOycy3h+VsEbabA=;
 b=QOzQK500Apqtpb2hLiX1/xcDhbnITfMlhuDd1afWMSEM09CXfA/8gHw3oiHHs6Bx7x
 5gI/1QG5rMZJjsmZPATpCFqdRFsiLGeQG7LH6LApcJp0RNuxjdZc7NwNUXwdvBh3k9mP
 5RWpzn7jNPulbaWsYNYdcZ6/fuWcxjSP7CMNbBxAd+hrkhlrqm0ZiSZW9ZFNboeT/Nrv
 5ohEIU83JIOjY9KtCsufBbpZXWsMYb7V4Qhu0UFfkRMTQPhWOO2VnlNtCBZ9BYrWmMb5
 qjYiAAAehdjtx2yfVitFghK+Ay5XBNTdjlWmIltCLiRP/U03azarzgCU3UkYs8rG3cBP
 yoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=VHlOSf2KDp3OjuZwxD4thdD6mysvmOycy3h+VsEbabA=;
 b=kFKPCOy7sW9Jblkxa78hTFUChGADSd4w5YCBdi0v1X68ndmXzfYN4Tb/eJAxXKxFD8
 N43IC6abrlQpHqYUkzARbQSrjHL/zqQHPBwZuElmQBdQtGTiLG3G1ILuTrPeFNInORv9
 i6pGEGoBqWHt3qMs5TctYDIJ6XMlN2W/X387dIxhknWHzlmA3qWivFnic3MFaVsnNhdc
 fvOhrse8Bw+B8gEXI757l5Kf7V0p9zhgg8CBvH3wcNf5cSEl5UC0eniqGPt6/5wH9SjP
 Kxj0xV/sUVJZA3sODmr2KU4FxbmCJKreUeZttmpfEQKx9e47A+9xFiDVTWmnZwdYi+Sx
 o6qg==
X-Gm-Message-State: ACgBeo0t+P/ek8ntcY2L7EU8Eo+ShGlwKzYrkEiB3LQeNrffEObVwaQ9
 eg4fzktTI8L3zjMY9DWfQIPMcZlAIdU3EDleimI=
X-Google-Smtp-Source: AA6agR78zgRMM04aMOTgx2/IyOBWalp/+d6hWA21utSxs+kIYReTA0+KDYCDN3MH2m6FaH/uh4D3azGdzXFUgrKRAyE=
X-Received: by 2002:a05:620a:430d:b0:6be:7846:2169 with SMTP id
 u13-20020a05620a430d00b006be78462169mr933043qko.389.1661642355909; Sat, 27
 Aug 2022 16:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-41-bmeng.cn@gmail.com>
 <CAMxuvawYwmo=-TicWwgn-JRB0u_9a04-Rx80TphOybNQ89Pf6Q@mail.gmail.com>
 <CAEUhbmV28TJGxf9JCrN-D8rDA47vgMJ4nO0gSGBcKcyEqPxEUA@mail.gmail.com>
 <CAJ+F1CKMcAfOAYbN3TXqjiiW-yqOYdoroN6BHp+PV+24-Ty7mg@mail.gmail.com>
In-Reply-To: <CAJ+F1CKMcAfOAYbN3TXqjiiW-yqOYdoroN6BHp+PV+24-Ty7mg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Aug 2022 07:19:06 +0800
Message-ID: <CAEUhbmXkZCWJ86wnLNMoxKzP5Qpi5HMtLSCki0-MrLyMEEM7gw@mail.gmail.com>
Subject: Re: [PATCH 40/51] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 9:23 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Fri, Aug 26, 2022 at 5:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Thu, Aug 25, 2022 at 3:59 PM Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@redhat.com> wrote:
>> >
>> > Hi
>> >
>> > On Wed, Aug 24, 2022 at 1:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > >
>> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> > >
>> > > The combination of GENERIC_WRITE and FILE_SHARE_READ options does
>> > > not allow the same file to be opened again by CreateFile() from
>> > > another QEMU process with the same options when the previous QEMU
>> > > process still holds the file handle openned.
>> >
>> > opened
>> >
>> > >
>> > > As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
>> > > such use case. This change makes the behavior be consisten with the
>> > > POSIX platforms.
>> > >
>> >
>> > consistent
>> >
>> > > [1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-a=
nd-opening-files
>> > >
>> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> > > ---
>> >
>> >
>> > What's the benefit to allow multiple processes write access to the
>> > same file? It seems it could easily lead to corruption or unexpected
>> > results.
>>
>> This was triggered by running the test_multifd_tcp_cancel() case on
>> windows, which cancels the migration, and launches another QEMU
>> process to migrate with the same file opened for write. Chances are
>> that the previous QEMU process does not quit before the new QEMU
>> process runs hence the new one still holds the file handle that does
>> not allow shared write permission then the new QEMU process will fail.
>>
>
> Thanks for the details, that's worth to add in commit message imho.

Sure, I can add this in the commit message.

>
> But can't we fix the test instead to use different paths?
>

Yeah, the test case fix is here:
https://lore.kernel.org/qemu-devel/20220824094029.1634519-42-bmeng.cn@gmail=
.com/

I think this patch is still needed as it makes the Windows char-file
behavior be consistent with the posix because there is no lock
mechanism in posix.

Regards,
Bin

