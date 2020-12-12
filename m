Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E42D894E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:35:05 +0100 (CET)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9jU-0003Ug-FM
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1ko9XI-0005XN-Vn
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:22:30 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1ko9XG-0003MV-BV
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:22:28 -0500
Received: by mail-pf1-x430.google.com with SMTP id q22so9268177pfk.12
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kz9fnsqZtLE+VFM4mnJkB/CYEIt0FJhtcc3PTn/Jskw=;
 b=dTjHvxxXGHYn23cZ9N60xED5vWuP4ccGFoq7rPKQ+JYv7iL7pR24KOxV12r+RfoCfL
 FNAu7ICRBD2LwoPVzt0x0nJij4R7hk3PQjukWCFcE3YVXExKcKiZCA6iR0kRRPIbre34
 qokzslN6xlxJjt54rK2o2EIyh3h5ks27pxxfPHxiMKT9rMzN0RrpebTvgER49bdU4l+R
 Q0CWE3tjBSQreJfngRo4vJI2MIkW2gDxAVSLshHPj7zA486dMLN3OnRZbKRZuPddG5i8
 gmUKE8KO3Z+ydKHzX3pLD4dVhpmxQ6NWV5Nzdgc0UfeSfy+wGV7wZQGmCJ9cn2q13zoj
 r8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kz9fnsqZtLE+VFM4mnJkB/CYEIt0FJhtcc3PTn/Jskw=;
 b=petTP+MbOLjaP3JBUQOxXyFBA+4/19xA0A1niX3DjmEv+S47kRKM5DDE4GV9ZLY/sY
 JwK3C14f74U5HhA5HvBFUv7uFDoJcfjVXJEhFdK3sJyp/CdDEx598NWeGx5vOmzIkIit
 A484HukxyuwJPjYAWDiFDpLf4D8MZJjBs61B0v8TGACAmUcuI+ysLFD32UerKwFifGcq
 HX3Zr2rh2agtxvgnAesdz+25mgQZYNmk8w3vwU7B+UkRMVX0tKTYvFUwuPPVLLSoKtDq
 VU6d88iyh8mE1CGvOsVDnYQL4rIMQRepfCrGblU8/Bw/3qzZcKN/rcZAf6QFGL18qOoR
 tTVw==
X-Gm-Message-State: AOAM530oQDWL2ZThBkHUpPgFUZD53v+TT5r5EK/Mtc8prW13a40SLEue
 IJg4QwqJP5UQ1VRIVQaktLdHM6zYl3C4HLl2Ot5mURfrMx8=
X-Google-Smtp-Source: ABdhPJzYhg5LwsYJPCftTXzuVbcJIPOcxOJD93pyvvGHw6hyn+elnAX7yDoMY50KKFywU4ELzmqajhIwYbj/oocSwig=
X-Received: by 2002:a92:5b9d:: with SMTP id c29mr24091734ilg.91.1607790529924; 
 Sat, 12 Dec 2020 08:28:49 -0800 (PST)
MIME-Version: 1.0
From: Diego Viola <diego.viola@gmail.com>
Date: Sat, 12 Dec 2020 13:28:39 -0300
Message-ID: <CA+ToGPHan_XHjy+=3vzefnJ9+EBHkL+BBR2FgM_v-XWcqVkgQw@mail.gmail.com>
Subject: Slow video output from webcam with qemu-xhci but smooth with usb-ehci
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=diego.viola@gmail.com; helo=mail-pf1-x430.google.com
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

I'm experiencing a lot of choppiness in the video output when I pass
through my USB webcam to the guest using qemu-xhci as follows:

qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -vga virtio
-device qemu-xhci,id=xhci -device
usb-host,bus=xhci.0,hostdevice=/dev/bus/usb/002/004

My webcam is:

Bus 002 Device 004: ID 04f2:b449 Chicony Electronics Co., Ltd Integrated Camera

I am using mpv /dev/video0 from the guest.

It works fine if I use usb-ehci instead, e.g.:

qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -vga virtio
-device usb-ehci,id=ehci -device
usb-host,bus=ehci.0,hostdevice=/dev/bus/usb/002/004

In this case, the video output from mpv /dev/video0 is not choppy.

My QEMU version is 5.2.0 -- I am running Arch Linux on the host and guest.

Any ideas please?

Thanks,
Diego

