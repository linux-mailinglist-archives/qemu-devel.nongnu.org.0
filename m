Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA9C5FD7D0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:34:33 +0200 (CEST)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivXs-0001sv-8Q
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiv0K-0002i4-RE
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:59:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiv0F-00025M-NU
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665655185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nby4cSvTo9TtPh8r+KWYc12c+Ib/tx90i3oIEwNj/lc=;
 b=Z/ilJ74iRxOMejzTepMNjxjIvcsa9dpdqJYuXfPvqmP2viwtr37aO/6WpZZJ9O9/3g/+j7
 Ze7VAnYNeCR+H53ufidrx0dIcuXsWEXp1lERtwynkh3Qrt+ktYFdNy6CUcNL2x5H+waQCu
 yp2FkjlP/rT31GUfh4zci6U0DGQ2bmw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-CN5UasMTNdaePUtqgVbvuw-1; Thu, 13 Oct 2022 05:59:44 -0400
X-MC-Unique: CN5UasMTNdaePUtqgVbvuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 2-20020a05600c268200b003c4290989e1so615328wmt.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 02:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nby4cSvTo9TtPh8r+KWYc12c+Ib/tx90i3oIEwNj/lc=;
 b=ATRxEs+sJJ7dqez5T4jHjx1n7MQzZZUX+qRIbrf1qv01ki8mIB9ZHw3S37pnZkBLKF
 Tmd6byYCtML+inqnt0kzIZBY0HACWnfbprYImBAsSfzgLJ5+tq5C7g8bNx2rYtuWKLH6
 ypWjsa5E2q39LF+pLrQ2xyZyocoByLmmZUZ0eM5dQu8//+2ArBKjK48FemjeWltYEcBF
 40AXnY3D7Yi6syc8bCeZKJ1aYaJSh3wZSiFOa2/rOBavoO8HZwNrzMEGkoh9sYaVhdPg
 +tEHXcm4Xia6VPIRYfiPngFGoLdlbgG16RpotchzTWzm20jtVnl9N6lHMsrcUhJBWFVz
 0x7Q==
X-Gm-Message-State: ACrzQf3WRwQ+tOnrR0cOSRj+3wII86GTyOoufwH1bb+6XOfjS+AW06RS
 e77fj4mF/Zo1SHxViZhSc3Z0Clm5Hxc2QNFsIgA2bHAzpOocoevHmKuxUwjCxwkZT8i+EfJ6PaQ
 b5ZwtS3rpPNhLuXI=
X-Received: by 2002:a05:600c:58a:b0:3c6:1627:94cc with SMTP id
 o10-20020a05600c058a00b003c6162794ccmr5871446wmd.122.1665655183275; 
 Thu, 13 Oct 2022 02:59:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4CYLvKfErwoHrUKONLFFHOY04+GAw9UxzVBsZ9xzK2VHBfH92snJ5HxJD6nLoMyQWVhFFiDw==
X-Received: by 2002:a05:600c:58a:b0:3c6:1627:94cc with SMTP id
 o10-20020a05600c058a00b003c6162794ccmr5871430wmd.122.1665655183018; 
 Thu, 13 Oct 2022 02:59:43 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i16-20020adfe490000000b0022a2bacabbasm1695199wrm.31.2022.10.13.02.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 02:59:42 -0700 (PDT)
Date: Thu, 13 Oct 2022 10:59:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrea Parri <andrea@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Message-ID: <Y0fhi2/hcvb37uiO@work-vm>
References: <YzXvIKVeFcHQ3ZQI@work-vm>
 <mhng-36837e18-1883-443f-85a7-69010d5d38ef@palmer-ri-x1c9>
 <YzqhAdsGwC0so55O@work-vm> <Y0fX/VloiH7Bqewm@andrea>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0fX/VloiH7Bqewm@andrea>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

* Andrea Parri (andrea@rivosinc.com) wrote:
> > > > Is x86's brand of memory ordering strong enough for Ztso?
> > > > I thought x86 had an optimisation where it was allowed to store forward
> > > > within the current CPU causing stores not to be quite strictly ordered.
> 
> [...]
> 
> > then a bit further down, '8.2.3.5 Intra-Processor Forwarding Is Allowed'
> > has an example and says
> > 
> >     'The memory-ordering model allows concurrent stores by two processors to be seen in
> >     different orders by those two processors; specifically, each processor may perceive
> >     its own store occurring before that of the other.'
> > 
> > Having said that, I remember it's realyl difficult to trigger; it's ~10
> > years since I saw an example to trigger it, and can't remember it.
> 
> AFAICT, Ztso allows the forwarding in question too.  Simulations with
> the axiomatic formalization confirm such expectation:

OK that seems to be what it says in:
https://five-embeddev.com/riscv-isa-manual/latest/ztso.html
  'In both of these memory models, it is the that allows a hart to
forward a value from its store buffer to a subsequent (in program order)
load—that is to say that stores can be forwarded locally before they are
visible to other harts'

> RISCV intra-processor-forwarding
> {
> 0:x5=1; 0:x6=x; 0:x8=y;
> 1:x5=1; 1:x6=y; 1:x8=x;
> }
>  P0          | P1          ;
>  sw x5,0(x6) | sw x5,0(x6) ;
>  lw x9,0(x6) | lw x9,0(x6) ;
>  lw x7,0(x8) | lw x7,0(x8) ;
> exists
> (0:x7=0 /\ 1:x7=0 /\ 0:x9=1 /\ 1:x9=1)

(I'm a bit fuzzy reading this...)
So is that the interesting case - where x7 is saying neither processor
saw the other processors write yet, but they did see their own?


So from a qemu patch perspective, I think the important thing is that
the flag that's defined, is defined and commented in such a way that
it's obvious that local forwarding is allowed; we wouldn't want someone
emulating a stricter CPU (that doesn't allow local forwarding) to go and
use this flag as an indication that the host cpu is that strict.

Dave

> Test intra-processor-forwarding Allowed
> States 4
> 0:x7=0; 0:x9=1; 1:x7=0; 1:x9=1;
> 0:x7=0; 0:x9=1; 1:x7=1; 1:x9=1;
> 0:x7=1; 0:x9=1; 1:x7=0; 1:x9=1;
> 0:x7=1; 0:x9=1; 1:x7=1; 1:x9=1;
> Ok
> Witnesses
> Positive: 1 Negative: 3
> Condition exists (0:x7=0 /\ 1:x7=0 /\ 0:x9=1 /\ 1:x9=1)
> Observation intra-processor-forwarding Sometimes 1 3
> Time intra-processor-forwarding 0.00
> Hash=518e4b9b2f0770c94918ac5d7e311ba5
> 
>   Andrea
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


