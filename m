Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02517613E13
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 20:15:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opaF2-0001Bq-BQ; Mon, 31 Oct 2022 15:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opaEz-0001A3-RX
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:14:34 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opaEw-0002vz-EF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 15:14:32 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-36cbcda2157so116769887b3.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 12:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d/De5w3x6shiN1KPYo8oJj10H5za0tzTEduD+Mbu6Wo=;
 b=KZCdLSJYyJ/6JSpibLuiKhy0l6G14Nsa+0ZSepIHYvWEsI8PehBD42E3G5J36jEvKS
 S8jTkMxK5z7QN2fuwlZa8orH9ecJC11UUMo0mG4YoI9wng/DzZCU5V5KpGlzGLQfTwLh
 ER5UK2x71doG2lwWTG0mbhTQEcgMwtOAm5RxWuwhUCqm8glIuWG05JI5RMoEKKlRaDw2
 A4inw3hLA0ufQBGMTiCuRcTgGCoqqkCufi/dHlJznzgeojZNROSuXRvZJvSg3G9uizWi
 DFqxW9ANxhaqqOJ1YjIfY/7ENW9pyXsMuENEG/HrX+dd1HtGuaBdd1O7O3HR3JQrQZ1c
 yLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d/De5w3x6shiN1KPYo8oJj10H5za0tzTEduD+Mbu6Wo=;
 b=6c8435ZNIsTwy4TwM/KblXnFBFzTaG04kMl5LLxErDX30WqNhXUllqPFotTUG2/1no
 ESkisbVOmzgwWvQP1IHGyz79J1WjGXvrhoBhBVpYJ3GL03lN9/xUa+p7dFv8HzzWvyXn
 QfOMmmWTk6GpdSn+YpkN5THaF6bfflSaUOz8y/AuJzvs48QVoAfCEoV4bK4k8eh0uw+9
 extXRgh+KuBAzqFp7r09Pz456vigXmPW6TYqLeY072FJyEa5T8846wHFBLdh1OSGOLWn
 tjxYsV7hfLP7cRcG8AFCADFOw4/IZuSaRTLmSZxh5E1JQN08PX+Mtv/xMHwpYNuvsfJ2
 kz3Q==
X-Gm-Message-State: ACrzQf1aTnzIzva1HyF6TuY/61GGLw3a43Gii77/HVwcrQnAMj/ZuUOK
 GciVUZsCtj3Q3z559q4bGkY7YdXULm5524ftB60=
X-Google-Smtp-Source: AMsMyM4EzohcgFuVArsifZKn/OhFGZ/S6uIABbgIPyZOhniEo7FAG7xp1BXiBAMsKY5QBVrr9y9ZTHSLTr7Xzy7yh5g=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr15204667ywf.296.1667243668989; Mon, 31
 Oct 2022 12:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 15:14:17 -0400
Message-ID: <CAJSP0QXafXM0CJDe5G=--3Xa4O5ifqz=yvO=ubWLaS-KNBVkwQ@mail.gmail.com>
Subject: Re: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
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

On Mon, 31 Oct 2022 at 08:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> Lei He (4):
>       virtio-crypto: Support asynchronous mode

The following clang warning breaks the build. Please resend a fixed
pull request, thanks!

clang -m64 -mcx16 -Ilibqemu-x86_64-softmmu.fa.p -I. -I.. -Itarget/i386
-I../target/i386 -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/pixman-1 -I/usr/include/capstone
-I/usr/include/spice-server -I/usr/include/spice-1
-I/usr/include/cacard -I/usr/include/glib-2.0
-I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4
-I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -flto
-fcolor-diagnostics -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
-isystem /builds/qemu-project/qemu/linux-headers -isystem
linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong
-fsanitize=safe-stack -fsanitize=cfi-icall
-fsanitize-cfi-icall-generalize-pointers -fno-sanitize-trap=cfi-icall
-fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET="x86_64-softmmu-config-target.h"'
'-DCONFIG_DEVICES="x86_64-softmmu-config-devices.h"' -MD -MQ
libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -MF
libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o.d -o
libqemu-x86_64-softmmu.fa.p/hw_virtio_virtio-crypto.c.o -c
../hw/virtio/virtio-crypto.c
../hw/virtio/virtio-crypto.c:569:30: error: unused variable
'in_iov_copy' [-Werror,-Wunused-variable]
g_autofree struct iovec *in_iov_copy = req->in_iov;
^

https://gitlab.com/qemu-project/qemu/-/jobs/3253703167

Stefan

