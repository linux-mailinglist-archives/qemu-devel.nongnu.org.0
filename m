Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E7230A647
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:14:14 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6X9p-0003qk-F1
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6X7y-0002b6-Ge
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:12:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6X7k-0000Pm-JA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:12:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id m1so9529941wml.2
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ifXWw+fuSaZruoQc2hdEOrn5sC5jkN/Y0ScQhXiorQY=;
 b=V+4XnBaHKTHZtcSiJPfzpYuatny+M4LvZi8Jvn51auON/aCStPR/4XZoVwIu7ISm+4
 UkTi03jiyeDHMQLPh4wMAwtZAhiU2WQiesbOGi2IKmTIfgE7oly0oDZkCqgr6KQeR1ja
 FiL47SPNheTzyA5RYQJyM6lQiDbLTcdtPWMJYeqwjM1kOraEcaW9vS+0kdb4VFDDaARP
 set35xMYfKRARH+/APaQGp/05omm4lOlRAo+ouDVeMyKKs8SOnDjrx6DHoi1YCbSLmVo
 4mpD/lraIC3KO9oOlSn9mKh/npuomRVcF9Qc2RL/PHD682ZUH3KRHDeu0qrnujvTxhCG
 bTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ifXWw+fuSaZruoQc2hdEOrn5sC5jkN/Y0ScQhXiorQY=;
 b=dNLqRm46qvzL9jeGGebw11mPRJCWoqmy7OEguLa6zqLd2oZN0FI40hPbwKXaDVVgK4
 2q12clAzp5BtYAhczfg4Ju2st7vaSbkMgLR1iil/WeUEC1E3i9nh90dFF5Q+tQxySRUJ
 CUMAa8y7fYAMBuJn7L+F08IRsyll+lBQ1Qnt36CLqt37Htf+fE2CRxuCqg/chHdo4/iB
 0YrhQMrrLQCEGp7OzcwTrLUbcMdsSFRiGD2KNdCiPZk32jmiFgDcxDLqs1UXTFjPFCNY
 VrETraaX6WXTaPZvNEtMjRDrKdV5JNRMidgLO89pmiEOfraHdLb5CqKpuL80mzmS250i
 TO0g==
X-Gm-Message-State: AOAM530dgBHkRnVC1QSiVrGnktgbdPSAdKcD9M9vwDs7fEbxa7b7sfgB
 BR/WMnLXE5q0IWWA5kxGFvJdzA==
X-Google-Smtp-Source: ABdhPJzUVW6c0CBbXvCir5HCZkhSJXm6vW4/5xgPkFp0jzqeLqr6PjXJqu9YtKQW4Jo79pEvTGD8pg==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr2691502wma.37.1612177920161;
 Mon, 01 Feb 2021 03:12:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v4sm30395438wrw.42.2021.02.01.03.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:11:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13D1C1FF7E;
 Mon,  1 Feb 2021 11:11:58 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-5-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 04/10] hw/lm32/Kconfig: Have MILKYMIST select
 LM32_PERIPHERALS
Date: Mon, 01 Feb 2021 11:11:52 +0000
In-reply-to: <20210131111316.232778-5-f4bug@amsat.org>
Message-ID: <87k0rsvy81.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The Milkymist board requires more than the PTIMER. Directly
> select the LM32_PERIPHERALS. This fixes:
>
>   /usr/bin/ld:
>   libqemu-lm32-softmmu.fa.p/target_lm32_gdbstub.c.o: in function `lm32_cp=
u_gdb_read_register':
>   target/lm32/gdbstub.c:46: undefined reference to `lm32_pic_get_im'
>   target/lm32/gdbstub.c:48: undefined reference to `lm32_pic_get_ip'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_im':
>   target/lm32/op_helper.c:107: undefined reference to `lm32_pic_set_im'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_ip':
>   target/lm32/op_helper.c:114: undefined reference to `lm32_pic_set_ip'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_jtx':
>   target/lm32/op_helper.c:120: undefined reference to `lm32_juart_set_jtx'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_jrx':
>   target/lm32/op_helper.c:125: undefined reference to `lm32_juart_set_jrx'
>   libqemu-lm32-softmmu.fa.p/target_lm32_translate.c.o: in function `lm32_=
cpu_dump_state':
>   target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_ip'
>   target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_im'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

