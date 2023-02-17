Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3DD69A49A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:01:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSrur-0003K3-F9; Thu, 16 Feb 2023 23:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSrup-0003Jr-96
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:00:07 -0500
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSrun-0005Yl-6e
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:00:06 -0500
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 261145023
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xo3g+qqDtrr0ajXLw2kgiuUpfixeBmKmZxIvgKrLsJaIsI4StFCzt
 garIBmFbvrbZ2D2L41yPt6/8UNTusWHzNUwSwtq/3tkQysQopacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPK4T5zcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3MJYM0FH7
 uQhDjkQaB2inOS33qy8c7w57igjBJGD0II3v3hhyXTADq9jT8mSE+PF4thX2Dp2jcdLdRrcT
 5BBOHw/MVKaOUcJYwZHYH49tL7Aan3XejlIrl6PjaAqpWXf0WSd1ZC3boOMJoHSH549ckCwo
 Hnq8SfXPzYmL/+08BO67l6luP7vknauMG4VPPjinhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN8x8Y1ha079UjuV9qkGhPh8S7CsRkbVN5dVeY97Wlh15bp3upQPUBcJhYpVTDsnJVeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:sussIKnh59BUSQI/4K6+SPjeDN3pDfL63DAbv31ZSRFFG/FwWf
 re+8jz8SWE9Qr5OUtQ4+xoXZPrfZqyz+8W3WB8B8bGYOCighrVEGgA1/qY/9SDIVyGygc178
 4JGNkcNDSzNykDsS+T2mmF+r0bsb+6Gc6T9IPj5kYoZy1RL49b0ydFJjCyLnBWLTM2eqbR16
 Dx2iOEnVedkLgsAPhTz0NrPtT+mw==
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 22:59:56 -0500
Received: by mail-qk1-f198.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso2437512qko.11
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 19:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hExIX0W3hYLZ2em3fiTBJy8F+fH+eAARcIcBV8+Wk3A=;
 b=Fb7bGOjiltX9kRSqogYJ3bBHMCzL6tXAShDFA6Is72La2ux5VUMD4CFhOBFNuks6DS
 GVA4FuueyfGJXkQ+uimfQ42SZ9HsK7LTSJeAw1NW5Wzisv+x6KkzQQT50KbhvfNhO9IA
 JopvK/BbxKLYrsFAlMisi+lhBjeSaUFGHkTZFfhpnZgthBPGEIGJSpspBLwTpiwR14w3
 wiwvukOfYrcYVFtYUwtLVS58kqDgkXDGKe0ol1Z0OtHL3r955fd2Ej7O7ktRzLNsxoEY
 rjIc34rsqYf2B2uMc9cVyLhkuk/kMfuzZ9eUmWdRU5SonUzc3IX0NAApUZc3N+Ev+dj3
 +wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hExIX0W3hYLZ2em3fiTBJy8F+fH+eAARcIcBV8+Wk3A=;
 b=GtWLozFi1FDLMQIRvl+w9KO5ttvV4+ez87S3doNCugImdE8iW4jRyOfxWKCaX9SjLu
 fDVzBEXl3ZSdzeMbH6XjHg2EamNvGxuGOZnbV3acHiCUIy13GjBjt+iXJPQtbCBOOVKD
 LmPFXlMBmak1d6rzqnu54ia0FY/1UEwbjA4JJUinxjE8nQGfm+vbr9BLeKKpMbZjv+HO
 pXxkMEj/YLbyi1z9OGWX/eDEeZMdhIl4CTDzMuDeYr3caPDWDHKkVb7G7pP/5msmQ4i8
 FBmt/mvxQke9l83eB9bjwUaYFBNXH8/EzAdBekF4CsOH0sPheTjKwietlk00agIJhzzG
 nbYQ==
X-Gm-Message-State: AO0yUKWlj66ag7KEgVx+P0pUg/VXqWkAIyPE08f3SXgmoeT6bXFTFemy
 i77vciXRgiw1sHlyYTZOMuEr5Z8ZpI3p0TIlP6AqcRk3hXT2v/OgDKyBHLspcw4l9iC5D93JZdu
 /la+RtrzcjXpk/s9ObIFg1JDffVTmeA==
