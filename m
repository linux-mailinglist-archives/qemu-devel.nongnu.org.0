Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E837242F82E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 18:31:55 +0200 (CEST)
Received: from localhost ([::1]:54534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbQ7d-0001op-Oy
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 12:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajaygargnsit@gmail.com>)
 id 1mbPjL-0007RT-CZ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 12:06:48 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:41930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajaygargnsit@gmail.com>)
 id 1mbPjJ-0002am-O1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 12:06:46 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so13461968ote.8
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=I1hD65KZvsTUM11Z3+OFqcCldJ1PmlO0xyX0FqNo4g8=;
 b=l7XGJBtJWwSkDWFWzBueb4AOSdvZPd4CkJ2gDdb73FyZEMtgbjYfBINLTJu83ai4hT
 tajsKA8RLPGARMVv0m/Q1I3VOGvUPGjRJNixb/okrR20oTnyWPoGjITcAkKW4pG6s0q/
 zPtHNRSkFDmgBhGlFxfmcOb90crdFxjQ4/xmXZZFiZ2uu9VqpLYi7IXAl8BMc3OPwLHG
 TuwbXZENdhyAH6g2S2+XB9LvSLEkU/wWI02BHGXAzGL7/f9JJlnbl3EryOw1tMojjc2n
 G4LTqIpMCJ4CkTmBgcEMz16PS0TqEPdW5Z/2HDJTb1fdjgWQh1++6o2ABzCWEfNVmmqV
 YcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=I1hD65KZvsTUM11Z3+OFqcCldJ1PmlO0xyX0FqNo4g8=;
 b=0ZTGGM6VTV4FByUr6tAW1PZpS4ewTVpMKIJ6+uUunPvz3B6xetpu6EELKm2ttO/XWR
 W3QX73zpuKhgFx1c3BFP1pKePjjEsHSokJ86skOGNcKxcwnro9ircKbU3o9IJpu5n4yV
 5Nw2Zl5qnpUyFGTNNsNOBggKF+5V6fEdCvaoEJMUshXeWRuIfwkQLKkXKOw+N9URVfpl
 Itgx253UgONFOfISIESKR9b9BH4nrBXSsb4nAhzcjIXlYaF0O2NkXlmRObRrzms/2Wo7
 yvv+hzgP7m3yDnt1WmUf+62G4sDzBZ6SSeBPJESPBZNiefKF/9oKKNQ3n/FJO+IghyZ3
 4Dxg==
X-Gm-Message-State: AOAM532ybQzJeV23u/PqSe5zKXBZftK0kN07m/XlUpCJcXFT9K5afBdB
 /0bkuEK3jy1xJpbZIcRhFSjU0o0MGwM0ZwFbheqMdAPmYB4DJQ==
X-Google-Smtp-Source: ABdhPJw6yX5L5dezK5z0mmUW9dbMl86S6pg5jOzb/va4JUt41Rwc0U5zQOe0QKe2HobyCq8dSYvnArBjCiA5B7smi5w=
X-Received: by 2002:a05:6830:3148:: with SMTP id
 c8mr5714344ots.351.1634314003564; 
 Fri, 15 Oct 2021 09:06:43 -0700 (PDT)
MIME-Version: 1.0
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Fri, 15 Oct 2021 21:36:31 +0530
Message-ID: <CAHP4M8URVjPEGFLHFXk4iS-7FYpg_=ZCVr2f6ufcFkNnZqAUug@mail.gmail.com>
Subject: Host-PCI-Device mapping
To: QEMU Developers <qemu-devel@nongnu.org>, iommu@lists.linux-foundation.org, 
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=ajaygargnsit@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 Oct 2021 12:29:23 -0400
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

Hello everyone.

I have a x86_64 L1 guest, running on a x86_64 host, with a
host-pci-device attached to the guest.
The host runs with IOMMU enabled, and passthrough enabled.

Following are the addresses of the bar0-region of the pci-device, as
per the output of lspci -v :

* On host (hpa) => e2c20000
* On guest (gpa) => fc078000


Now, if /proc/<qemu-pid>/maps is dumped on the host, following line of
interest is seen :

#############################################################################
7f0b5c5f4000-7f0b5c5f5000 rw-s e2c20000 00:0e 13653
  anon_inode:[vfio-device]
#############################################################################

Above indicates that the hva for the pci-device starts from 0x7f0b5c5f4000.


Also, upon attaching gdb to the qemu process, and using a slightly
modified qemugdb/mtree.py (that prints only the information for
0000:0a:00.0 name) to dump the memory-regions, following is obtained :

#############################################################################
(gdb) source qemu-gdb.py
(gdb) qemu mtree
    00000000fc078000-00000000fc07c095 0000:0a:00.0 base BAR 0 (I/O) (@
0x56540d8c8da0)
      00000000fc078000-00000000fc07c095 0000:0a:00.0 BAR 0 (I/O) (@
0x56540d8c76b0)
        00000000fc078000-00000000fc07c095 0000:0a:00.0 BAR 0 mmaps[0]
(I/O) (@ 0x56540d8c7c30)
(gdb)
#############################################################################

Above indicates that the hva for the pci-device starts from 0x56540d8c7c30.

As seen, there is a discrepancy in the two results.


What am I missing?
Looking for pointers, will be grateful.


Thanks and Regards,
Ajay

