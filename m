Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05295BBD86
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 13:09:36 +0200 (CEST)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZsB4-00058X-BT
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 07:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZs9X-0002x4-Df
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 07:07:59 -0400
Received: from mail-vk1-f182.google.com ([209.85.221.182]:36658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZs9V-0001qP-U3
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 07:07:59 -0400
Received: by mail-vk1-f182.google.com with SMTP id g27so296598vkl.3
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 04:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6LTml2fBHoqxCnBW7uJURKCQ50RIKEgkpkMXOWn6z84=;
 b=6wxuXxdVdq4VxnWoCGJLmqeyVvFHCoVqii+wDLCR1U08Fxh4jJJGSkH66iMF1aUuwS
 EjSeM8Z3A1RRRtFIJVciaBppW6dhLtp4JrAXNZsv+QqUsCj5VjANszIO0dq5VqC7bbWt
 EqZWyw29CG2enccmr/FdCle7k5kufhSX0W73WuIvK4n5LJXihDHYS+5xpAJHMla1pFb9
 8deMp8Fs06lSkyq+Bfs97Zr9ld1TLPtOaEzdhtTOxXN4vAT73csnbxGjzt3EE9NLKd5n
 7/uxsVdN9i2TLl7g9cRz+FmRdgQgQ/i2UTZ8OFwdzVFSIZEMCe9turveVt9RImjyxP6L
 2Acg==
X-Gm-Message-State: ACrzQf3mlXTqYDM07OheU6TacfrN+nYm8YmbeRkBPgDwNs22VSLpRDWv
 OaPydsYlwT6b23dDiiKdThmkTAUJI+f0hCJa6BE=
X-Google-Smtp-Source: AMsMyM7NzE0ykJEag8lQjdH3XY0aiG8TNu4L/CZ7glbYNa1YtzWxW+c/ePaS0DBvbn6muovBMqs1O5zyIdEmktyV+ds=
X-Received: by 2002:a05:6122:10dc:b0:3a3:4904:2941 with SMTP id
 l28-20020a05612210dc00b003a349042941mr1155807vko.24.1663499276603; Sun, 18
 Sep 2022 04:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <152673688616.9061.7617411809661975686.malonedeb@chaenomeles.canonical.com>
 <164553818076.45462.17246694949180967211.malone@dale.internal>
In-Reply-To: <164553818076.45462.17246694949180967211.malone@dale.internal>
Date: Sun, 18 Sep 2022 13:07:45 +0200
Message-ID: <CAAdtpL6NTm6h9KeXsDTUUTF1YcsLNcLKtFAR=BYAiZg0ceUydQ@mail.gmail.com>
Subject: Re: [Bug 1772165] Re: arm raspi2/raspi3 emulation has no USB support
To: Bug 1772165 <1772165@bugs.launchpad.net>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.221.182;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Tue, Feb 22, 2022 at 3:15 PM Carlo Bramini
<1772165@bugs.launchpad.net> wrote:
>
> I'm also trying to run QEMU for emulating Raspberry PI, but I'm still unable to make working external USB devices like keyboard and mouse.
> Unlike previous users, I'm not using a linux distro but Microsoft Windows 10 instead.
> I'm using the precompiled 64bit executables downloaded from https://qemu.weilnetz.de/w64/ as suggested from the download page at qemu.org for Windows targets.

> The emulator starts, the desktop of the OS appears, but still no keyboard and no mouse support.
> However, I can still login by using the terminal provided by the emulated serial terminal.
>
> Is the feature expected to work also on the port of QEMU for Windows?

Yes.

However upstream QEMU bugs are now tracked on https://gitlab.com/qemu-
project/qemu/-/issues - so if you can reproduce it with the latest
version from upstream QEMU, please report it there.

Regards,

Phil.

