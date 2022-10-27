Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4B60FCF5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:20:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5bl-0004X4-1d; Thu, 27 Oct 2022 12:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oo5bi-0004Bc-5G
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:19:50 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oo5bX-0006Zo-Rs
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:19:49 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id ml12so1799067qvb.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4v8yXs7g8BM28vOdAjKAvdNBnSxfwuTTcxXCMGKahF8=;
 b=J8pxl6HFnY0l1ASWvmWeweUhPCuNh7/cOsKepojKbFvi02H0htn/hbHWmUoZ0DNuvO
 4gRv80ncikKLlnCsR+5HjNOBpaNH5zh/7CdtmQt5CCIYVu6BhFT/B5aTcbwjIuWHtYzd
 1xcH3rTbFPlmYDYL4j3b24dgTGFj5l+6PZ+MmS+FoG3uxwmvG16w10aYbr2ZfQlwgDVV
 4RGPuRJla3+ZhF9BQiiSEfbWeEv5VZpWmCRyQ+wTmkEuGl0JO7zx+NV3f60qJhR7yu31
 TcCIwTAx1TgCBUeBZGTjSslUOy3FsxTk8H5BT4e99QGmRiwGIlHFF/bUx2uf9ikzf76P
 /lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4v8yXs7g8BM28vOdAjKAvdNBnSxfwuTTcxXCMGKahF8=;
 b=kXKmR/4+vSz9E/+8a+WbzTijVji41Kdb5VoJsKW+MI+RyO0cMLEFV9PcN5fqCTUAb6
 oFDgNrK9TKPcusUDNcw6Y21zOuLYd4m6PPbQaVN+QxEKNGHLIClupi/KQuXvfd1QlcdL
 IP6XXV0jqX0lOEzJzlGjQ/b9BroidvLf4tJ5PDS3Fq/ju9wq524IUNi7AUEEE/iQh0EZ
 LEuqszQHDNVAA7h0je5tyoG6pNJnjgsAnmZpduirrNjnq7UFg2LKyM3X9tMFIqVvdG+u
 qNzwdNRT/yuMF80M2T8O84n/oDZTrlmLxDZPrxNHZ9oor0RTPqZgqp/6qPPCu+83rsdM
 GjvA==
X-Gm-Message-State: ACrzQf3arh+ZB+SAOR9tMPW+otnOHomM/0s4ecv4IMROjGuXkGxeiRJ8
 lPCqPwGZ8NuH9ViIAKkXpk9TPH8DTOfzgEtQwiY=
X-Google-Smtp-Source: AMsMyM6e7X6ooh6585InkTe8TbYxf3WJZwkQyYHeSiuAtC5ZgqgmklW/AbAnfowomUySIJZ3+pWaXtK8j569Y9RE4ew=
X-Received: by 2002:a05:6214:2245:b0:4b7:b2a1:7aff with SMTP id
 c5-20020a056214224500b004b7b2a17affmr34057318qvc.114.1666887578685; Thu, 27
 Oct 2022 09:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221024045759.448014-1-bin.meng@windriver.com>
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 28 Oct 2022 00:19:27 +0800
Message-ID: <CAEUhbmV632N-w7yAj2jcmRMa_XMGi+jRJ-riFK5jBZFjgoyrAg@mail.gmail.com>
Subject: Re: [PATCH 00/16] hw/9pfs: Add 9pfs support for Windows
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, 
 Keno Fischer <keno@juliacomputing.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>, Will Cohen <wwcohen@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Christian,

On Mon, Oct 24, 2022 at 1:16 PM Bin Meng <bin.meng@windriver.com> wrote:
>
> At present there is no Windows support for 9p file system.
> This series adds initial Windows support for 9p file system.
>
> 'local' file system backend driver is supported on Windows,
> including open, read, write, close, rename, remove, etc.
> All security models are supported. The mapped (mapped-xattr)
> security model is implemented using NTFS Alternate Data Stream
> (ADS) so the 9p export path shall be on an NTFS partition.
>
> 'synth' driver is adapted for Windows too so that we can now
> run qtests on Windows for 9p related regression testing.
>
> Example command line to test:
>
>   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
>
>
> Bin Meng (5):
>   qemu/xattr.h: Exclude <sys/xattr.h> for Windows
>   hw/9pfs: Drop unnecessary *xattr wrapper API declarations
>   hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper
>   hw/9pfs: Introduce an opaque type 9P_FILE_ID
>   hw/9pfs: Update P9_FILE_ID to support Windows
>
> Guohuai Shi (11):
>   hw/9pfs: Add missing definitions for Windows
>   hw/9pfs: Implement Windows specific utilities functions for 9pfs
>   hw/9pfs: Handle current directory offset for Windows
>   hw/9pfs: Disable unsupported flags and features for Windows
>   hw/9pfs: Update the local fs driver to support Windows
>   hw/9pfs: Add Linux error number definition
>   hw/9pfs: Translate Windows errno to Linux value
>   fsdev: Disable proxy fs driver on Windows
>   hw/9pfs: Update synth fs driver for Windows
>   tests/qtest: virtio-9p-test: Adapt the case for win32
>   meson.build: Turn on virtfs for Windows
>

With the latest 9p test case refactoring in the mainline, I will have
to cherry-pick the following 2 patches in this series, to v6 of
"tests/qtest: Enable running qtest on Windows" series [1], in order to
get qtest on Windows build successfully.

[06/16] hw/9pfs: Add missing definitions for Windows
[15/16] tests/qtest: virtio-9p-test: Adapt the case for win32

I will include the above 2 patches in the v6 qtest windows support series.

[1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=321695

Regards,
Bin

