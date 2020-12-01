Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9A2CA910
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:57:12 +0100 (CET)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8xi-0006oV-MK
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk8va-0005fn-7W
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:54:59 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk8vU-0004Qv-MJ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:54:57 -0500
Received: by mail-ej1-x636.google.com with SMTP id f23so5581293ejk.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 08:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4MhNtHsFpjh2tJ2+LBRPnUA2D90LN3eOzCbydpS8BNs=;
 b=rFZ7nKMsLYYtnMPH2zWeFtNZkUp8GtIFxAzpJ/gv7IFHj1iTXlANbgN4nmpKnsJIfB
 b8JWP/tyZ7dOMe0salB1dQik2tKbiAr9cNKiN8wTlg41RWqP8fsOmqzMZl5Tm1hhVDF5
 lUr7K1HMvPXrhwetHt/MfWIbqNOncFfThYwTqG32iY6026y8DD/B0jXvEnP2WbDkOHS5
 zGTjkcNTZfPayRvmYC/4O2GUHEAaxkc9KEbWIiFUkiXL1CcQ3qzKprvXMx3gQBS1o8t2
 N1kA/GZdwxnfUbeFTR50nOboxrRZiiPZOl0GYw4jhDjTd48b/dwFK/ykBnwLUNcv6NJu
 7bnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4MhNtHsFpjh2tJ2+LBRPnUA2D90LN3eOzCbydpS8BNs=;
 b=R/uIu4sAIQxmBBeSHFjtk+xTfBJKG6euLWbnJOpctuPX+DQDQgr0GeS/OXJfsGgd+z
 eakWhO4zihlvLu1gh/duwNxmav++DyyTBD0QmUlyq/od7OIbH5hl3TXgQiVfbBQSBJ4d
 DtSCPGgUR9L08zBUvwZUeWjnnPCgupWAVkA7wgeuJfd3bC+5aiX0hZmQKIgQAVV1DshI
 /MtjmWeR68iaFHsVNVVf13zoxxFtSV0SVbotuknFEcoG+psjfC/GsQVrU7QKFA3Y7eYv
 8sIcHszR+2vNndL8TY1fUMGY2bzKoKQXWycxVpW2qqm31QIz3hHcJFg66BIn5A4BeqZ3
 tXcQ==
X-Gm-Message-State: AOAM533vVE+OQUOSXvCt0vwavEDdE7p9HyWUAJxs8PpfU2JerMKthg32
 b68NEW6AdGCjrZ79N5p0mK6H5E23rP+wddkstvqisw==
X-Google-Smtp-Source: ABdhPJzbFD2nQmEdVfACmW3V3olR6kom23hib7Y86PkiW19t00j6eFhOgcObMovEqZtF5omLCIFDzVZU/dBduDRkYCU=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr3873378ejd.85.1606841687404; 
 Tue, 01 Dec 2020 08:54:47 -0800 (PST)
MIME-Version: 1.0
References: <3333301.iIbC2pHGDl@basile.remlab.net>
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 16:54:36 +0000
Message-ID: <CAFEAcA9J0t1UtrNqGxst7-9kCq_+M3+xA6-h+xo3x9Z6Ccc5bw@mail.gmail.com>
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 at 08:02, R=C3=A9mi Denis-Courmont
<remi.denis.courmont@huawei.com> wrote:
>
> The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe=
07:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122=
' into staging (2020-11-22 15:02:52 +0000)
>
> follow.
>
> Changes since version 2:
> - Don't set HPFAR.NS in AT instruction in NS state.
>

This series seems to break the 'make check-acceptance' tests. Specifically
the vexpress-a9 image fails to boot:
 (20/40) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_v=
expressa9:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'20-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_vexpre=
ssa9',
'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tes.=
..
(90.23 s)

The log shows the guest kernel booting partway and then hanging.

thanks
-- PMM

