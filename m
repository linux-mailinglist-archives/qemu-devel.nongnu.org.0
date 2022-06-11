Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F5E5477BB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 23:50:46 +0200 (CEST)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o090G-0004hn-P3
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 17:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o08yg-0003rI-Md; Sat, 11 Jun 2022 17:49:06 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:39859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o08ye-0001xR-QS; Sat, 11 Jun 2022 17:49:06 -0400
Received: by mail-oi1-f169.google.com with SMTP id s8so3569198oib.6;
 Sat, 11 Jun 2022 14:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K1Py6qfLxNVWeO1x79P9Qjqppw4Icg4Zq+4D6x/hA7g=;
 b=oUAwrAMrXXvnme5AtsZtnjpkgWGVsu6WFrugsRItHuUmqQJ4ziDXDwR1ZX391sLr96
 /zZbvXX4PaLKCvW1d28lMd5vcvH9eLjTi/gZJXqb+cfniLGB1dW2IXNRdr3syA4PEJkf
 tbiOnvrkquogA4chqLkIAN/yQVdUk9NxpmGJnCvnwqleyMHjj/LK3dc1v5jcyusTu8PN
 J0xBTerVqVKRtABlJ6sJQ27FSIVWuy7jgCyAa+bxcEmHDI9Fn3LjFeXBsEIGe3g/wWg0
 sVywkGC8FBE2svNBiqJadJVGJlFqCRRmCfIguF2fEYpDreOUELJTJexu7gHQP4asE7dw
 jkfg==
X-Gm-Message-State: AOAM530cnzVU+7dXE4G2xNcJROtitRjMXlVNAsh0bguHbcZre5PorUWW
 tUWHCZjJqZKTPnaWwRHpUaq/+Q+VBSuOOvzth5g=
X-Google-Smtp-Source: ABdhPJzErT88T30GyPNupKhHeFp92UGxL2gvE3ZGFMdRvlkyjbTlER3Fw07VRuxWCGOPAqzWtVbo5YRk4U20VXx6G0Y=
X-Received: by 2002:a05:6808:1444:b0:32f:1e22:55d9 with SMTP id
 x4-20020a056808144400b0032f1e2255d9mr2165431oiv.106.1654984142676; Sat, 11
 Jun 2022 14:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220605151908.30566-1-shentey@gmail.com>
 <124a4722-01f9-225f-05d3-35bd51713bfe@amsat.org>
 <CAG4p6K74wB1hnT=O2Z8Fyi0yk1W320AjCmYLEWDdcyZvX76oFg@mail.gmail.com>
In-Reply-To: <CAG4p6K74wB1hnT=O2Z8Fyi0yk1W320AjCmYLEWDdcyZvX76oFg@mail.gmail.com>
Date: Sat, 11 Jun 2022 23:48:51 +0200
Message-ID: <CAAdtpL7b0vtL2RxBR8xxrPA4gfCKe-5fs6JpuBCU-LVrdJLTiQ@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/boston: Initialize g_autofree pointers
To: Bernhard Beschow <shentey@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.169;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f169.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Sat, Jun 11, 2022 at 5:27 PM Bernhard Beschow <shentey@gmail.com> wrote:
> On Fri, Jun 10, 2022 at 4:04 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
>> On 5/6/22 17:19, Bernhard Beschow wrote:
>> > Fixes compilation due to false positives with -Werror:
>> >
>> >    In file included from /usr/include/glib-2.0/glib.h:114,
>> >                     from qemu/src/include/glib-compat.h:32,
>> >                     from qemu/src/include/qemu/osdep.h:144,
>> >                     from ../src/hw/mips/boston.c:20:
>> >    In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=80=99,
>> >        inlined from =E2=80=98boston_mach_init=E2=80=99 at ../src/hw/mi=
ps/boston.c:790:52:
>> >    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: =E2=80=
=98dtb_load_data=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninit=
ialized]
>> >       28 |   g_free (*pp);
>> >          |   ^~~~~~~~~~~~
>> >    ../src/hw/mips/boston.c: In function =E2=80=98boston_mach_init=E2=
=80=99:
>> >    ../src/hw/mips/boston.c:790:52: note: =E2=80=98dtb_load_data=E2=80=
=99 was declared here
>> >      790 |             g_autofree const void *dtb_file_data, *dtb_load=
_data;
>> >          |                                                    ^~~~~~~~=
~~~~~
>> >    In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=80=99,
>> >      inlined from =E2=80=98boston_mach_init=E2=80=99 at ../src/hw/mips=
/boston.c:790:36:
>> >    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: =E2=80=
=98dtb_file_data=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninit=
ialized]
>> >       28 |   g_free (*pp);
>> >          |   ^~~~~~~~~~~~
>> >    ../src/hw/mips/boston.c: In function =E2=80=98boston_mach_init=E2=
=80=99:
>> >    ../src/hw/mips/boston.c:790:36: note: =E2=80=98dtb_file_data=E2=80=
=99 was declared here
>> >      790 |             g_autofree const void *dtb_file_data, *dtb_load=
_data;
>> >          |                                    ^~~~~~~~~~~~~
>> >    cc1: all warnings being treated as errors
>> >
>> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> > ---
>> >   hw/mips/boston.c | 3 ++-
>> >   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> Queued via mips-next.
>
>
> Hi Phil,
>
> shouldn't this patch be visible in your pull request then? https://patche=
w.org/QEMU/20220611103312.67773-1-philippe.mathieu.daude@gmail.com/

It was included, but I have been overzealous when removing Mark's PS2
series and removed it as well :/

> Best regards,
> Bernhard

