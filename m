Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244632D89B7
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 20:31:18 +0100 (CET)
Received: from localhost ([::1]:36540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koAbs-0004r2-O4
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 14:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ko9c3-0004Q1-3Z; Sat, 12 Dec 2020 13:27:23 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ko9bu-00051L-Fo; Sat, 12 Dec 2020 13:27:19 -0500
Received: by mail-yb1-f193.google.com with SMTP id o144so10855314ybc.0;
 Sat, 12 Dec 2020 10:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SGxLZprnZ9I9eN6E8C93gAmx4qCCNevo43IarZetRkY=;
 b=RUJG4Eh0o/0yQS+wRB9G9NZ0Fs1DTGGOp+93V6YfnfG+i40e8AmcYBdoZrP8aWZHqs
 UA49JhNNPLWh3ZJE8jTHJ/h7cN0cTRFyQXjddVTUH8FF69G+su7Vk4LOeJhOCA3q91+g
 h7WC1shfprsJn7VH2S//7amTncq3zntMSYjxiY68zwP8Tn0YK+RQVht6uXcbLa1+otNJ
 FR7mfmppy+8sEZ7PDJw9WEdsOaqaTe9QRcyfU5QU9jrlSopHtCIJKuHtO6PW3/GUirQV
 NY2Pvh/Hei1++SvEGDMC5vdSTjboyHrnkZhB7KTEQuZYQ4CDSXXTLZFOgDHIOYPyPq4p
 AOSQ==
X-Gm-Message-State: AOAM533nfN37bmXKcXq6ddfrShGdQ+XsnPZoRIU+lJs3wg1Fx32DKbyj
 wUDBomCKc0JkSi7ND9BQi62ZVRYSyrS/66+E7sBrs7wl9os=
X-Google-Smtp-Source: ABdhPJyaWMr9iZLHmrwE2HeCkk20ZEfA+/aYnIvHXT7icD/PVF1wrWQJ7CWacKMHfI0H7DX4DDZkqKsIt1k+9mJ+zWM=
X-Received: by 2002:a4a:9cc7:: with SMTP id d7mr14405359ook.8.1607795830665;
 Sat, 12 Dec 2020 09:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20201009064449.2336-1-zhaolichang@huawei.com>
 <20201009064449.2336-9-zhaolichang@huawei.com>
 <f790ec0a-1f0d-90fd-f597-20fddad9a60c@vivier.eu>
In-Reply-To: <f790ec0a-1f0d-90fd-f597-20fddad9a60c@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 12 Dec 2020 18:56:59 +0100
Message-ID: <CAAdtpL4dxKYxu=W3zboCaOuAiJeiV1SzOnPXXLxtoX_BkW7sow@mail.gmail.com>
Subject: Re: [PATCH V2 08/14] m68k/: fix some comment spelling errors
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.193;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f193.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 David Edmondson <david.edmondson@oracle.com>,
 zhaolichang <zhaolichang@huawei.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On Sat, Dec 12, 2020 at 6:11 PM Laurent Vivier <laurent@vivier.eu> wrote:
> Le 09/10/2020 =C3=A0 08:44, zhaolichang a =C3=A9crit :
> > I found that there are many spelling errors in the comments of qemu/tar=
get/m68k.
> > I used spellcheck to check the spelling errors and found some errors in=
 the folder.
> >
> > Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> > Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> > Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>

Do you mind replacing this line by:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks,

Phil.

> > Reviewed-by: Laurent Vivier<laurent@vivier.eu>
> > ---
> >  target/m68k/translate.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
>
> Applied to my m68k-for-6.0 branch
>
> Thanks,
> Laurent
>

