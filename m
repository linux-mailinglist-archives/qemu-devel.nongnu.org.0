Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DB314F281
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 20:06:16 +0100 (CET)
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixbcM-00028r-RN
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 14:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ixbbS-0001cn-CW
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 14:05:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ixbbR-0007ns-41
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 14:05:18 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:42854)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ixbbQ-0007mc-V3
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 14:05:17 -0500
Received: by mail-ot1-x332.google.com with SMTP id 66so7568161otd.9
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 11:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a63feuu9mueh/e10TOOZWAUG4CvDLz5bXdMVszhXSaY=;
 b=UkOMnri9gk5pyizUUXdwRPmtIkNFgWWMcPpnOR68GE1CvexvCZexD3YRnFjLlQcxXP
 DvwJ+sD9KQCfKRhr0h9iHe0oCjLrqEdEyR1ofmkCgKcr2gPSRdpY++TQ4y7tHc/LPmSt
 /ieX1yywnE4zKxHP1zCdzkBgWMUQKq7HcxLrUJJmSmZ7vIpX+Y/BQeFpKh+bSMxF+Og8
 Wq53QIXZebID1BCspzG/FAE2HsDmTlaY2R8viX/II2O+FmAb/5lDkbqMW8aTBJto6SaM
 K8pWPm+LaclWjJT7ox69hn4h0EPtsyt6N5dDhp0oDZK66UIuVyWCPu2kADKEAKlVxmzX
 P/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a63feuu9mueh/e10TOOZWAUG4CvDLz5bXdMVszhXSaY=;
 b=BYra7cJMfg8vJDQ94VrfWsBkxLxme6Sm11XPCNlzovttoScU03G24P4jULXHOEGgOs
 +YwT4/QorCENLzcdHDQzaIFfEHSVEBG3hAV8laT4tOWEn53O6jTr+DGY9/vrC65V1HK0
 3A5bhEZFuhkEWovAPvztIs8gghLzm0wsz9Ahxsa6RZ8N+BuKEZ1Pex6qgUJ+DYOAo2io
 VoPv8FAM4UtjHdY1Y0K/ktrtZSUwswFNpK/lxRcotmJ8jwirGj3iiBn1SocEiE8cgfzC
 /zP3lpNlQ/y4J5bcXFWTCxO7wMuj+/jxDOc44yLzWd17If2cm/RneObdFbPfh5b4IjVe
 s9AA==
X-Gm-Message-State: APjAAAV6rxJ7vG0RTdS1QOGUHjk/WsgDh0KhEOdw5nlTAyoUIPQBYzoy
 qzHVLi742i1Sru2uAZUuVGZF7xxcJIMG9d0i+zxDtQ==
X-Google-Smtp-Source: APXvYqwxLE9MqzwX8YNAC1r17ENAN6A+hUTvwbO6M310AHDznMecte/Cx4EGmvxu67yDV8F7df9/zbr2qwGObCB3HnE=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr8826046ota.232.1580497515939; 
 Fri, 31 Jan 2020 11:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20200130213814.334195-1-stefanha@redhat.com>
In-Reply-To: <20200130213814.334195-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jan 2020 19:05:05 +0000
Message-ID: <CAFEAcA_D+pbCUFvZVmRnvVBf+a4PboOzPRAvXyM=HoaCVrZjQA@mail.gmail.com>
Subject: Re: [PULL 0/5] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::332
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jan 2020 at 21:38, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 928173659d6e5dc368284f73f90ea1d129e1f57d:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200130' into staging (2020-01-30 16:19:04 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to e144a605a614d22165000c69e8e1dc6986d45cd8:
>
>   qemu_set_log_filename: filename argument may be NULL (2020-01-30 21:33:50 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

