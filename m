Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19D19D169
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 09:40:59 +0200 (CEST)
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKGwk-00077T-6B
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 03:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jKGvz-0006cc-57
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 03:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jKGvx-0005iv-NY
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 03:40:10 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40660)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jKGvx-0005iR-Hl
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 03:40:09 -0400
Received: by mail-ot1-x342.google.com with SMTP id r19so6340639otn.7
 for <qemu-devel@nongnu.org>; Fri, 03 Apr 2020 00:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HqGl59/0JvIhcYk7SQe+U2SamldG+Jua+pGUe02QquA=;
 b=tfWfa1aWyoTD1lO+emeeP7+w5TizgZEXZBrgr/ik0hf/pWfCpqUJyglSy3blZxqaJ0
 YOzkqVoUIAarcLFmgvky5tZpnFDU93jJKqWpJ5OwVZwHWvUPgCEkIUMERt6okZOrZVvY
 PdKy/oghGZddfzhZPmV0w3Tga/XcHyIUm8uOCi2BXigZbHwwDMFxopJ0ikCvAdApIGuV
 WKEC1rEE+XGv5EsBJ9wPJqZzXqPNYhHdNgfYLtoz+ypz8W2sA7LuOzbw0UFscju80XIl
 phbsnrjZZdMsZ8psELzVNs/uyPXHcMAeSCdSszuWO1rQVI0WsCG9mx9ZtrCC4wsURPom
 Pl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HqGl59/0JvIhcYk7SQe+U2SamldG+Jua+pGUe02QquA=;
 b=BdONy5WNPMoqYvJScb7xXOnmgiLlSeTG3WnHJySQltnC1pgrIucaHV3836VAm9otkC
 d7HrmdLnCEb2O7R7OkWdnTnlf4L6oyq/f3FDqq/U06wBoe5+2D8RaZxCFREwu1HxFr6O
 OX5IaMyl5rS2mDQdkEksxjKT+fdKoyzDj/wNXFhwX4c7G9n4g1jkHZ/Xq2Juk6CpfUQI
 1Na72ZELIEXKAOU5b0jaYylLbQakWDrLLjdTq/SYJlRbAIuXCe7HUUEE8WDAGuBJsfQJ
 vx5RU+QUU8bffIkDG3Sjl7z52KW4dMotlg/ZCUwj737vlQgCi/M50HeCWsttbt76TWux
 6oHA==
X-Gm-Message-State: AGi0PuZoiHSlN18MBdBJo08L4DvhbHsqKzdZRpqOUVjUgCm4nmVqJ3Nd
 2sreF8whgRVPeY39gRr+lldf4yMPLUVL67rVih0ITw==
X-Google-Smtp-Source: APiQypLHVEpuSmLCS27FcsJqox4rb2k3e0uMhslUGNpg84KjbJBQTNKgRegEFE1uhQHUgZWAKfL5/9W8WgRQLtmkkEQ=
X-Received: by 2002:a05:6830:11d5:: with SMTP id
 v21mr5455785otq.91.1585899608581; 
 Fri, 03 Apr 2020 00:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <XSF-9CLAGYMG1ivdwoihQBZm3XT2vWdKVqHtMLExgA1LJwkSeISDoKKVEJ3E3qhZaNvki44j2CdXdQ81ljytvtS0MGmXL3gFhO2kQmWA2Kk=@protonmail.com>
In-Reply-To: <XSF-9CLAGYMG1ivdwoihQBZm3XT2vWdKVqHtMLExgA1LJwkSeISDoKKVEJ3E3qhZaNvki44j2CdXdQ81ljytvtS0MGmXL3gFhO2kQmWA2Kk=@protonmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Apr 2020 08:39:57 +0100
Message-ID: <CAFEAcA_-aRethWOmzaKqft8yMg6dGUUwvf1kX36R4+R=yWS2RA@mail.gmail.com>
Subject: Re: Qemu doesn't detect hard drive
To: "Aijaz.Baig" <Aijaz.Baig@protonmail.com>
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Apr 2020 at 06:18, Aijaz.Baig <Aijaz.Baig@protonmail.com> wrote:
> I would now like to add a hard disk for persistent storage and then trans=
fer control from busybox initrd based rootfs over to the full fledged versi=
on offered with Linux. So I add it to the command line
>
> `sudo qemu-system-arm -m 1024M -M vexpress-a9 -D qemu.log -drive if=3Dnon=
e,format=3Draw,file=3Ddisk.img -kernel buildroot-2019.02.5/output/images/zI=
mage -dtb buildroot-2019.02.5/output/images/vexpress-v2p-ca9.dtb -append "c=
onsole=3DttyAMA0,115200 kgdboc=3Dkbd,ttyAMA0,115200 ip=3Ddhcp nokaslr" -ini=
trd buildroot-2019.02.5/output/images/rootfs.cpio -nographic -net nic -net =
bridge,br=3Dmybridge -s

This command line creates a "drive" object but doesn't plug it in to anythi=
ng
(it's like asking QEMU to model a board, with a hard drive sat next to it
on the desk but no cable between them :-))

More generally, the vexpress-a9 board does not support hard disks.
This is because the real hardware we're modelling here has no disk
drive interfaces and no PCI or similar bus that you could plug a
scsi controller into. The best it can do for storage is an SD card
emulation, which works but the performance is not great.

thanks
-- PMM

