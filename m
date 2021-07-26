Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8A3D592B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:09:06 +0200 (CEST)
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zPt-00085l-0X
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zOr-0007Q4-Cu
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zOn-0005PU-Bw
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627301275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llogEDAElGVEfel9i7J/iWCrKrtwsaQRi0akrGXlSpU=;
 b=NykcqBN5MNv9Pj3uKjZ6Z5/IBS8mesmWMZdAlDKUpzr0ehOJtJAtD94CuYkduhHP98/QfW
 26WAjmGyzymj2KF3ZifloTuO+QKclwPbsteIFtFhtnXC1U9fQpXk5aVk3PPVRP63pL1RSh
 H7NNDfBtd3WPKpWBN3/FTVPo1ZoGzWw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-vmy_ZO1jPdW3j4V2UuqeGw-1; Mon, 26 Jul 2021 08:07:54 -0400
X-MC-Unique: vmy_ZO1jPdW3j4V2UuqeGw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so4702299wrl.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 05:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=llogEDAElGVEfel9i7J/iWCrKrtwsaQRi0akrGXlSpU=;
 b=XulozDlyt0/MxatO/E+UjJ3iVAddmdJnej2GOsPRqgq5UWx4oEMivcLAl3PH9zSwFO
 Iiq2vOmDtP5COrrxMzmwR1pkJ9HQTI/J7v5ZYx4pDuf3+vTcc11dzH3xTnLe5MODPIKS
 2ftkkCrFi5EyMctITPp+wXEp3IrYa/7Lm8PudVBvy2St33bE99zq745MLSbRMmZTtIrR
 zdBZdqLFmRsU2jXJPPE/5IxgMkE7bIAoxTMr5L/oTaq3lzV/pvgcun4Mn7MOWsTUpqFT
 YtgAM50SpFaste6Rs1hYUrRDM/EMF7GIs8lGuA1LXC8odFPucKbz2JQXbwLrAgToRC6s
 VjxA==
X-Gm-Message-State: AOAM531Xfgr2jyBYOJUk4/n5e+7lF5Lc8mTW/5Wgmr7nO+xT3qLGvp1g
 a0BdNSMfNa8+v+mIOFJw2x9AeRxSBPhlHcBoyvU88yYJQZC2B1hDJS2PtBwlobGZErxvnjDdTBK
 xM8DSJ+/EiRIQC70=
X-Received: by 2002:a05:6000:2a9:: with SMTP id
 l9mr18813955wry.75.1627301272996; 
 Mon, 26 Jul 2021 05:07:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6NRdIpMbtCd4+QL49wExtVc4l6VZyNTZ/0oJT24lZn/YHiVFwqiCOkW17rMNsQrMoISAx0A==
X-Received: by 2002:a05:6000:2a9:: with SMTP id
 l9mr18813930wry.75.1627301272739; 
 Mon, 26 Jul 2021 05:07:52 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id g138sm43125753wmg.32.2021.07.26.05.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 05:07:52 -0700 (PDT)
Date: Mon, 26 Jul 2021 13:07:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: Prefetches in buffer_zero_*
Message-ID: <YP6llgVw1lN0U58h@work-vm>
References: <YPlCJpMIOb2Umc+Z@work-vm>
 <092f9b8b-4a14-d059-49be-010b760828aa@linaro.org>
 <YPnDdT1VYANI0Wzw@work-vm>
 <CA+c1WK7XCgdYTbG5FK3q=x9S1t2p2vxcreEwtiZf5L=rsg0i6g@mail.gmail.com>
 <YP52r9ck8jmV/RkR@work-vm>
 <bcbca5e4-d804-2a2f-2dff-4b19f4ef07cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bcbca5e4-d804-2a2f-2dff-4b19f4ef07cf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Joe Mario <jmario@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> +Lukáš
