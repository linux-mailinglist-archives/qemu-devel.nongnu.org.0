Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57148016
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 13:00:20 +0200 (CEST)
Received: from localhost ([::1]:46066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcpN4-0003Wu-VC
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 07:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46187)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcpIH-0000sT-6K
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 06:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcpIE-00013s-5m
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 06:55:21 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:34473)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcpI5-0000oD-KW
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 06:55:11 -0400
Received: by mail-ot1-x32e.google.com with SMTP id n5so8850449otk.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2wvujGYCcMt1EQmZL4UscOdC7Xw5npuneDzUVJ5cis8=;
 b=bdOBUAkDqGbRA0duq/JjcNnNlLaoPoE5eT681lXJ6NrQPcIa30443D2uMK06wuI/jw
 2PRFhNqNTIJ8XE5B92JMlR1PnJEzIJd/Mx3jquNFuUM7voN8NimVdvwQzvlIKmsDt6mo
 qGepUZp3CNSUAFgdg/a54yTqO8/2I4zNM4BOChFTHt3KcPGXBNDlCQcVNGOx08z7g5ae
 Ct1G93GH7CF6ZtvOTJCuqnX5HZUm14PPFPpna3w/I9SG8zxIWmcG/gD/SJ7+bWbghNP5
 sNyk2836NM6nTqSBT/5cpWUnFH+l92gp0ul1DfzLY1ggNu73k+QhayzREDWDiiDRTyQ0
 dTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2wvujGYCcMt1EQmZL4UscOdC7Xw5npuneDzUVJ5cis8=;
 b=i1j64xqnZ2Eqi91JwIZXkiixSC4s0gaR3V7trSeKoZDq5oHRPNBGeIjtotgN5Cn338
 jVpgwPQmuOy7YxnuapaMooh0dsbY99xS+L/I4+UQeKSeleOWHYKwjjqDCV3YOEo3lLbH
 u2te7VxcUaT/XVcJ32kme3NGCjhDLD2/DRxrI23aqeq5/o4iCXuHnI7gtIe4w9Mou+m+
 Vwz4wOGFIxGgXgG+JaHQ6ysY5JEU18+sXF+MurCSqISE4M/aXot37t2RxVRrpn8GacRg
 cPtPfy+w3Xp3Uot8sv+guoF3v19W8LUN4P+22D99axhRPUYKHgLnAIVy/hKFKSIffcRd
 HjUQ==
X-Gm-Message-State: APjAAAXAX1ycNUpISvR0ZYfXCMJD1CKkNEcri6ayiu6vSZmQF1xUXO+I
 lth6BcLxdrIY4RJgln4L3FQgxv+VFCCEC8cL2KHbJQ==
X-Google-Smtp-Source: APXvYqzL6UuaIf3ty04peSYBIjDn0clxUigOt24E5jGJHiRv79P2h/yDX5Nhc6mhGyKn+1S4+JcV6H381mvPFASyF6A=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr6266157oti.91.1560768906923; 
 Mon, 17 Jun 2019 03:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190614202333.19355-1-lersek@redhat.com>
In-Reply-To: <20190614202333.19355-1-lersek@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jun 2019 11:54:55 +0100
Message-ID: <CAFEAcA9PcTTagxUcxba-_qFsC97T6uEe927akjj-G4na22rf6g@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
Subject: Re: [Qemu-devel] [PULL 0/6] update edk2 submodule & binaries to
 edk2-stable201905
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

On Fri, 14 Jun 2019 at 21:25, Laszlo Ersek <lersek@redhat.com> wrote:
>
> The following changes since commit f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f:
>
>   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2019-06-14' into staging (2019-06-14 14:46:13 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/lersek/qemu.git tags/edk2-pull-2019-06-14
>
> for you to fetch changes up to 541617cad3445fdc6735e9e5752e1f698e337737:
>
>   pc-bios: update the README file with edk2-stable201905 information (2019-06-14 21:48:00 +0200)
>
> ----------------------------------------------------------------
> edk2-stable201905 was released on 2019-06-06:
>
>   https://github.com/tianocore/edk2/releases/tag/edk2-stable201905
>
> Advance QEMU's edk2 submodule to edk2-stable201905, and rebuild the
> firmware binaries. This should be the edk2 release that goes into QEMU
> 4.1.
>
> Launchpad: https://bugs.launchpad.net/qemu/+bug/1831477


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

