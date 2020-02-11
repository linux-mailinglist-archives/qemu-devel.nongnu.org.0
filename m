Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0846615956D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 17:56:53 +0100 (CET)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1YqB-0000B4-Tq
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 11:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1Yp3-0008Be-Kp
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:55:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1Yp2-0000DF-65
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:55:41 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36504)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1Yp1-0000AV-Vu
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:55:40 -0500
Received: by mail-ot1-x343.google.com with SMTP id j20so10790626otq.3
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8X1xAbHlZqvaE7jRxuo4lNxyZhCcWICQ+WEizwUM28=;
 b=byjjXnvKY3HIrCin+RB4j7ymApth5RPQ0dePDKDp+l6pnOIVITk6/Rtky+Rtc2O4m3
 n63Z7XMe+aWwbmOQw40R2LoLOSQgal+p9wDmOCfjaGmNsg/TiBbgXdHXBdSQomDneaAu
 YNrNqTjnQO6VWobw0i0sssYlvczSme8WRjHDq9mrTj/2RxUyNqC6wBbk27EwVQxiMCLH
 NY+77yHeVnFzO86aNSPj1TZnWYCXyTkDO/lDr5zW4aehp4K/VRPOVZNY/dNXcbiEkqCX
 MMpnrztbYnkbeqMEDkAtyu0tP49OkzGL+QauV5W8JQZKgrBYxGt1feI7w6VN4Zhc4662
 Mbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8X1xAbHlZqvaE7jRxuo4lNxyZhCcWICQ+WEizwUM28=;
 b=t/7kEzx3qo5k4o+GzJTtvraroJJOKkrkzmnpGr1LW1h6cnpYorAAjIMMqipOYwRpvr
 S4SaeT8zsEq6NzO2StNAK1QbJ/biMgcY9cNvLqmUn+dO8qXmb2ZdeXDMjXX+Toumyv7f
 T1Zq5iwGvaDCIjJgImV8zNytl6tWFmIEel1tJfiN+zIHJYcMPaBYtUw4NMW1MYGC8Wyb
 TnfGw9Q74HvHtXfaZYXD39psSW9XDFd91k5ORz8sTBUTuEgUOxqxizMvwsQR5rvJ8pBp
 YxJPDvl8NOFDVUZNdt1zXqheBTg3Jpxg3I5VG+oX0vpJp9CUL69ppFISVZI4oEPYdo3p
 HXoA==
X-Gm-Message-State: APjAAAX8FjINz4WvhXBV5YTaqjp+WAM6XM2AqHvkErRy6CQlxwXvBZUU
 bfB/F9kmQOcxO9qJgndh79ls//ZrWkgfXP4uUy2i0w==
X-Google-Smtp-Source: APXvYqwmn+YGq0kFbuqK9etxU+ktvxQx6RyqFLkd1UTdE5DJfPdnEshmMKBCyr6izGEW//cj6pm/aZx0uYc7O+q7M6M=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr6053484ota.232.1581440138749; 
 Tue, 11 Feb 2020 08:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20200204171053.1718013-1-laurent@vivier.eu>
 <20200204171053.1718013-2-laurent@vivier.eu>
In-Reply-To: <20200204171053.1718013-2-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 16:55:28 +0000
Message-ID: <CAFEAcA-ikT8wTh67UXOrQ-FeASk+oBvXPjVtMQTzsbMNxsS6qA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] linux-user: add missing TARGET_SIGRTMIN for hppa
To: Laurent Vivier <laurent@vivier.eu>
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
Cc: Marlies Ruck <marlies.ruck@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Josh Kunz <jkz@google.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Matus Kysel <mkysel@tachyum.com>,
 =?UTF-8?B?TWlsb8WhIFN0b2phbm92acSH?= <milos.stojanovic@rt-rk.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Feb 2020 at 17:11, Laurent Vivier <laurent@vivier.eu> wrote:
>
> This signal is defined for all other targets and we will need it later
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/hppa/target_signal.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
> index ba159ff8d006..c2a0102ed73d 100644
> --- a/linux-user/hppa/target_signal.h
> +++ b/linux-user/hppa/target_signal.h
> @@ -34,6 +34,7 @@
>  #define TARGET_SIGURG          29
>  #define TARGET_SIGXFSZ         30
>  #define TARGET_SIGSYS          31
> +#define TARGET_SIGRTMIN        32
>
>  #define TARGET_SIG_BLOCK       0
>  #define TARGET_SIG_UNBLOCK     1

I've just discovered that this was actually an ABI change
in the hppa kernel (at kernel version 3.17, kernel commit
1f25df2eff5b25f52c139d). Before that SIGRTMIN was 37...
All our other HPPA TARGET_SIG* values are for the updated
ABI following that commit, so using 32 for SIGRTMIN is
the right thing for us.

thanks
-- PMM

