Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237FE3C1790
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:58:45 +0200 (CEST)
Received: from localhost ([::1]:57102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XMK-0007Vz-5p
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1WoQ-0003nt-B6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:23:42 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1WoO-0003Gv-Ie
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:23:42 -0400
Received: by mail-qt1-x82e.google.com with SMTP id z12so5260385qtj.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NQO2i9adFhiwGLGxGCId5JT2A7IxIeuOyfDZPn9a9uE=;
 b=IOn4VA2XrE6oTCRB4iURrEzdgfWKJP9OgxWV20RGTtR6Llz5dogWpEJi2mvAslwUY4
 iR70Ta0ceBxwsYKKN5upvGxIXFsT3qRy+f91prMwwR3BDjUOZIM64waN9H70faACWSjP
 0MPHhxqiGOi8suuldu5eLm6UOc5nNyYmih0AjeWByEKvPCM8K99FAE76ki9JzXpuFEUo
 BC7ZqV0HVqvxa//jWhPDV1FcaTfzi3/q+UgpLE7YVEWTEOmLXbosP8eNEYRc8s1smHyO
 9ycRZwq0tZTzY4NRtg+dXhiEu+/Bkn/foRt8tbOeEoH4aqHg0GUS08DwHWfHppDL4OrT
 QASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NQO2i9adFhiwGLGxGCId5JT2A7IxIeuOyfDZPn9a9uE=;
 b=mV7vlb9XbdSHhEGcuhauhXCHn7/4DUrRPxzkYkv2uqW6hlt8yVjYQd5sZDoyNCudlo
 aKSTnJTtYDzf6DUIYRBC/+sDmazMTMTYQ/LAFsl7/roXru4FwINcQESjQd9dbrzt92BO
 NEa+9xt7oJD8xO3gVatcfkUPwz5CbMEsEamsZP+uDEkC1rqQxVLn1AgEszKRBh5HML/6
 Lobm3cIslBr8aaXkdMLP0StTE1xxsBm3h3tUsb5WUX5ch4cPSRw07Qjd9ZtwmV03ZEsC
 s0mltSIlMwHxfAYQ9yvrLIqn19o8nKSSNuHTknPCvhGpEYgl1xi7xGCKPQaGyKtlSqvX
 Fsdg==
X-Gm-Message-State: AOAM530Buc8M7q4HENqVW5g5QMWxn22wBhPjjgrnGLYTftGxgxZ4c2iQ
 52M3KgcOV0bEu+SbtN+FR8M=
X-Google-Smtp-Source: ABdhPJwvBvM/UrwvOLm0FV5HA0wJES2PJ3REWSaNmjsxKSVEF2sa0TX3mGyoiQmC9qn4aYtKGRFfZQ==
X-Received: by 2002:ac8:5bc8:: with SMTP id b8mr28871955qtb.386.1625761419502; 
 Thu, 08 Jul 2021 09:23:39 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id b7sm1154830qti.21.2021.07.08.09.23.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:23:38 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Picture missing in About dialog on cocoa ui
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA-KxyVeKaRPV+A9RkTQGQBoT_LsgyoRH6mON96dTz7uag@mail.gmail.com>
Date: Thu, 8 Jul 2021 12:23:37 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <C057B53A-368A-4C9C-9404-230D5FA769ED@gmail.com>
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
 <CAFEAcA-KxyVeKaRPV+A9RkTQGQBoT_LsgyoRH6mON96dTz7uag@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82e.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 8, 2021, at 4:58 AM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Thu, 8 Jul 2021 at 06:38, Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
>>=20
>> Hi,
>>=20
>> My installation correctly shows the picture. Please make sure you
>> install it and run the installed binary (not the binary located in =
the
>> build directory). The new code should work reliably once you install
>> it while the old code may or may not work depending on how you =
execute
>> the binary.
>=20
> The correct behaviour would be for it to find the icon both
> as an installed binary and when run from the build directory.
> (This is true for various kinds of loaded file including guest
> bios images.)
>=20
> thanks
> -- PMM

Agreed. My original code did this. I do think reverting =
e31746ecf8dd2f25f687c94ac14016a3ba5debfc is the best way to fix this =
issue.

Thank you.=

