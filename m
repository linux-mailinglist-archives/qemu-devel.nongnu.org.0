Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6063A7F3A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 11:22:56 +0200 (CEST)
Received: from localhost ([::1]:55056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5RVA-0007Qn-0Z
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 05:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5ROS-0008Nm-GV
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:16:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5ROR-0006lh-21
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:16:00 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:34453)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5ROQ-0006lT-SJ
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:15:59 -0400
Received: by mail-ot1-x335.google.com with SMTP id c7so19935969otp.1
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5202wWqMhcjrZ2T5M46VXo9W3WUwT+15a5glYrw4PuQ=;
 b=mnQHayLNbTgXBAYa66DTA/rtXRL/zjYGBOz06dhDfdti4SMtzuW+URZQoHmpEAPTzs
 tduxj8kuRyYpz/GuBcKO2M7tV3o7uutKBaVZUsdaFhQsnqk08xhfM6cR4v9JeRzmEHLO
 1tVH3avglZ57tep1IitbXE2haKV37W3oF9RFXkIpJ1X2ozowJK/sz5/3eyYEUHZLW43z
 I/vjpAhAXTqyh8ohcdtvFbS4azvJYiVmVqSRs3MZswAcYFCsibsVKEd81IGI3KCSjq6W
 txmb/nIfsIPqSJOhiw+rIDI+Jf0AB+PIW8kcUZy93KVzmpC1+G2DXZ/P271BgNmCtZ6s
 YikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5202wWqMhcjrZ2T5M46VXo9W3WUwT+15a5glYrw4PuQ=;
 b=W8V99nm3ztKeuLfjN7gbIr0+HnJDV9SfcNI7d6PcZd9qIBZQfdY24KKXAzpNJzuJh/
 fPoUbwOVEW3mzC9TDFVCbyMvxysGGf63Docp1EyFHt+qDxnB5IVZonc4eqTx2yb9Z0/s
 RXs7sp+IH8h/7qfSTe9/w0JRZQ13g/NtLvR5LPgUWHDZMh6iYlhCbC8YssJDQFAlUDID
 QlcyGXgnPU115Kc6Om+8Z4q36FafpKfuTf6b+MdEYQ6ew+4nkIFVX6OlHdJ0T0utMAAx
 x6OPoLzZqo3MGbE12+DecyFRdW3KbRfgTDrgOA3/xtf/ZSAuLBeG0SFskC057b2Fv/Ed
 ZYhQ==
X-Gm-Message-State: APjAAAU2ApKU1lfDLz97Y71Nh2yqjknpOaVHiK68VutohkO/5iYyEs6v
 6p44PlBeasrSyTOxu7OH5UHnmgmhqrNFALQP6tTcig==
X-Google-Smtp-Source: APXvYqwaI54CzoRjm+FIbgo86vUR8lNe2/4LjTfsa273z6ax68NIluMpyU9z8ycMXLty7HIS1CFkUtU+kfKcpHQKeUk=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr32587182oti.91.1567588557854; 
 Wed, 04 Sep 2019 02:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190829071016.16589-1-kraxel@redhat.com>
In-Reply-To: <20190829071016.16589-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Sep 2019 10:15:47 +0100
Message-ID: <CAFEAcA86UrdAt0hVVk_BHDDFK3EO_b04CCrGxYjOwpcNvr-8tw@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
Subject: Re: [Qemu-devel] [PULL 0/3] Usb 20190829 patches
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

On Thu, 29 Aug 2019 at 08:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 23919ddfd56135cad3cb468a8f54d5a595f024f4:
>
>   Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20190827' into staging (2019-08-27 15:52:36 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20190829-pull-request
>
> for you to fetch changes up to e4c1c64112565a9be50008e6f28dbc41b53da740:
>
>   usb-mtp: add sanity checks on rootdir (2019-08-29 07:31:12 +0200)
>
> ----------------------------------------------------------------
> usb: bugfixes for xhci and mtp.
>
> ----------------------------------------------------------------
>
> Bandan Das (1):
>   usb-mtp: add sanity checks on rootdir
>
> Ying Fang (1):
>   xhci: Fix memory leak in xhci_address_slot
>
> fangying (1):
>   xhci: Fix memory leak in xhci_kick_epctx


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

