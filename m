Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA0E517C4A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 05:43:30 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nljRg-0006H6-OC
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 23:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nljQW-0005Vs-Rg
 for qemu-devel@nongnu.org; Mon, 02 May 2022 23:42:16 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:37234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nljQV-00080p-Bc
 for qemu-devel@nongnu.org; Mon, 02 May 2022 23:42:16 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f16645872fso167735847b3.4
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 20:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hkGUKVNzdWbXHc8n6HZf/YxWGnW4Qb/+vZ0Sbe4DoXI=;
 b=Tw0cly3zkoJ1O42o+ug+spo4IZIzcdBdpc9XvseXyW3+PszwbkbVLoARRsmpFLJkn6
 MVJGV9JFGmP5wZQ41PwNPsi/vrpl93Bam0cW/Vs9EcqC8aoJsaV+Mil3KfxFKUBvbGgQ
 r6Rit+WPzI41puO/f8Sx6BnAugfyzHssPVFnrCLcBz7cxats+39kRSWQFm909/DjZ+8L
 S2bp6xsh0NqBSoCeeDFue1QD/Grzi/T4QVJnSemc0lHPevdrHeLjrtyoKHhAawjvtT3r
 YC4GBoxST/DjvW7Qgofxzn8QKsxzve8YNJzF2StZwZ6C1IN1dkQG2C+UyZIAXOHaKH+0
 3SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hkGUKVNzdWbXHc8n6HZf/YxWGnW4Qb/+vZ0Sbe4DoXI=;
 b=nplNkVhTvji9uJrfCjoy3obRdNGpw+JgnrPwcUv/InCnSxmqq2mUde0xtshlt+l8Ym
 L5f+oa/Un+EYRHrLwD8nGwdh/vwiS+WCTeP2nosqzJ2Q6lrtYWVRBrLQ5cHelw3DH2SR
 aKOcxWW2Eb+BA0bP3z/Ts8fqkZGsI//WhbvZZnplHOwRxpba+RHR/z6i8yRUAvuJ7hnc
 vdRRhonSodcS+WtCtTru/7eJmAGVHpBcEr3f9R0yHDHgyZOicmGcV0HQVhU56feTOkfL
 M0qAOsDFtp7UXV63Lwc+hA/HJ9hb6p8VkdG6GtC+AZqvJdMqZF1mYMKER/zsZKTUi4ng
 4ZmQ==
X-Gm-Message-State: AOAM530+1gelJmI7Lbnz//AA4NJCoZBdBIki6iDrpYt8J2CAsVWYnB+5
 gMTMGkbOQIATncTSqgrSVFsKtzF+3u5nF8IQZ6Y=
X-Google-Smtp-Source: ABdhPJycOxpst9zOsXxAOXYTNlmJPgJ6ibx7GDX4QZohxXSfKs7Le1P3Rtx+RUrj8Jw48zlcLAFklyByivwYHwLc5vk=
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr13840843ywb.132.1651549333975; Mon, 02
 May 2022 20:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <CAEUhbmV6mDnkoKfzJMgs8PSrtTjQ9SnSE3XtgOuY3qaO+F7wJA@mail.gmail.com>
In-Reply-To: <CAEUhbmV6mDnkoKfzJMgs8PSrtTjQ9SnSE3XtgOuY3qaO+F7wJA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 3 May 2022 11:42:03 +0800
Message-ID: <CAEUhbmX7fww8qXrr50rKFWU+sf1pz=LDp8daKSWOvkeJVbjWhw@mail.gmail.com>
Subject: Re: [PATCH 0/9] 9pfs: Add 9pfs support for Windows host
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Guohuai Shi <guohuai.shi@windriver.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 26, 2022 at 9:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> +Mark
>
>
> On Mon, Apr 25, 2022 at 10:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > At present there is no Windows support for 9p file system.
> > This series adds initial Windows support for 9p file system.
> >
> > 'local' file system backend driver is supported on Windows,
> > including open, read, write, close, rename, remove, etc.
> > All security models are supported. The mapped (mapped-xattr)
> > security model is implemented using NTFS Alternate Data Stream
> > (ADS) so the 9p export path shall be on an NTFS partition.
> >
> > 'synth' backend driver is updated only to build sucessuflly
> > in a Windows build. Funtionalities are not tested as test
> > cases do not run on Windows at present.
> >
> > Example command line to test:
> >
> >   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
> >

Any comments to v1 before we send a v2 which will be rebased on master?

Regards,
Bin

