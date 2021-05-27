Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B139273D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 08:15:16 +0200 (CEST)
Received: from localhost ([::1]:53350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm9IY-00087P-7r
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 02:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lm9H1-0007Qy-EW
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:13:39 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lm9Gx-0001Nt-6g
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:13:39 -0400
Received: by mail-yb1-xb35.google.com with SMTP id f84so5608717ybg.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 23:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lQpcT/loIQDhT2OEB6MyKgpHVnCRgrrnL+NIxeRlZBU=;
 b=PXn1QPCQTDbS4MZqfamIAjv9YL47RwJ/5B3nkLLCN3MHVAic/cFA07bBFtIPyy34gK
 8hqyDJ0TryJ5DCxcITInX5ww8254GkzsEiFPUAhId5x5kA0EtZ79xpYHPZiMijClv2ii
 HApB2d1aD/tORooCF101YAVHC1fYN5kZhzOOuT7q81BNyIRKFwiTj9yPeChZeJZ6w4FU
 SejBP8n5VLIF7zyBL8OA1hvXSsGVaPPYWhrF4XJbT3QZ9wQc62F8WounG3TsjNOi5Qxm
 q6jInMKwPBq9+nInLX8lh+2VerIEZxc+/GUzRFZG9a43+PHQvxQiwoKBtgX6Q654c51x
 ozDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lQpcT/loIQDhT2OEB6MyKgpHVnCRgrrnL+NIxeRlZBU=;
 b=chXlyipoS84rNY6FekUdtYR1kytCrmrx+NXs+ShsKDx13NPs1wsS1VpYwpc+oeYwsh
 IQ9+EG5urv0uAYvKYYNZodYk7173dL5OK3GQ9D1FU7nKHYKNsdaiGdILUG0EXwxmrINr
 KJN5uo+9Fa2ZZxY45WEWIaq70iPsYfpetn/XvOd8sYENtfeLm2INNrHenW2W51CQKm5J
 tyliOeTTpv+1+P3VhqDr56pqKLa8Uu36d7CoG8Gr7wp9V0ROnEw37rMZrZrfHxbtDp32
 RFk1lbc9D82PJfOQFdjA2cNlxD8GEFIJE6HQuAio6TJj9chYRRRU4IP2XaPGkN6FSGRs
 v8hw==
X-Gm-Message-State: AOAM533T3Zj31DBMkFkgq/BZ4fkpjk/XpCi7v1DCfR36drv+U68zjHfW
 62OY23NDdd5j0tzFmRCQs6jfPBrSiQwQNfHLjXU=
X-Google-Smtp-Source: ABdhPJwhl0C0cNRK2W8j3Hyv6enPQ0oHEbdgWi/AtLclXvZk6tLB3m4kvS1b492h5bwiPQ4JB1wtcQkPeW9CGY8nrLY=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr2470226ybu.332.1622096014231; 
 Wed, 26 May 2021 23:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 27 May 2021 14:13:23 +0800
Message-ID: <CAEUhbmW2dHstLd6gE43gdyBr+xpoGXjZSuh+6fwKwtSrQjmuWg@mail.gmail.com>
Subject: Re: [PULL V2 0/3] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On Thu, May 27, 2021 at 12:24 PM Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 4f8a39494aded9f2026a26b137378ea2ee3d5338:
>
>   tap-bsd: Remove special casing for older OpenBSD releases (2021-05-27 11:03:55 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------
> Brad Smith (1):
>       tap-bsd: Remove special casing for older OpenBSD releases
>
> Guenter Roeck (1):
>       hw/net/imx_fec: return 0xffff when accessing non-existing PHY
>
> Laurent Vivier (1):
>       virtio-net: failover: add missing remove_migration_state_change_notifier()
>
>  hw/net/imx_fec.c    | 8 +++-----
>  hw/net/trace-events | 2 ++
>  hw/net/virtio-net.c | 1 +
>  net/tap-bsd.c       | 8 --------
>  4 files changed, 6 insertions(+), 13 deletions(-)

What happened to patch 5-12 in the following series?
http://patchwork.ozlabs.org/project/qemu-devel/cover/20210317062638.72626-1-bmeng.cn@gmail.com/

Regards,
Bin