> 
> On 7/26/21 10:47 AM, Dr. David Alan Gilbert wrote:
> > * Joe Mario (jmario@redhat.com) wrote:
> >> On Thu, Jul 22, 2021 at 3:14 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> wrote:
> >>
> >>> * Richard Henderson (richard.henderson@linaro.org) wrote:
> >>>> On 7/22/21 12:02 AM, Dr. David Alan Gilbert wrote:
> >>>>> Hi Richard,
> >>>>>    I think you were the last person to fiddle with the prefetching
> >>>>> in buffer_zero_avx2 and friends; Joe (cc'd) wondered if explicit
> >>>>> prefetching still made sense on modern CPUs, and that their hardware
> >>>>> generally figures stuff out better on simple increments.
> >>>>>
> >>>>>    What was your thinking on this, and did you actually measure
> >>>>> any improvement?
> >>>>
> >>>> Ah, well, that was 5 years ago so I have no particular memory of this.
> >>> It
> >>>> wouldn't surprise me if you can't measure any improvement on modern
> >>>> hardware.
> >>>>
> >>>> Do you now measure an improvement with the prefetches gone?
> >>>
> >>> Not tried, it just came from Joe's suggestion that it was generally a
> >>> bad idea these days; I do remember that the behaviour of those functions
> >>> is quite tricky because there performance is VERY data dependent - many
> >>> VMs actually have pages that are quite dirty so you never iterate the
> >>> loop, but then you hit others with big zero pages and you spend your
> >>> entire life in the loop.
> >>>
> >>>
> >> Dave, Richard:
> >> My curiosity got the best of me.  So I created a small test program that
> >> used the buffer_zero_avx2() routine from qemu's bufferiszero.c.
> > 
> > Thanks for testing,
> > 
> >> When I run it on an Intel Cascade Lake processor, the cost of calling
> >> "__builtin_prefetch(p)" is in the noise range .  It's always "just
> >> slightly" slower.  I doubt it could ever be measured in qemu.
> >>
> >> Ironically, when I disabled the hardware prefetchers, the program slowed
> >> down over 33%.  And the call to "__builtin_prefetch(p)" actually hurt
> >> performance by over 3%.
> > 
> > Yeh that's a bit odd.
> > 
> >> My results are below, (only with the hardware prefetchers enabled).  The
> >> program is attached.
> >> Joe
> >>
> >> # gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH ; for i in {1..5}; do
> >> ./a.out; done
> >> TSC 356144 Kcycles.
> >> TSC 356714 Kcycles.
> >> TSC 356707 Kcycles.
> >> TSC 356565 Kcycles.
> >> TSC 356853 Kcycles.
> >> # gcc -mavx buffer_zero_avx.c -O ; for i in {1..5}; do ./a.out; done
> >> TSC 355520 Kcycles.
> >> TSC 355961 Kcycles.
> >> TSC 355872 Kcycles.
> >> TSC 355948 Kcycles.
> >> TSC 355918 Kcycles.
> > 
> > This basically agrees with the machines I've just tried your test on -
> > *except* AMD EPYC 7302P's - that really like the prefetch:
> > 
> > [root@virtlab720 ~]# gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH ; for i in {1..5}; do ./a.out; done
> > TSC 322162 Kcycles.
> > TSC 321861 Kcycles. 
> > TSC 322212 Kcycles. 
> > TSC 321957 Kcycles.
> > TSC 322085 Kcycles. 
> >  
> > [root@virtlab720 ~]# gcc -mavx buffer_zero_avx.c -O ; for i in {1..5}; do ./a.out; done
> > TSC 377988 Kcycles. 
> > TSC 380125 Kcycles. 
> > TSC 379440 Kcycles.
> > TSC 379689 Kcycles. 
> > TSC 379571 Kcycles. 
> >  
> > The 1st gen doesn't seem to see much difference with/without it.
> > 
> > Probably best to leave this code as is!
> 
> Regardless the decision of changing the code or not, it would be
> nice to have this test committed in the repository to run
> performance regression testing from time to time.

It could be, although this is a slightly odd microtest for that; it's a bit
specific (the avx2 variant, and only really testing the all zero case).


Dave

> >> /*
> >>  * Simple program to test if a prefetch helps or hurts buffer_zero_avx2.
> >>  *
> >>  * Compile with either:
> >>  *  gcc -mavx buffer_zero_avx.c -O 
> >>  * or
> >>  *  gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH 
> >>  */
> >>
> [...]
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


