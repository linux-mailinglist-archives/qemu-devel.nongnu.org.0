Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A955132F9B0
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:23:34 +0100 (CET)
Received: from localhost ([::1]:38884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIV1x-0006Mq-Nx
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIV0z-0005sU-HC
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 06:22:33 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIV0x-0008Kc-N3
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 06:22:33 -0500
Received: by mail-ej1-x630.google.com with SMTP id w17so9038018ejc.6
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 03:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cREl9Aoz31FwpILMN5MBqxVAXIdfI7p/1e+SwB+Gceo=;
 b=PHK54j8nbvJ6iE2a1gGIFxFRrvKyYpvI8j82j0+fhgJQr6RT/sErG2RLaweWR6kvFv
 J8Dcyu7oNdlj4I8feR82nrpc7c0YAGu38ie41cXcfXaDsuGvOKvR7xbRXOqY9QGOjtDX
 NTzj6ImeZ6CM4avgITx1OcSawX94GoaHr9HY8VynzKbtlhuf8oJp6uuksFKUFhEtqBOK
 2j9r75SswdwNbbQdaEKVSdOadH95F1ghEGYmdVJ50Gr8zgYme0Y75PmRCTc5CeemVbSx
 bBDVM+IV61P55KokUT0yYqMA4gBik8JNI6v8U6sGxx3TquDfz+wNC4GAoziD1EQl/JPl
 k7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cREl9Aoz31FwpILMN5MBqxVAXIdfI7p/1e+SwB+Gceo=;
 b=hXOrBa+1FAmQ30j84DOvdGMgp9h+eVBB0we4mqF2Tr3Zp+hZvdbCJwoKW56/eM6T+5
 Rxwrn2XrbKa2x77yEN4EczpA5TOZBPFXj5Z97R6jki6xyx63o5ipzjtlb8xhKgTlNOBa
 wodklTCH3yiOO41MQzZ2fYvIP9eHBFR8rbJvBFSrRf890Wgvz8p3wdT96+gBaJ5yJScW
 wCOv6tC+nHvxKU2nmmeGucq+hnWUvD0eDMAEtD6U8hvGguy9+DvArINYbEamPn5hAl47
 56Pl3kze/ZIkh1xCopQ1gIbqIdEr3HBvzuhoGmIZU8j+8oPLyoTT8b482XLWUTeC3Oei
 oFWw==
X-Gm-Message-State: AOAM53213R4YizYjo5c6J1XUpoJ+kwln2FE+J8rDIucsp0x4F3iV0X7+
 BEEStz74YjX9Z9g+KvVMSOL4cJeEUWucWp+smUNv3Q==
X-Google-Smtp-Source: ABdhPJxdbyjS+OVukewLIkE40NMt0A+aYHOTDRFOGD0i2Hdg01MmLOor9mFCP5f2ANJ613YgtLsYKAJN3FTJ+nOxZR8=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr6375515ejp.382.1615029750152; 
 Sat, 06 Mar 2021 03:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20210305165454.356840-1-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Mar 2021 11:22:13 +0000
Message-ID: <CAFEAcA8=jkCWw=NAJy5Zd5Rx4=QJPHX_cppHwz3b2TLgPUgWqw@mail.gmail.com>
Subject: Re: [PULL 00/31] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Fri, 5 Mar 2021 at 16:55, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 9a7beaad3dbba982f7a461d676b55a5c3851d312:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210304' into staging (2021-03-05 10:47:46 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 67bedc3aed5c455b629c2cb5f523b536c46adff9:
>
>   docs: qsd: Explain --export nbd,name=... default (2021-03-05 17:09:46 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - qemu-storage-daemon: add --pidfile option
> - qemu-storage-daemon: CLI error messages include the option name now
> - vhost-user-blk export: Misc fixes, added test cases
> - docs: Improvements for qemu-storage-daemon documentation
> - parallels: load bitmap extension
> - backup-top: Don't crash on post-finalize accesses
> - iotests improvements

This failed some of the gitlab CI jobs, like this:

https://gitlab.com/qemu-project/qemu/-/jobs/1077335781

Running test qtest-x86_64/test-hmp
Running test qtest-x86_64/qos-test
qemu-storage-daemon: vu_panic: Not implemented: memfd support is missing
qemu-storage-daemon: vu_panic: Failed to alloc vhost inflight area
qemu-system-x86_64: Failed to write msg. Wrote -1 instead of 20.
qemu-system-x86_64: vhost_set_features failed: Invalid argument (22)
qemu-system-x86_64: Error starting vhost: 22
qemu-system-x86_64: vhost-user-blk: vhost start failed: Invalid argument
**
ERROR:../tests/qtest/libqos/virtio.c:228:qvirtio_wait_used_elem:
assertion failed: (g_get_monotonic_time() - start_time <= timeout_us)
ERROR qtest-x86_64/qos-test - Bail out!
ERROR:../tests/qtest/libqos/virtio.c:228:qvirtio_wait_used_elem:
assertion failed: (g_get_monotonic_time() - start_time <= timeout_us)
make: *** [run-test-159] Error 1

I guess some test or other is assuming the presence of
a host feature that isn't guaranteed to be there ?

thanks
-- PMM

