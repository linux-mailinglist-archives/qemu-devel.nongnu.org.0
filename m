Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32155EDBB6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:25:25 +0200 (CEST)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVBs-0004X4-Un
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odTpB-0004Oo-D6
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:57:54 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odTp9-0005zB-Fm
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:57:52 -0400
Received: by mail-qt1-x833.google.com with SMTP id ay9so7635838qtb.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ohCt+6UM2hyIqf3vdtxJsQlrQcmke11T0U8WDNXHpmQ=;
 b=B0vk4j9uYvJY6tg6xYVdQZI2cJVA+PB+KbeGV2pKsRlieyxcRQl+p71mtJQBIUr+Z+
 OV6zjfIG9oPQcZWZM+ShEU0eeqNmCNaBgm1hh5leE2KahekG5HwQ1Vt7DNksEf7K3h74
 p1AIXNg3bz8LTCUv2PfdrLLamO6qdY71mAUmn29YFlQzB6VhrwHA66UE4Oy2Q8Ly1OJO
 /cBAOFa7U/oug5sGUWZ2kIvFkl6C6re2/0N/zFYhjGheEepi/3wScPIs+95vKxsoRTDD
 Txfa4i3vaZV22lk6LUQrKpBMgiC/m0Jli2vlnyWNT17mzeuA7EATrRMVQR2sp5+BQiHk
 q20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ohCt+6UM2hyIqf3vdtxJsQlrQcmke11T0U8WDNXHpmQ=;
 b=M8ZHYVqyriVlZqOLDSx7pOysMfoVCvsH4XqihsefUHbbgjL4WqGHAv4sE+v+p24FEm
 cFPvMyIUvMVClHn6zFslVoFdH5vMnT4T2fiPEWsklXH5YfJsaFasbblYHZsIXRhJnKmZ
 MoFIB+xKk8MEaKUDDfubzVRdgGAC1KY0b3Vr1P5L0bt/YZZhuQA+aI6p9QElc4Djmd6H
 PQ7iEZr8S8HL3916beY6sRGf6LzzQALcS/H9xZmBCiEokvsKuMtFdsaZQd4el3ci3xsq
 Jrl/wWAj6gzmt0w5gvutqect8UGBMKM7ToUrg2a5skO7xvlYw9f23EKNipVxKtwJo54O
 YdDw==
X-Gm-Message-State: ACrzQf0FP+oDstmbtdUa0ioBpCNxMusqbQihobmIIBdxTu75+3IZVhoV
 25DCqd0vWxMQnz0wNh761RWdPdmJs8J0WaTtN0E=
X-Google-Smtp-Source: AMsMyM4r6a3nzcpvwL1Vu4rdBTajZe0318P+hQk/HhjZJWFEzeLwFInUiDlP17aul1dzUeBo8Bd57lXluXcO7xhOWeQ=
X-Received: by 2002:a05:622a:92:b0:35d:58bc:4a4a with SMTP id
 o18-20020a05622a009200b0035d58bc4a4amr472617qtw.391.1664359070379; Wed, 28
 Sep 2022 02:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-36-bmeng.cn@gmail.com>
 <8b15887b-686f-3b59-ce2a-899c22b53458@redhat.com>
In-Reply-To: <8b15887b-686f-3b59-ce2a-899c22b53458@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Sep 2022 17:57:39 +0800
Message-ID: <CAEUhbmWLMfLGJvH+aMV-w0mBaH16vp+2Foxj1Mm-xGMhmg86gw@mail.gmail.com>
Subject: Re: [PATCH v4 35/54] tests/qtest: libqtest: Install signal handler
 via signal()
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x833.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 5:43 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/09/2022 13.06, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present the codes uses sigaction() to install signal handler with
> > a flag SA_RESETHAND. Such usage can be covered by the signal() API
> > that is a simplified interface to the general sigaction() facility.
> >
> > Update to use signal() to install the signal handler, as it is
> > available on Windows which we are going to support.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >
> > (no changes since v1)
> >
> >   tests/qtest/libqtest.c | 14 +++-----------
> >   1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 269d622fe3..f0ac467903 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -66,7 +66,7 @@ struct QTestState
> >   };
> >
> >   static GHookList abrt_hooks;
> > -static struct sigaction sigact_old;
> > +static sighandler_t sighandler_old;
>
> This seems to break compilation on NetBSD (which you can test via "make
> vm-build-netbsd" on a Linux KVM host):

Oops, so this means this test is not covered by GitLab CI ...

>
>
> ../src/tests/qtest/libqtest.c:86:8: error: unknown type name 'sighandler_=
t'
>   static sighandler_t sighandler_old;
>          ^~~~~~~~~~~~
>

Regards,
Bin

