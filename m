Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C7B6C8097
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfflI-0007TJ-0c; Fri, 24 Mar 2023 07:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pfflC-0007T8-7F
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:39:08 -0400
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pffku-0005BM-H9
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:39:05 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 268576791
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/OEX4qtURdodxwJqqs43ycbYu+fnVOhcMUV32f8akzHdYApBsoF/q
 tZmKWrSbPzcMTD8Ko1/Otzk9kgO6JeDnNU2GQBt+SAyRCka9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkOagS1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqUC2f90L01kp
 cUKA2stbwmMhLKfxO+SH7wEasQLdKEHPasas3BkiCjaVLMoGMGSBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6aOVsWawZ/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKzYIeKJIPbHK25mG6Im
 G2d0mndDyocd8Wj6gal8HaplsvAyHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmyTYC4UUTp8TiLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7qfamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:YvKm9qwrgp9T/+wpzXiIKrPw8L1zdoMgy1knxilNoH1uA7elfq
 WV98jzuiWbtN98YhwdcJO7Sc29qArnlKKduLNwAV7AZniFhILLFvAb0WKK+VSJcREWkNQtsJ
 uIGJIQNDSfNzRHZInBkW6F+nsbsb+62bHtr933i11qSRhua6lm5Qs8MACGCUd7LTM2ZqbRUK
 Dsn/Z6mw==
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 07:37:35 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 s12-20020a37a90c000000b007468eaf866aso611693qke.17
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 04:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1679657854;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ju7k8UKu9jnGmNl6BH5kUYO0VaYoF/g4SLL1TAK//HA=;
 b=RNLyBqrFfb5dxm8R33q/Mt2V8P0oGVFga9Ajb/Mvr1A77E/5Nf3q7cJTTbMtBqDUGH
 55w3TcYCc0yxJl2qK6FDmRpvzbJkBRjTVA1+hgqGjCrOPtNy3BDtxIgJrEWs+umxJjO3
 w6PQOJjIvhMroxCKNFldI+jx1aRRt7MPqYBlBlCQQ+s+edPnWbfn69wx+4T2uah14e1T
 Tm0r+KclAtcswR77arBJZuDk2Szsv2V8eP/T40iNoolu2AB2Tpu20ORMVxacCDS4QzrZ
 ALpgFVOKatQJiOq8NQl532rwktRcNTfXZIsYYVDqpi3IMVPRgPEQizgVrnMLK+z6oz/A
 MzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679657854;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ju7k8UKu9jnGmNl6BH5kUYO0VaYoF/g4SLL1TAK//HA=;
 b=yW1avPyb7U9UmnelXJdoHFavLkI+dLMMZpIOjQf53TfekuTqcEmDasr9lcucFyTveG
 v3ON9C32I1sGlmpXVO/e/IThqG5r1D1TwV5Ed/OaNSFeGfKycV2g8eieiRRXI/9v00s/
 Lx80lU6EHhPk7ggqOA/aPn7eJhVvXhr3JkOBzJ22gApA8ioEQqr4r/ubNdb3AzVlxohM
 fYEcrR37B+OZonFN+Xzvgx/o1vpaUjfyQ/Lt3ZckQI2u6hebi+OSHJoflOSxjo6VH6HO
 r4VnSQj3/Yn1JrNU784WNvYqpFO17SkBjIDgLG+zyjbu3TWqImCtCoLTqeoJRQZCwASc
 7+uA==
X-Gm-Message-State: AAQBX9eFehUzoqSAQDthBMPsSjEpsosMnbM45uy0K9lgtF/zRROYALNW
 ysCZZkpPZuAuRHn36labpvXiSN5TF6eYlKo2AhRVPR4zh+qMh0cGx65JmgHew+KoqFNBkgDpCUr
 qFu49ZUF8LsG8kl0dLH5gj0jJG970Qg==
X-Received: by 2002:a05:6214:2622:b0:5a9:129:c704 with SMTP id
 gv2-20020a056214262200b005a90129c704mr3903886qvb.9.1679657854599; 
 Fri, 24 Mar 2023 04:37:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZenMQAkLn7CFQowRz8d3dmu0L60RdUzAAWNwKWwpyccVc9EYyfKTAwxH3czlr3B2SOAbSHpg==
X-Received: by 2002:a05:6214:2622:b0:5a9:129:c704 with SMTP id
 gv2-20020a056214262200b005a90129c704mr3903467qvb.9.1679657849363; 
 Fri, 24 Mar 2023 04:37:29 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a0cda92000000b005dd8b9345b6sm610168qvj.78.2023.03.24.04.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 04:37:29 -0700 (PDT)
Date: Fri, 24 Mar 2023 07:37:25 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Karl Heubaum <karl.heubaum@oracle.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "zheyuma97@gmail.com" <zheyuma97@gmail.com>
Subject: Re: [PATCH] scsi/lsi53c895a: restrict DMA engine to memory regions
 (CVE-2023-0330)
Message-ID: <20230324113725.xsnbqvzo6rszayjj@mozz.bu.edu>
References: <20230116204232.1142442-1-mcascell@redhat.com>
 <110DADE7-A361-4F53-B735-B926C40C0B9B@oracle.com>
 <b84a7f60-f0de-b9e5-254f-3c3c649a08e1@linaro.org>
 <CAA8xKjUV8LQ5=ZTwoGo9+Xj1fMMyF1ffXL84U8r1vnfXiFrDGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8xKjUV8LQ5=ZTwoGo9+Xj1fMMyF1ffXL84U8r1vnfXiFrDGg@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230324 1200, Mauro Matteo Cascella wrote:
