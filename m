Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE181C00FB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 17:58:27 +0200 (CEST)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUBZy-0002aw-It
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 11:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBWc-0007dF-4J
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBUH-00032f-Ld
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:54:57 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUBUH-000325-3U
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:52:33 -0400
Received: by mail-ot1-x342.google.com with SMTP id j4so5284107otr.11
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OqJGNyVDz211UW5Fz6r9VsMwrvbPs0yJjE+VVXfRzaY=;
 b=NgU1xVL5dlm6s/vd508ky3LILETIShXJR9DvsuTXIu5wNU14jxv6LBeelmlVsqo37m
 c2QNxwyA/zH6z8Lqphum/NUhatGuN6BJoSdiYBcpFn97mCkPfLmGuieq440TQ9mn+nuW
 zRjsWCLdCgIAOV6GM+b3n/oMIcnIqba0AzXs70I/IscDhUJhogpLitXw65PaAqlo26S6
 TXy5KJ68AgZp8X++SD580wRKofYxCsok3P1UEVhFufdvSQgPbkE9NP2zfJlv8fHqsZeF
 WRx049Yai0N6D/FaxPdHv+fPwa18tg9AEuTToU4VUoOV9Xd4/CWChKimAhPzc9QHgzHg
 8eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OqJGNyVDz211UW5Fz6r9VsMwrvbPs0yJjE+VVXfRzaY=;
 b=BGFsTUpygIWVevnpcN09oUWSLl5j2oMRnR3Q5ugGwxkT8wIF43+HERJ0wFvQs7pK5j
 d9PZHGE+zlsm3ziznv31gzyWSh61KGXpgWUcfg40iitbVxGbyEzSGmwTVOsaGK/9hPW9
 d4BR0+8fSu9zMG4SWEFUPhWwcvJz93CKb6f95r7tQS4O7ibx1xAq81g/oMRSeRAFloX6
 vhBHSPNIW7HmSOCDb/1e/EYmck/KNmlyjcT3GD+xD5Roc/quIU8pHH56zlb5mAQ1IcgF
 FvLNpLOlAfsbw23sQuKa+jZ9TUxsGMKkI8eBU7jdKKWcVXtFtcpCmHlWgT6cWPEC+3Yu
 wFMg==
X-Gm-Message-State: AGi0PuYhTzl5buaiTe+w4Um5NzW0sd2t3AsXCq0RNNzfry8B6tn6MOtK
 2UTrheGO75lSzNi7KiMJRn0m9hF/Wx+WwQGHTxsLVQ==
X-Google-Smtp-Source: APiQypKwzEHA9CQrVuq2torBs0zfWrQDfXi7K37xxkMF51uz0u5so8s1eR9NSMClyelz1K3Qsbw2lqjkl0oxr/kMA/Q=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr2937146otc.221.1588261951836; 
 Thu, 30 Apr 2020 08:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200428154650.21991-1-f4bug@amsat.org>
In-Reply-To: <20200428154650.21991-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2020 16:52:21 +0100
Message-ID: <CAFEAcA-1FmK0x3+X2Gzd_e20oz4OaRWV=CSVHA7EOLjc3EvJGw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/mps2-tz: Use TYPE_IOTKIT instead of hardcoded
 string
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Apr 2020 at 16:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> By using the TYPE_* definitions for devices, we can:
>  - quickly find where devices are used with 'git-grep'
>  - easily rename a device (one-line change).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/mps2-tz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

