Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D475AA55D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 03:58:36 +0200 (CEST)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTvx0-0000oL-Er
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 21:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTvvB-0007q8-OP
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 21:56:37 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:45707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTvv9-000094-S2
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 21:56:37 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id jy14so433399qvb.12
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 18:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7KaCpkFBpXwkZCGlsUS8Nn/FWXUxOFhLaA6P4jDQM00=;
 b=GADVDWrjJIaTpGYFsZBTz6IMsTnKdCcGlktsBcyx01TsTwU3RtcLF24oru8Obhvkz7
 SxEh45ko7YumuIGbMX9pPsyFC6vlMdaGBmQUoTmEEHziRyVflVHaHkEjWssBgX0e/fnN
 u2vZ75LRl1qvUctE1kpK4qM6b3FPRVUMUHH3+kob7xRh0+0nr/A7ZzkaWB74VHmyTWNA
 0G4mccGFN7xvZS8TGy+iz3iDfS5HjLxTkW1zsYGRLnOpINdoOYJF4W3LHVoZx3SPbC9d
 mOnDLmYy2lvDTigTAOrba7lQHf12FqFPQTM3YRbqOSnuz/fA7HeJx2rBSQdfkBik7rTM
 f0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7KaCpkFBpXwkZCGlsUS8Nn/FWXUxOFhLaA6P4jDQM00=;
 b=rcbuoeo0ajn5TuvKijS3Cb1VWNhnn0LS2AZbQRIGOs2C53NgGVo3TERCog5wEGvf1d
 J5ihi3eUmjKK/LaxkSuPS12LPRzsGs5WKmiRSSnA5TgS3grTNwykczhxQ+oaEa9wB1L1
 20OaFO02q1n19/qUThAr+KPOYCOwHZZlZ5MTq2eFskp/an3NwBy/YiCF5EhG0xmCoMUh
 WwkmJ/M2epNgHVaKdJHtCNJNb1b/vclV5iwH7fYiPV/W1P1HfNM6jM3/jCDUo/fStGh8
 75Ml+qXLiyVdA1t0LGA4ftSR5+xLMQ7BShspwdqGUu/ZXCd1QhsDsmL/M7yIFhRZuE43
 RXhQ==
X-Gm-Message-State: ACgBeo3qoJEQLubpeYdQfF54CfLPtysgq0n8bTxAhwT4Lg+om8jYekwX
 KqLP4ZTJQN3H1zDtF11/FC6hlHv0vIzxaOJX9YQ=
X-Google-Smtp-Source: AA6agR7S1q4yWU0uDVtGt7N9WHUaNW/6SwNa+n4r8xdIBFd97TwFryy3TVYVwIxMV3I86WXqpaj3bkznrUPdVwiVGc0=
X-Received: by 2002:a05:6214:ca1:b0:498:f96d:4a8c with SMTP id
 s1-20020a0562140ca100b00498f96d4a8cmr23829297qvs.51.1662083794913; Thu, 01
 Sep 2022 18:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220713124357.247817-1-pbonzini@redhat.com>
In-Reply-To: <20220713124357.247817-1-pbonzini@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 09:56:24 +0800
Message-ID: <CAEUhbmVWdAF2fO1E6YAJYQOaC_4dog7TkHdyJwqMAmEzrST8UQ@mail.gmail.com>
Subject: Re: [PATCH] scsi/lsi53c895a: really fix use-after-free in
 lsi_do_msgout (CVE-2022-0216)
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2c.google.com
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

Hi,

