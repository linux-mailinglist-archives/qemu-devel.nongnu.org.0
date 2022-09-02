Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF745AACC0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 12:49:30 +0200 (CEST)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU4Er-0006nn-AI
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 06:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oU4AI-0004GS-Rj
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oU4AF-0005Wl-9p
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662115481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D6Frd5KnjcYfRxMD+IcdtOgERC4ckxlK7QvjxIauKNM=;
 b=ETE6iGLP/6Gt+lTyEL8IPj5VTfL7zyybp2BJTaS2sNYoByNf4518GMaJ3/YdgZXSh0rw1J
 CSSInbPEirLUAGivnDMC2eWVDoSAmYD2hOGvmzZf+Ar6wefAhQv50eXJZ5qTxy0dgQQ3mL
 odgm8TI8JC1mhHwt5/nkqEhYMTHti9g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-Z5My3TFHNvylVnPLAJ67zA-1; Fri, 02 Sep 2022 06:44:38 -0400
X-MC-Unique: Z5My3TFHNvylVnPLAJ67zA-1
Received: by mail-qk1-f198.google.com with SMTP id
 g6-20020a05620a40c600b006bbdeb0b1f2so1584968qko.22
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 03:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=D6Frd5KnjcYfRxMD+IcdtOgERC4ckxlK7QvjxIauKNM=;
 b=q/cICI+cXfiLm7zTlS4z2xw1QbQKyOMoWX+8CBNNZGMVJf5Ujvc+7ASvmUqX3SpprI
 nFZQMooD7WQPKVTt72DTcn6+LfLwEMTijSsCiA9JGu5TD4R81Qx10ohFzIg2wGSno+L/
 IA/CI+f/1Yf3IWVmKDcmAyqQfvd+T+wDWz7a4r1jndfr+se9xIy/DSqSxkB9G10ogfCA
 JKE4nQ19oyui6AAfMnfwU0gPacrEShLmvb3ZeZTP0v+4FlmZipKHkBUOoxivNSPK226x
 XJA1qFxzjhFqmq/1q1TgOG7BA3XB28q14Nsp05ye96XD+oEK+nnTa80t7taYmMh1p0na
 OjxQ==
X-Gm-Message-State: ACgBeo3WZlLvbzn4R3TFaxkl+e+d9EDP8WVK65pMAwHRriLGYXzS89tQ
 JzHkwgnUxjswfphOctsrZF6z9ImoJMsVegoKu9fOGhET2VTb29X/dWLQ4lR9Cwn4AurzAcy5p6f
 6Wi/W5YXovdd3HMjlZUA27LyKB7R0iwQ=
X-Received: by 2002:a05:620a:4251:b0:6be:7b31:2275 with SMTP id
 w17-20020a05620a425100b006be7b312275mr18726981qko.604.1662115478109; 
 Fri, 02 Sep 2022 03:44:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7wPR29/JUu7yAW8pvdgUzFmAMLW8NJGXAmef4Hc3yTLpCGa+Xan4o3VT42uM+rM8cqZQPWFgJYxcltDwXzqaI=
X-Received: by 2002:a05:620a:4251:b0:6be:7b31:2275 with SMTP id
 w17-20020a05620a425100b006be7b312275mr18726971qko.604.1662115477866; Fri, 02
 Sep 2022 03:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220713124357.247817-1-pbonzini@redhat.com>
 <CAEUhbmVWdAF2fO1E6YAJYQOaC_4dog7TkHdyJwqMAmEzrST8UQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVWdAF2fO1E6YAJYQOaC_4dog7TkHdyJwqMAmEzrST8UQ@mail.gmail.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 2 Sep 2022 12:44:27 +0200
Message-ID: <CAA8xKjW9fCtiS3Zgvh6W6sBOiCz_OJxL1G-bABez-2oMQCd=yw@mail.gmail.com>
Subject: Re: [PATCH] scsi/lsi53c895a: really fix use-after-free in
 lsi_do_msgout (CVE-2022-0216)
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Bin,

