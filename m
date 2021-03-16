Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099733D4B6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:19:03 +0100 (CET)
Received: from localhost ([::1]:38544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9bB-0002Jv-FP
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM9Zt-0001pp-VA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:17:43 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM9Zr-000406-RF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:17:41 -0400
Received: by mail-ej1-x633.google.com with SMTP id dx17so72121606ejb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G+5rNugoKK23EdfVYRUhzDk5elqW9A1VTPJGWDMtxMM=;
 b=hv1RCvJrY3u+tAA+FZFqMKu6nRqYiF4B9mfhD/dmQtFpTr276rKr3ZXZ89XisR7NHc
 t9l6T5z0cXOKv/32VpO4VH42GLqhMOeOSWkcjIpZa1B5uywwaKtyQ/NOfV0mTJ87hXgQ
 kt4+1lxEFhj7VgwDZ/EkPq8MBG7rOIKTiC4zfEyOYSfigO/y4I8PRl52NUDwdQnKmX9a
 PWM9ASb1+3ngBJeywi0WfDaEeM0RpjH5h0GbVUkdRlb6bgb/ZX7xBcf7ah8n0owB5g+L
 EkqcWOBggbKqG4tUVhhF5pyiFcFuR9q34mH/aFHgWcp2m5A2aH0OL+CoU0MFwcQRFyxq
 e1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G+5rNugoKK23EdfVYRUhzDk5elqW9A1VTPJGWDMtxMM=;
 b=dRO5/+A5Grzjvu8A2fEnh8wiTNwFOVIc3EY2ZZhx7DOzcIv0fKvIPQKfy7XJZru9D2
 alCZG91yfc8EpmW0wgVhto6QSsb5lr5xGgCM4/7JrhtdGs0F2rW/xHIrN8pyzDQw69tx
 +vfrWBJdReOm7/Itx4zjk/gvKISbD9pI9HH5mtyGL581+dKc9M0GWCe24eM9RMjmrRyo
 bLAhbzyYmswA4wXuCbMAR6k9Fgpdj9FqYkODwnaGWwVov5TwCmWH7DiErAIf1M3ViKa4
 eMyLvqTkt0VdxfcS6+T4uMvCKPc32pbDaqfILNRe2APQoRjaS/NpfXng3xs4zoWhSYUN
 GzCg==
X-Gm-Message-State: AOAM532YSMYVmwD4p+nNAsYf6CjZ69cuOSbjZ6SNUGuXbsvUUGXiG/Xn
 WdRPIrPyf292R2qe1AwZ5gK/8k+aARf+RK1EMVLOUg==
X-Google-Smtp-Source: ABdhPJyDWFMm93Ej+8Eqmh+4aXThmGkayDvFXhmLWh29IeFuEh9dW80hyegViuFtFSLQnJjockjwLzmvB+42etU2VJw=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr30263697ejc.250.1615900658168; 
 Tue, 16 Mar 2021 06:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210315123520.118752-1-kwolf@redhat.com>
In-Reply-To: <20210315123520.118752-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 13:17:15 +0000
Message-ID: <CAFEAcA8ckSBYcONgQKXeWnSwL9inGAchUAAwy9=xcb2HEP=qVQ@mail.gmail.com>
Subject: Re: [PULL v2 00/42] Block layer patches and object-add QAPIfication
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 12:35, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 078ee48ef7d172df1b3ad020255d1eb6beda2daf:
>
>   qom: Support JSON in HMP object_add and tools --object (2021-03-15 13:04:27 +0100)
>
> ----------------------------------------------------------------
> Block layer patches and object-add QAPIfication
>
> - QAPIfy object-add and --object for tools (keyval and JSON support)
> - Add vhost-user-blk-test
> - stream: Fail gracefully if permission is denied
> - storage-daemon: Fix crash on quit when job is still running
> - curl: Fix use after free
> - char: Deprecate backend aliases, fix QMP query-chardev-backends
> - Fix image creation option defaults that exist in both the format and
>   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
>   default was incorrectly applied to the rbd layer)
>
> ----------------------------------------------------------------

Fails 'make check' on x86-64 linux:

PASS 61 qtest-x86_64/qos-test
/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/config
PASS 62 qtest-x86_64/qos-test
/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/basic
PASS 63 qtest-x86_64/qos-test
/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/resize
**
ERROR:../../tests/qtest/libqos/virtio.c:194:qvirtio_wait_status_byte_no_isr:
assertion failed: (!d->bus->get_queue_isr_status(d, vq))
ERROR qtest-x86_64/qos-test - Bail out!
ERROR:../../tests/qtest/libqos/virtio.c:194:qvirtio_wait_status_byte_no_isr:
assertion failed: (!d->bus->get_queue_isr_status(d, vq))
Makefile.mtest:1008: recipe for target 'run-test-124' failed
make: *** [run-test-124] Error 1


thanks
-- PMM

