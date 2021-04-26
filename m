Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D189936BC9A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 02:23:45 +0200 (CEST)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbBVw-0005O9-DJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 20:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb8CX-0005Xd-Th
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:51:29 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb8CT-0003Ll-Ib
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:51:29 -0400
Received: by mail-ej1-x636.google.com with SMTP id u3so7748909eja.12
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Mb/ndas/GJnUGf+ornSRf0HmzRHlLzi67gC17Km87io=;
 b=el0D5FDuqlX1RGw8KNgy4zTKnD4jIEh24xnuA93sMDZRbed8yaWvrk5OUKVh56mW9o
 iPvS90orLFgqUsd+wU3ywxFJIR+7KaljLlKhClN98wtSI5geiHrQYog0lGX9hquDgsBe
 eFuGf65zVEp1tta0A5jgc2GnB9uUPT+OvewNX2gWL7Sz3B1+zeHJ2JsbvT7IwMbTOrqz
 LLy9+ozENBYQoCKQQvYQZS9ZeeLqw7lPvv0OtpA/f0q/tdrMIRjqqjBaz/f343MMqotW
 lz6JTRPGg+Dua4XImCmazmExYTjXjA2cJS/Ybgi251BlQrkgGMU/F0OyXxm88syzgszV
 Jeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Mb/ndas/GJnUGf+ornSRf0HmzRHlLzi67gC17Km87io=;
 b=nPG83Ulv13o0SqCrH7VLTl6i1Pig0AWf2s8NAs0DVwkThUevYrqIefuSA+wAw7dnVv
 AytUTtqwN/zBH9yVGUTDU0l8W4XBTVFHE8dOaDbTe7U47OQNUfe6z5POoCckAOIT+67J
 9xhC+OB5EktOXzvUVs3Q02x4XEMmcIPKkK8EudTezp5zxymj60Gs2XPxMjIKGQbOouIa
 hGl7bHcq5vKk1sttLwqPFOYU9m8oPLJqOdQBEXA9fV4orKiYnQwafL7g169bMmm9onRQ
 4NIYnRpTIIBMduLirdlMKENbzSYXtRS21ABIbXp8EH8ToHVH38u74w0Fbm3Y6G5GZdM2
 KbGA==
X-Gm-Message-State: AOAM533zjH+loFII8BVB3WiZA4NyhRm/y3qXC9n+yxPGQ6if4IJcXiBQ
 EqH7oNwrmMB8eQ5b1VDnCDhicMtUx5lS6XHBVXe8hCs7LaLwFh6Kk6M=
X-Google-Smtp-Source: ABdhPJx0eeN24qmGqcgMBRbr6oIXioeHn+RvH2RQpD64TWrAj9gj2tUtl1244pEIVrzy6GGLnDBqX5QqbbDPQyK4uLQ=
X-Received: by 2002:a17:906:d81:: with SMTP id
 m1mr20645881eji.105.1619470283772; 
 Mon, 26 Apr 2021 13:51:23 -0700 (PDT)
MIME-Version: 1.0
From: Dev Audsin <dev.devaqemu@gmail.com>
Date: Mon, 26 Apr 2021 21:50:38 +0100
Message-ID: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=dev.devaqemu@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:21:43 -0400
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
Cc: alex.williamson@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex and David

@Alex:

Justification on why this region cannot be a DMA target for the device,

virtio-fs with DAX is currently not compatible with NIC Pass through.
When a SR-IOV VF attaches to a qemu process, vfio will try to pin the
entire DAX Window but it is empty when the guest boots and will fail.
A method to make VFIO and DAX to work together is to make vfio skip
DAX cache.

Currently DAX cache need to be set to 0, for the SR-IOV VF to be
attached to Kata containers. Enabling both SR-IOV VF and DAX work
together will potentially improve performance for workloads which are
I/O and network intensive.

@David

1. If DAX mode of virtiofs isn't yet in qemu, what is the best project
that this could be discussed?
2a. Regarding your comment on hard coding the name, I am referring to
the device by its name, which has been initialised in
hw/virtio/vhost-user-fs.c. I downloaded the source code of qemu with
virtiofs support which I obtained in reference to the Kata container
project and analysed it.  I see the following  code snippet in
hw/virtio/vhost-user-fs
  if (fs->conf.cache_size) {
        /* Anonymous, private memory is not counted as overcommit */
        cache_ptr = mmap(NULL, fs->conf.cache_size, DAX_WINDOW_PROT,
                         MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
        if (cache_ptr == MAP_FAILED) {
            error_setg(errp, "Unable to mmap blank cache");
            return;
        }

        memory_region_init_ram_ptr(&fs->cache, OBJECT(vdev),
                                   "virtio-fs-cache",
                                   fs->conf.cache_size, cache_ptr);
    }

In the above code snippet, the memory region is initialised with
device name  "virtio-fs-cache",which I am referring to in my source
code.

2b. Regarding, needing a way for the cache to declare it wants to be
omitted, I am not sure thats what is needed. Currently virtio-fs with
DAX is currently not compatible with vfio. I want to overcome this
problem by making vfio not using the cache.
What I want is cache to be used for purposes other than the VFIO
device. For example, in my deployment scenario, I want DAX cache to be
not used by SR-IOV VF (which is a VFIO device) but used by all other
system.

3. Moved to  vfio_listener_skip_section () and patch resubmitted.

Best
Dev

