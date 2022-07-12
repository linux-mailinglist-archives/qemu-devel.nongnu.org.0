Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB2570EA4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 02:11:37 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB3V2-0003vF-26
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 20:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oB3T1-0002Oi-HC
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 20:09:31 -0400
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80]:40497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oB3Sy-00026n-Uj
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 20:09:30 -0400
X-IronPort-RemoteIP: 209.85.166.71
X-IronPort-MID: 211976934
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:g2qlBKl8xFnG6eDbl5WQTjro5gwKJERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZWTyBP6uDYzTwfttwaYm+oRlVsMTTnNVkTVM++383QS4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXFrU4
 YiaT/D3YzdJ5RYlagr41Ire8HuDjNyq0N/PlgVjDRzjlAa2e0g9VfrzF4noR5fLatA88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiM+t6OK23CuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6qOvVgs4Zob3xds5YiR4IQRPBa0b9+qSSZS/mZT7I0zudnLtx7BvCxhzM9JBvOlwBm5K+
 LoTLzVlghKr3brnhuLmDLAy2IJ8daEHP6tG0p1k5TjdHfAqW7jJXuPH6cIwMDIY3JkXTKmAN
 pFFAdZpRDLBQRhIN2oxM5I/jM7rjFLEQg9x9GvA8MLb5ECWlmSdyoPFKdfQZ5mGSNtYmm6eo
 WTJ+Xm/BQsVXOFz0hKA+3Oow+7IxGb1B9tUG7q/+fpnxlaUwwT/FSEraLdymtHh4mbWZj6VA
 xV8FvYGxUTqyHGWcw==
IronPort-HdrOrdr: A9a23:WLEpxqDkF8hzxvvlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nAppQmPGDP+VQssR0b9exoW5PwIk80l6QV3WB5B97LYOCMggWVxe9ZgrcKygeQfhHDyg==
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2022 20:09:23 -0400
Received: by mail-io1-f71.google.com with SMTP id
 w12-20020a5d960c000000b00678e4b1197bso3358851iol.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 17:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/PX6VtDc3r2r+UjLACx4KCItiLt+7QLSbOLBujwEGWQ=;
 b=f7+4n+RHo2bULx59IeUszifDsnHzSxqrlUSWs6HJpUa/l9aV8olVo++FsRZvGt6rMu
 X1JxWfYVVJqGRvk910ZSbjW+AhpogQ26drbzR9JgGKhIO1G/5+QpM9WjXrxHp4+nf1MA
 /fLouBKKhNkTG+MEUNTv6tvoX3QVKsk0wusgg0qlyCRXUCllOBwOkDoD55Yv/dULCDIe
 N96OeUfbFcomD2Nci+1ge7j2yaUoYxwKnbNYHVsbXpw2JAGe5sBVqvaeQfGPQ13ZHxUM
 Movh+Zz23eJPKGri3zN1ksUDuqPRJqCoILnIqWgeYX+BCatyh83341J11uZH14huUq3q
 y75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/PX6VtDc3r2r+UjLACx4KCItiLt+7QLSbOLBujwEGWQ=;
 b=cQRiaUbNdWtMJuq0U1Tx0OQqTimjArT6SHSr5YkSmrybnzCRo0Ehd3+RHqBvRuuAWn
 TIdjKD1XM7hSCXI2HFM/doyuHdbyhS4LEiNfCg8tNh4IRPp0Q4w8vAxfVdJe8HIQto8T
 GeretgFwSbgvvCc+CI7TY1Jqz0CU6jrVJF3QlmkU1n0Zk01edZhoKtv1GsjSImKIkkvE
 Ps8DNQrn0djKFvkzEDHbXdN4TWldkAGRdMIR29XDYgSQvOvJtKTHXvkTt6fyBaVi2l9W
 LZ2iepKVLvuAbfA1z/J1r7h6wdOlbJpVsYsD/kLyyzHzuNHtMbGT6YC9syYrUKIHs9oK
 BbxQ==
X-Gm-Message-State: AJIora+j14PcdJQwnSpae0PyEBTARi166sopRkSwbwYTPFCgtVWSWiRx
 Tlr7ESw/1SRUhVP5cSQ5J8lk3l3Pem7WYpOTGS/MUuHbnk2XGZ3JTpriobvtJhS0zQcESYeS1C9
 Q9JPf96VeCNA799RLTMpG3+tHw5Y4yA==
X-Received: by 2002:a05:6e02:1bad:b0:2da:d6d0:a58 with SMTP id
 n13-20020a056e021bad00b002dad6d00a58mr10697970ili.19.1657584563659; 
 Mon, 11 Jul 2022 17:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tRIeXjND4/TY7ptL7mJUfUCE7uol5rjmF+wzRsk57xiFecmPxAhMUuHhxO25m5LHJHdneyBw==
X-Received: by 2002:a05:6e02:1bad:b0:2da:d6d0:a58 with SMTP id
 n13-20020a056e021bad00b002dad6d00a58mr10697962ili.19.1657584563386; 
 Mon, 11 Jul 2022 17:09:23 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056602080f00b0067b4d6cecc8sm4310369iow.45.2022.07.11.17.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 17:09:22 -0700 (PDT)
Date: Mon, 11 Jul 2022 20:09:17 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 thuth@redhat.com
Subject: Re: [PATCH v2] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
Message-ID: <20220712000917.i77k4p3o2qh6dw5z@mozz.bu.edu>
References: <20220711123316.421279-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711123316.421279-1-mcascell@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 220711 1433, Mauro Matteo Cascella wrote:
> Set current_req to NULL to prevent reusing a free'd buffer in case of repeated
> SCSI cancel requests. Thanks to Thomas Huth for suggesting the first version of
> the patch and Alexander Bulekov for providing a reproducer.
> 
> Fixes: CVE-2022-0216
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>

Thank you - With this, the fuzzer isn't finding any more heap-related
crashes.

Tested-by: Alexander Bulekov <alxndr@bu.edu>

> ---
> v2:
> - handle CLEAR QUEUE and BUS DEVICE RESET messages
> - new qtest: test_lsi_do_msgout_cancel_req
> 
>  hw/scsi/lsi53c895a.c               |  2 +
>  tests/qtest/fuzz-lsi53c895a-test.c | 71 ++++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index c8773f73f7..6934040c59 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -1030,6 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
>              trace_lsi_do_msgout_abort(current_tag);
>              if (current_req) {
>                  scsi_req_cancel(current_req->req);
> +                current_req = NULL;
>              }
>              lsi_disconnect(s);
>              break;
> @@ -1055,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
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
> -- 
> 2.35.3
> 

