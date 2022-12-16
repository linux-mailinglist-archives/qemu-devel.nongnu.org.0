Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09BF64EDC5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CXt-0000pa-4I; Fri, 16 Dec 2022 10:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6CXr-0000pH-GU
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:22:43 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6CXj-0000Yq-RW
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:22:43 -0500
Received: by mail-pl1-x634.google.com with SMTP id a9so2622685pld.7
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKRRg/V1GD4koQ4/ICbxuWhM2y/ntkaiE8HOTWWwz8A=;
 b=VkT9uOtEFc1MompVUuA3YkFFePuB5ewoHIxe3xE0F4AnDkYS6P4aEJl4fM41/dDbM5
 i7fcSlYfniqHkNEPzElketSecYs5ZRahJ4K+MTicR9DyErmKfxq2IoPHIefE64Zqwkbe
 Me17urRxaf2N1CZWOgBoe7Sfj0FI30e52ET32iMHHgpI9FBgcK6HW2frvyQuk9PCpXNi
 viqZGXhT9etYBWm6azGaLEG2uCIKahxtyHy9s1Jdsm23wmoi8R7x5Ib87vDdzC/xgJIz
 Lhv6vUHDoXKB31H756O9zr8eKC8QiWw7GCejLVN1zjNcsomczPv3jLgN6NIOFBUP/7oy
 bM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mKRRg/V1GD4koQ4/ICbxuWhM2y/ntkaiE8HOTWWwz8A=;
 b=3pRDY48BkHZJ/7UBpA+BChzMY1lxCgYlXOYQBmmu7V+qh0W6Aq1OUZE9gwK70SJT1R
 QMzn+TZ2VM5q81xwhF3qkekNCTZjKv/q21iH007kRvC7iq8i/s/cRAAlSiA29YLmYEfL
 dqSLlxBeJPjCk669v2kUR6E6uCh2EvyIgAPpUD2Nl7Z7A354By/gsqHbkXTuAoHuNdlJ
 H5RCw9T922RX/nJ5Y8PPoIRYZRxkGHFK/7dyk4MSnp2aTbxATFbu+JnMQDBYgcyQOE5L
 zME1hCQh990Zz4yLN9QQHuiUN3Jtme0Uao/PHV67K1CiUcHMijXfklgg1KnTolxhAzjc
 zeQw==
X-Gm-Message-State: ANoB5pltHmWF4zVFFK/XqjVrsPO7WNcmxJLrtRlT+sHqoZxE4jZx82lf
 yoZJ3/qTB6eujkJ+2JN7x5XKz1qEn6p2PiMpv1G6uGhSYxTUSCpo
X-Google-Smtp-Source: AA0mqf7Pueq8aTh6Ydbze7TFbPNVvi6PMeRW13POow6jTlU96aUFdjKG8e/gUkqUma/ky5Q43XZ6QwV2qT2mHJODsVY=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr36630678plt.60.1671204152121; Fri, 16
 Dec 2022 07:22:32 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
In-Reply-To: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 15:22:20 +0000
Message-ID: <CAFEAcA_nGW1XATj5u1WUNmbV2nS5tRsA-0T8UYT8KpGijJnT9Q@mail.gmail.com>
Subject: Re: migration qtest failure: "query-migrate shows failed migration:
 Unable to write to socket: Broken pipe"
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 15 Dec 2022 at 11:17, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> Hi; I see this migration qtest failure on my x86 macos box:

Same assertion failure, this time on the OpenBSD VM, with
a different error string:


 34/616 qemu:qtest+qtest-i386 / qtest-i386/migration-test
           ERROR
      139.66s   killed by signal 6 SIGABRT
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
query-migrate shows failed migration: Failed to connect to
'127.0.0.1:4562': Address alread
y in use
**
ERROR:../src/tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
assertion failed
: (!g_str_equal(status, "failed"))
assertion "pid =3D=3D s->qemu_pid" failed: file
"../src/tests/qtest/libqtest.c", line 207, func
tion "qtest_wait_qemu"

(test program exited with status code -6)
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95


thanks
-- PMM

