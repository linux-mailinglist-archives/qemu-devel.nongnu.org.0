Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86963115E4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 23:55:02 +0100 (CET)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A0D-0008D0-Bc
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 17:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l89zP-0007fq-8D
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:54:11 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l89zN-0001mx-4H
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:54:11 -0500
Received: by mail-ej1-x631.google.com with SMTP id sa23so14726342ejb.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EUjxSr35WMLgMgiKALvdwhWmZ2LapjnrmGSxWq+kU6I=;
 b=HeIacFx+OSgYWiCpn059h6GhxIdYzrv3Qe4dvVuL5CC00KHsCDMdRZB6kdxFIa6eJJ
 2ibWW+SNImS7xxB2sNaWL/6HT9NdxmkV9gfVX4jlKjayXpB33GeGq9QTF/ECYBFNBEAk
 HUfgT5SQk/WVJhV4F9d63tLdXN0dOfd2aWZ7G3gIDGP7pJOHtCB9CIYk8npZwDpu+Ccg
 Yam/jjMo10Gk9CDaiXsIv8diQIxPZy5CNS8eg5m7KBcx6H3e768vcO1aWwpAZ1TAJHD2
 3UkmZqTFExULJF9GnJvEMHvz38SCpw4xoJ1EunUDFsUc196y0sFxewYgZkckQo8I+ez5
 y6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EUjxSr35WMLgMgiKALvdwhWmZ2LapjnrmGSxWq+kU6I=;
 b=Md2tIHLI3XvF6sBKEhx4hrLi6Z5lYBXyK4qdslcbQZ328WArz+Uqb7BHnPkyNxH+4A
 SEhSIKNELlNQpBmLgRw0ppppbjLvs9mAnqNt6rnFRFa3FXps6m3C7r3BkfCnwcXBeiHl
 B6GTUdHQYlbB7xRwJvQbkp39igxIr97yY3MAQmCKAvUpRRqAkp1mBlW1W9lqxLGvP584
 BQSONyS9GPqXWqFNqoZo67Pg4RgrjmXpmi1O26XjZA1nF1u/JwBFpmqRV1pyLTLUAHTZ
 Gn8TmNSWTQn/QGQr4+vmV3v8ojDtFfdbzssqjGOA3Yqbeg532ry5qWDDXFn1or5HOYQm
 6oeQ==
X-Gm-Message-State: AOAM533gtB9eEMZf8kC0kSedZdg68DvCQV7oxkb2FB6u12Rc2OnCvtzI
 6FaczJ5aUL8DO2VTfluEEloSS/WmmtiVwFU3fC+XYQ==
X-Google-Smtp-Source: ABdhPJyQONJbHf3ETsgj1GBuiNjgnAGmkyw/nAWSVBQEbgAR8hOFICQIOxjzwBOEhB0bIDxsrY5Mom/QVAcDqvYm6Fc=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr6330800ejd.250.1612565646625; 
 Fri, 05 Feb 2021 14:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20210205164459.432714-1-stefanha@redhat.com>
In-Reply-To: <20210205164459.432714-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 22:53:55 +0000
Message-ID: <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
Subject: Re: [PULL v3 00/27] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 16:45, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit e2c5093c993ef646e4e28f7aa78429853bcc06ac:
>
>   iotests: 30: drop from auto group (and effectively from make check) (2021-02-05 15:16:13 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to b07011f375bda3319cf72eee7cb18d310078387b:
>
>   docs: fix Parallels Image "dirty bitmap" section (2021-02-05 16:36:36 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> v3:
>  * Replace {0} array initialization with {} to make clang happy [Peter]
>
> ----------------------------------------------------------------


Fails 'make check' on s390x host:

socket_accept failed: Resource temporarily unavailable
**
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
socket_accept failed: Resource temporarily unavailable
**
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
ERROR qtest-s390x/pxe-test - Bail out!
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
ERROR qtest-s390x/test-netfilter - Bail out!
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
Makefile.mtest:3121: recipe for target 'run-test-388' failed
make: *** [run-test-388] Error 1
make: *** Waiting for unfinished jobs....
Makefile.mtest:3113: recipe for target 'run-test-387' failed

thanks
-- PMM

