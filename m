Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7FC1155CC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:53:03 +0100 (CET)
Received: from localhost ([::1]:41268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idGqk-0005vR-C3
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idFXz-0007xW-OQ
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:29:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idFXy-0008JH-NW
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:29:35 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39149)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idFXx-0008Hv-Mm
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:29:33 -0500
Received: by mail-ot1-x342.google.com with SMTP id 77so6107640oty.6
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Yzv5Xveobx+eBUxsnVw67hztizIW+3C2SXpKxGaDxU=;
 b=ozGlnR8bZqcf4D26sD/TAzQBXj2oK0ZCFIJGSuFogeAaLHPq8maW6DUvYPnjxfN4Rf
 EvMIWUO6sI6Tv4tDgjOFjfJP8T2FelTTep1/D3pdwHk57D7mRj5m8nLomvSyA+LOYVr6
 JtcLBaxcW4U4OyyshjGFKMh5CCZhzqKPkgLsM4YsqNfp46e9KiNkYCuGS4OO1bp0F0ug
 +AU8Y212F9DmF8Us1AeC6l0L6LU6q9v9JLGImOJWCUx4X5ZTrDyyOssxS3nNE57MPC3+
 xJcS4E3IG7ZOZ/yqTqElfuNgxw0UdELz8ZjKERi6+lhnClcdfhHfRrHoQ+E5ZLidBlDw
 IxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Yzv5Xveobx+eBUxsnVw67hztizIW+3C2SXpKxGaDxU=;
 b=JObCdLPPCIHL5aOAHv1oPMEXHCyMIMqbbRK8FyRNf3vYIHM7fu6b0yiwr+dtn7LYki
 yf5MK8Sawcm5g9BTZp4Byyi9y3seCPLgb4IdOSa8VYGuKufirr3hMOpMqgX4pyIHPbD8
 K1ETxPOck3Ze5Bo3AEwyflepLhNjfDBwOv/mwO/bFVtHzGwmFBkKWZtmPep4315pc68+
 oo6dZoT+cvEeGyvjOxf5KRP7zzBUC/Yqu8Rx8ZV9xmp/4BghrHSuaJK2H6z45UV4OZ7r
 nkGaNcHgr/pqgITfpvHM/ieaBge2rvVKTlVhDyLfk92raVS9WE0wn0EUgttZag2ceUrv
 uVYQ==
X-Gm-Message-State: APjAAAWCFgEqNASEfQcJAheFMebs2HtWjBV4SJORZpv+QwFiXLr1s7Mc
 ESI4ZogDRQ6fo4NUwjMYlBdwDTV2f3do8pY5qGUiEg==
X-Google-Smtp-Source: APXvYqx7ADnxQQd2CUTKfZRlgeADallzuH7gsnzL/2RWBJif6Y+L4dcK5VnOh/+pYwlvxXY7o9ruYzUI7U7UbPbY4jU=
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr11796431otg.232.1575646171756; 
 Fri, 06 Dec 2019 07:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20191206122247.7507-1-alex.bennee@linaro.org>
In-Reply-To: <20191206122247.7507-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 15:29:21 +0000
Message-ID: <CAFEAcA9S51DWqysHbO42CjOhZBMA4qwN2zT+isOmWFtH5G8N3Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: don't bother with id_aa64pfr0_read for
 USER_ONLY
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Dec 2019 at 12:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> For system emulation we need to check the state of the GIC before we
> report the value. However this isn't relevant to exporting of the
> value to linux-user and indeed breaks the exported value as set by
> modify_arm_cp_regs.
>
> [AJB: the other option would be just to set reset value anyway and not
> ifdef out the readfn as the register will become const anyway]

If you want it to be const it would be clearer to define it
with ARM_CP_CONST... I'm not sure what an ARM_CP_NO_RAW without
a readfn or a fieldoffset will do on reads.

thanks
-- PMM