On Wed, Jul 13, 2022 at 8:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Mauro Matteo Cascella <mcascell@redhat.com>
>
> Set current_req to NULL, not current_req->req, to prevent reusing a free'd
> buffer in case of repeated SCSI cancel requests.  Also apply the fix to
> CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cancel
> the request.
>
> Thanks to Alexander Bulekov for providing a reproducer.
>
> Fixes: CVE-2022-0216
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>         Adjust the patch from v1 to v2 since the changes crossed
>         with the pull request.
>
>  hw/scsi/lsi53c895a.c               |  3 +-
>  tests/qtest/fuzz-lsi53c895a-test.c | 71 ++++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+), 1 deletion(-)
>
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 99ea42d49b..ad5f5e5f39 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -1030,7 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
>              trace_lsi_do_msgout_abort(current_tag);
>              if (current_req && current_req->req) {
>                  scsi_req_cancel(current_req->req);
> -                current_req->req = NULL;
> +                current_req = NULL;
>              }
>              lsi_disconnect(s);
>              break;
> @@ -1056,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
>              /* clear the current I/O process */
>              if (s->current) {
>                  scsi_req_cancel(s->current->req);
> +                current_req = NULL;
>              }
>
>              /* As the current implemented devices scsi_disk and scsi_generic
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index 2e8e67859e..6872c70d3a 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -8,6 +8,74 @@
>  #include "qemu/osdep.h"
>  #include "libqtest.h"
>
> +/*
> + * This used to trigger a UAF in lsi_do_msgout()
> + * https://gitlab.com/qemu-project/qemu/-/issues/972
> + */
> +static void test_lsi_do_msgout_cancel_req(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-M q35 -m 4G -display none -nodefaults "

This test does not run on machines with small size memory. Is 4G a
must have for this test?

> +                   "-device lsi53c895a,id=scsi "
> +                   "-device scsi-hd,drive=disk0 "
> +                   "-drive file=null-co://,id=disk0,if=none,format=raw");
> +
> +    qtest_outl(s, 0xcf8, 0x80000810);
> +    qtest_outl(s, 0xcf8, 0xc000);
> +    qtest_outl(s, 0xcf8, 0x80000810);
> +    qtest_outw(s, 0xcfc, 0x7);
> +    qtest_outl(s, 0xcf8, 0x80000810);
> +    qtest_outl(s, 0xcfc, 0xc000);
> +    qtest_outl(s, 0xcf8, 0x80000804);
> +    qtest_outw(s, 0xcfc, 0x05);
> +    qtest_writeb(s, 0x69736c10, 0x08);
> +    qtest_writeb(s, 0x69736c13, 0x58);
> +    qtest_writeb(s, 0x69736c1a, 0x01);
> +    qtest_writeb(s, 0x69736c1b, 0x06);
> +    qtest_writeb(s, 0x69736c22, 0x01);
> +    qtest_writeb(s, 0x69736c23, 0x07);
> +    qtest_writeb(s, 0x69736c2b, 0x02);
> +    qtest_writeb(s, 0x69736c48, 0x08);
> +    qtest_writeb(s, 0x69736c4b, 0x58);
> +    qtest_writeb(s, 0x69736c52, 0x04);
> +    qtest_writeb(s, 0x69736c53, 0x06);
> +    qtest_writeb(s, 0x69736c5b, 0x02);
> +    qtest_outl(s, 0xc02d, 0x697300);
> +    qtest_writeb(s, 0x5a554662, 0x01);
> +    qtest_writeb(s, 0x5a554663, 0x07);
> +    qtest_writeb(s, 0x5a55466a, 0x10);
> +    qtest_writeb(s, 0x5a55466b, 0x22);
> +    qtest_writeb(s, 0x5a55466c, 0x5a);
> +    qtest_writeb(s, 0x5a55466d, 0x5a);
> +    qtest_writeb(s, 0x5a55466e, 0x34);
> +    qtest_writeb(s, 0x5a55466f, 0x5a);
> +    qtest_writeb(s, 0x5a345a5a, 0x77);
> +    qtest_writeb(s, 0x5a345a5b, 0x55);
> +    qtest_writeb(s, 0x5a345a5c, 0x51);
> +    qtest_writeb(s, 0x5a345a5d, 0x27);
> +    qtest_writeb(s, 0x27515577, 0x41);
> +    qtest_outl(s, 0xc02d, 0x5a5500);
> +    qtest_writeb(s, 0x364001d0, 0x08);
> +    qtest_writeb(s, 0x364001d3, 0x58);
> +    qtest_writeb(s, 0x364001da, 0x01);
> +    qtest_writeb(s, 0x364001db, 0x26);
> +    qtest_writeb(s, 0x364001dc, 0x0d);
> +    qtest_writeb(s, 0x364001dd, 0xae);
> +    qtest_writeb(s, 0x364001de, 0x41);
> +    qtest_writeb(s, 0x364001df, 0x5a);
> +    qtest_writeb(s, 0x5a41ae0d, 0xf8);
> +    qtest_writeb(s, 0x5a41ae0e, 0x36);
> +    qtest_writeb(s, 0x5a41ae0f, 0xd7);
> +    qtest_writeb(s, 0x5a41ae10, 0x36);
> +    qtest_writeb(s, 0x36d736f8, 0x0c);
> +    qtest_writeb(s, 0x36d736f9, 0x80);
> +    qtest_writeb(s, 0x36d736fa, 0x0d);
> +    qtest_outl(s, 0xc02d, 0x364000);
> +
> +    qtest_quit(s);
> +}
> +
>  /*
>   * This used to trigger the assert in lsi_do_dma()
>   * https://bugs.launchpad.net/qemu/+bug/697510
> @@ -44,5 +112,8 @@ int main(int argc, char **argv)
>      qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
>                     test_lsi_do_dma_empty_queue);
>
> +    qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
> +                   test_lsi_do_msgout_cancel_req);
> +
>      return g_test_run();
>  }

Regards,
Bin

