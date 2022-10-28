Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218826107FB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 04:28:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooF4f-0000Bl-Ee; Thu, 27 Oct 2022 22:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ooF4X-0000BH-UM
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:26:13 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ooF4M-0005wc-QB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:26:13 -0400
Received: by mail-qt1-x830.google.com with SMTP id h24so2744224qta.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 19:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8SZ98KYoe8wx4eJnEDR7DloXRo9eefRPHYrGS8a/50g=;
 b=PZ21vdfgCSjRJ0rNEdwVvMr0P+8Ci7oG2HBtJUZ4P4yymPlCWzjHsNqHwj3UlUuhXN
 8iS1p3FXYUkOpKhnXMLg+UeLfIx7moSFdPKa7L+ZPmggwPLN/SGbHY4UJJ022KOAqI0f
 r6g+0hdjovUVPrqgnh8xNm7ushK3VCX7STBqvhYS1Iegx8ijzyuPe0R/DG9tTA7pauHr
 x8zBqqMHa6qpetxvym6gvxIUrLMXr9NOaG6nK0inZAYXKHC6FxEQW4sVUNQy8tvLmJyo
 VdEZYnZt1lOutCxjFqKHlOITAANm0JRDMyroKZ2AO5kyC63EzTOvqtJVqXmOxXyL8LzV
 //EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8SZ98KYoe8wx4eJnEDR7DloXRo9eefRPHYrGS8a/50g=;
 b=Odbi08zygxXE7GasQOVqpLs5d8jfNOGvlmZU3NFg4dKZGFeXCeZrvCq/TJ5ZAKh+nh
 ymGEGoe1m0NbZ5xl+d7lFqUfiYlTcrCG8Tjb7zzgk5o7hZ7ftiUS8o8wakZcnetU4F+m
 CQ5TuZh3lC0ugbs/nZc9/uV8V8bptxSSfOu6Qo2V5Bp+u25u2pJ+x5x1svXqG67m/Plx
 L/j4t7K1vmsLgQ6B3m7+o3dPkJh3FmZhduwl08GIh+jW3qUVspKnyn+UfLWKXgwezMsE
 6b3F3k1QZRDp3Xrig5220cxw47+AHSSpVuat9Zawr1nHQz9fghSxXwFUT1AIzOxFQH+N
 wd2g==
X-Gm-Message-State: ACrzQf1Xrs8B0VIuJShDD/8ERJ5QYyhqS4DqEBwxpM4kL0gH5wMMvEP0
 Z6MJs3/kxe3Z8JsNfkm02H5pIyHNUYYo0Fnx7YA=
X-Google-Smtp-Source: AMsMyM72XWZQJFm8ualPbNKAqQW1fdZYR7n+y/5pK4Uk/BidNDE2+uAVbQLxtUWJbOKvG9KkES+WVIeDbwDV28zp6cI=
X-Received: by 2002:ac8:57c5:0:b0:39a:6512:6e3e with SMTP id
 w5-20020ac857c5000000b0039a65126e3emr44701604qta.334.1666923958178; Thu, 27
 Oct 2022 19:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <CAEUhbmV632N-w7yAj2jcmRMa_XMGi+jRJ-riFK5jBZFjgoyrAg@mail.gmail.com>
 <13126592.PNbLGPOa45@silver>
In-Reply-To: <13126592.PNbLGPOa45@silver>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 28 Oct 2022 10:25:47 +0800
Message-ID: <CAEUhbmVyQJfuQ=4zrk+Cy_6YXWBSbnfPDUxchEiVXiXV1jRYdA@mail.gmail.com>
Subject: Re: [PATCH 00/16] hw/9pfs: Add 9pfs support for Windows
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, 
 Keno Fischer <keno@juliacomputing.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>, Will Cohen <wwcohen@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x830.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 12:31 AM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Thursday, October 27, 2022 6:19:27 PM CEST Bin Meng wrote:
> > Hi Christian,
> >
> > On Mon, Oct 24, 2022 at 1:16 PM Bin Meng <bin.meng@windriver.com> wrote:
> > >
> > > At present there is no Windows support for 9p file system.
> > > This series adds initial Windows support for 9p file system.
> > >
> > > 'local' file system backend driver is supported on Windows,
> > > including open, read, write, close, rename, remove, etc.
> > > All security models are supported. The mapped (mapped-xattr)
> > > security model is implemented using NTFS Alternate Data Stream
> > > (ADS) so the 9p export path shall be on an NTFS partition.
> > >
> > > 'synth' driver is adapted for Windows too so that we can now
> > > run qtests on Windows for 9p related regression testing.
> > >
> > > Example command line to test:
> > >
> > >   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
> > >
> > >
> > > Bin Meng (5):
> > >   qemu/xattr.h: Exclude <sys/xattr.h> for Windows
> > >   hw/9pfs: Drop unnecessary *xattr wrapper API declarations
> > >   hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper
> > >   hw/9pfs: Introduce an opaque type 9P_FILE_ID
> > >   hw/9pfs: Update P9_FILE_ID to support Windows
> > >
> > > Guohuai Shi (11):
> > >   hw/9pfs: Add missing definitions for Windows
> > >   hw/9pfs: Implement Windows specific utilities functions for 9pfs
> > >   hw/9pfs: Handle current directory offset for Windows
> > >   hw/9pfs: Disable unsupported flags and features for Windows
> > >   hw/9pfs: Update the local fs driver to support Windows
> > >   hw/9pfs: Add Linux error number definition
> > >   hw/9pfs: Translate Windows errno to Linux value
> > >   fsdev: Disable proxy fs driver on Windows
> > >   hw/9pfs: Update synth fs driver for Windows
> > >   tests/qtest: virtio-9p-test: Adapt the case for win32
> > >   meson.build: Turn on virtfs for Windows
> > >
> >
> > With the latest 9p test case refactoring in the mainline, I will have
> > to cherry-pick the following 2 patches in this series, to v6 of
> > "tests/qtest: Enable running qtest on Windows" series [1], in order to
> > get qtest on Windows build successfully.
> >
> > [06/16] hw/9pfs: Add missing definitions for Windows
> > [15/16] tests/qtest: virtio-9p-test: Adapt the case for win32
> >
> > I will include the above 2 patches in the v6 qtest windows support series.
>
> No need to add those patches as they are already being queued separately. Just
> add appropriate tag(s) to the first patch:
>
> Based-on: <MESSAGE-ID>

Sure, but I really want to get the qtest windows support patch series
merged first.

I will disable the 9p test for Windows in my v6 then. We will enable
the 9p test later when it lands on the mainline.

>
> I already had a quick look on this version, will try to give feedback
> tomorrow.
>
> This feature won't make it into 7.2 release anyway, so patience please. ;-)
>
> Best regards,
> Christian Schoenebeck
>
> > [1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=321695

Regards,
Bin

