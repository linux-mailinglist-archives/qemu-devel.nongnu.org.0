Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85C3554F0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 15:23:22 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTlft-0000Ay-UV
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 09:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTlet-0007kl-J3
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:22:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTler-0005Jj-NF
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:22:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q26so8528658wrz.9
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2yixALfjuWq/IIUfyxety+jGeFdLGfLBhcO/I7wN+JA=;
 b=oKCg0RUgWol2tmaBEPHjGuBDaCrLH0ySedE8+xjU2FU9Xit0hKAXB7p+NeTt2Q6gBH
 S8MvxZ7W/JjQIbyTC4/aWi/K43XfY0G3OoXDpp5jex0IAiNBQ0IHbxvyd+I+1Ui7FZSK
 mRWWhwPCuK9+YYr5sbkbL38zFSIUhHQ7Z1bwG34RNA/cN20XLX3OswT/agR7yfTrWiyc
 vzUXEKNIKWWZIk1MDh1G6Mws6jRU5HHUw1VfXm09LTGDJuJmEL5j6txnMInA0FztBQq5
 ACOzN+8RTseUEanYndFqdyBIPjPQGow8rQroEFowDdVFlARpkAf3uXRnnnsUvxDyCslb
 3mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2yixALfjuWq/IIUfyxety+jGeFdLGfLBhcO/I7wN+JA=;
 b=WeNBLdzmc5YX7k086CpksUnGBrxzNZzf3ujxsZF7rShKGtCerhilvBmLKbudVaKDaJ
 aaaDVRpSUZk2yqoBZLf07v4XZyEhXY5ZWf5Xe1r6UhOJc5D6xULKIu1aUeV9n68TG2oT
 uGt8edp7pgqzYBNPfIG+2LMLdvXV/Yjwo6W9gyk0SUssyD9g53+lL5JIDr0nmgZX3tzT
 phti2yMJOE8NV1k1G/hJaLPILwATjhj6vTePRRUjs2TiN0Z8wgOawbnFyLujk0z7kz0Z
 Yryaq5Y4rBg/upH6dyrAYjPnh/W8pEcmNCanJuH5iT6S0XfjNSfHM9tSTVygRW0xRVDO
 E43A==
X-Gm-Message-State: AOAM532NS0pSLOJT0I2xVcFrZEfXcKLMSlhU2fw6B2+WhOyCTFc+sggD
 +5Z9V9YOH0b2BoBZssHDMGATKQ==
X-Google-Smtp-Source: ABdhPJyeNKHiyGqZuNvGwTaR2771q4WfVfOt/hTNuv6alqClTbACNbBMMPkt9qExi76pBZ1Eb15wSQ==
X-Received: by 2002:a5d:58e5:: with SMTP id f5mr21316640wrd.131.1617715336254; 
 Tue, 06 Apr 2021 06:22:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g189sm953896wmf.14.2021.04.06.06.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 06:22:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AEE001FF7E;
 Tue,  6 Apr 2021 14:22:13 +0100 (BST)
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Could we document exact steps for loongson3-virt in the manual?
Date: Tue, 06 Apr 2021 14:06:57 +0100
Message-ID: <87mtubwnsq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I was trying to bootstrap a Loongson3 Debian image but ran into some
roadblocks. Philippe pointed me at:

  https://www.mail-archive.com/qemu-devel@nongnu.org/msg768848.html

which gives a bit of detail but elides over details such as how to
handle block devices. AFAICT it should support virtio-blk although maybe
Debian bullseye doesn't support the target, it's hard to say:

  ./qemu-system-mips64el -M loongson3-virt -m 4096 -nographic -blockdev dri=
ver=3Draw,node-name=3Dhd0,discard=3Dunmap,file.driver=3Dhost_device,file.fi=
lename=3D/dev/zvol/hackpool-0/debian-bullseye-mips64le -device virtio-blk,d=
rive=3Dhd0 -kernel ./vmlinuz-5.9.0-4-loongson-3 -initrd initrd.gz -append "=
root=3D/dev/sda1 console=3Dtty0 nokaslr"

Gets as far as:

[    0.008641] printk: console [tty0] enabled
[    0.009507] printk: bootconsole [early0] disabled

and then just goes silent. It would be nice if we could add enough
detail to the appropriate target-mips.rst to:

 - give guidance on the best model to use for general purpose distros
 - describe a common command line for such
 - detail bootstraping a modern kernel

In the ARM section there is a nice "Choosing a board model" which
discusses what you want (probably "virt") and then we have varying
levels of detail for the various myriad zoo of ARM machines that are
emulated. I recently added sections to the versatile and vexpress
sections after going through similar pain trying to get those up and
running.

--=20
Alex Benn=C3=A9e

