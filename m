Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6245C2EB4C0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 22:15:09 +0100 (CET)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwtfY-0006pd-FB
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 16:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtel-0006Kp-VA; Tue, 05 Jan 2021 16:14:20 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:42155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtej-0006Lu-Cz; Tue, 05 Jan 2021 16:14:19 -0500
Received: by mail-io1-xd2f.google.com with SMTP id q137so687282iod.9;
 Tue, 05 Jan 2021 13:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u8bkEcY9B5zzzhLfsnMK2fEzrzmbzsGtE4FqWt5aNoU=;
 b=unE+eRnJNp3LNmBfhxnb5DPIXBPBfuJqyoHVJlyZeBoWS704y/llHmEsboa8Ii/Nlh
 Rq++4+NzcMpTyWnLl0o+kFeRpzdY88zR2tCOQ2CnEkncyK9tXitAx0tnWV9P6XFy6wLb
 Ue0fAfoHq9jtObA5e1XZ1WWP3zeAL0utUkSSzTVryTBFKqGC7fEk+cuo0ocpKsYRe2vJ
 /MVe+s/dXP+0Qn+jbSe43+4cXV+AZhbNYP3CxI5KeK2KPEclsVH562NOjJyjxIOy1vyS
 +LqfJ7J9MkamKpb4h/B/+MUY6wJGlI+ghU2dfq2gP+kAngsAujc5XIS1ONjS3It3wZ49
 lyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u8bkEcY9B5zzzhLfsnMK2fEzrzmbzsGtE4FqWt5aNoU=;
 b=YwXAY8tv+wQUpIbJLA3rVNWZafEz+YleYYKZFRIyz1/2Uy+c5lzDdLClSiqzcd85n7
 f8WZEoFWn+KNfgn/32zI5xx71nZ8qCGnTRhs+l9vH5AEuWFot28Tz0UJGBLM7OKfewVP
 xPizjaQVj3zmH96ilafgb4UQXDjLQgVRb9ZfpDQhxDjy8EXzgf1WIFG0Y4lyyKdAw84K
 yhrx3xwt8ekvEmU0u28u3LD6zPGB/CJs1WkYOcioI75XZo01J9KarZrSaUHbm6BbopBD
 jqtEM8JoYytndOjaS8E76Ftnkd8b7Uy8krnv/1Gqe0qALZWsURsoEDNWqQAXmpc8CdVW
 I3dw==
X-Gm-Message-State: AOAM530X2RcZyYDNSXE+wfWWkMNAG8chJ9yqBfWikCLTt+wQCGY9qXy0
 XH3u5qZABLJv1QWtLrL3maHYdbOKlvI/4tsD9Xk=
X-Google-Smtp-Source: ABdhPJzyucAK3OVTN5A0rZ4pg5/R/Upe36eX3vqVi2vmsCytj7u3kdzIP92slyjgnJS7FQjpBfrtCz14Y0bH9OlMnYM=
X-Received: by 2002:a5e:9242:: with SMTP id z2mr746654iop.175.1609881255612;
 Tue, 05 Jan 2021 13:14:15 -0800 (PST)
MIME-Version: 1.0
References: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmVU=f_tfJFMcCErnY+qS00QLoKVGcezoVc-WoaTtB1eBQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVU=f_tfJFMcCErnY+qS00QLoKVGcezoVc-WoaTtB1eBQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2021 13:13:49 -0800
Message-ID: <CAKmqyKMT83hV=DpFkZGRNTZMGnOMUHc+=px3omJWDb+BhFB-0w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 4, 2021 at 7:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Dec 23, 2020 at 10:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > When write is disabled, the write to flash should be avoided
> > in flash_write8().
> >
> > Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash devic=
e")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> >
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - new patch: honor write enable flag in flash write
> >
> >  hw/block/m25p80.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Ping?

Thanks!

Applied to riscv-to-apply.next

Alistair

>

