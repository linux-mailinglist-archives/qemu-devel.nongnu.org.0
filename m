Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00393EA357
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:15:01 +0200 (CEST)
Received: from localhost ([::1]:58126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8fs-0003Rh-Pr
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE8ed-0002Di-Gp
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:13:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE8eZ-0008Nf-BW
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:13:43 -0400
Received: by mail-wr1-x433.google.com with SMTP id q18so870988wrm.6
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yIpQH5J36FnfSKhdlIR4giPRwMtJeXiTgpe8Zp1t9kI=;
 b=bQ/TejqP1vgpanF23RBA6YskbMc8wG7O5NW3u1GlkEUXhWbpfSKtvROl5g+4wtaBoL
 7Sv5q3c9MIOATCP7zrHrVTRy1VQFFvCp7Z+ohxF8SIB75BPXEVkto4Ayf0Ng4d7FtKe1
 3qnxjfwsxEbysj+QK8kMlF4RtGWIVDPOeWiAIByQw53x5Udo11ceW82kRhyxPz1ql2K7
 4k0CYudv+TKYi/i5JodQFdrPajZ+jVr39mZ2DZ49O8FOB+am8YvZqxikVCY0ppYnOVm6
 PkNi/xnsMinfehxTD9RigwUkdDuY9F9d8SbwynTpv4g3+WhrqByZOecDXtXR2qF8UYbH
 O3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yIpQH5J36FnfSKhdlIR4giPRwMtJeXiTgpe8Zp1t9kI=;
 b=sQ7AMYbSN6u+zjFiG6mUhw1VmF6zl75tgru6zIsC3qgBb5axppqS/CVMNv1z7fSO1u
 wotQq6mYCLUgDKL4UWbhGISDxLnDctZUJ9iuirrIwh7zAiC2ARHd8xTIpmOjl8RNKn/C
 KMWkaMsR3oKlSl3qkmHaqT/glsNYi4nYUGMOt/JBfnYTFkOE71J9mA10JTiTa1n94iU4
 LeGPKegA/ehcKKkc0NVCm2zHMP+6GDPUWBmwgJaOFYvtNxy94S8sF4BZWw7b8c+E+top
 dd2UPz6vEpXm4m4VoB254axSK9K8G034vjI0+VSrGB8gzKTH/Xpf6S4e8x3HH7t2LGSr
 d4lw==
X-Gm-Message-State: AOAM532SghuqHasfMzIf0HH77gwPF5+VFIg5whoHs7pqoa0zutpgJTAB
 RXu0EJmYgLHGnc+81Q9ej/AW1oITyFK/QrRJKaxP7+fpTVs=
X-Google-Smtp-Source: ABdhPJyHbT5sbZorF25/Fe61a7Rck6KuLqISGGeHvvhCi48sbzShmC8ETWfD90GPeIEK79OQ6Qyobvsdih2jNrZh0a4=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3049114ejy.407.1628766466910; 
 Thu, 12 Aug 2021 04:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210811094705.131314-1-thuth@redhat.com>
 <YRT9rFAGwuox62mT@redhat.com>
In-Reply-To: <YRT9rFAGwuox62mT@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 12:07:01 +0100
Message-ID: <CAFEAcA_QuV=b75=X6-74PExUQff5HLDVLT73xuP-HG6oKXMicA@mail.gmail.com>
Subject: Re: [PATCH] storage-daemon: Add missing build dependency to the
 vhost-user-blk-test
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 11:53, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Aug 11, 2021 at 11:47:05AM +0200, Thomas Huth wrote:
> > vhost-user-blk-test needs the qemu-storage-deamon, otherwise it
> > currently hangs. So make sure that we build the daemon before running
> > the tests.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  storage-daemon/meson.build | 8 ++++----
> >  tests/qtest/meson.build    | 7 +++++--
> >  2 files changed, 9 insertions(+), 6 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> IIUC, this is the fix for the oss-fuzz test that hangs
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01850.html
>
> can we get this fix into 6.1, so that hopefully now we get
> a clean CI pipeline for the release.

Only if we need an rc4 anyway; I'm not going to roll rc4 just
for tests fixes.

-- PMM

