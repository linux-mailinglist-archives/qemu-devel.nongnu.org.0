Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E66EF810
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:01:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhYS-0007K9-Rh; Wed, 26 Apr 2023 11:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhYQ-0007Jw-VM
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 11:59:38 -0400
Received: from esa8.hc2706-39.iphmx.com ([216.71.140.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhYP-0001CU-Cx
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 11:59:38 -0400
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 272938852
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e3P91K3+KsroYcZUj/bD5W1zkn2cJEfYwER7XKvMYLTBsI5bpzIOn
 zEcDTvUb66INDT9LYh3atjg9BkG757dn9A2G1Y5qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYwr414rZ8Ek05Kio5mtC1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN0tVn8aBLIc+tppKnoQq
 uxGcS9cXDK60rfeLLKTEoGAh+wmJcjveZoc4zRulGCJS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZBDM3w2PUSojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKMll0qgOiwarI5fPSnd9hfoHnEr
 F6e2EjFBhgLBsKWyWWKpyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83rvF3+hX6Hp/yWBq3pHPCtRkZMzZNL9AHBMi24vK8y26k6qIsFFattPROWBcKeAEX
IronPort-HdrOrdr: A9a23:fGVuB6gxk96S9vy7jMKNviHet3BQXgwji2hC6mlwRA09TyVXrb
 HIoB0+726ItN9xYgBbpTnkAsO9qBznhPxICOUqTNKftUzdyReVxeJZnPDfKl/balTDH4dmvM
 8KAstD4Z/LfCBHZK7BgDVQeOxQpuVvnprY4dv2/jNGYTsvRZtdzzpUPC6mL2wefng4OXP7Lv
 ahDwh8ygZItU54Ui1zPBZlY9T+
X-Talos-CUID: 9a23:eFXgamCMoP2BQj/6E2o9ymItJcQlTmP21ymPMxHhFjdbaoTAHA==
X-Talos-MUID: 9a23:alyqFgUOkQO3v5nq/BLemTtcC5ti3/yJJHwJmIQ0pcCEaiMlbg==
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 11:59:27 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-74e3f0a8349so374986985a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682524762; x=1685116762;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hrre9aqgEQbSZyHIWwKTu4zL57afcUx7fRUJh1SSkM4=;
 b=PT13EiIxUmIzBT4v7e9moamy3ZzZ0tE3lVgj/dYW5BrZDM8GSYwXR0IHQ+NRYnBWEy
 yJ4N/Z2viFOQwxKc+bGWcTh4NKLFu+itEVvof55O9zl1Y8hHuzh0GuUjQyE9RZIyRedQ
 /MIDWtZaaZJ9JePcpSV+E3ZLEr3ksXkV9x35CR2ZA+LqMyGU3yDkVKCMeK8mP0CIssLE
 0UJuV8IQMiS/bM7HYdTrgJ62g2Vh2qVapak+RkZqte1YDQQyo6vXdAxdUK272sXBw6lc
 J9uVqNzWGmGg3Jg2dw07NgFkrKIXa0mWKeHK+/0UvqH1CoTYEDyMwZy8GWFdDMxChoig
 ybbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682524762; x=1685116762;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrre9aqgEQbSZyHIWwKTu4zL57afcUx7fRUJh1SSkM4=;
 b=atx4RxdotfhLo+qOd6d6taK4A1wgSMo68e+TdwOiOzjixu1V5PhAkhWljkiztHAGJN
 lsV7BkrZSOMRDDoFZy6aXmYlUJ3Ypkff+Vbf/goW3vLvaNdZ2nt2CfzGlu9bFOsWTZir
 NhMXANUFTcJFZrEaYj4rMprLsjo20iRtM52iBX8fYj7uJodqxb58nXYLMxHl/fkZ/ALf
 DWV0piWs7TbuPRsDjfjvvhjShEn1cdMnrUv8m0Vvtm5w72rPtBNAy7VxJ3HDCxR3o/NU
 lG8wwy1gFx92aVuLVbzzjlZomriqJLxwdxHimxMIOFV3fO3KmNR3VZdX7teYJO6gS7yJ
 BiUw==
X-Gm-Message-State: AC+VfDwS5U2sVGxmWdtmE1OOFUqJYKaZiMibn5NhMI0YI7x0Fb+B8JgF
 wU3tytvkbLJf9ipbruFSFJspMansBW52brgaD7n7Ga6KIknkAcN6C80r1+xde9LQ8jT0GdjyGXn
 etRMPk5X5mA7HkxSPR7ezKoCSxJeErw==
X-Received: by 2002:ac8:7dd1:0:b0:3f1:f14f:9fd1 with SMTP id
 c17-20020ac87dd1000000b003f1f14f9fd1mr685760qte.66.1682524762483; 
 Wed, 26 Apr 2023 08:59:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ682EpPX60ApEDWNOSP20XiTVztDEDMeocH7duyLPFGpA1QlsGiveTZYPcDhvyZXPldgfwiLQ==
X-Received: by 2002:ac8:7dd1:0:b0:3f1:f14f:9fd1 with SMTP id
 c17-20020ac87dd1000000b003f1f14f9fd1mr685705qte.66.1682524762117; 
 Wed, 26 Apr 2023 08:59:22 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i3-20020ac813c3000000b003ef3e8f8823sm5376042qtj.89.2023.04.26.08.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 08:59:21 -0700 (PDT)
Date: Wed, 26 Apr 2023 11:59:18 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH v8 5/8] memory: Allow disabling re-entrancy checking per-MR
Message-ID: <20230426155918.ctcm76ig3fyzonx6@mozz.bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
 <20230421142736.2817601-6-alxndr@bu.edu>
 <c6c5f756-c226-e091-c30c-97895a0234ed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6c5f756-c226-e091-c30c-97895a0234ed@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.196; envelope-from=alxndr@bu.edu;
 helo=esa8.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230425 0941, Thomas Huth wrote:
> On 21/04/2023 16.27, Alexander Bulekov wrote:
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> > ---
> >   include/exec/memory.h | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 6c0a5e68d3..4e9531bd8a 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -793,6 +793,9 @@ struct MemoryRegion {
> >       unsigned ioeventfd_nb;
> >       MemoryRegionIoeventfd *ioeventfds;
> >       RamDiscardManager *rdm; /* Only for RAM */
> > +
> > +    /* For devices designed to perform re-entrant IO into their own IO MRs */
> > +    bool disable_reentrancy_guard;
> >   };
> >   struct IOMMUMemoryRegion {
> 
> Oh, wait, that check for "!mr->disable_reentrancy_guard" has been squashed
> into the first patch now ... that's bad, I think you should squash this into
> the first patch now, too!
> 

Oh.. Thanks for catching that.

