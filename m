Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC155BFCE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:37:06 +0200 (CEST)
Received: from localhost ([::1]:40172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67ea-0001Tp-Ui
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o67cY-0008GL-Bw; Tue, 28 Jun 2022 05:34:58 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o67cW-0007Ur-QO; Tue, 28 Jun 2022 05:34:58 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ef5380669cso110519397b3.9; 
 Tue, 28 Jun 2022 02:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EzxpaQz7bxIUmNeE87P52neE+w9xvYN22Zxnp8GO8I0=;
 b=SH8el+TNEhy2nRDnfF9F7Nx4Ax5WKt0laITHjkdqfUQao79wxUmw21vMS795itDfCq
 x6nQngnftKpS39EQMGxcgTBeJW4UkqN+W9WhFP/K+/PqWX9FrhuhO+rAPkmatjEvQ4T/
 tZI9E0e+t+JCc4SCD2okv0UQUA1g7g2LA2JTrIKfbQc0ebDs2itaOvRuVHONAiaryiya
 WBKXm3tiI+pzmUnjxWlqmBv1nYclV8XXF/R3mIm1zDZFsF2DLqRa8IPShSv3FL+srqPj
 uRMJGFlIkap2cSd2Iq2JjyfRvrb9bazPClknJjIQxukGe3DfIg2hDWdA/AqNOHOTU49k
 1xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EzxpaQz7bxIUmNeE87P52neE+w9xvYN22Zxnp8GO8I0=;
 b=dzJloYMd3Og5RpdmZGFXvyYoCt/Su50Xb9x0aQPbnPfKCtxGaFWCtyUKy3hu7cq3XJ
 E911Zjyl1b6Dq4+Qny9A4EI9/HsWNkj4Gz/jCqsG3I8jIvMnb/5+xJpw/OtPKt39WVGG
 FDKsVk/LFR8+NHQzBvtg/66WZNZTvi4mZr8F4MMngdbxGhN/VgKdSQlchBrc/vLT/uC0
 h6D7mUYt4wSOEnbKr0I+AcsrZ39VAI9BYcS/uOlc3bYrKM1TTysEaUgzya4yU/JWWZlE
 LicDkNlhTaF7lDigQKfpQKUnT1mCQ20PFlSiwD6U3QExYktvpELa9KkUMGFBItoNxfGr
 xknQ==
X-Gm-Message-State: AJIora+rbbDhIPGNpoGtx+N7CbgCaOuwN/bW4MvfsgEozztMCHkpka4A
 B3z8Ucod+Jat+VJXVTpA6DTzWep+SAO/fLO2Q2k=
X-Google-Smtp-Source: AGRyM1vEYm9qfHZOUk7oSvXSVeTWZcWK+na1zGDlDQzxYsXDxoC2FV4onvXyuHHW1iFUb/zpM5O4NRfMgnN9sKUVbcw=
X-Received: by 2002:a81:c4c:0:b0:317:cba2:a610 with SMTP id
 73-20020a810c4c000000b00317cba2a610mr21025570ywm.147.1656408894350; Tue, 28
 Jun 2022 02:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-6-faithilikerun@gmail.com>
 <Yrq5j3TQs8crLRVn@stefanha-x1.localdomain>
In-Reply-To: <Yrq5j3TQs8crLRVn@stefanha-x1.localdomain>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 28 Jun 2022 17:34:43 +0800
Message-ID: <CAAAx-8JTDjSUw+AAnp5mc2TUoX8GS85sE--BqyBMEsgbG0fGQw@mail.gmail.com>
Subject: Re: [RFC v3 5/5] qemu-iotests: add zone operation tests.
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1130.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 16:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jun 27, 2022 at 08:19:17AM +0800, Sam Li wrote:
> > diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tes=
ts/zoned.sh
> > new file mode 100755
> > index 0000000000..262c0b5427
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/zoned.sh
> > @@ -0,0 +1,49 @@
> > +#!/usr/bin/env bash
> > +#
> > +# Test zone management operations.
> > +#
> > +
> > +QEMU_IO=3D"build/qemu-io"
> > +IMG=3D"--image-opts driver=3Dzoned_host_device,filename=3D/dev/nullb0"
> > +QEMU_IO_OPTIONS=3D$QEMU_IO_OPTIONS_NO_FMT
> > +
> > +echo "Testing a null_blk device"
> > +echo "Simple cases: if the operations work"
> > +sudo modprobe null_blk nr_devices=3D1 zoned=3D1
>
> Please use bash's "trap" command to remove null_blk on exit. That way
> cleanup happens whether the script exits successfully or not. See
> tests/qemu-iotests/108 for an example.

Noted. Should I just include "rmmod null_blk" in _cleanup()? I'm a
little confused about the normal way to write qemu-iotests.

>
> > +# success, all done
> > +sudo rmmod null_blk
> > +echo "*** done"
> > +#rm -f $seq.full
>
> Why is this commented out?
I should just remove it. seq is not used.

