Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086A171630
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 12:43:03 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7HZG-0006nY-KV
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 06:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HYT-0006L5-5F
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:42:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HYS-0005HZ-7x
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:42:13 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:32785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7HYS-0005Go-2Q
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:42:12 -0500
Received: by mail-oi1-x244.google.com with SMTP id q81so3009962oig.0
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrbC0oQw7VXJt7JLDkv/kW1T+NY7ozwjk8067V7eRGA=;
 b=xZGeQXmUYJ6aomVNVuICqwx3MFTT2Nev2+R5QzCJady127BkmlLz67CLdXGPuQONOQ
 ZCI/tJqMmEfhCOJh31txFMQHgrA1kuQPNUDtYNTFhODALk1XpwpgSJnNs6P02WleAwzz
 77mtWMEvJOC5IcwkQxIagP7pL9HD2WyqLVcFwRuEftWbrXuYGYsdRt7bjhDus6kZweeF
 4UwWGo/bzQ+an9kvq+bXGO5Sc317tPygdFf7AFBqJMAx8GUIfeFjUFBzfzlMuq2rUwRK
 5X2tezx2TNQIvHRjvp8+e3UrTyPS4M9oYuuee45/19Zzw7ojKHwG0qZzwlFifvvcIzCO
 IkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrbC0oQw7VXJt7JLDkv/kW1T+NY7ozwjk8067V7eRGA=;
 b=ImsyYDBlu132SAkTElWSCZnfFBjSlBRl7rrYA7JQtl3jNcelndM8k3Sa+NnuNFlk5W
 crycrXQpX7GrMvZbXpZ4dLw7D2uXv72ucrtIrVXkf432LKz3tBazVNAkcdHmO+/3OBac
 ooQBqmW5++M7CNyWtdywlZcI2DBMGHvwangn9UnlB7YxEEWGAQ+kaXd4MFyYjUiPFcKd
 FmpR9pJoauZKfhEp0LvuozNcSAXG8nFlwj97lTS4dizF1wqcqhU/a3048sVV2ydmviiP
 RbHjv2vlSOiyMHzUTZ4HhIYtZfpiQmWw5CjuLh1k8vUufjV7N0IXOZCPHUcP79IazhzF
 Pvvg==
X-Gm-Message-State: APjAAAVKOr5teQJ63G3Dl5/45ICdPfDw44cxDsETDlNS6Gzy/nhMNZvH
 siaju/igFiRLEfOFGstvEepiq2aJj8dRIJXx0lHLyA==
X-Google-Smtp-Source: APXvYqz2fzj5WqBIfTpbFqf8Y6V5CwIqKrVA1CgnQ+or/DFdlkUP6//ipWeCXYXsKBydIUKBtsw1z+oerLg3AQIU+Zk=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2836665oie.146.1582803729680; 
 Thu, 27 Feb 2020 03:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20200226113034.6741-1-pbonzini@redhat.com>
 <20200226113034.6741-7-pbonzini@redhat.com>
In-Reply-To: <20200226113034.6741-7-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 11:41:58 +0000
Message-ID: <CAFEAcA809VU54e4pXxX=En0LCuDmNHCdg2QMTfu9HWS=9h59NA@mail.gmail.com>
Subject: Re: [PATCH 06/18] qemu-doc: extract common system emulator
 documentation from the PC section
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Feb 2020 at 11:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Move the section on PC peripherals together with other targets.
> While some x86-specific information remains in the main system
> emulation chapter, it can be tackled more easily a section at a
> time.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'm all in favour of reducing x86-bias in our docs :-)

thanks
-- PMM

