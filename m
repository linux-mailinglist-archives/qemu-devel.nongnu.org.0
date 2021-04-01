Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86041351486
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:41:25 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvhU-0006J1-Gd
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1lRvfn-0005kH-Gf
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:39:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1lRvfk-0008Ob-Pv
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:39:39 -0400
Received: by mail-ed1-x530.google.com with SMTP id dm8so1595988edb.2
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=Nz0khJQyLD3EDWtFbYLIR7B4Vvbzc4qC2gA7f5DCIvI=;
 b=XA59XKWDm+6+4vl+/oDVnlosu7fT0IvEceBFcOSudwBBYyYFljeg/egd2v8JW6toEH
 YbzqZMvdkQwwCM7L//V5nTdUa48KUg6Mdm/KBiGvR2fKY89wCn8f3Nefzyy1HQEUnfTj
 uBC1kI43s7KvD42R1r4h0G1EJdtAg5P90DDCIc+XGg8Kj7k0zCHrTaCrptnY2QxkvR2W
 GidYRB39JrBVjzADqWw9zNAY364T+ne9e4VQzVjD1E9jSv3ii7e7Dgnncos7S6c+rDmk
 UHxvaS2bpfYk7rkzOjbQ+vc0MKH6ZD8YrZgN4REDalo+Lb9x4dWqYzdlXfauvqpcWOEe
 FMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Nz0khJQyLD3EDWtFbYLIR7B4Vvbzc4qC2gA7f5DCIvI=;
 b=e2Cv5KtFKjcFJAddyuVkxEWpVLMWBZKNKCMu2g4Md0Y+SW1PjG/O2Td4D5BxOL8Pg6
 tSK/JdIgrqExSxfDjVzbvx7CSVVNZal79bKGVQOGk38Qqg2N7eIKMtA4VLUFaPg9LoIT
 r33DqzEtBNHijBZhrh1PtCIRMWc4Tvk/JPgWf6mkvjt7ZjB6egEBWbPgIY0xaWBvrupG
 1BIeADBjzNEbSoRcX9sZaoA2boObqOuVNyR0OxlJITzwcJv6rJu5tXXKQw6dJHhVtDZi
 IJNOZA7GOr2c2xW6gfjeB6Xri1OjsHBPVImCaURt5XbrDnVPq2D3VdQUvFHVdlQoN6vj
 5vug==
X-Gm-Message-State: AOAM532NaGzSJ5MdA19/eBmkdj5BFkBXGwCCg6b+nnqvk5wn55t/3ZCO
 Rz8MU6YvKGT55+B5+gr5ewqS5lmIZP3O2/3+8GxTeQ==
X-Google-Smtp-Source: ABdhPJzfAwPBigxn30/IFPXcBcLCAioAzDodrmJ07tjnIcspmL1w4gdpgMzA0kFN6UM6U7Fwpnm0CmTW1a6z+Fmqes0=
X-Received: by 2002:aa7:c9c8:: with SMTP id i8mr9161147edt.193.1617277174266; 
 Thu, 01 Apr 2021 04:39:34 -0700 (PDT)
MIME-Version: 1.0
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 1 Apr 2021 17:09:23 +0530
Message-ID: <CAARzgwyS6Lhcqx6nPqtbdwzZuhz+roKCiVLDPzftpsxN2T+H2Q@mail.gmail.com>
Subject: virtio-pci reset option
To: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi MST:

ref: https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-pci

What: /sys/bus/pci/devices/.../reset
Date: July 2009
Contact: Michael S. Tsirkin <mst@redhat.com>
Description:
Some devices allow an individual function to be reset
without affecting other functions in the same device.
For devices that have this support, a file named reset
will be present in sysfs.  Writing 1 to this file
will perform reset.


Can you please tell me which change in the kernel virtio-pci driver
enabled this option to be available in sysfs? The kernel we are
running does not seem to have this option for virtio-pci devices. I
cannot seem to pin-point the exact change that is needed to get this.


thanks

ani

