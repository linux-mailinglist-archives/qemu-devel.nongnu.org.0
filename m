Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32853E34E1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 15:59:36 +0200 (CEST)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNdeI-0003zb-Mw
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 09:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNc6B-0002dU-Of
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:20:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNc69-0004k3-F7
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:20:14 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNc69-0004jl-9i
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:20:13 -0400
Received: by mail-ot1-x342.google.com with SMTP id z20so1796683otk.10
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bu9VtAfZyma9hAxIAPgNAkso+ko+dznduw4mStAQrX4=;
 b=W1V51Gy6psD0hgGvm21L1PYu2ondqcZTjpcj1vex7wGwkoaV/SMdqGv2VoXY6TbG1n
 O32tAKuZDs9xigeqUW5/15yW4AHEljgvWPBROVTkBzVjjK8xAKby72rB5JwMMtrwMUCE
 ZOGHOFvPPK/W2m0ygLGNV8vVC3/+Qe/ISI4Fl90aUsWXWdydoDdXk1qvEdURoFEMoVBk
 81gP1T17T8S1JOJci8DPadwSh7mK8zEdr1OQyqprFgA6KZMR2itaS1uot8Mqj/yH71aG
 BFXG/3Mke1MctGc4nP+EkFq0aI+cesqaEQ1nO3PMqO2LvWAvT8qp+QMz8k/qDnKE3JLO
 EBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bu9VtAfZyma9hAxIAPgNAkso+ko+dznduw4mStAQrX4=;
 b=QLzgrKnDnGbncmLBRfOlJuGgz8Px80abygeZoMwk9xKBKa1OI1R9Bk5eNfZzkLgQA/
 aGUrC9+v9gz4i7WaRYG9jYN7GcTOTt2XFKrbns6WRCefGPqKprKkLoEFgdbquyT5ly1B
 /04uE0iKYjQp4A1wLhLN8jmte2jfsP9lRW5KeW+QqFhFpFN2Dc/mrlduXHgc/+YVQtpo
 qt6wkeJims79BdTYpzcVc7BMfW0E24YgYSWcu1sRMB538kzC/ESrr/xpSvL5MM23+0vu
 g0rOvGcMabAaSXFFl1iuEFOc1QKbXJt6jdQkme7B3CZ3dooWA60DkbStQRHua0xnX4dH
 MeRg==
X-Gm-Message-State: APjAAAWpTvjX+ridrnZqiij7Rga6xo6G6tDH9M23xBl1dUrUL4vdPogb
 sNqBqg0fKfjOqdexUWGGyhdHGffGJ/WEmOwXwC7L0w==
X-Google-Smtp-Source: APXvYqxbQG5fFGaW4WT0rRdLzTcinVRktIWnHLFFN86yGF9vpVmZezzk2qWuS4xeo3gOZeNcmJOkrHb1Lrnun8XXi0c=
X-Received: by 2002:a9d:30c1:: with SMTP id r1mr11784100otg.91.1571919612565; 
 Thu, 24 Oct 2019 05:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191021140600.10725-1-peter.maydell@linaro.org>
 <374ee14a-e462-d839-3997-45f642e849ca@posteo.de>
In-Reply-To: <374ee14a-e462-d839-3997-45f642e849ca@posteo.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 13:20:01 +0100
Message-ID: <CAFEAcA_qkqANHkiLXvrw43SBzT3j=gqTZxfkuOCahOhd+MzsAA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/m68k/mcf5206.c: Switch to transaction-based ptimer
 API
To: Thomas Huth <th.huth@posteo.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Oct 2019 at 12:40, Thomas Huth <th.huth@posteo.de> wrote:
>
> On 21/10/2019 16.06, Peter Maydell wrote:
> > Switch the mcf5206 code away from bottom-half based ptimers to
> > the new transaction-based ptimer API.  This just requires adding
> > begin/commit calls around the various places that modify the ptimer
> > state, and using the new ptimer_init() function to create the timer.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Changes v1->v2:
> >  * turn the early-exit in m5206_timer_recalibrate() into a goto-exit
> >    so we can end the ptimer transaction
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>




Applied to target-arm.next, thanks.

-- PMM

