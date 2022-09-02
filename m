Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63E5AACF0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 12:58:35 +0200 (CEST)
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU4Ne-00078f-9Q
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 06:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU4LA-0004vh-Qe
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:56:00 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:45670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU4L8-0008SO-T5
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:56:00 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id jy14so1095983qvb.12
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=pQlVW0CeF2tD4vSeeLKvLQk2jUJgfzVKUrdy3OEjdtY=;
 b=jILKipNrhuFE3DUJVDwyQJ8L09u51rD5kBfUFC1Q0oMDBTvN3MD3tLu2JEH1Fk2Qkv
 91lM4BWeTjhSuyP5yeT2EVf4UlixkTFPchuqEd/3/ULrpA+yvm6jCGHDmnx1G1O3tn1B
 YBw4zFyt2Yxoaqpm2ponTGczU25KuxEGXHkoRicMEzDKXo1evstQH8fq5ZkuOIvpJIfw
 gVzhm/ONzIBanjf7XIY9t7lQwXKL8QGAHPRyZ4n7L64ENjaoqMa9E2NFyTNvHnPsLDQa
 xSiLRvHXYdX2FN2a6pA4nyQV+EWAkXDjweQnvCI30E3/QgyB2dcvnWDfmUYbRsUT6pH0
 /GtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=pQlVW0CeF2tD4vSeeLKvLQk2jUJgfzVKUrdy3OEjdtY=;
 b=K2wWVCoMdVBDphlN7YQ6xraddjibezH2HsF4vvplkn2YYcunlyK5nWoispGgJdTIhq
 sXyRSGYxzpgXFaZcoHB8+seRaoriaSUgAdE09jbz12fIYne8n+7qGc43X3ybinlcA8IS
 omXlNa6kaV+Pp3+47q2wuXBov1iCLYH92VBONS5VBhShKUXc2NJPoeMTT9SW/8aGnTyc
 WqRSyl3i52WynV994LJKaZoEKXg41dPJAkgNUoh3479Dw+WngdwjV7Ou4E5K1EVVeSXl
 /vwRCLAzpa+5wFOIBaGNw/DENmWMod5I1b9hrPSvNfhU6t5Fs4IDJpceqgM+G0LvN4Cy
 0+VA==
X-Gm-Message-State: ACgBeo2g7KmHXw3pQNvNkcIfcY6txhxhX9wgKhxQRwR6aMzdElIUfITq
 Xxauh3v+KcWPdPfeQrqlJhQiIm7EjI32Q5PAtAf7jshh
X-Google-Smtp-Source: AA6agR5OmBa9wwCisvPIKKXBy1C8bhkPaeQMBAzHkt7VG1k9T+SrTw2OIVQ8Onf9E+cE1yf6O4qdWFv9SQJRTZoFp/k=
X-Received: by 2002:a05:6214:ca1:b0:498:f96d:4a8c with SMTP id
 s1-20020a0562140ca100b00498f96d4a8cmr25017235qvs.51.1662116157854; Fri, 02
 Sep 2022 03:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220713124357.247817-1-pbonzini@redhat.com>
 <CAEUhbmVWdAF2fO1E6YAJYQOaC_4dog7TkHdyJwqMAmEzrST8UQ@mail.gmail.com>
 <CAA8xKjW9fCtiS3Zgvh6W6sBOiCz_OJxL1G-bABez-2oMQCd=yw@mail.gmail.com>
In-Reply-To: <CAA8xKjW9fCtiS3Zgvh6W6sBOiCz_OJxL1G-bABez-2oMQCd=yw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 18:55:47 +0800
Message-ID: <CAEUhbmVHMV+NLkoweWLkx554SxXSnwvU=os_YrX0UStfiwUcqQ@mail.gmail.com>
Subject: Re: [PATCH] scsi/lsi53c895a: really fix use-after-free in
 lsi_do_msgout (CVE-2022-0216)
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2e.google.com
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

Hi Mauro,

On Fri, Sep 2, 2022 at 6:44 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> Hi Bin,
>
> On Fri, Sep 2, 2022 at 3:56 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 13, 2022 at 8:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >
> > > From: Mauro Matteo Cascella <mcascell@redhat.com>
> > >
> > > Set current_req to NULL, not current_req->req, to prevent reusing a free'd
> > > buffer in case of repeated SCSI cancel requests.  Also apply the fix to
> > > CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cancel
> > > the request.
> > >
> > > Thanks to Alexander Bulekov for providing a reproducer.
> > >
> > > Fixes: CVE-2022-0216
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> > > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > > Tested-by: Alexander Bulekov <alxndr@bu.edu>
> > > Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >         Adjust the patch from v1 to v2 since the changes crossed
> > >         with the pull request.
> > >
> > >  hw/scsi/lsi53c895a.c               |  3 +-
> > >  tests/qtest/fuzz-lsi53c895a-test.c | 71 ++++++++++++++++++++++++++++++
> > >  2 files changed, 73 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> > > index 99ea42d49b..ad5f5e5f39 100644
> > > --- a/hw/scsi/lsi53c895a.c
> > > +++ b/hw/scsi/lsi53c895a.c
> > > @@ -1030,7 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
> > >              trace_lsi_do_msgout_abort(current_tag);
> > >              if (current_req && current_req->req) {
> > >                  scsi_req_cancel(current_req->req);
> > > -                current_req->req = NULL;
> > > +                current_req = NULL;
> > >              }
> > >              lsi_disconnect(s);
> > >              break;
> > > @@ -1056,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
> > >              /* clear the current I/O process */
> > >              if (s->current) {
> > >                  scsi_req_cancel(s->current->req);
> > > +                current_req = NULL;
> > >              }
> > >
> > >              /* As the current implemented devices scsi_disk and scsi_generic
> > > diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> > > index 2e8e67859e..6872c70d3a 100644
> > > --- a/tests/qtest/fuzz-lsi53c895a-test.c
> > > +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> > > @@ -8,6 +8,74 @@
> > >  #include "qemu/osdep.h"
> > >  #include "libqtest.h"
> > >
> > > +/*
> > > + * This used to trigger a UAF in lsi_do_msgout()
> > > + * https://gitlab.com/qemu-project/qemu/-/issues/972
> > > + */
> > > +static void test_lsi_do_msgout_cancel_req(void)
> > > +{
> > > +    QTestState *s;
> > > +
> > > +    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
> >
> > This test does not run on machines with small size memory. Is 4G a
> > must have for this test?
>
> 4G comes from [1], I don't think it's a must have. Would 2G be okay?

2G is much better. My machine has 8G memory and 4G fails sometimes.

> For some reason ASAN does not trigger the UAF when I run the test
> locally with less than 2G (1.7G to be precise). I didn't really
> investigate why that is the case.
>
> [1] https://gitlab.com/qemu-project/qemu/-/issues/972#note_1019851430.
>

Regards,
Bin

