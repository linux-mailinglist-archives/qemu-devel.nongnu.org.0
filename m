Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201FD5BD49D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:14:13 +0200 (CEST)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLHY-0002kQ-7X
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oaKjv-00081P-NJ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:39:29 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:44577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oaKjt-0003dv-QY
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:39:26 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-345528ceb87so347817237b3.11
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Nx3GJGwEGl+qTgDi/E6p6HWSLgbDQy2OOchGuaS14bU=;
 b=oth5j0Z6L5b/h/XNKgax2B55dmbtJUz4I/Abspcbw4lRrXoSHhqwz17IYSCVY8vxEg
 Z8xkMv3X7yITFjBMZ/POLBXOmY86opyFQlgdu9h5hPzFHzxWXPs8P07QPHNrV9Ykcqvw
 jItbWpNnBQwHI4mQAbNkqPRihl0g+0MapxBCaFZRDnV0ECXgD8P/a07+WpzNVyNAN26R
 HamSqnvF7dk3hlxFVmw8dUk7VtjJDcZuJvqF3Pbpj+DYux88kx8TRRadGN9PpU52qwI5
 7j40E11PtcNmPSoB0YlbDfV3zF40fz7QGYMUjKP+7d7kl4W0EHzNbO7mxP+y2pHG2zvN
 n6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Nx3GJGwEGl+qTgDi/E6p6HWSLgbDQy2OOchGuaS14bU=;
 b=2eO3Ne9zEgY3IxzXomDdIjuknH5cRxp7sye5R/d8XnJKiQCegNl6bG68Zmr2JWzGuQ
 hED0i45fXpf9tZNqaJ0wowNoK8b7N9kkshhc+axcpLF+mf1IcaMeCMOWUJHsvSAdKgiu
 Rc1PltTdOTSoZ93RzWvuLXdGzTRLBTXSllBQbKzM2Qxen4LHxnK6mRGFXGhdJFBba0JR
 MSTJcMHC2U+7P5vdMG+/z22UAvxRLuS6aKFp87e6O1//3KktLC1diMx2PHWKaw9eV/gv
 IzxmIUi9l27oPgwjMKGgIY8N5SkU9BPheUh9HWBDRsMeIWq+17i/2KZs3oNPViIl0mtT
 Ti7g==
X-Gm-Message-State: ACrzQf0CXmBsWYNEyGki30UQDSkrqwSabubIrfw+011bN3D/ZyCJQMC9
 4eoqq76n84bCLa3+uWQSDRrjWaxYZNNjZUr+oVM=
X-Google-Smtp-Source: AMsMyM5S+AfRyFBWUKmDBP/kP7P3kREPd/YSBkXOjeMB2K9qjRIx3iPfDIvvdu0qKg5zGS7d9yY4vuwY2ixh8rjsw+E=
X-Received: by 2002:a81:66c5:0:b0:345:3b1c:26 with SMTP id
 a188-20020a8166c5000000b003453b1c0026mr16494005ywc.156.1663609164889; 
 Mon, 19 Sep 2022 10:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220919124901.2653396-1-gaosong@loongson.cn>
In-Reply-To: <20220919124901.2653396-1-gaosong@loongson.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 19 Sep 2022 13:39:13 -0400
Message-ID: <CAJSP0QVD-J3DfE1RV_4mV=DD+OxYuY14O9G--090YM+35+jujA@mail.gmail.com>
Subject: Re: [PULL 0/9] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following CI error was reported:

../hw/loongarch/virt.c: In function =E2=80=98fdt_add_irqchip_node=E2=80=99:
../hw/loongarch/virt.c:174:32: error: format =E2=80=98%llx=E2=80=99 expects=
 argument
of type =E2=80=98long long unsigned int=E2=80=99, but argument 2 has type =
=E2=80=98long
unsigned int=E2=80=99 [-Werror=3Dformat=3D]
174 | nodename =3D g_strdup_printf("/intc@%" PRIx64,
| ^~~~~~~~~
In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:101,
from ../hw/loongarch/virt.c:7:
/usr/arm-linux-gnueabi/include/inttypes.h:121:34: note: format string
is defined here
121 | # define PRIx64 __PRI64_PREFIX "x"

https://gitlab.com/qemu-project/qemu/-/jobs/3050165217

Please fix and send a v2 pull request. Thanks!

Stefan