On Fri, Sep 2, 2022 at 3:56 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Wed, Jul 13, 2022 at 8:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > From: Mauro Matteo Cascella <mcascell@redhat.com>
> >
> > Set current_req to NULL, not current_req->req, to prevent reusing a free'd
> > buffer in case of repeated SCSI cancel requests.  Also apply the fix to
> > CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cancel
> > the request.
> >
> > Thanks to Alexander Bulekov for providing a reproducer.
> >
> > Fixes: CVE-2022-0216
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > Tested-by: Alexander Bulekov <alxndr@bu.edu>
> > Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >         Adjust the patch from v1 to v2 since the changes crossed
> >         with the pull request.
> >
> >  hw/scsi/lsi53c895a.c               |  3 +-
> >  tests/qtest/fuzz-lsi53c895a-test.c | 71 ++++++++++++++++++++++++++++++
> >  2 files changed, 73 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> > index 99ea42d49b..ad5f5e5f39 100644
> > --- a/hw/scsi/lsi53c895a.c
> > +++ b/hw/scsi/lsi53c895a.c
> > @@ -1030,7 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
> >              trace_lsi_do_msgout_abort(current_tag);
> >              if (current_req && current_req->req) {
> >                  scsi_req_cancel(current_req->req);
> > -                current_req->req = NULL;
> > +                current_req = NULL;
> >              }
> >              lsi_disconnect(s);
> >              break;
> > @@ -1056,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
> >              /* clear the current I/O process */
> >              if (s->current) {
> >                  scsi_req_cancel(s->current->req);
> > +                current_req = NULL;
> >              }
> >
> >              /* As the current implemented devices scsi_disk and scsi_generic
> > diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> > index 2e8e67859e..6872c70d3a 100644
> > --- a/tests/qtest/fuzz-lsi53c895a-test.c
> > +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> > @@ -8,6 +8,74 @@
> >  #include "qemu/osdep.h"
> >  #include "libqtest.h"
> >
> > +/*
> > + * This used to trigger a UAF in lsi_do_msgout()
> > + * https://gitlab.com/qemu-project/qemu/-/issues/972
> > + */
> > +static void test_lsi_do_msgout_cancel_req(void)
> > +{
> > +    QTestState *s;
> > +
> > +    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
>
> This test does not run on machines with small size memory. Is 4G a
> must have for this test?

4G comes from [1], I don't think it's a must have. Would 2G be okay?
For some reason ASAN does not trigger the UAF when I run the test
locally with less than 2G (1.7G to be precise). I didn't really
investigate why that is the case.

[1] https://gitlab.com/qemu-project/qemu/-/issues/972#note_1019851430.

>
>
> > +                   "-device lsi53c895a,id=scsi "
> > +                   "-device scsi-hd,drive=disk0 "
> > +                   "-drive file=null-co://,id=disk0,if=none,format=raw");
> > +
> > +    qtest_outl(s, 0xcf8, 0x80000810);
> > +    qtest_outl(s, 0xcf8, 0xc000);
> > +    qtest_outl(s, 0xcf8, 0x80000810);
> > +    qtest_outw(s, 0xcfc, 0x7);
> > +    qtest_outl(s, 0xcf8, 0x80000810);
> > +    qtest_outl(s, 0xcfc, 0xc000);
> > +    qtest_outl(s, 0xcf8, 0x80000804);
> > +    qtest_outw(s, 0xcfc, 0x05);
> > +    qtest_writeb(s, 0x69736c10, 0x08);
> > +    qtest_writeb(s, 0x69736c13, 0x58);
> > +    qtest_writeb(s, 0x69736c1a, 0x01);
> > +    qtest_writeb(s, 0x69736c1b, 0x06);
> > +    qtest_writeb(s, 0x69736c22, 0x01);
> > +    qtest_writeb(s, 0x69736c23, 0x07);
> > +    qtest_writeb(s, 0x69736c2b, 0x02);
> > +    qtest_writeb(s, 0x69736c48, 0x08);
> > +    qtest_writeb(s, 0x69736c4b, 0x58);
> > +    qtest_writeb(s, 0x69736c52, 0x04);
> > +    qtest_writeb(s, 0x69736c53, 0x06);
> > +    qtest_writeb(s, 0x69736c5b, 0x02);
> > +    qtest_outl(s, 0xc02d, 0x697300);
> > +    qtest_writeb(s, 0x5a554662, 0x01);
> > +    qtest_writeb(s, 0x5a554663, 0x07);
> > +    qtest_writeb(s, 0x5a55466a, 0x10);
> > +    qtest_writeb(s, 0x5a55466b, 0x22);
> > +    qtest_writeb(s, 0x5a55466c, 0x5a);
> > +    qtest_writeb(s, 0x5a55466d, 0x5a);
> > +    qtest_writeb(s, 0x5a55466e, 0x34);
> > +    qtest_writeb(s, 0x5a55466f, 0x5a);
> > +    qtest_writeb(s, 0x5a345a5a, 0x77);
> > +    qtest_writeb(s, 0x5a345a5b, 0x55);
> > +    qtest_writeb(s, 0x5a345a5c, 0x51);
> > +    qtest_writeb(s, 0x5a345a5d, 0x27);
> > +    qtest_writeb(s, 0x27515577, 0x41);
> > +    qtest_outl(s, 0xc02d, 0x5a5500);
> > +    qtest_writeb(s, 0x364001d0, 0x08);
> > +    qtest_writeb(s, 0x364001d3, 0x58);
> > +    qtest_writeb(s, 0x364001da, 0x01);
> > +    qtest_writeb(s, 0x364001db, 0x26);
> > +    qtest_writeb(s, 0x364001dc, 0x0d);
> > +    qtest_writeb(s, 0x364001dd, 0xae);
> > +    qtest_writeb(s, 0x364001de, 0x41);
> > +    qtest_writeb(s, 0x364001df, 0x5a);
> > +    qtest_writeb(s, 0x5a41ae0d, 0xf8);
> > +    qtest_writeb(s, 0x5a41ae0e, 0x36);
> > +    qtest_writeb(s, 0x5a41ae0f, 0xd7);
> > +    qtest_writeb(s, 0x5a41ae10, 0x36);
> > +    qtest_writeb(s, 0x36d736f8, 0x0c);
> > +    qtest_writeb(s, 0x36d736f9, 0x80);
> > +    qtest_writeb(s, 0x36d736fa, 0x0d);
> > +    qtest_outl(s, 0xc02d, 0x364000);
> > +
> > +    qtest_quit(s);
> > +}
> > +
> >  /*
> >   * This used to trigger the assert in lsi_do_dma()
> >   * https://bugs.launchpad.net/qemu/+bug/697510
> > @@ -44,5 +112,8 @@ int main(int argc, char **argv)
> >      qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
> >                     test_lsi_do_dma_empty_queue);
> >
> > +    qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
> > +                   test_lsi_do_msgout_cancel_req);
> > +
> >      return g_test_run();
> >  }
>
> Regards,
> Bin
>

--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


