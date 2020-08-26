Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3762538B2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 22:01:30 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kB1bt-0000Q6-5B
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 16:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1kB1ap-0008Jt-Nu
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 16:00:23 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1kB1an-0002LY-VN
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 16:00:23 -0400
Received: by mail-il1-x136.google.com with SMTP id c6so2866066ilo.13
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/yOrsYwPENhGKi6/GQdeXPEmV77xrf7h3i4KjZDWaOY=;
 b=ggJRX/dc/uaSqlpx8TejY5oSEvlz8nyt9AIN8JuryS09ymm4CyiTiwypnfM4uePL7p
 IY6U7OxixvY8iTyP3hrlLenFWPpZLdX87jHXBfBxYCLX0UbV2cJHR/G9k1I9CIBJiE11
 VaKAErqptWYFCKzUV7dD6hKo9m27zUvuaYCu62DoCpI+5Ng56YP1d4BvH36oSK3zgJT0
 vfcnI2RSbr1G8MSB41YmQ0sTEgc5CXJwgJI58ZzmzDBjnPopgIF8uXWGn5/THe1a7kGm
 cSNtZcUJLo9i9eex8vqH1PT/6OS1MamXkA7v3iexetFWL1G7XvHhlTnNE9KI9VifsZdU
 XA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/yOrsYwPENhGKi6/GQdeXPEmV77xrf7h3i4KjZDWaOY=;
 b=clKXqlyQxvUS81sctdSbNDpcpKBIz1n4WbtCS0AjReZbAfsZCXlHja6MkFRPN+Ql+r
 eI8EHAxxs0fmfzd4tgpAUXAeaWAZP2CClyv8tuGQdITs1xLsusltC5t8Iukw9vMOqJO7
 nUhlha4qfYfD0zyM2d3AB2uv7U4DuH7t5em5mDU7B1RCMoaR75cMUqMNiRfiiHBZz6kZ
 6f3cKw36ZbZsGv7+EaE1zWYUTne0rIdzlJN8yeI7N4cjEEkgYOm9jwbVcW91qeOl7Dv9
 c/Dw752A7MreolG30K5+CEztJEi897n+DVOP/5zqrVWuU2ACUe9rTchSGwZCd2LZoYuz
 RDCg==
X-Gm-Message-State: AOAM533mLuzzGVeHOskHbOprK7Z+GCe1nevBU4cWEOKd7AC8IXrdWY3C
 F3rYN/jmkhhTi8QhHmV98chL+K4Ul/B+vAVhO3U=
X-Google-Smtp-Source: ABdhPJyIZfGHULX7XYSp7cnIZkcOZu5LQc7K0aq5Hk727YE1fSYgugao/rS5fJFt03Gebgzg7n5yxTIXugUwQxk1cLk=
X-Received: by 2002:a05:6e02:1212:: with SMTP id
 a18mr14769135ilq.73.1598472020117; 
 Wed, 26 Aug 2020 13:00:20 -0700 (PDT)
MIME-Version: 1.0
From: Diego Viola <diego.viola@gmail.com>
Date: Wed, 26 Aug 2020 17:00:09 -0300
Message-ID: <CA+ToGPGh2JwaHC_6mmJcsiEDn6Qp4=zMD+UTGfiKo-yeHjxKKQ@mail.gmail.com>
Subject: Help with usb-host hostdevice property
To: kraxel@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=diego.viola@gmail.com; helo=mail-il1-x136.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm trying to use the new usb-host hostdevice property that was added here:

https://git.qemu.org/?p=qemu.git;a=commit;h=9f815e83e983d247a3cd67579d2d9c1765adc644

This is the command line that I am using:

qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -device
qemu-xhci,id=xhci -device
usb-host,bus=xhci.0,hostdevice=/dev/bus/usb/002/004 -device intel-hda
-device hda-duplex -vga virtio

My user has permissions to access /dev/bus/usb/002/004 -- I am trying
to pass-through this device:

Bus 002 Device 004: ID 04f2:b449 Chicony Electronics Co., Ltd Integrated Camera

When I boot up the guest I get this:

usb 1-1: Invalid ep0 maxpacket: 64
usb usb1-port1: unable to enumerate USB device

This works though:

qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -device
qemu-xhci,id=xhci -device
usb-host,bus=xhci.0,vendorid=0x04f2,productid=0xb449 -device intel-hda
-device hda-duplex -vga virtio

I am using QEMU 5.1.0 on Arch Linux.

Arch Linux is running on the guest as well as on the host.

Any ideas what I'm doing wrong here please?

Thanks,
Diego

