Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B52C8377
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 12:50:06 +0100 (CET)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjhgz-0005T5-1f
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 06:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhfa-0004zB-P2
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:48:38 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhfZ-00073O-08
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:48:38 -0500
Received: by mail-ej1-x62a.google.com with SMTP id s13so5849719ejr.1
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ABBfkz8bVqs6ONR2FvmsKUP1JFcLJ89RMG9fA53ncgc=;
 b=Kx8k0j53RHVuPiVV5lcBc2/cHNopvPiTDJ2g5nnqfw7fVB2ecukFMcvNSv5IvDZiTI
 +MCNuXZmCRx/M5u+qE4U1FNqqtHqW7EYLqHyEqQ40lDLw1ViqIxeX1QadnJY1ib0FJPl
 E/uY7CwqBaaBkx1jBsgAa+ELyxqh61Dw1u+GAcvKCUBNUOhW78agaadQ/XXG+Kkz+Mjd
 F2717lCh5oa21nMD84PU3McuaIxXYgaDFolcYix1pPW16rD/oWGz2blH5oHJQhPGBvXW
 H65XA/R15ak1zvnRgOGY2jE3/oa68Claq8iFmfOQCBNs7JlkrHA3jtQYr1eTPFA+SKLR
 qFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ABBfkz8bVqs6ONR2FvmsKUP1JFcLJ89RMG9fA53ncgc=;
 b=UhkUBMJoQbBHekvFwEX8vGnp6zO9ePh8yrBd+cfgkmjh6Iyc73n91MMwX5H6fy9CPE
 m109c9erdTiOjrgT3wU8wqmB94lRWxbwJ1LL/LFDvQS46moF2aaoWLp1zc8mf0PY0PeY
 tXa+dvu/cwS3KK9+uzevEpq4QCFVjJshT5UfFbict3EPDnkCfOi3T4Ez1M0/soakvC7a
 J2O2vdneaJpF8/BpyouwSJbGX95fzXYcBVZLsb4ctodsE199NmJGjR0Ct6bAIz+vIaMl
 rGLUUl8g/9Qj+BbzagflSehSubbKYuY/b8K1K8DYMQBzVdbtoz3BAr6uieIijEhHn5CQ
 M0/g==
X-Gm-Message-State: AOAM533/pN1vsSsPCDaUKveFypbF3G2qpj9pwLrLgApJQmI9fHRzvDZQ
 R7xdajlgkDr8oXG8mTyaimDHmuIf3MUXIYDtOnW/kg==
X-Google-Smtp-Source: ABdhPJyPGSSPIGKoL5TwXc4/Px5MSItdI3XaEQL7w9rGn6OAy2Jodp2myFD4+en+TUKMltGxdcz5Aoy5yEc7zLGEUbU=
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr20172168ejb.482.1606736914903; 
 Mon, 30 Nov 2020 03:48:34 -0800 (PST)
MIME-Version: 1.0
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 11:48:23 +0000
Message-ID: <CAFEAcA_gcuxVuA6pc7F3nWN+5hvznqwB1L_767VqjPg0Kziydw@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] Add Versal usb model
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 at 06:48, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> This patch series attempts to make 'hcd-xhci' an independent model so it can be used by both pci and system-bus interface.

This fails "make check":

[...]
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-from-laptop/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-aarch64
tests/qtest/device-introspect-test --tap -k
PASS 1 qtest-aarch64/device-introspect-test /aarch64/device/introspect/list
PASS 2 qtest-aarch64/device-introspect-test
/aarch64/device/introspect/list-fields
PASS 3 qtest-aarch64/device-introspect-test /aarch64/device/introspect/none
PASS 4 qtest-aarch64/device-introspect-test /aarch64/device/introspect/abstract
PASS 5 qtest-aarch64/device-introspect-test
/aarch64/device/introspect/abstract-interfaces
missing object type 'usb_dwc3'
Broken pipe
../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
ERROR qtest-aarch64/device-introspect-test - too few tests run
(expected 6, got 5)

Probably an error in meson.build or Kconfig handling of that new device.

thanks
-- PMM

