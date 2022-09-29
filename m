Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9215EFF02
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 23:07:51 +0200 (CEST)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe0l3-0006Om-MH
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 17:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oe0gK-0003Xr-BF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 17:02:56 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oe0gH-0006Fu-2e
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 17:02:56 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3539c6f39d7so26562647b3.12
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Hm1hgtk4kRiGotCK4M46nn0DHoRXYP9W7MfQQvOHeFE=;
 b=gzbmN9Pdm5gocK5pxYPalMRb+L9BbOlmcmer1SAh60eqQkwMRRY20NTtz8MNP0i6Gg
 KBqHI6gGQDDNnSnq2oDpO06oHVl9ICYcxJw67VSEayw6StRm3aUD7ee7CEhzce//GFAl
 UmZvuvSRLPcNA/6IMAEgzIgLcuwZZDfoILaWNC9aBK6/w1IfzAIBoB+xxkLS881ybiY1
 p2CjeOOf0u12x64X8GA5T4YmMW9MbxMjq/YmvG4dJYzPocVZlwKYTa1hQhsUdZ/gyLyH
 oumv1uD4kPIuuGngd3VMhawTszdAvXrIL0LJRMQzFc16hW2zrxGZGLbcMHBb3JXgQu2n
 6HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Hm1hgtk4kRiGotCK4M46nn0DHoRXYP9W7MfQQvOHeFE=;
 b=xr3FaRuC/qnhfma+6wO+LVCskSp9DQtpUEPi+wPxyrqC8cAnMmgZkg5LaiTdnFtGX5
 WAo5ZdyRNtrQmwA3tU0n5RxoQdw1jkyGMsJZKXS/ysv3vtE6Mrug8hsTF0mvwb+CuFze
 LcjBQhuaGMEN0/nxiRrEMv6f0gNruaUz/VM6PJ2mwXUXBFsPDIqzvBsgKEGa5rQBEQ5y
 gTr/4SF6NBqSuzEdnpEJoNBJdCykVrncBt80VtnVE568ZKkT+3+rPWGSwEZcI0bWk6cJ
 66sEtnJ/47w8UO4TcgSf2Du4swQe9yt82AofvmLCpiZgWE3QviGSjUMXvVK56T/H9kbg
 51NA==
X-Gm-Message-State: ACrzQf0YNPohxRmsZyQ+f3iTqpobquX5Mzkw/w6sdHrtthjf4NlVYWyg
 aJCvSdkc5+BeLI8gsHE+bU4wzoTnEdjG6NIpaPY=
X-Google-Smtp-Source: AMsMyM4BO0xcrGjX59yZoPPpIHUeI1sXm4gEWmg7TjTp2P5NhjW0lYr6TNvu4R3de8DEV2EaIAqCevbR/fCPi60IgzU=
X-Received: by 2002:a81:14cc:0:b0:356:4ab:7b08 with SMTP id
 195-20020a8114cc000000b0035604ab7b08mr994335ywu.62.1664485371836; Thu, 29 Sep
 2022 14:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220929163014.16950-1-pbonzini@redhat.com>
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 29 Sep 2022 17:02:39 -0400
Message-ID: <CAJSP0QWFfpQnYYP9vmHyp1=m9PvogxRYok-77HGSaBorfF7BOA@mail.gmail.com>
Subject: Re: [PULL 00/14] x86 + misc changes for 2022-09-29
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please see the following check-cfi-x86_64 failure:

>>> QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon=
 QTEST_QEMU_IMG=3D./qemu-img MALLOC_PERTURB_=3D30 QTEST_QEMU_BINARY=3D./qem=
u-system-x86_64 G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-v=
mstate-daemon.sh /builds/qemu-project/qemu/build/tests/qtest/dbus-display-t=
est --tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
ui/dbus-display1.c:17036:3: runtime error: control flow integrity
check for type 'void (struct _GObject *)' failed during indirect
function call
(/lib64/libgio-2.0.so.0+0x123910): note: (unknown) defined here
ui/dbus-display1.c:17036:3: note: check failed in
/builds/qemu-project/qemu/build/qemu-system-x86_64, destination
function located in /lib64/libgio-2.0.so.0
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
ui/dbus-display1.c:17036:3 in
../tests/qtest/libqtest.c:156: kill_qemu() tried to terminate QEMU
process but encountered exit status 1 (expected 0)
TAP parsing error: Too few tests run (expected 3, got 0)
(test program exited with status code -6)

https://gitlab.com/qemu-project/qemu/-/jobs/3106030360

