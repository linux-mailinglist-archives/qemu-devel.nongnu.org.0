Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C084CB156
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:32:32 +0100 (CET)
Received: from localhost ([::1]:33358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWaE-0005D4-Qu
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPW0e-0002yT-4H
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:55:44 -0500
Received: from [2607:f8b0:4864:20::1136] (port=36003
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPW0c-0003M0-CX
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:55:43 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2dbfe58670cso32985597b3.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3WuDyhgwiN8E5RCM/+FfA39q5+YVJdgVXZeoi/Rk28M=;
 b=WikKRn1h9GFqS5xGeBhDJ23xBhLF6HWIk51DWmOP4YTy92dBDkV8ejYUqGEFKgDepa
 nrgOlU4SZIfrShK+Zibx19O+YOKEjdWFiib0fTUiXtrm49OtoRMe8CLaENTQ0do2nmAY
 ZXjlTscbPpVbbyublb/FIVoaKRCsU2PlbpUuAKphz/S9bhgzvYe3o742aJZnYhGhc3qe
 qoD9f5s/pxdCZRpWYHYCZoGWqLHvGPcAdgQ4Ac5BIS9NsdnLTjjKyr9byoC+I2J/fSOE
 GyHhf52sJKjWr4B+81mq2T1jfhaHO5bkDyHLFOKEwwVpplckT5RgvJeZbAQBIJuU21XT
 lGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3WuDyhgwiN8E5RCM/+FfA39q5+YVJdgVXZeoi/Rk28M=;
 b=seTNDc5hLjBXy7ekTuLa//oIHE+L+urjOtA8d9e3jCnMnF43nUtkNQ26rABGZf932X
 eqWA8N2tqv/0MDB0RqKrQp3IyDYbHJzNBdf65BwFbDliVpSwGC5c7bC1QfXeRFLye+Yo
 zLpVrQeVwP28tzvdJ8hs5oj03qNBIQDgEHt0TpfbvlFKCkarRnUyhshUZmOyQW2NV4ue
 lHMQcpAWeO26HIRt4kLzwwPiz3yFfJ95m0IHTVNl55YmY7Jj/gCfeJV64oJ/NPkdjPAk
 eDiemE3TfhwmsEQvT+D2ASPY64Zxb41IcVfm6NOpy7zavsXGr0vKsuMl05b72vrDY7Yb
 47+Q==
X-Gm-Message-State: AOAM530kJd5jt8LukaEOpEqDZiWXVc634WekGmMGPTbanI+0nzFSVzLX
 mxUOYUjdiRGe/HopibcfWkphYXNiqYwOCoxrffR2GQ==
X-Google-Smtp-Source: ABdhPJzCv6rbTHXoOaOdhqM4L47llbAMF8UEXuH650komQPpW0S3pIlRGxedTogK7WCHL4LdHT3ZZf9zeivVjVkC64c=
X-Received: by 2002:a81:8c9:0:b0:2d7:6801:3fcc with SMTP id
 192-20020a8108c9000000b002d768013fccmr32470302ywi.347.1646254541226; Wed, 02
 Mar 2022 12:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20220302181134.285107-1-pbonzini@redhat.com>
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 20:55:30 +0000
Message-ID: <CAFEAcA8=8tiqmFTFPaNXcqjXy6Rb5xR59Q2VYUXOTbN91rbYuA@mail.gmail.com>
Subject: Re: [PULL 00/11] QEMU changes for 2021-03-02
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 18:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 99c53410bc9d50e556f565b0960673cccb5664=
52:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-20=
22-02-28' into staging (2022-03-01 13:25:54 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 9e685c6c574a9e1f1e3affbb900f7c38fb4bff6e:
>
>   target/i386: Throw a #SS when loading a non-canonical IST (2022-03-02 1=
0:38:40 +0100)
>
> ----------------------------------------------------------------
> * whpx fixes in preparation for GDB support (Ivan)
> * VSS header fixes (Marc-Andr=C3=A9)
> * Add 5-level EPT support to vmxcap (Vitaly)
> * Bundle changes to MSI routes (Longpeng)
> * More precise emulation of #SS (Gareth)
>
> ----------------------------------------------------------------

build-oss-fuzz detects a new memory leak:
https://gitlab.com/qemu-project/qemu/-/jobs/2155668404

=3D=3D7088=3D=3DERROR: LeakSanitizer: detected memory leaks
Direct leak of 7200 byte(s) in 9 object(s) allocated from:
#0 0x5645ae447747 in __interceptor_calloc
(/builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test+0x25c747)
#1 0x7f79c6b36510 in g_malloc0 (/lib64/libglib-2.0.so.0+0x5a510)
#2 0x5645ae48044a in walk_path
/builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/qos-test.c:225:23
#3 0x5645ae4cf97e in qos_traverse_graph
/builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/libqos/qgraph.c:417=
:17
#4 0x5645ae4cf97e in qos_graph_foreach_test_path
/builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/libqos/qgraph.c:737=
:5
#5 0x5645ae4801c4 in main
/builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/qos-test.c:334:5
#6 0x7f79c65e555f in __libc_start_call_main (/lib64/libc.so.6+0x2d55f)
#7 0x7f79c65e560b in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x2d60=
b)
#8 0x5645ae39fba4 in _start
(/builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test+0x1b4ba4)
Indirect leak of 1152 byte(s) in 9 object(s) allocated from:
#0 0x5645ae44792f in __interceptor_realloc
(/builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test+0x25c92f)
#1 0x7f79c6b3664f in g_realloc (/lib64/libglib-2.0.so.0+0x5a64f)
#2 0x7f79c6b5260b in g_string_sized_new (/lib64/libglib-2.0.so.0+0x7660b)
#3 0x5645ae480487 in walk_path
/builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/qos-test.c:232:25
#4 0x5645ae4cf97e in qos_traverse_graph
/builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/libqos/qgraph.c:417=
:17
#5 0x5645ae4cf97e in qos_graph_foreach_test_path
/builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/libqos/qgraph.c:737=
:5
#6 0x5645ae4801c4 in main
/builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/qos-test.c:334:5
#7 0x7f79c65e555f in __libc_start_call_main (/lib64/libc.so.6+0x2d55f)
#8 0x7f79c65e560b in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x2d60=
b)
#9 0x5645ae39fba4 in _start
(/builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test+0x1b4ba4)
SUMMARY: AddressSanitizer: 8352 byte(s) leaked in 18 allocation(s).
(test program exited with status code 1)


thanks
-- PMM

