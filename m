Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584DB621E09
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 21:50:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osVX9-0000xA-0s; Tue, 08 Nov 2022 15:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osVX5-0000wU-BM; Tue, 08 Nov 2022 15:49:19 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osVX3-0004yN-QG; Tue, 08 Nov 2022 15:49:19 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-37063f855e5so144900957b3.3; 
 Tue, 08 Nov 2022 12:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osecGGmvyozZM6woBsfejq6sstWCMPgyz7CS8A19MFw=;
 b=L8+F2oxf436CDgC8lrz2S6oi7x1mYNC0YQdOqnBPZLS6icXv3r18AOPs2xderthD3X
 HgtTKJ7/OxHgM+muy/Ri/tFlWZ1W/TNsvouvFI5HaOnToXzJABEaVNHj5W0c6+bV0qIg
 8HV0MhJC1n2Lj5PX/iI8JeWaAnDZXen6swBH/B9S7CUXAxwo9wlpec+CwJhyrq3z4e0+
 hjCqiXmsmBaKh8Pdk0af6P8uRQudGGEOwKTysLJYc4pWuovRbEf9+ab4V01AONFfS5BI
 tmNimtru9v/AyUj//1d/hQSA7W7o+F1zPMfGiTnA+U9Aw9kdUSEjFruQMI0IgEQ1/Jwf
 xJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osecGGmvyozZM6woBsfejq6sstWCMPgyz7CS8A19MFw=;
 b=By0j/jNvZlU+OvlXSTb102bTSw1X3XmG0vcbL03oZsYKeZa+xStWKYjANqJY+fLin2
 mRPHC7urVnqm/+vLOjMUW4yf2/6s8cLkT0iIuFDREIXhokdZLm0/NAH2LkF/BmlFODXz
 QK+9iWRdEuv5NkdA+15GLFobTcDDdxGRJmxjC5/K+DP3LYssXbW0VivX+omniQ8mjw9s
 IaHxGZcriZT1WXSOboyg/Zxe2SAZMQFX5ZoK51LdhlpVmqbLzUNJlzouSKKBhMnM+aiE
 A252H3Ze1CIycBEQLprg9rVyA9sjq5EEpPSIXB4DnpGuLmifbw4i63Od/M1gYUAlC93W
 G04A==
X-Gm-Message-State: ACrzQf0B+UIaKrzzcSstT4ejs8Hm0x9mMSe5SBQyPuT9twyg8htsGHOT
 Fz/jfzcIF+G+JvfWguRrM89Fpm919V5XcLvrPnw=
X-Google-Smtp-Source: AMsMyM6bga9f69X2U7Qwn6aNNIwnaodIjxrZtqwvaZYM9eZUeReTfbtkFsH1rH702slnxdqz4zsBxaHMkoQIw+Aq0AU=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr56269870ywf.296.1667940556239; Tue, 08
 Nov 2022 12:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20221108183352.9466-1-philmd@linaro.org>
In-Reply-To: <20221108183352.9466-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 15:49:04 -0500
Message-ID: <CAJSP0QVdQ=wTtgNVDChzu5U1ww3SZAa2HfXjuE4z5uOnFeT_bw@mail.gmail.com>
Subject: Re: [PULL 0/3] Memory/SDHCI/ParallelFlash patches for v7.2.0-rc0
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 8 Nov 2022 at 13:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> The following changes since commit ade760a2f63804b7ab1839fbc3e5ddbf305387=
18:
>
>   Merge tag 'pull-request-2022-11-08' of https://gitlab.com/thuth/qemu in=
to staging (2022-11-08 11:34:06 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/memflash-20221108
>
> for you to fetch changes up to cf9b3efd816518f9f210f50a0fa3e46a00b33c27:
>
>   Revert "hw/block/pflash_cfi: Error out if dev length isn't power of 2" =
(2022-11-08 19:29:25 +0100)
>
> ----------------------------------------------------------------
> Memory/SDHCI/ParallelFlash patches queue
>
> - Fix wrong end address dump in 'info mtree' (Zhenzhong Duan)
> - Fix in SDHCI for CVE-2022-3872 (myself)

There is a CI failure:

>>> G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-daemo=
n.sh MALLOC_PERTURB_=3D127 QTEST_QEMU_BINARY=3D./qemu-system-arm QTEST_QEMU=
_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon QTEST_QEMU_IM=
G=3D./qemu-img /builds/qemu-project/qemu/build/tests/qtest/npcm7xx_sdhci-te=
st --tap -k
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
** Message: 19:27:52.411: /tmp/sdhci_ZD2EV1
**
ERROR:../tests/qtest/npcm7xx_sdhci-test.c:101:sdwrite_read: assertion
failed: (!memcmp(rmsg, msg, len))

https://gitlab.com/qemu-project/qemu/-/jobs/3292896670

Stefan