> On Fri, Mar 17, 2023 at 10:59 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > On 17/3/23 19:18, Karl Heubaum wrote:
> > > Did this CVE fix fall in the cracks during the QEMU 8.0 merge window?
> >
> > The patch isn't reviewed, and apparently almost no active contributor
> > understand this device enough to be sure this security patch doesn't
> > break normal use. Fuzzed bugs are rarely trivial.
> 
> I guess Alexander's new patchset [1] does not help fix this one?
> 
> [1] https://patchew.org/QEMU/20230313082417.827484-1-alxndr@bu.edu/20230313082417.827484-7-alxndr@bu.edu/
> 

It should cover it. At least the reproducer in this email no longer
works.
-Alex

> 
> > >> On Jan 16, 2023, at 2:42 PM, Mauro Matteo Cascella <mcascell@redhat.com> wrote:
> > >>
> > >> This prevents the well known DMA-MMIO reentrancy problem (upstream issue #556)
> > >> leading to memory corruption bugs like stack overflow or use-after-free.
> > >>
> > >> Fixes: CVE-2023-0330
> > >> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > >> Reported-by: Zheyu Ma <zheyuma97@gmail.com>
> > >> ---
> > >> hw/scsi/lsi53c895a.c               | 14 +++++++++----
> > >> tests/qtest/fuzz-lsi53c895a-test.c | 32 ++++++++++++++++++++++++++++++
> > >> 2 files changed, 42 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> > >> index af93557a9a..89c52594eb 100644
> > >> --- a/hw/scsi/lsi53c895a.c
> > >> +++ b/hw/scsi/lsi53c895a.c
> > >> @@ -446,22 +446,28 @@ static void lsi_reselect(LSIState *s, lsi_request *p);
> > >> static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
> > >>                                 void *buf, dma_addr_t len)
> > >> {
> > >> +    const MemTxAttrs attrs = { .memory = true };
> > >> +
> > >>      if (s->dmode & LSI_DMODE_SIOM) {
> > >> -        address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
> > >> +        address_space_read(&s->pci_io_as, addr, attrs,
> > >>                             buf, len);
> > >>      } else {
> > >> -        pci_dma_read(PCI_DEVICE(s), addr, buf, len);
> > >> +        pci_dma_rw(PCI_DEVICE(s), addr, buf, len,
> > >> +                      DMA_DIRECTION_TO_DEVICE, attrs);
> > >>      }
> > >> }
> > >>
> > >> static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
> > >>                                  const void *buf, dma_addr_t len)
> > >> {
> > >> +    const MemTxAttrs attrs = { .memory = true };
> > >> +
> > >>      if (s->dmode & LSI_DMODE_DIOM) {
> > >> -        address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
> > >> +        address_space_write(&s->pci_io_as, addr, attrs,
> > >>                              buf, len);
> > >>      } else {
> > >> -        pci_dma_write(PCI_DEVICE(s), addr, buf, len);
> > >> +        pci_dma_rw(PCI_DEVICE(s), addr, (void *) buf, len,
> > >> +                      DMA_DIRECTION_FROM_DEVICE, attrs);
> > >>      }
> > >> }
> > >>
> > >> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> > >> index 392a7ae7ed..35c02e89f3 100644
> > >> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> > >> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> > >> @@ -8,6 +8,35 @@
> > >> #include "qemu/osdep.h"
> > >> #include "libqtest.h"
> > >>
> > >> +/*
> > >> + * This used to trigger a DMA reentrancy issue
> > >> + * leading to memory corruption bugs like stack
> > >> + * overflow or use-after-free
> > >> + */
> > >> +static void test_lsi_dma_reentrancy(void)
> > >> +{
> > >> +    QTestState *s;
> > >> +
> > >> +    s = qtest_init("-M q35 -m 512M -nodefaults "
> > >> +                   "-blockdev driver=null-co,node-name=null0 "
> > >> +                   "-device lsi53c810 -device scsi-cd,drive=null0");
> > >> +
> > >> +    qtest_outl(s, 0xcf8, 0x80000804); /* PCI Command Register */
> > >> +    qtest_outw(s, 0xcfc, 0x7);        /* Enables accesses */
> > >> +    qtest_outl(s, 0xcf8, 0x80000814); /* Memory Bar 1 */
> > >> +    qtest_outl(s, 0xcfc, 0xff100000); /* Set MMIO Address*/
> > >> +    qtest_outl(s, 0xcf8, 0x80000818); /* Memory Bar 2 */
> > >> +    qtest_outl(s, 0xcfc, 0xff000000); /* Set RAM Address*/
> > >> +    qtest_writel(s, 0xff000000, 0xc0000024);
> > >> +    qtest_writel(s, 0xff000114, 0x00000080);
> > >> +    qtest_writel(s, 0xff00012c, 0xff000000);
> > >> +    qtest_writel(s, 0xff000004, 0xff000114);
> > >> +    qtest_writel(s, 0xff000008, 0xff100014);
> > >> +    qtest_writel(s, 0xff10002f, 0x000000ff);
> > >> +
> > >> +    qtest_quit(s);
> > >> +}
> > >> +
> > >> /*
> > >>   * This used to trigger a UAF in lsi_do_msgout()
> > >>   * https://gitlab.com/qemu-project/qemu/-/issues/972
> > >> @@ -120,5 +149,8 @@ int main(int argc, char **argv)
> > >>      qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
> > >>                     test_lsi_do_msgout_cancel_req);
> > >>
> > >> +    qtest_add_func("fuzz/lsi53c895a/lsi_dma_reentrancy",
> > >> +                   test_lsi_dma_reentrancy);
> > >> +
> > >>      return g_test_run();
> > >> }
> > >> --
> > >> 2.39.0
> > >>
> > >>
> > >
> >
> 
> 
> --
> Mauro Matteo Cascella
> Red Hat Product Security
> PGP-Key ID: BB3410B0
> 

