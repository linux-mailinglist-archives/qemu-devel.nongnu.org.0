Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8545B9EAB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:23:46 +0200 (CEST)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqiP-0007bw-Gv
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYqge-0006BA-Ua
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:21:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYqgZ-0004Gz-AX
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663255310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/CFlJk7ste3ZReC/254Z5QCPO1PqISieUywIs1VTWqM=;
 b=T35+JYth9rQN+2xW2mN59JlnCfTWm/2mGXooVXcYrXurk3bBg6SOhx2SwTZYyGRHpAKtx0
 iWGls8WwnjRXHsFH2lYKWoJG3JKPZrnl8j9oAh7jnE1zaydah9uPDpmcpbQBTMs0JFLd1t
 83wE48UV4BxnqhgZSZVSri5RNcXFhLw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-VpPLLgUuMC6vVC-aC5FvVA-1; Thu, 15 Sep 2022 11:21:48 -0400
X-MC-Unique: VpPLLgUuMC6vVC-aC5FvVA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j16-20020adfb310000000b0022abebda18bso2719059wrd.1
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 08:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/CFlJk7ste3ZReC/254Z5QCPO1PqISieUywIs1VTWqM=;
 b=eBpk7dWmO5WMpU50KQoyetXygE/XZgaJPr/CZhNTKyUnHfdcRxyPTN2zq2d0IQ6Tq1
 KKnWjbOBQ2Qam3HuZ7ASDczkVWwRvkIQaNxJ17iHtrUC4w1VAGbCgT4JLiIz8tkKJZQr
 pL/HKBu3dDn647j3TdjKvXD8hItx+5kRwqwtAvbEK4ZhYlwgWAY00Atiy2rny2jeT/XG
 /LN619DWdEVRFraiXMJ6aJ1mDVyjDpc0QXNxi79sjA48jHIRajbG8tn1Pbx0WABHGkuM
 nQrbWnLSE5T15zUeFlct5CHXAQ0JNajanE5cxO5dz1vvap8HRFDscZR1yZFLjYBgSFP6
 WsJg==
X-Gm-Message-State: ACrzQf2PG4A2YbpjlYu4idz7r8vWjDGJJyooXg2FAJg3zyIos7mo423h
 /tgEUeE3ZSj1QnaD5CF8UN/foxE88TDEwEwpgCk0X1miNcbzWkRyqo6rN3C1JT0/eHahiv0M2B3
 Em5dmXM8ZjcfJzwI=
X-Received: by 2002:adf:d4c9:0:b0:228:de3a:220f with SMTP id
 w9-20020adfd4c9000000b00228de3a220fmr103404wrk.597.1663255307670; 
 Thu, 15 Sep 2022 08:21:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6dBDXQbk9QnK2WciJSxfgGkKRHb/ZaQUYVcVL53eKpLI44D4aIz6ddHugi/wMSf8ibMz3Uhw==
X-Received: by 2002:adf:d4c9:0:b0:228:de3a:220f with SMTP id
 w9-20020adfd4c9000000b00228de3a220fmr103383wrk.597.1663255307397; 
 Thu, 15 Sep 2022 08:21:47 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g3-20020a5d46c3000000b0022acb7195aesm2823258wrs.33.2022.09.15.08.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:21:46 -0700 (PDT)
Date: Thu, 15 Sep 2022 16:21:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Maximum QMP reply size
Message-ID: <YyNDCDH71oytYujr@work-vm>
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <CAFEAcA8Zy3RpTZM-gJk6ZZaUEf6huTuuK3C4-uSo6pYz8KCrMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Zy3RpTZM-gJk6ZZaUEf6huTuuK3C4-uSo6pYz8KCrMQ@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 6 Sept 2022 at 20:41, John Snow <jsnow@redhat.com> wrote:
> > Hi, I suspect I have asked this before, but I didn't write it down in
> > a comment, so I forget my justification...
> >
> > In the QMP lib, we need to set a buffering limit for how big a QMP
> > message can be -- In practice, I found that the largest possible
> > response was the QAPI schema reply, and I set the code to this:
> >
> >     # Maximum allowable size of read buffer
> >     _limit = (64 * 1024)
> >
> > However, I didn't document if this was a reasonable limit or just a
> > "worksforme" one. I assume that there's no hard limit for the protocol
> > or the implementation thereof in QEMU. Is there any kind of value here
> > that would be more sensible than another?
> >
> > I'm worried that if replies get bigger in the future (possibly in some
> > degenerate case I am presently unaware of) that the library default
> > will become nonsensical.
> 
> There are some QMP commands which return lists of things
> where we put no inherent limit on how many things there
> are in the list, like qom-list-types. We'd have to be getting
> a bit enthusiastic about defining types for that to get
> up towards 64K's worth of response, but it's not inherently
> impossible. I think using human-monitor-command to send
> an 'xp' HMP command is also a way to get back an arbitrarily
> large string (just ask for a lot of memory to be dumped).

We could put size limits on xp; most Humans will only dump a few kB
maximum like that, any larger and you can dump to file.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


