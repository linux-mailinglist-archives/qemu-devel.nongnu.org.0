Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86334496CC7
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 16:11:36 +0100 (CET)
Received: from localhost ([::1]:48870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBI3A-0001ut-U0
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 10:11:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.milind.luthra@gmail.com>)
 id 1nBD9P-0007im-Iu
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 04:57:40 -0500
Received: from [2a00:1450:4864:20::532] (port=33679
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <i.milind.luthra@gmail.com>)
 id 1nBD9N-0001gO-It
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 04:57:39 -0500
Received: by mail-ed1-x532.google.com with SMTP id b13so47208199edn.0
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 01:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=HxibagKLzH/Pn7v8LJQAh7+wrJF4pyMJkXGvIkk2Gy4=;
 b=X89htJ8eexi7u8r/LYdSXmPpCx0DGYIm9RJ0LL9R0F0YqHkpKB4V+C2JcB93vvhrkP
 mFoN921Zny2qhrraRYP167qK+33kbUm582AzmkA1m4TG7jxRgrZ3fYCsZ6DwIinlNjnZ
 5ImkR2VV3+d3ZIFSKdH+OEbt755nDHcCWlZ1hYPnIjLgxv1yAdpBjH0wy6cjASUeZiKj
 +YoZdrMo3Hy0VIIKhtMgrdt3OS64zhrIsW7PRKaHCuCjn4sOomue2iU4ScbUg+RBV7+U
 ihLRSi4WsuK+s1f2p3VKhxOodrIIOhUAJO7YcdO7E79//oGm1is1zr560ZX0ui2y2s8d
 lycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HxibagKLzH/Pn7v8LJQAh7+wrJF4pyMJkXGvIkk2Gy4=;
 b=FXCuK82dhP2JBXvRtQOIIrIt+tO+vhMdZF3/+yuBfbMkcuGW8bRt70TTUgo/8GNNIC
 /u6XqTXOpcCMWrqFZx43DHlfUhppK+sc+pSISAXN7hNt71cFODhWE3KRHKXbiMICHHgf
 vVaMhFS8xj/RA1pJU++IqqgrR6rWrMXSHRiYRs29VKw4TZWR482QA9dtw3S73JbP3aXv
 QYicnBJJnAZ2Fa+supGmqnb0YPRaiESYVD5c241I2GqfbQlEDvjyiz/OeoCdpCofMNt8
 +KEsYGWgvAU6SugrS0biA8a5nuTo+No6IwkNwht23WBflZh8okykzOwL4i3WnY67s4L6
 YoHA==
X-Gm-Message-State: AOAM53313N55dVN35d/1QP0+a8nlCkPeTkdbX43+zQdkKZOpHmf5o2q9
 JMFPMDSE2tVEHZaAvq0eWtEkgl5frSx/4djjZiaUgwRrP6Q=
X-Google-Smtp-Source: ABdhPJwJedI/nApTRNnUYWoy7STcX4y/kO76vGapzlq/E/ob/rWifmGDn5z4GBwHa58F52k3XvIz0v+95fZvjQjz9DU=
X-Received: by 2002:a05:6402:6d4:: with SMTP id
 n20mr7591509edy.69.1642845455306; 
 Sat, 22 Jan 2022 01:57:35 -0800 (PST)
MIME-Version: 1.0
From: Milind Luthra <i.milind.luthra@gmail.com>
Date: Sat, 22 Jan 2022 15:27:24 +0530
Message-ID: <CALE2ieB8w58jJzXWcQQhusSWQ1x8PKOQXGXvGGcCuK7N4Wr1Hw@mail.gmail.com>
Subject: Getting privilege level of an instruction in TCG plugin
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c8d4b105d628c3aa"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=i.milind.luthra@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 22 Jan 2022 10:06:19 -0500
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

--000000000000c8d4b105d628c3aa
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

We were writing a TCG plugin, and for every instruction executed, we wanted
to know the privilege level where it was executed, i.e. was it in user mode
or kernel mode.

Approaches we tried:

1. We tried to use vcpu_syscall_cb/vcpu_syscall_ret_cb initially - any
instruction execution between invocations of these functions would be
marked as being in kernel mode. However, these callbacks don't seem to be
called in Qemu's full system emulation, and in Qemu's user mode emulation,
we won't get any privileged instructions executing anyway. Also, we would
miss interrupts/pagefaults in this way.

2. We thought we could look up the registers which store the privilege
level for our guest (AArch64 - current program status register). But, from
reading the code and from a previous mailing list thread "Qemu TCG Plugins
- how to access guest registers" , we saw that registers are not readable
from plugins either.

Is there a way to do this in the plugin API?

Thank you,
Milind

--000000000000c8d4b105d628c3aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone, <br><br>We were writing a TCG plugin, and for=
 every instruction executed, we wanted to know the privilege level where it=
 was executed, i.e. was it in user mode or kernel mode.<br><br>Approaches w=
e tried:<br><br>1. We tried to use vcpu_syscall_cb/vcpu_syscall_ret_cb init=
ially - any instruction execution between invocations of these functions wo=
uld be marked as being in kernel mode. However, these callbacks don&#39;t s=
eem to be called in Qemu&#39;s full system emulation, and in Qemu&#39;s use=
r mode emulation, we won&#39;t get any privileged instructions executing an=
yway. Also, we would miss interrupts/pagefaults in this way.<br><br>2. We t=
hought we could look up the registers which store the privilege level for o=
ur guest (AArch64 - current program status register). But, from reading the=
 code and from a previous mailing list=C2=A0thread &quot;Qemu TCG Plugins -=
 how to access guest registers&quot; , we saw that registers are not readab=
le from plugins either.<br><br><div>Is there a way to do this in the plugin=
 API?</div><div><br></div><div>Thank you,<br></div><div>Milind<br></div></d=
iv>

--000000000000c8d4b105d628c3aa--

