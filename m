Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED842D32B9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:32:21 +0100 (CET)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiig-0002np-7Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aj.shirvani@gmail.com>)
 id 1kmieK-0008Or-Lh
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:27:50 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aj.shirvani@gmail.com>)
 id 1kmieI-0002di-CF
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:27:48 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 91so13489563wrj.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1/4ZX6yvWE/R/Wec+7APkk3GgGKkLpciJp2o6fJMzBc=;
 b=CuNx/gL5ruyk0CEP26+8kucRa22FBge0JGfcXKZKIy+5LwnSuWXugyzLbJkYcLmN6M
 Wgzf13WPkNES+/1M89Qfq6nlVFphbpGbuiOcHQ+qL0s3xFxxOAST2rdgNIWqnpcHv8so
 e06EpyuQnvJQrZ/ZL2hdd8LIJl5KpbTodvTpf8g4U8nP//oMYN767Oi+qJtWyJmFQRxg
 a4wFun8pZTK83huH6NM0paFaLhe7pO6nRm45/LHarrw6obkEzCEzxTZnlNi2wCfsXmpg
 9o/daWtkGX0yk1MoON4IbFBgLBFGnndzMrcBz1W0sac5Vbes52l2bmQTrbYC9JKBhxMf
 fe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1/4ZX6yvWE/R/Wec+7APkk3GgGKkLpciJp2o6fJMzBc=;
 b=cQU+6/Gi1QDN4pz0488Xrj/9QOQv8SKL8UPqkBctF6SdyqVGRjBcCX1iCpRIffGr4k
 hRyNu4OO7c9Bk3F/yB6QnbebvKZpshdwh3yDeiFE/oyRhC5VHTpebHQ4+voSEWoprLVg
 CUSFAsmwFzjjPHaegP3pM/Hhe3RMKyUHSqOcPddvJZVyMQh1BzBJBpqJECnyjlDdlhnm
 OB3Jq0HYHZZIfKD/IOuGO9vXnYTK+NNmcqLt2kTS2Fm0RyYcPhyecWvgs+NGra9/3HSw
 s8VReu/DWnjQKk4Rb0Vjb9La3c87jKEbvYh9ui/nV54Ynme39wHhYynE/BzHMMG57Uyf
 bsLg==
X-Gm-Message-State: AOAM5327tdMvYTI2pzvGYLUiL/ZjzJBglxzhmEgN+gfY3JEQapLdVsZh
 IVTU0oGyOSGbImKOh5HM4uDSUHmt3g2ni+xIIlBmPSK8bW0N0g==
X-Google-Smtp-Source: ABdhPJzkcxWXUo6niasyLlcML7f1ffFYqc/MKWeeQESCfUVL4G1yA8OV9gnDCoNzFO4GBdocVnWEMRImu2WId+Dejac=
X-Received: by 2002:a5d:6250:: with SMTP id m16mr27023353wrv.400.1607455663641; 
 Tue, 08 Dec 2020 11:27:43 -0800 (PST)
MIME-Version: 1.0
From: Ali Shirvani <aj.shirvani@gmail.com>
Date: Tue, 8 Dec 2020 22:57:32 +0330
Message-ID: <CAFQ97XEnLfpdSR_F6+xLmXxAYhKf-JbVWZuLcQbQy0wNdsWw8Q@mail.gmail.com>
Subject: Implementing Custom USB HID Device
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d2d95f05b5f8ef6d"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=aj.shirvani@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000d2d95f05b5f8ef6d
Content-Type: text/plain; charset="UTF-8"

Hi all,

I want to implement a custom USB HID device in QEMU. I found the
`hw/usb/dev-hid.c` in the source tree, but I could not find any further
documentation.

Would you please guide me how I should proceed?

Regards,
Ali

--000000000000d2d95f05b5f8ef6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I want to implement =
a custom USB HID device in QEMU. I found the `hw/usb/dev-hid.c`<span></span=
> in the source tree, but I could not find any further documentation.</div>=
<div><br></div><div>Would you please guide me how I should proceed?</div><d=
iv><br></div><div>Regards,</div><div>Ali<br></div></div>

--000000000000d2d95f05b5f8ef6d--

