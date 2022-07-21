Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE07257D180
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:30:31 +0200 (CEST)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZ4I-0002CS-Oc
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEZ2b-0000bL-UY
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEZ2V-00066I-VD
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658420918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=466lMBQHrR9R90V+5w2Z2LmKnSJjXN/EpL0Pu6BGhpQ=;
 b=Y6DTDIIHnF5iYTt9u5aCjDz6lyDz0yd1Hr/jeC1mjzo6mTCZP2RFyn2lKCQqgSmAhO6Pqe
 CzlQbPq6KYw1TN2KLOJ1S7l1weEgQ29JNSDO8kzYouTMFGDgYTvBXIxQYZxdYpJWFpjqOl
 6kPPsS+bjwkodHljR2kL4sBbFH6qIxU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-gMgfdDxcN16zkg0SP1HEEg-1; Thu, 21 Jul 2022 12:28:37 -0400
X-MC-Unique: gMgfdDxcN16zkg0SP1HEEg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r10-20020a05600c284a00b003a2ff6c9d6aso3006314wmb.4
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=466lMBQHrR9R90V+5w2Z2LmKnSJjXN/EpL0Pu6BGhpQ=;
 b=jsTmzZuzYpgJN4seFDLQ580deUeBAkzA7ftKADyJG4dBfm7mc6X340TbXVa+CHn/IQ
 QnTVUQ/SAhIbjmbm4U2Wowl9cup4Cvbr7ifUuSLUeW3gz4JMVeUMkwwSRh8O38SvBusf
 18ySOy53tkLseAZKPPpBBs0JY/PQd4AgE5ymv/GpaPuaSu3haWZRM2WhypcYLN+yv4j9
 c16JIEylEkXxGX95kMwxnws8RXezEeZD9l0rAwT5TR127cm6i6pwSnc81OTLSHgWLbjd
 2gO/DGtxX8xKUa1OI3+EbzbxkjwIvmVKQzrwpELqYgbWPtKEJS99itWKKIIvPd191NwS
 MEoQ==
X-Gm-Message-State: AJIora+Fc8eDeLA7Or7vZiFECH/xnxF5qX4fFn3Y53mxf02ZGR3vZaL/
 B4oEDG6PaEt+H7+FQHnkMd5A1295HzcXNJrJsBw3+Z7k/hSTOMm3rxWAXYS9aC7W/gvKna2Tilb
 aOxD5edotrTkNPy4=
X-Received: by 2002:a05:600c:3ac3:b0:3a0:45b6:7efb with SMTP id
 d3-20020a05600c3ac300b003a045b67efbmr8859543wms.183.1658420916260; 
 Thu, 21 Jul 2022 09:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twBZLm2PMuWnEW0q1Ne5esBo3eaLeC1KgkPcdyJwoHTIbvUF9DCqTVe/DNtzpONmj7Ogza5Q==
X-Received: by 2002:a05:600c:3ac3:b0:3a0:45b6:7efb with SMTP id
 d3-20020a05600c3ac300b003a045b67efbmr8859523wms.183.1658420915983; 
 Thu, 21 Jul 2022 09:28:35 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 s2-20020a7bc382000000b003a3253b705dsm2307707wmj.35.2022.07.21.09.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:28:35 -0700 (PDT)
Date: Thu, 21 Jul 2022 17:28:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Zhao, Zhou" <zhou.zhao@intel.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Xu, Ling1" <ling1.xu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "Jin, Jun I" <jun.i.jin@intel.com>
Subject: Re: [PATCH 1/1] Add AVX512 support for xbzrle_encode_buffer function
Message-ID: <Ytl+sTUEGqt1axfW@work-vm>
References: <20220721103147.96608-1-ling1.xu@intel.com>
 <20220721103147.96608-2-ling1.xu@intel.com>
 <YtlshIteVijWePbd@redhat.com>
 <DM6PR11MB28126DAC62A921E5551C1400F5919@DM6PR11MB2812.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR11MB28126DAC62A921E5551C1400F5919@DM6PR11MB2812.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

* Zhao, Zhou (zhou.zhao@intel.com) wrote:
> Hi dainel:
>   Cause our code depend on intel intrinsics lib implement. And this lib depend on macro like  " AVX512BW ". This macro need compile time check to enable some machine options . if you only use that utility to do runtime check ,you will met compile issue. And also if we want to save cpu time , we'd better check it in compile time.

You need to do *both*:

  a) You need to check at compile time to see if you have the
intrinsics.
  b) You need to check at runtime to see if you're running on a suitable
CPU.

Other things to note (I've not checked the algorithm yet):
  c) The patch needs splitting up into compile checks, the algorithm,
the tests as at least 3 patches.
  d) The test includes a benchmark, we don't need to include a benchmark
program in the code, just something to check it works.
  e) The benchmark is a microbenchmark on the routine; what's it's
effect on the whole migration - is it significant?
  f) xbzrle isn't actually used that much these days, so I'm not sure
generally it's worth it.

Dave

> -----Original Message-----
> From: Daniel P. Berrangé <berrange@redhat.com> 
> Sent: Thursday, July 21, 2022 11:11 PM
> To: Xu, Ling1 <ling1.xu@intel.com>
> Cc: qemu-devel@nongnu.org; quintela@redhat.com; dgilbert@redhat.com; Zhao, Zhou <zhou.zhao@intel.com>; Jin, Jun I <jun.i.jin@intel.com>
> Subject: Re: [PATCH 1/1] Add AVX512 support for xbzrle_encode_buffer function
> 
> On Thu, Jul 21, 2022 at 06:31:47PM +0800, ling xu wrote:
> > This commit adds AVX512 implementation of xbzrle_encode_buffer 
> > function to accelerate xbzrle encoding speed. Compared with C version 
> > of xbzrle_encode_buffer function,
> > AVX512 version can achieve almost 60%-70% performance improvement on unit test provided by qemu.
> > In addition, we provide one more unit test called 
> > "test_encode_decode_random", in which dirty data are randomly located in 4K page, and this case can achieve almost 140% performance gain.
> > 
> > Signed-off-by: ling xu <ling1.xu@intel.com>
> > Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> > Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> > ---
> >  configure                | 434 ++++++++++++++++++++++++++++++++++++++-
> >  migration/ram.c          |   6 +
> >  migration/xbzrle.c       | 177 ++++++++++++++++
> >  migration/xbzrle.h       |   4 +
> >  tests/unit/test-xbzrle.c | 307 +++++++++++++++++++++++++--
> >  5 files changed, 908 insertions(+), 20 deletions(-)
> 
> > diff --git a/migration/ram.c b/migration/ram.c index 
> > 01f9cc1d72..3b931c325f 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -747,9 +747,15 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
> >      memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
> >  
> >      /* XBZRLE encoding (if there is no overflow) */
> > +    #if defined(__x86_64__) && defined(__AVX512BW__)
> > +    encoded_len = xbzrle_encode_buffer_512(prev_cached_page, XBZRLE.current_buf,
> > +                                       TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> > +                                       TARGET_PAGE_SIZE);
> > +    #else
> >      encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
> >                                         TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> >                                         TARGET_PAGE_SIZE);
> > +    #endif
> 
> Shouldn't we be deciding which impl using a runtime check of the current CPUID, rather than a compile time check ? I'm thinking along the lines of what util/bufferiszero.c does to select different optimized versions based on CPUID. The build host CPU features can't be expected to match the runtime host CPU features.
> 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


