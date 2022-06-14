Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288C154B855
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 20:11:51 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1B13-00082O-Um
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 14:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dionnaglaze@google.com>)
 id 1o1AyS-0006da-9b
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 14:09:08 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:44990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dionnaglaze@google.com>)
 id 1o1AyD-0006C1-Ci
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 14:09:08 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso37815417b3.11
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=xkz0TWZPozZh5NPnriXrV6r3b43E0tHNWDcR7Rqc7hs=;
 b=X9muRIhk2heM/kYZVRCZpec37aTqf8/etpcLnxtzagllYQQgopSDtG/9G7wNTV2TSx
 Df/csBlWJ7zWffX8bgKApCEF+FTwZ/DW0IrXkekFndxUpoKX1II4THTLS8jw32SH3R3W
 8233yjgIaIg9YPtT3wm3SUeWqKS0wgkNANDctWdzoa7yfOp1Utf4D6yk/H7uNS9QJYF5
 NNmXess+JOKwS+IEkVur+b1uptLP1h/BdxpEXCXX03eVXf1Y/w8ZrEZKH0/nAGgglMfH
 oSZQmTjdWGvTjIrBZ8XP0dDcD7xn35TswJwxPsKxIYWWBrsA6Ovc/A8GXlYSBYfJF1bV
 C0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=xkz0TWZPozZh5NPnriXrV6r3b43E0tHNWDcR7Rqc7hs=;
 b=4FtX+Y7IEJUIWWDJpGteoepGJiEcK+GFjnKa+xxQb9tjeFf2XXwexhnrZ204dUFcSE
 HJZkTiQHNn5Ax04uFIcujNdrBxKNnx7uIZ8OC6yiV6qoTWWXUU0HrKI+OuJFVgvbZ8w6
 BO+JsyuubhIaUl6PiqyKRmB+UHqRqSsAMZgG26R1SNl+3wveDOqL6Wn148WeVaT2yLp1
 31J+4vSFnDVF3myg9wYUfrIFMEqUG1Du+NoAcncAZkL69TG8plVrml10qphtkQHG4Dth
 pZFZn+tbLPD9z7QePb6mvTJB/lhReXqR7AUpwPrqBu+ljO8l5ytQjKNyxz+S4YXL/95B
 3pKQ==
X-Gm-Message-State: AJIora+ssU68jZC4Jy6uXUXJrWEdj1kdIIdp4r6NOtdZtpe/Ah3AzX+F
 6Tf0CwHZo8j/Skg+SlPplQGLQ3HqHfA6n0zRtJPCFgc+gJwRxw==
X-Google-Smtp-Source: AGRyM1sQMvIuPVCfIfb2p1vs9VPpwRMv90oxQaCYJ7xY2pYhUARuXKLuRCndAdVEPh726+RPiWcwNy+wMJmi9mckqfo=
X-Received: by 2002:a0d:ca08:0:b0:30c:b11b:8cfc with SMTP id
 m8-20020a0dca08000000b0030cb11b8cfcmr7386371ywd.362.1655230131004; Tue, 14
 Jun 2022 11:08:51 -0700 (PDT)
MIME-Version: 1.0
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 14 Jun 2022 11:08:39 -0700
Message-ID: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
Subject: New "IndustryStandard" fw_cfg?
To: qemu-devel@nongnu.org
Cc: "Xu, Min M" <min.m.xu@intel.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=dionnaglaze@google.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi y'all, I'm Dionna. I work on Confidential VMs at Google Cloud. I've
been keeping up with the TDX and SEV-SNP developments in OVMF and
Linux, and some in Qemu.

There's a new UEFI feature in v2.9 of the specification (March 2021)
that allows for memory ranges to be classified as "unaccepted", since
both TDX and SEV-SNP require that the guest VM accept any host-made
changes to page state. We should expect newer technologies on non-x86
architectures to require memory acceptance as well. Operating systems
are not necessarily going to support this memory type, however.

This leads to a problem: how does the UEFI know that the OS it's going
to boot will support unaccepted memory? Right now we (Google Compute
Engine) have a system of "tagging" for guest image providers to state
that their OS supports some new feature so that we can enable
appropriate configurations for certain images.

I could go about adding a Google-specific fw_cfg file path and
definition to tell our custom OVMF build to use unaccepted memory or
not, but I personally prefer open source. I don't know y'all's process
though, so I'm asking before making a patch set.

There are two approaches I've considered.

1. An arch-specific config key for a u64 value:

The idea would be that I would add QemuFwCfgItemUnacceptedMinimum = 0x8005 here
https://github.com/tianocore/edk2/blob/master/OvmfPkg/Include/IndustryStandard/QemuFwCfg.h#L50

For Qemu, the main code I see for adding config is here, but I'm not
sure what y'all's preferred external configuration method is to get a
value from an invocation (flag, config file, etc) to fw_cfg.c:
https://github.com/qemu/qemu/blob/58b53669e87fed0d70903e05cd42079fbbdbc195/hw/i386/fw_cfg.c#L95

We'd add something like

fw_cfg_add_u64(fw_cfg, FW_CFG_MINIMUM_ACCEPTED_MEMORY_SIZE,
ms->minimum_accepted_memory_size);

where FW_CFG_MINIMUM_ACCEPTED_MEMORY_SIZE is #defined as
FW_CFG_ARCH_LOCAL + 5 in
https://github.com/qemu/qemu/blob/266469947161aa10b1d36843580d369d5aa38589/hw/i386/fw_cfg.h

The name has "minimum" in it since the firmware can choose to accept
more than the minimum, and specifically interpret 0 as UINT64_MAX.

2. A "well-known" file path to be included in the file slots starting
at 0x0020, such as "etc/min_accepted_mem_size", still plumbed through
like in 1.

Thanks!

-- 
-Dionna Glaze, PhD (she/her)

