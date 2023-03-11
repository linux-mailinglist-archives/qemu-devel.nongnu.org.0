Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E06B6095
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 21:41:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb60f-0005Nw-7O; Sat, 11 Mar 2023 15:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisgs987@gmail.com>)
 id 1pb4U6-0001yp-Sh
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 14:02:26 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisgs987@gmail.com>)
 id 1pb4U5-0008Fw-6A
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 14:02:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h14so7922421wru.4
 for <qemu-devel@nongnu.org>; Sat, 11 Mar 2023 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678561342;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jpaD+Ozw6zNAOHMj5wea13fZgI8vcbqMwUu/T/1wsqQ=;
 b=bg3WZeSyDhuBNMjYNGIYYg/3+QV06YdmGOYGwOcvOZsAJ8rFuws1uyMXyjsg4rfyLB
 ZNpIjXWIqyc03DnxInqwYhxT/w98DSL5eeq2L4lielt3E5aqi6gvQHBskVCRIM6hsgES
 phBzDOlPJU50vbMlfGjmiSZjAd3BGQ33a6Cs+fPwVr6LiW0JHFg880esFEvWO3P56D1P
 dV9vdW5kOaJ3gcsvzyYpqZeI9CNdqSiL7e9seKLgrFngtOmeXbdUYTgxEmEvqjC7ZUKe
 bftYKRyUjFAY7xf3zCykCdCM4SpmobqrIiyMNBdQKypntUx9FOcqRK3nhKQKH9xebYV9
 ehbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678561342;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jpaD+Ozw6zNAOHMj5wea13fZgI8vcbqMwUu/T/1wsqQ=;
 b=Rd/dJexs6ItWIDoua1zHsUvDjkggVeEhXWKQrwv8B0rpzL4aEFy8baGc1ZDe1vBGGx
 fCrX3R3eh6vxLjaep3/S0hslxZFCjXEZ70erEysFSnh9XzPdrKv/n80H3plNDai6IO2V
 x8yM2a58Af2HjXL5YwMDXTRq5ebw2G/YAq6qZNE8OcZBW6IJBVBUtqYldMIz1+tJ4IJ5
 iBkPHNdKLiPlMMJBZeGZ56C/lBnNF6f/Vdfm5kn6UTiAsw93utN1IDhOlS2+9bOIkw+J
 Zw/vsMPTi7kLUNxYq6e0XAZBIiO4E16xP2wpdYZKEBlEKfNMxUGS0kVHaV487hnQS9P7
 3CUg==
X-Gm-Message-State: AO0yUKVipYnv17a5zD4+WAGFkWBPDTh+sgvtezWacpOaH6Ska4kN4wV+
 irbBUtGWhy01fSD0WVhFsWn4mJIaGibVeXokD6PjqP9Wt18=
X-Google-Smtp-Source: AK7set8kGe74RAP3GN+UuMtiw26nZb3r+iBg1M3NMJqOmyc27MG4WO6rlW90dD87p7gfiqjoCQiMt7brZ3DFDsXlkpo=
X-Received: by 2002:a5d:654a:0:b0:2ce:aa0e:6a98 with SMTP id
 z10-20020a5d654a000000b002ceaa0e6a98mr30806wrv.9.1678561342276; Sat, 11 Mar
 2023 11:02:22 -0800 (PST)
MIME-Version: 1.0
From: Chris Smith <chrisgs987@gmail.com>
Date: Sat, 11 Mar 2023 21:02:11 +0200
Message-ID: <CABn+hrA5Gd0KmizYvuMFznhQmrdWhni8AMkjp924O-0irG39JQ@mail.gmail.com>
Subject: Resizable BAR in Kernel 6.1
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008a484d05f6a4842a"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=chrisgs987@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 11 Mar 2023 15:40:04 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000008a484d05f6a4842a
Content-Type: text/plain; charset="UTF-8"

Hi,

I was wondering if Resizable BAR support is planned to come to QEMU soon as
it does now have a sysfs interface (commit
041bc24d867a2a577a06534d6d25e500b24a01ef) meaning that a protocol could be
implemented for virtualizing it to the VM.

I am wondering if this is a feature being developed or planned to be
developed in the near-future?

Sources:
https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Code_43_while_Resizable_Bar_is_turned_on_in_the_bios
https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.1
https://github.com/qemu/qemu/commit/3412d8ec9810b819f8b79e8e0c6b87217c876e32

--0000000000008a484d05f6a4842a
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div class="gmail_default" style="font-family:trebuchet ms,sans-serif"><p>Hi,</p>
<p>I was wondering if Resizable BAR support is planned to come to QEMU 
soon as it does now have a sysfs interface (commit 
041bc24d867a2a577a06534d6d25e500b24a01ef) meaning that a protocol could 
be implemented for virtualizing it to the VM.</p>
<p>I am wondering if this is a feature being developed or planned to be developed in the near-future?</p>
<p>Sources:<br>
<a href="https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Code_43_while_Resizable_Bar_is_turned_on_in_the_bios">https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Code_43_while_Resizable_Bar_is_turned_on_in_the_bios</a><br>
<a href="https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.1">https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.1</a><br>
<a href="https://github.com/qemu/qemu/commit/3412d8ec9810b819f8b79e8e0c6b87217c876e32">https://github.com/qemu/qemu/commit/3412d8ec9810b819f8b79e8e0c6b87217c876e32</a></p></div></div>

--0000000000008a484d05f6a4842a--

