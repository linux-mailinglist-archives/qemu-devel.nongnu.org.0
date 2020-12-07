Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23B2D1EB0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 00:57:39 +0100 (CET)
Received: from localhost ([::1]:47456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQNu-0005Gp-Aq
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 18:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQM5-0003rr-NU
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:55:45 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQM3-00042o-Sr
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:55:45 -0500
Received: by mail-ej1-x644.google.com with SMTP id x16so22045349ejj.7
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kzl0AALsmS8BSI2s1yWwb1eTTjeSxRukzNssdVVqA8I=;
 b=PN/ZQBXNMBzJU80aKISghDI5zOgu9bkTExQbUVp9TffgV4DSdh8Gm0j09upPo7OVfV
 QIQVYYkLya7Whmg74erX1jwfvODegvzHQ+IDK2F+7S4yvyvKHrHSW7MFE+v8iRDgwrBb
 qEvRmCnLAN6FJERQwnSiTOyMnvUYPhvyg3Ii9Q/ZrFVJcG8cN8NINRsYfLuD3N0Dg+1A
 17FM47FM1HcYrdAg6PATgIKW/Xj4wFpfEDQ8J3wFWbROIxSUlwuDQIgmFz6ecTQ6jZK4
 UilqtuW3YV6B7gOEml3D5jC06nYF/busfgH4b+UHzdshegdwbUzH0sq7yjbWBEGLdjGl
 SPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Kzl0AALsmS8BSI2s1yWwb1eTTjeSxRukzNssdVVqA8I=;
 b=Gvs18lNTOf7oqfX3v+d8MKciAdxSfpM4ur478UH4gFc1IvRfhMz+nDH46XmFfA8sxy
 AuVnYpCoOf4AtMXO0iguKlmA9jQbo77OEgfmXrsoi9Sz168qVdrP19yWCsNPcJlqqNjz
 kIQl3SWdwDRsj57k5Nh4I2DhgGZhMxKexSZsG4viw8PNuFDxXDthkqDoxidh7OqcNXjR
 d1G3EowMKgP6howXItbk1s6sAz+tZc8fpymCYop2K4QnrQsgVvMGaP9WH1B26yMWt2cK
 g8dK1HmyEHMVq0hnh/xhrtoPhtRipAyHG0V3TPKogpUYZOpPvZW2BPNLtt2NLvmHhdct
 VdSA==
X-Gm-Message-State: AOAM530N0Rdv2WKPoheb6VCUzihsN0T5Loe3SOjqbwEJx4VH8tCuaFM0
 /rfEK2R1dNvQKuzx2aJxcQJYKehqslQ=
X-Google-Smtp-Source: ABdhPJzVOcw+tUDWczT7m8MPPc4QIS0c7OXNkIN6I3lbJUhs0wn/J5cPJB+VnQLTpOm6ehLZyXX/7A==
X-Received: by 2002:a17:906:1945:: with SMTP id
 b5mr22157491eje.388.1607385341622; 
 Mon, 07 Dec 2020 15:55:41 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id dd18sm13785298ejb.53.2020.12.07.15.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:55:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/mips: Add translate.h and fpu_translate.h headers
Date: Tue,  8 Dec 2020 00:55:32 +0100
Message-Id: <20201207235539.4070364-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the 'extract MSA' series keep growing, yet another=0D
preliminary series.=0D
=0D
Basically we add declarations for everything that will=0D
be reused by code extracted from the big translate.c.=0D
=0D
Doing so now, we avoid the intermediate step of using=0D
.c.inc files, and we compile as different objects.=0D
(We would have to do this later anyway).=0D
Slower, as it involve more series, but we can bisect.=0D
=0D
This series is common to the other 'extract XYZ from=0D
translate.c' series.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Based-on: mips-next (https://gitlab.com/philmd/qemu/-/tree/mips-next)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  target/mips/translate: Extract DisasContext structure=0D
  target/mips/translate: Add declarations for generic code=0D
  target/mips: Use FloatRoundMode enum for FCR31 modes conversion=0D
  target/mips: Extract FPU helpers to 'fpu_helper.h'=0D
  target/mips/fpu_helper: Remove unused headers=0D
  target/mips: Declare generic FPU functions in 'fpu_translate.h'=0D
  target/mips: Extract FPU specific definitions to fpu_translate.h=0D
=0D
 target/mips/fpu_helper.h    |  59 +++++++++++++=0D
 target/mips/fpu_translate.h |  96 +++++++++++++++++++++=0D
 target/mips/internal.h      |  49 -----------=0D
 target/mips/translate.h     |  83 ++++++++++++++++++=0D
 linux-user/mips/cpu_loop.c  |   1 +=0D
 target/mips/fpu_helper.c    |   7 +-=0D
 target/mips/gdbstub.c       |   1 +=0D
 target/mips/kvm.c           |   1 +=0D
 target/mips/machine.c       |   1 +=0D
 target/mips/msa_helper.c    |   1 +=0D
 target/mips/op_helper.c     |   1 +=0D
 target/mips/translate.c     | 163 +++++-------------------------------=0D
 12 files changed, 267 insertions(+), 196 deletions(-)=0D
 create mode 100644 target/mips/fpu_helper.h=0D
 create mode 100644 target/mips/fpu_translate.h=0D
 create mode 100644 target/mips/translate.h=0D
=0D
-- =0D
2.26.2=0D
=0D

