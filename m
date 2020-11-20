Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532242BAF6D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:59:34 +0100 (CET)
Received: from localhost ([::1]:48968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8ov-0003E7-Ay
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kg8fd-0003Ff-BJ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:49:57 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:34950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kg8fb-0004GG-Nu
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:49:57 -0500
Received: by mail-il1-f194.google.com with SMTP id t13so8952788ilp.2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:49:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KwA/L+PrOMbhRhJ5bSktHkkOnrzTAmlWuShef7k65Ps=;
 b=LKnOxZG+zl3+nN7X9WfIwQdK9ZHr1vbS6yPonPH9EcBnw6UF+jscuUUJ7QfoQwprP2
 tnPH+poSfCiTjWEVRdQtoDIevp3H08q/mr7r5srvBHF+qhJVB85QFu0L1iakap4qK/kp
 UlBMihskQp9TrILRkYoDNpc5WL4qg57xyElG9SOYcGIHXPyNutIRtCPcqsZnI1GWZHAW
 1V35CAgVsBtLPabuKnRKP1DOwk4eCcNvW3ePT6mgT42yWSsiEW9UKuYJN5QEziBIm287
 rOdRgIFRrsqMmec+YCupPKFM4YlDlU2UunP3I9NGZL4SkUJtphil08eLuKl7VKeDA1eK
 sMUg==
X-Gm-Message-State: AOAM5315wHl1k9Jfx+aa9BY9YqkLx5rGsqXTo256KI4JkohAWnDqOO80
 00qJKUbu1uxpVGq4Cw2ikR5wYTOPw2Y=
X-Google-Smtp-Source: ABdhPJwnxroYlemG2BEBtAg2VN0xNRcNduWy87pVoYNs1ceWOlXFx9aJXjcGl+b2s0EDxcwVo/fBQA==
X-Received: by 2002:a05:6e02:13a3:: with SMTP id
 h3mr5049455ilo.164.1605887392349; 
 Fri, 20 Nov 2020 07:49:52 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id i14sm2143680ilb.2.2020.11.20.07.49.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:49:52 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id d17so10378537ion.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:49:51 -0800 (PST)
X-Received: by 2002:a02:5b09:: with SMTP id g9mr18728270jab.89.1605887391682; 
 Fri, 20 Nov 2020 07:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-8-j@getutm.app>
 <abb6c2d9-d375-1963-e0a0-627636643860@amsat.org>
In-Reply-To: <abb6c2d9-d375-1963-e0a0-627636643860@amsat.org>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 20 Nov 2020 09:49:41 -0600
X-Gmail-Original-Message-ID: <CA+E+eSC0hj=hOhpLForn9KQw39-ZcOMRRG-D__iYDneqDOcZ3g@mail.gmail.com>
Message-ID: <CA+E+eSC0hj=hOhpLForn9KQw39-ZcOMRRG-D__iYDneqDOcZ3g@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] block: check availablity for preadv/pwritev on mac
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.194; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f194.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No, because if you build on a macOS 11 host but try to run it on macOS
10.15 then it will crash.

-j

On Fri, Nov 20, 2020 at 4:32 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 11/9/20 12:24 AM, Joelle van Dyne wrote:
> > macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configu=
re
> > will succeed with CONFIG_PREADV even when targeting a lower OS version.=
 We
> > therefore need to check at run time if we can actually use these APIs.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  block/file-posix.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index d83219df55..a9d69746a0 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1394,12 +1394,24 @@ static bool preadv_present =3D true;
> >  static ssize_t
> >  qemu_preadv(int fd, const struct iovec *iov, int nr_iov, off_t offset)
> >  {
> > +#ifdef CONFIG_DARWIN /* preadv introduced in macOS 11 */
> > +    if (!__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *))=
 {
>
> Can we change the CONFIG_PREADV ifdef'ry to run this check once
> on macOS 11?
>
> > +        preadv_present =3D false;
> > +        return -ENOSYS;
> > +    } else
> > +#endif
> >      return preadv(fd, iov, nr_iov, offset);
> >  }
> >
> >  static ssize_t
> >  qemu_pwritev(int fd, const struct iovec *iov, int nr_iov, off_t offset=
)
> >  {
> > +#ifdef CONFIG_DARWIN /* pwritev introduced in macOS 11 */
> > +    if (!__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *))=
 {
> > +        preadv_present =3D false;
> > +        return -ENOSYS;
> > +    } else
> > +#endif
> >      return pwritev(fd, iov, nr_iov, offset);
> >  }
> >
> >
>

