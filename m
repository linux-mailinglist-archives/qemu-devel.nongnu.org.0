Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CA613BF1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 18:11:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opYHy-0001gl-0M; Mon, 31 Oct 2022 13:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opYHv-0001gO-NC
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 13:09:27 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opYHt-0004ox-W6
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 13:09:27 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-370547b8ca0so34056937b3.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d1tjczV7kDV4YQgAk/EIYyvTYRO33T2EkScBsXiLfFk=;
 b=pg/UYAEs/nWV/Pc8JRnxrXc0UO0C+qUf7Y74g9Pnhl+UK9bMAhWOmthW8oNLLn97s+
 dmLxonR5HIaaJRzdkCzNJ2Obcv2BV56E/yjvocQtOXAAOtXxg7dUyrXXvv0TiEgdn4tf
 oxxUnBPbDB9yKQekT8ITGqkeMFvNa9fsSXD0XcqKYvkhqgkoYGbh0KGUknvKs159WFYl
 C4Kfh1MZ618Wi6aCnOwWiKUfhIqrCkqKFE1Mow+pFr3WxjFGOCwQIIJlzSNNgYz9D7QB
 QrT3BmAt3NRLTJ9xOTBzbOdc9x7EojMFTf5uiljKQG1I3tRi5bCYHMeoq0Gf2gEIF2Zf
 zgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d1tjczV7kDV4YQgAk/EIYyvTYRO33T2EkScBsXiLfFk=;
 b=4/oFaI7b9RnJ/9rrVLNdf6Vq0Q9ajOZLXX2MzaIPOsysHJ6E9it3xcDgPqiyHcP6qa
 0kzBoaLz9cOCHjkeY4TG2kWZ8+tuRCrG4vsEYE0xCjCD5GHal1sZpijGWKiRwFvqovc/
 Xs/S190tNytE25EXNKxRuyO0Ue2LQKRQqRU2b6mIrl40il8P6D4gR/LFB5X87AOpLG1O
 iEExdqrqd/67fMxvOUxUu5c7gpjvo+P9mr58hVgBt915K3O/t/eiTkUsRhzWx58i22Xn
 wYNVZNDFWh/QQGRz23fPDSgCMXQDnj6mYrEhYQFRhWOk0K9BLPYZfAalaN23SiFBhmGX
 ohjA==
X-Gm-Message-State: ACrzQf3mPUEwV4Z2LB/G3jloXpdUl6Fvm8LM2i9NH9wyyvgBgmUjSz/A
 yxBLEWTsZmWz9AbMWXwP/ojJIb8Nzo0v2Sq6bXw=
X-Google-Smtp-Source: AMsMyM5yt9lE4NxoiOFWfqBEZ+LcV/PRfwyuhoXkkAcIS1z8yyiuj+p8pVDfWlXgGv0YUfPqAIVzWWwKVwqWfXYJ8FA=
X-Received: by 2002:a0d:f0c2:0:b0:370:10ff:17fa with SMTP id
 z185-20020a0df0c2000000b0037010ff17famr13715040ywe.239.1667236164679; Mon, 31
 Oct 2022 10:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221031053948.3408-1-richard.henderson@linaro.org>
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 13:09:12 -0400
Message-ID: <CAJSP0QXdW9RvWSnwY36=fuXHWp73Hm6b3KM07cKWBB2p4uR8qg@mail.gmail.com>
Subject: Re: [PULL 00/11] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This pull request causes the following CI failure:

cc -m64 -mcx16 -Ilibqemu-i386-softmmu.fa.p -I. -I.. -Itarget/i386
-I../target/i386 -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/pixman-1 -I/usr/include/capstone
-I/usr/include/spice-server -I/usr/include/spice-1
-I/usr/include/cacard -I/usr/include/glib-2.0
-I/usr/lib64/glib-2.0/include -I/usr/include/nss3 -I/usr/include/nspr4
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g
-isystem /builds/qemu-project/qemu/linux-headers -isystem
linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET=3D"i386-softmmu-config-target.h"'
'-DCONFIG_DEVICES=3D"i386-softmmu-config-devices.h"' -MD -MQ
libqemu-i386-softmmu.fa.p/target_i386_helper.c.o -MF
libqemu-i386-softmmu.fa.p/target_i386_helper.c.o.d -o
libqemu-i386-softmmu.fa.p/target_i386_helper.c.o -c
../target/i386/helper.c
../target/i386/helper.c: In function =E2=80=98get_memio_eip=E2=80=99:
../target/i386/helper.c:514:19: error: =E2=80=98TARGET_INSN_START_WORDS=E2=
=80=99
undeclared (first use in this function); did you mean
=E2=80=98TARGET_INSN_START_EXTRA_WORDS=E2=80=99?
uint64_t data[TARGET_INSN_START_WORDS];
^~~~~~~~~~~~~~~~~~~~~~~
TARGET_INSN_START_EXTRA_WORDS
../target/i386/helper.c:514:19: note: each undeclared identifier is
reported only once for each function it appears in
../target/i386/helper.c:514:14: error: unused variable =E2=80=98data=E2=80=
=99
[-Werror=3Dunused-variable]
uint64_t data[TARGET_INSN_START_WORDS];
^~~~

https://gitlab.com/qemu-project/qemu/-/jobs/3252134230

Stefan

