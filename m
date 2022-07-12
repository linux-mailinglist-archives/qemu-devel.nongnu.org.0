Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AF8571217
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:05:18 +0200 (CEST)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB91I-0004jv-JM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB8vj-0001tn-Qi; Tue, 12 Jul 2022 01:59:32 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB8vi-00024K-CS; Tue, 12 Jul 2022 01:59:31 -0400
Received: by mail-yb1-xb31.google.com with SMTP id f73so12237269yba.10;
 Mon, 11 Jul 2022 22:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=47JNRolWrIht0cHsh+Xb5ts5RE1GzkrYtpgH3Hrmo2o=;
 b=CL9t8yxwD93+mhqvThtPb2UXBHwRwJ+3LYciGPH9Zd+cKHKfVmEm4netkpIiWZV67n
 TJIntq8eNlEh39IXLOIdd6qHUu8oecB9iP1zfPlGZjBFMFNhJXq2Ol6mQnpP2LzADFjn
 cM7IJ5CpMaVUuaFuPgkuLaW1kvh7z/LpOo3eOlPpOW/ar6X0TQrD7wrqdHkUnot/YxSS
 lQYodeLaPLb8nznYPD2Sg1xuW/Q57y9N5FECqvbbu3iR0TaKvGUK+RmpAzSQ+DF1BYki
 oiDnHdNABKOA8Wriy0W1gihwjgWuaAVT6dbU8Hwwax9sjMB2/Vrj5oZc20qnO8UcJ4WD
 dspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=47JNRolWrIht0cHsh+Xb5ts5RE1GzkrYtpgH3Hrmo2o=;
 b=FZcDLBt+Oaa56MtEow+PDoXSnwif8tOSVBfetDUxdJFibNx+Q4inIYI+vUJvnhBNt6
 S0KCICOpxs2c0x4fOQJdH0xr66y2A84chrU9RGYmeccTS1B4oNdK+2TBqpjoEr3j1xpE
 bMwR8sa4aFUfQTReZluNWoQ8Ej7Sq1J4t2yAGxOXwAt8xeU/IoPUQBMYLJw90DvYwAqe
 nfZtiC5zFpS05OJ3IuxLm1K9PZamBLrYAwJSX5L2Osmn0GQr9wsyxL8Rvc9XsN0DgPFg
 NwdcIwboe23z3PpeuPmhk99oRCiYbD1FuEId7vf5g3AfPCW+r7AwkF0JSsKwROqt2qFi
 E//Q==
X-Gm-Message-State: AJIora8eBs3TPo1PpONeCnBCmTmVmUIgMzwe7m6DRJT4Mu29v+P3Rvdz
 aL3I/rYy5BiODEzNRGNcCi2GdKcnWcXgMxVR6D0=
X-Google-Smtp-Source: AGRyM1tlHM+HtMhfeKQhC2ToiJtqLN1bO0gWiiX423T36uAazT97ShdfgppzbQ+nPuWfCvpFkdpSLlVuxeTt2XVU/LA=
X-Received: by 2002:a25:abd1:0:b0:66e:da0f:3800 with SMTP id
 v75-20020a25abd1000000b0066eda0f3800mr19574062ybi.213.1657605568946; Mon, 11
 Jul 2022 22:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <87pmiaubjz.fsf@pond.sub.org>
In-Reply-To: <87pmiaubjz.fsf@pond.sub.org>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 12 Jul 2022 13:59:32 +0800
Message-ID: <CAAAx-8LNouyevjpbkC4yrQ+twfx+7-XvTzJ+3fkZ19xmm8g=8A@mail.gmail.com>
Subject: Re: [RFC v4 0/9] Add support for zoned device
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb31.google.com
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

Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=BA=8C 13:47=E5=86=99=E9=81=93=EF=BC=9A
>
> Sam Li <faithilikerun@gmail.com> writes:
>
> > This patch series adds support for zoned device to virtio-blk emulation=
. Zoned
> > Storage can support sequential writes, which reduces write amplificatio=
n in SSD,
> > leading to higher write throughput and increased capacity.
>
> Forgive me if this has already been discussed, or is explained deeper in
> the patch series...
>
> The commit message sounds like you're extending virtio-blk to optionally
> emulate zoned storage.  Correct?

Yes! The main purpose is to emulate zoned storage only for the zoned
device files. Right now, QEMU sees those as regular block devices.

> PATCH 1 adds a new block block device driver 'zoned_host_device', and
> PATCH 9 exposes it in QAPI.  This is for passing through a zoned host
> device, correct?

Yes! It allows the guest os see zoned host device. It is still in
development. Maybe the implementations will change later.


Best regards,
Sam

