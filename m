Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE73451C9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 22:29:39 +0100 (CET)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOS7F-0001wq-JY
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 17:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lOS5g-0001EB-Bs
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:28:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lOS5b-0002WG-2f
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:28:00 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u9so23673896ejj.7
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 14:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMxTR5Fw/xMOpTjyHw5CpXN+SBmLM4cPxvU/0oX9Y2A=;
 b=XlfPdsH3/HqgqFcbey/V9AvorfC2Fxh3UD70G+4MMfE/VhKHtPaff3akpgLQ1AXsHX
 dsXQRIJ90QLrjYm9tTfhvh87HQyoIMPB18cl4eJnZ700f5pAVsNlGsIVdGEt5yYii+IV
 uxTFs2pu+YdrOLZffmVjDNWPyNQwbH8S0PltYTqSNdf4RmnEIpGVTV+iagUDMPQM+fpg
 PkvsGGOcDIxzgtnvMUGzxreIj5QCigntrFPyKT+Qm2G8MHmb6ueV3/eRZSzysiu2YYQx
 FyS297jikNarGEoA7q69kU/KZFvol7T+UE4muRe5Etc4/8w1MAuhXTVkWjIGpBRR5mSe
 jGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMxTR5Fw/xMOpTjyHw5CpXN+SBmLM4cPxvU/0oX9Y2A=;
 b=frOgu9S2zs54TapFx9a5KZCK0h8Do8WEQkr8FPOWBKxbGYnzNKsvTl0bsSY62mJdPN
 u+QPFHDGS2HYeGTSYOJMxBwHO2Fqq69qhp0e5PR6zSE9h3x2YZhscWuhNLA5QZKhh58M
 CiGn5IlJ2kEx/dElCOkstgFC9pfMo1kAoHpoQMIsYuMdCEDOw5gxcrMQtuHWXOCpg7Ex
 kfKVz8T5wpHe9oOGCIO0srzixwinGUhSNs3V1npJooRKnaXUbtyphvj6TjXpUQrsn6+7
 QtFFOA8i6LMsABwCfeU/vj0mebgvPpngyj0QuMtWVntDvmRrcbxUI0dE8b2tdqdyH2u3
 0M+A==
X-Gm-Message-State: AOAM5333VqNVhY06GMdH+BPyJcD1J3d6jvoorkNbf8oRPZPJeqCOFRZN
 rfVSMXNKuz/F81Cn4LkMyCJ5V4EHK57MyUymdoU=
X-Google-Smtp-Source: ABdhPJzdlizw+PZ82ql1MdsEVMVhWvDcaQe4IkNMNDoGe61/vsCjhhZMYYXRZdUdsRThVhHb6COYkdUuSI5bgWqttTQ=
X-Received: by 2002:a17:906:1f93:: with SMTP id
 t19mr1723090ejr.443.1616448472040; 
 Mon, 22 Mar 2021 14:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
In-Reply-To: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 22 Mar 2021 14:27:40 -0700
Message-ID: <CAMo8Bf+Uy3m0YWQrmH4_2ikB8BD4ucYz+=zvtO+rt2xHj8ixqA@mail.gmail.com>
Subject: Re: [PATCH] [NFC] Mark locally used symbols as static.
To: Yuri Gribov <tetra2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Taylor Simpson <tsimpson@quicinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 12:55 PM Yuri Gribov <tetra2005@gmail.com> wrote:
>
> Hi all,
>
> This patch makes locally used symbols static to enable more compiler
> optimizations on them. Some of the symbols turned out to not be used
> at all so I marked them with ATTRIBUTE_UNUSED (as I wasn't sure if
> they were ok to delete).
>
> The symbols have been identified with a pet project of mine:
> https://github.com/yugr/Localizer
>
> From 07b4f05893b7037e68e5d7bdec5ba8e74e509999 Mon Sep 17 00:00:00 2001
> From: Yury Gribov <tetra2005@gmail.com>
> Date: Sat, 20 Mar 2021 23:39:15 +0300
> Subject: [PATCH] [NFC] Mark locally used symbols as static.
>
> Signed-off-by: Yury Gribov <tetra2005@gmail.com>
> ---
>  disas/alpha.c                                 | 16 ++--
>  disas/m68k.c                                  | 78 ++++++++---------
>  disas/mips.c                                  | 14 ++--
>  disas/nios2.c                                 | 84 +++++++++----------
>  disas/ppc.c                                   | 26 +++---
>  disas/riscv.c                                 |  2 +-
>  pc-bios/optionrom/linuxboot_dma.c             |  4 +-
>  scripts/tracetool/format/c.py                 |  2 +-
>  target/hexagon/gen_dectree_import.c           |  2 +-
>  target/hexagon/opcodes.c                      |  2 +-
>  target/i386/cpu.c                             |  2 +-
>  target/s390x/cpu_models.c                     |  2 +-
>  .../xtensa/core-dc232b/xtensa-modules.c.inc   |  2 +-
>  .../xtensa/core-dc233c/xtensa-modules.c.inc   |  2 +-
>  target/xtensa/core-de212/xtensa-modules.c.inc |  2 +-
>  .../core-de233_fpu/xtensa-modules.c.inc       |  2 +-
>  .../xtensa/core-dsp3400/xtensa-modules.c.inc  |  2 +-
>  target/xtensa/core-fsf/xtensa-modules.c.inc   |  2 +-
>  .../xtensa-modules.c.inc                      |  2 +-
>  .../core-test_kc705_be/xtensa-modules.c.inc   |  2 +-
>  .../core-test_mmuhifi_c3/xtensa-modules.c.inc |  2 +-
>  21 files changed, 125 insertions(+), 127 deletions(-)

For the xtensa part:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

Changed files are auto-generated, I'll add a rule to the import
script (target/xtensa/import_core.sh) to do this transformation.
-- 
Thanks.
-- Max

