Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6785477CE
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 00:03:11 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o09CI-00017h-6s
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 18:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o099e-0008KI-9H
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 18:00:26 -0400
Received: from mail-oo1-f41.google.com ([209.85.161.41]:45866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o099c-0003Qq-6z
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 18:00:25 -0400
Received: by mail-oo1-f41.google.com with SMTP id
 1-20020a4a1701000000b0040e90b56d03so526928ooe.12
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 15:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W3/o+YcMfXmqJyL8ns8WjHQt2//tl8IDqID+QwjMSCQ=;
 b=7sS+RYgXHFlxZG/8aYMzu3YvJv5HrwPffspUkH3683jnQEh4fTCoUJuKAsF4uUG9cs
 dI5TDMatbG26zK/R8J2MPwT6eRaY2+b7kZzTTgcK0BvRJan9sk+NOT9U+DTGGrvxsZun
 JUqA48tHgrQ45VqOBCICiDBbFHgH1BZaD0HJVkLI/DcGbjFPpg7Oo39c7ufT50AfRzEb
 BR5FPcZLAuiubfw3M8nMdAxfPyqdgsdQAEu/TQiYIHb9hb5Ia4ZY7V6K1v5iX1ywDSxJ
 Hj9tOOlK8gHYxfO6nPKwLYFp+26m+uOOT/C0nTQtL8oHwAlZ/1IISPIR8fmVwjfLur9Y
 Xv8g==
X-Gm-Message-State: AOAM532c0QvYcA41YM0M2FD+FjSTbj11rbyu/UTzSmRAtGs0T7pkrUYu
 /04UOZaDasc2TzRYEmegBnT5F+23yv2qHkrVX0fQ/b7QGsc=
X-Google-Smtp-Source: ABdhPJzh3GRhn0LPANwad/JjvvKrAy15tAyAUGVaNuQ4unxdgYyTA7td9gWv4e4nw8V7duQL0LmNPgk8dS/uEzXQ+UY=
X-Received: by 2002:a4a:adc1:0:b0:41b:7101:bb38 with SMTP id
 t1-20020a4aadc1000000b0041b7101bb38mr15416799oon.73.1654984822970; Sat, 11
 Jun 2022 15:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
Date: Sun, 12 Jun 2022 00:00:12 +0200
Message-ID: <CAAdtpL6X3cGEHAukR4puPU+kDp4vHSgW=prjZq75-Xza=6=GQQ@mail.gmail.com>
Subject: Re: [PULL 00/49] MIPS patches for 2022-06-11
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.161.41;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oo1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Sat, Jun 11, 2022 at 12:33 PM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> The following changes since commit 30796f556790631c86c733ab06756981be0e1d=
ef:
>
>   Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/q=
emu into staging (2022-06-10 18:15:34 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20220611
>
> for you to fetch changes up to 37da3bcf01ccd19336fd8f43bedcd0841d71bb6a:
>
>   docs/devel: Fix link to developer mailing lists (2022-06-11 11:44:50 +0=
200)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Various TCG fixes (Marcin Nowakowski, Ni Hui, Stefan Pejic, Stefan Peji=
c)
> - Sysbus floppy controller fix (Peter Maydell)
> - QOM'ification of PIIX southbridge (Mark Cave-Ayland, Bernhard Beschow)
> - Various fixes on ISA devices commonly used by x86/mips machines (Bernha=
rd)
> - Few cleanups in accel/tcg & documentation (Bernhard)
>
> ----------------------------------------------------------------

A job failed:
https://gitlab.com/qemu-project/qemu/-/jobs/2577882715#L169

122/237 qemu:qtest+qtest-aarch64 / qtest-aarch64/tpm-tis-device-test
ERROR 0.15s killed by signal 13 SIGPIPE
qemu-system-aarch64: -tpmdev emulator,id=3Ddev,chardev=3Dchr: 'chr' is not
emulating TPM device. Error: Interrupted system call
(test program exited with status code -13)

This doesn't seem related to this PR.

Anyhow, if this isn't too late I'm sending a v2 with a missing patch.

Regards,

Phil.

