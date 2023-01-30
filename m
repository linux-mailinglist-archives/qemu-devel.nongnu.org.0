Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A9D681FFC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:51:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdui-000753-Fw; Mon, 30 Jan 2023 18:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pMdue-00074U-Bb
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:50:13 -0500
Received: from esa13.hc2706-39.iphmx.com ([216.71.137.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pMdua-0004FS-Iz
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:50:11 -0500
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 254979392
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:psNa9q9MB9SUQ1nJYCaDDrUDPnyTJUtcMsCJ2f8bNWPcYEJGY0x3y
 mpNDTuCP/mLMGKhKd4kbYjgoxwGv8eHmNRrGgRrqikxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jeTQHOGU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNLg06/gEk35q+q4WhA5gdWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJHFsHcom3sBSOnxpz
 doGdj4PP1e73+3jldpXSsE07igiBMziPYdao3I5iD+DVa5gTpfETKHHo9Rf2V/chOgURaeYN
 5dfM2A1Kk6YO3WjOX9OYH46tO6sln/zaRVStRSYqbdfD237llEtgee8a4uPEjCMbcREkXmU/
 mXPxGCnPBY2Gdu/8x+Zrm3504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6LExrQmlFIGlGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYYADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:mZmKY6u/LARvKnUXSbS3y++j7skCLoMji2hC6mlwRA09TyXGra
 ze58jzhCWY+U4ssS8b86H4BEDmewKtyXcV2/hhAV7GZmaJhILGFvAW0WKP+UySJ8URntQtl5
 uJXcBFeZ7N5BtB/InHCDDRKadh/DD/ytHsuQ9qpE0dAT2CFZsQmDuRezzrYHGeHzM2SKbRfa
 D0jqE3wEvbCAhnEPhXHkN1ItQr5ee74q4OTiRnO/dN0nj7sdrH0s+yL/BYti1uNw+nAo1Skl
 QtUTaZ2k0S2MvLiyM0G1Wjjai+4OGRgueqCae3+4IowsWGsHfiWG2pYczmzVZF392H2RIRid
 HJ5z0gM85w536UXmbwjwDqxxCI6kdh10Pf
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jan 2023 18:50:04 -0500
Received: by mail-qk1-f200.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso8136680qkp.20
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mWLYugE/rwOc02eWd49fpjotiK/bDSF9evZ4DUOTdvM=;
 b=gT21WoZBiShpGznUJEPxP4BJoAjWSb16LX9Vo04I8d2+21ngCzNFWYrnQQDkklzChW
 QfHbKfxjtXmtvQTmPVMFNFXpLe9h808gFNFPSgMb+s/ja/0mSd8Vk51GHecsw+KUCY/u
 1bikKA0ontnVNg/cJzBsyYU6Ku0mej1yw9qmmBgV4LycH/WF7ouAN/Lhk4rp2T6rq0ye
 iOAhQZYLQgTgRLYfbzO/fqc2SGzTDegnAc3yJVEdpSW9vyXxIukqVYwAWK5bGPdfTNz+
 lrFQBfon1hdu863isJ4ifTkDtPtJDtBWhJmCD+OqQoeW9KTK22NmXq3JQZ1pZ+8g5iKF
 Ph3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWLYugE/rwOc02eWd49fpjotiK/bDSF9evZ4DUOTdvM=;
 b=38pN1hFr8PaAk/MAyZ141JXAjGVIFSgRMijxSot+J+FAoYWQHBchITYueVapgfSE8X
 Myb+TNYflVo5oT5b9qRyPD+fGoKV0mxVyJtaFp+RdMPZxdhY3ZGaPPIhmlhVqTlr6PKi
 l839wP2D5w46tM2ol4Nu5ILRdd7MzPmcZrAlh5jPlqgWhkwwsogpDSwdn/NV02PxLPnU
 9F7GY4bxnrAs4t1sdLqK+JOe57gkU1A0LqBhoQA1dmiQpjvcDcLKDRm006Y7+N3LZM/m
 9Vc3m26P+/rAN/YkEkIX2PKOMCEeNMBCQWmjdc+N7TQklFq91nTyrxbwPctIWfYT4oYZ
 Jk7Q==
X-Gm-Message-State: AO0yUKXXGJIw1Ip0TDWnnS67VhLyRfI3cH9vOzo9NiTAUbVx7FdtBwDw
 OViJ81O9ppYYo4qf2H7KS3qxy/4q3eJpZrB8yLBgy4KgLpb8uLAN8cVGYWhsPkLIwTyOKfk2P6c
 BiGCrk0x12u1WAzUbJH0M/X55+bxqcA==
X-Received: by 2002:a05:622a:1016:b0:3b8:248b:a035 with SMTP id
 d22-20020a05622a101600b003b8248ba035mr25854263qte.19.1675122603345; 
 Mon, 30 Jan 2023 15:50:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+9dGM7wc1d1DG3MWgSSAXn0mWALwlr98L4b761rrjZpUBXzeED05V1tl0HKRYo0MIpVg7M4g==
X-Received: by 2002:a05:622a:1016:b0:3b8:248b:a035 with SMTP id
 d22-20020a05622a101600b003b8248ba035mr25854238qte.19.1675122603062; 
 Mon, 30 Jan 2023 15:50:03 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05620a17a900b0071a49ac0e05sm1290576qkb.111.2023.01.30.15.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 15:50:02 -0800 (PST)
Date: Mon, 30 Jan 2023 18:49:58 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Xu <peterx@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] softmmu: Use memmove in flatview_write_continue
Message-ID: <20230130234958.rd3ybsbxpymbz5tw@mozz.bu.edu>
References: <20230130135152.76882-1-akihiko.odaki@daynix.com>
 <20230130200300.be736j6ya5srnphb@mozz.bu.edu>
 <Y9gobLLlMrBnJeZi@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9gobLLlMrBnJeZi@x1n>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.83; envelope-from=alxndr@bu.edu;
 helo=esa13.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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

On 230130 1528, Peter Xu wrote:
> On Mon, Jan 30, 2023 at 03:03:00PM -0500, Alexander Bulekov wrote:
> > On 230130 2251, Akihiko Odaki wrote:
> > > We found a case where the source passed to flatview_write_continue() may
> > > overlap with the destination when fuzzing igb, a new proposed network
> > > device with sanitizers.
> > > 
> > > igb uses pci_dma_map() to get Tx packet, and pci_dma_write() to write Rx
> > > buffer. While pci_dma_write() is usually used to write data from
> > > memory not mapped to the guest, if igb is configured to perform
> > > loopback, the data will be sourced from the guest memory. The source and
> > > destination can overlap and the usage of memcpy() will be invalid in
> > > such a case.
> > > 
> > > While we do not really have to deal with such an invalid request for
> > > igb, detecting the overlap in igb code beforehand requires complex code,
> > > and only covers this specific case. Instead, just replace memcpy() with
> > > memmove() to torelate overlaps. Using memmove() will slightly damage the
> > > performance as it will need to check overlaps before using SIMD
> > > instructions for copying, but the cost should be negiligble, considering
> > > the inherent complexity of flatview_write_continue().
> > > 
> > > The test cases generated by the fuzzer is available at:
> > > https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> > > 
> > > The fixed test case is:
> > > fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805
> > > 
> > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > 
> > Since this is called fairly often, I went down a rabit hole looking at
> > memmove vs memcpy perf, but It looks like this should not be much of a
> > problem.
> 
> Similar here. I quickly had a look at the dump of memmove() and it seems to
> me it's directly invoking the SIMD instructions.  I'm not sure whether it
> means in many cases the SIMD insts are compatible with overlapped buffers
> already, so it can be mostly the same as memcpy() in modern hardwares.
> 
> > 
> > Acked-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> I received this reply from Alexander Bulekov, but I think this is the
> author's contact?

Sorry about that!
Acked-by: Alexander Bulekov <alxndr@bu.edu>

> 
> Thanks,
> 
> -- 
> Peter Xu
> 

