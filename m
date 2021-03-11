Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7A336A67
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:08:17 +0100 (CET)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBgO-0003Ai-Cl
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdf-0001O5-HV; Wed, 10 Mar 2021 22:05:29 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdZ-0004k2-T3; Wed, 10 Mar 2021 22:05:27 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id d9so20236867ybq.1;
 Wed, 10 Mar 2021 19:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TLYb2zRwKk+OSCvIzjenf6XIMBbN8EUMsr0l1Uy0tLo=;
 b=hteU/85jGioeYtjDl94PZOVYwYNJ9CAh9dhQD/7YyOe8quTpMwo0wggQdii603awXq
 k6PUhfNZVkBBr/yyMfmUgrbe0aVal2SSfj350OAYoP20rXHvWuxWesREs7u4vuO7dQUn
 VzfwFnEgt1GVYe5ESlyB16Xq7gzqzlh3gdHSxFxgWTSCP4LfY5K38EnwnKp2IjupE7i6
 GKd+KAbVWleklOe9D6SgaQdJNwHOCf4H+BnqH88t+ptzbU3EZazxhVhMSagk9yY+nfZw
 r7RnJHJVJqa/U2Ts/hhf2gOJrd8sh+CQWPvpuYnSmgDRq0WVvlchXgBg6DNC0Th8evc/
 1Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TLYb2zRwKk+OSCvIzjenf6XIMBbN8EUMsr0l1Uy0tLo=;
 b=rMyRIxyN+2824s5F2vQiKYrmW8hqOS2Tn7Sw59jnWLKJPY0t7G083EmQOA3cj6BGym
 FtJFbkwMZow54nVq4J+U1qbH4IoSaUgVE8yyTjJXUROoOJDy7lDC6vdw9ACIecuuD9yc
 gxFfGjXCgxXjxphCxmocGVsfDvorQrjwbycVkgQK4FCQ6RUT3O2menc2y3HLuS5wJb+P
 ZMImaLN+sUFrQy4rs1wVBMbheedFNdGj+q/e0Qd4gkYzAtv9canZLB+bXoKZ/8e+Y5m7
 un7afUgm113O7drFOVw7iI+25Ag9F4bBt+85Csytk/wHMEeEC9i4wYKC8Zm6WpYpDtl5
 utHA==
X-Gm-Message-State: AOAM533ixzmhnTATFHkOIqi3uqehjEHiKJbUEDItSIr8VfIEGqQKfokq
 nNtAMrtKCvKym+t5laXy9FRbsyDNFneI06ypkGs=
X-Google-Smtp-Source: ABdhPJzUkYvPr25/2sgpSoZ7SdPyDJh2zzuPaI+TYTcuVL+oTpqe70/7jgxXVZFIaCr33bCeaacVAunueHdUPcggxIE=
X-Received: by 2002:a25:8712:: with SMTP id a18mr8819598ybl.306.1615431919832; 
 Wed, 10 Mar 2021 19:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-9-philmd@redhat.com>
In-Reply-To: <20210310170528.1184868-9-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 11:05:07 +0800
Message-ID: <CAEUhbmX78qmsOFNa-UZq5UB6CQQKB8U-VkAD_QBfocipUDsS-Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] hw/block/pflash_cfi02: Add DeviceReset method
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 1:22 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