X-Received: by 2002:a05:622a:20d:b0:3b1:c538:7026 with SMTP id
 b13-20020a05622a020d00b003b1c5387026mr13568730qtx.42.1676606395567; 
 Thu, 16 Feb 2023 19:59:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+WHc8PT+mIAZbqh7Oy2pSZmT+K7SQWwRf8a0V43y7ULzwkVkWHfffZt4Vg+Lfwdr9NrdSLeg==
X-Received: by 2002:a05:622a:20d:b0:3b1:c538:7026 with SMTP id
 b13-20020a05622a020d00b003b1c5387026mr13568707qtx.42.1676606395320; 
 Thu, 16 Feb 2023 19:59:55 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 t68-20020ae9df47000000b0073b8459d221sm2498246qkf.31.2023.02.16.19.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 19:59:54 -0800 (PST)
Date: Thu, 16 Feb 2023 22:59:51 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Darren Kenny <darren.kenny@oracle.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 04/10] fuzz/generic-fuzz: add a limit on DMA bytes written
Message-ID: <20230217035951.ii2xj4f4c4ysyl5e@mozz.bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-5-alxndr@bu.edu>
 <m2lel1r5p7.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2lel1r5p7.fsf@oracle.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 230213 1438, Darren Kenny wrote:
> Hi Alex,
> 
> On Saturday, 2023-02-04 at 23:29:45 -05, Alexander Bulekov wrote:
> > As we have repplaced fork-based fuzzing, with reboots - we can no longer
> > use a timeout+exit() to avoid slow inputs. Libfuzzer has its own timer
> > that it uses to catch slow inputs, however these timeouts are usually
> > seconds-minutes long: more than enough to bog-down the fuzzing process.
> > However, I found that slow inputs often attempt to fill overly large DMA
> > requests. Thus, we can mitigate most timeouts by setting a cap on the
> > total number of DMA bytes written by an input.
> >
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  tests/qtest/fuzz/generic_fuzz.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> > index c2e5642150..eab92cbc23 100644
> > --- a/tests/qtest/fuzz/generic_fuzz.c
> > +++ b/tests/qtest/fuzz/generic_fuzz.c
> > @@ -52,6 +52,7 @@ enum cmds {
> >  #define USEC_IN_SEC 1000000000
> >  
> >  #define MAX_DMA_FILL_SIZE 0x10000
> > +#define MAX_TOTAL_DMA_SIZE 0x10000000
> >  
> >  #define PCI_HOST_BRIDGE_CFG 0xcf8
> >  #define PCI_HOST_BRIDGE_DATA 0xcfc
> > @@ -64,6 +65,7 @@ typedef struct {
> >  static useconds_t timeout = DEFAULT_TIMEOUT_US;
> >  
> >  static bool qtest_log_enabled;
> > +size_t dma_bytes_written;
> >  
> >  MemoryRegion *sparse_mem_mr;
> >  
> > @@ -197,6 +199,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
> >       */
> >      if (dma_patterns->len == 0
> >          || len == 0
> > +        || dma_bytes_written > MAX_TOTAL_DMA_SIZE
> 
> NIT: Just wondering if you should check dma_bytes_written + l as opposed
>      to dma_bytes_written? It's probably not important enough given it's
>      just an artificial limit, but thought I'd ask.
>

Done :)

> >          || (mr != current_machine->ram && mr != sparse_mem_mr)) {
> >          return;
> >      }
> > @@ -269,6 +272,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
> >                  fflush(stderr);
> >              }
> >              qtest_memwrite(qts_global, addr, buf, l);
> > +            dma_bytes_written += l;
> >          }
> >          len -= l;
> >          buf += l;
> > @@ -648,6 +652,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
> >  
> >      op_clear_dma_patterns(s, NULL, 0);
> >      pci_disabled = false;
> > +    dma_bytes_written = 0;
> >  
> >      QPCIBus *pcibus = qpci_new_pc(s, NULL);
> >      g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
> > -- 
> > 2.39.0
> 
> While this will still consume the existing corpus, is it likely to
> cause these existing corpus to be trimmed?

Not sure - It would affect inputs that generate a lot of DMA
activity (though those should have been caught by our previous timeout
mechanism).

> 
> Otherwise, the changes look good:
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> 
> Thanks,
> 
> Darren.

