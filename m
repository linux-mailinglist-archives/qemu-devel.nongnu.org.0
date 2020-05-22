Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5B91DE8A6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 16:20:01 +0200 (CEST)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc8Wm-00024e-EB
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 10:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haris.phnx@gmail.com>)
 id 1jc37B-0000jp-I6
 for qemu-devel@nongnu.org; Fri, 22 May 2020 04:33:13 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haris.phnx@gmail.com>)
 id 1jc37A-00039g-KY
 for qemu-devel@nongnu.org; Fri, 22 May 2020 04:33:13 -0400
Received: by mail-lf1-x131.google.com with SMTP id a4so6022126lfh.12
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 01:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q1rhjp76abCy+NZtSwW/TpAW0D+kjfkf6867pQNi7+E=;
 b=PjY8DwzD9WEUD/ayHcvSJTKtMMZ9Hiy2eHT4IbTXi9PJjhjSAur7u90czALjgUxz7w
 G3ty0ydvjQcSWajAk+YNbJSrrJiNdY6m0pXLJHwM6PcOWKQPlpWFplC/ZQoPO0XVOzFT
 Uvy/R9Z/5mfmgZ5BzwJH6EQHhMw170qpYe6sR+Zr0ptXlv9LRWC+YX06U3+DxHiz+Yi3
 PzV/DtQ5cUPP0Z0xTcTFWDIeIrrQhiHJwBkTf+1dru1lwsh4oEWdRHbXRTBWT+j0x9EC
 82OZ4+/S1aE2FbOzsqkjHvHEIubvZ/yofRkbPj29or5C+6N8BhE8ffNDWnXfxnM747ZE
 IrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q1rhjp76abCy+NZtSwW/TpAW0D+kjfkf6867pQNi7+E=;
 b=qEqFulQ97I3XhZXw7Zn3zZPYMEYrsBmkJQCZWOfiUpcnflgX23mBI2Y/a8GrqszHAG
 xU/BKsl7YDCl81wpxqcxzSHiGZPb4POM3FegjM7OUXh7WnQJH2zla+Z+w0CemhKbKvFI
 QilC50DhYPRCg/iNZVZI6ER96fqrRRFkJms4Ruqabngmx8LwVQ3HZyDcImpZUYDGzl+K
 Ip5DGiuKN7Yd+7D/B6caVLLuxBvPlTyJUbIz9puZFuvq/H7CZOMU3aukj1bziGWLQonl
 0FUI6Nvt9HgGcbKHva812dOC0lB8ihJiEI+2OOgaqszwckyq3pJ//TtYErtm8tYV896V
 yNqA==
X-Gm-Message-State: AOAM533sFsdT8LFxkyRFnp9yorqfD7YdSXUPz+qqo2eHO9Z9tbDRxL5f
 EoQ7mVZCrVk/AQAXlqCkelCliGEsEw+fjn+tvoR0T/rppuE=
X-Google-Smtp-Source: ABdhPJyWKTQfquqe6AZKb8sNlo4j0LV4p9ZXXmPOr6R4fLmqTpUFIb1q31YfVKuQ+Rmv0jYHqYL9pBYyEJhoFBlDjdo=
X-Received: by 2002:ac2:490f:: with SMTP id n15mr6938853lfi.39.1590136389393; 
 Fri, 22 May 2020 01:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAE_WKMwmOtR_zqUR-40Lv6Wrrm-ZBqTganHT_zF_m3tf2is7xA@mail.gmail.com>
In-Reply-To: <CAE_WKMwmOtR_zqUR-40Lv6Wrrm-ZBqTganHT_zF_m3tf2is7xA@mail.gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Fri, 22 May 2020 14:02:42 +0530
Message-ID: <CAE_WKMy-PY3qyTGDGvogXPXWgCZ-N_N_n-qEP9Rtk-UgROHx6g@mail.gmail.com>
Subject: Fwd: simple qemu command not working
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=haris.phnx@gmail.com; helo=mail-lf1-x131.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 May 2020 10:19:05 -0400
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
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I am having some trouble with spinning up a VM using qemu. The
description is below. Can someone please point me in the right
direction?

--

Regards
-Haris


---------- Forwarded message ---------
From: haris iqbal <haris.phnx@gmail.com>
Date: Wed, May 20, 2020 at 5:10 PM
Subject: simple qemu command not working
To: <qemu-discuss@nongnu.org>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>


Hi,

I am trying to install ubuntu in one of the qcow2 images I have
created, using the below command

    sudo qemu-system-x86_64 -enable-kvm -nographic -smp 8 -m 8G -cpu
qemu64 -cdrom ubuntu-19.10-live-server-amd64.iso -boot d
ubuntu-19.10-live-server-amd64.qcow2

First it spits out a warning, and then just hangs at "Initializing gfx code...".

    qemu-system-x86_64: warning: host doesn't support requested
feature: CPUID.80000001H:ECX.svm [bit 2]
    qemu-system-x86_64: warning: host doesn't support requested
feature: CPUID.80000001H:ECX.svm [bit 2]
    qemu-system-x86_64: warning: host doesn't support requested
feature: CPUID.80000001H:ECX.svm [bit 2]
    qemu-system-x86_64: warning: host doesn't support requested
feature: CPUID.80000001H:ECX.svm [bit 2]
    qemu-system-x86_64: warning: host doesn't support requested
feature: CPUID.80000001H:ECX.svm [bit 2]
    qemu-system-x86_64: warning: host doesn't support requested
feature: CPUID.80000001H:ECX.svm [bit 2]
    qemu-system-x86_64: warning: host doesn't support requested
feature: CPUID.80000001H:ECX.svm [bit 2]
    qemu-system-x86_64: warning: host doesn't support requested
feature: CPUID.80000001H:ECX.svm [bit 2]
    SeaBIOS (version 1.13.0-1ubuntu1)


    iPXE (http://ipxe.org) 00:03.0 CA00 PCI2.10 PnP PMM+BFF8C9F0+BFECC9F0 CA00



    Booting from DVD/CD...

    ISOLINUX 6.04 20190226 ETCD Copyright (C) 1994-2015 H. Peter Anvin et al
    Loading bootlogo...

    Initializing gfx code...

I have searched a lot and got a number of solutions and possible
problems but none worked.

1) Have tried with Ubuntu 20 also, but same error.

2) VT-x not enabled.

It is enabled, `lscpu` shows

    Virtualization:                  VT-x
    Hypervisor vendor:               KVM
    Flags: .. vmx ..

3) Tried with `-cpu qemu64`. Did not work

4) used `qemu-system-i386` instead of `qemu-system-x86_64`. But that
fails with a different error

    This kernel requires an x86-64 CPU, but only detected an i686 CPU.
    Unable to boot - please use a kernel appropriate for your CPU.

5) I have asked the same question online, but no answers.
https://stackoverflow.com/questions/61864520/qemu-installating-ubuntu-through-iso-gets-stuck-shows-svm-cpu-bit-warning

6) Have tried without the -nographics option, same story.

7) I did find out that the "SVM" CPU bit corresponds to "AMD Secure
Virtual Machine", which confused me since my CPU is Haswell.

The host system on which I am running this command is an ubuntu.
I have tried this on 2 separate ubuntu machines, one running on
virtualbox as a VM with host OS windows 10.
The other also running on a virtualized hypervisor (not sure which
one), as a VM.

Can someone point out what the problem is, and what is the solution.

--

Regards
-Haris

