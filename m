Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14294494CA1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:17:31 +0100 (CET)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVRZ-0003SZ-Mb
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:17:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAV9v-0008Bn-5x
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:59:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAV9s-0000at-7J
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642676351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVbX3d9dOg9GMfLSoqJhNn1nFN7c1gXXh/Yze/j3LNk=;
 b=YdCmtqQl/iMM3wJU+h5qfDTu2MpReOZa1RtMkZJTO9KZDsupxeQyTI7PmoHpmcO/KsCnkV
 h1jvVQqvvU9+E+124NBLa+mzrTyyV7CpU0kpDRkVaH1ypE4a2EFEb2SWSw6xtxh7N2OPg7
 Hy2KKrGWLWg80msdQuhcDH1W5yAvAD4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-xcX7oWqlOpCONUFz2WSjmw-1; Thu, 20 Jan 2022 05:59:05 -0500
X-MC-Unique: xcX7oWqlOpCONUFz2WSjmw-1
Received: by mail-pj1-f71.google.com with SMTP id
 d92-20020a17090a6f6500b001b35ac5f393so3770393pjk.7
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TVbX3d9dOg9GMfLSoqJhNn1nFN7c1gXXh/Yze/j3LNk=;
 b=TLx+k+2Djx6GGFGtrCIPKSAZgGF760havXbxE7JLE20x3UIrUkzCCQaEbjCeMQFrJP
 gu8MrgfzRaom3rVBwmfjIvvnycBgfvZNJJptFDbgXnL33Wij0KQ1YmLZUFh94PbhEpPS
 sufyJvbN3F1tWDyZF0fxYpyLcM/awycLhgOm+E74XekqmSY9i1V8/gpVExVkKY4nlXAo
 DJF7zbVi1CigYvWIX84TxqTEM6y3x5wusDnfejjITs6OijiCGeU69z7RP3bfy9u3UqWv
 L9uG3vbwAJKQfyErEso3wbb7sCz22nGfHmte8DyW7PSt8ko+tiKL8idvvfhdvtGKg5ZU
 AAAg==
X-Gm-Message-State: AOAM531Bes5QHa7nJ8OeytYuB2QAdHXIPDPRzitbXsXNtWdjCco1EJIo
 S5cxXX76xKiG9YV/bNR/c77XQOVmS6RP3CiFdCzVSVNP1Qu8n4SL+i+bzBdSOvyT1Ju8hL/motQ
 c8zWPPGTo8cHSfps=
X-Received: by 2002:a05:6a00:8cb:b0:4bc:3def:b616 with SMTP id
 s11-20020a056a0008cb00b004bc3defb616mr35558334pfu.18.1642676344045; 
 Thu, 20 Jan 2022 02:59:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfGMZktvFiBsu+WpVZ0CJdC0F3xbqSSvO9GZ7W620py0rbqzVlUMx17I7yqPHEvD6ObqF0Rg==
X-Received: by 2002:a05:6a00:8cb:b0:4bc:3def:b616 with SMTP id
 s11-20020a056a0008cb00b004bc3defb616mr35558303pfu.18.1642676343682; 
 Thu, 20 Jan 2022 02:59:03 -0800 (PST)
Received: from xz-m1.local ([94.177.118.145])
 by smtp.gmail.com with ESMTPSA id f4sm2970276pfe.204.2022.01.20.02.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 02:59:03 -0800 (PST)
Date: Thu, 20 Jan 2022 18:58:55 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <YelAbyxRXDbRm8WC@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <d34dbb85-f8a9-cb21-a312-a4f4f3cafd07@chinatelecom.cn>
 <Yekqn90HOtFMWupM@xz-m1.local>
 <53783d89-ee0c-0704-5bf2-a2552376bfec@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <53783d89-ee0c-0704-5bf2-a2552376bfec@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 06:03:45PM +0800, Hyman Huang wrote:
> 
> 
> 在 2022/1/20 17:25, Peter Xu 写道:
> > On Thu, Jan 20, 2022 at 04:26:09PM +0800, Hyman Huang wrote:
> > > Hi，Peter. I'm working on this problem and found the reason is kind of the
> > > same as i metioned in cover letter of v10, the following is what i posted:
> > > 
> > >    2. The new implementaion of throttle algo enlightened by Peter
> > >       responds faster and consume less cpu resource than the older,
> > >       we make a impressed progress.
> > > 
> > >       And there is a viewpoint may be discussed, it is that the new
> > >       throttle logic is "passive", vcpu sleeps only after dirty ring,
> > >       is full, unlike the "auto-converge" which will kick vcpu instead
> > >       in a fixed slice time. If the vcpu is memory-write intensive
> > >       and the ring size is large, it will produce dirty memory during
> > >       the dirty ring full time and the throttle works not so good, it
> > >       means the throttle depends on the dirty ring size.
> > > 
> > >       I actually tested the new algo in two case:
> > > 
> > >       case 1: dirty-ring-size: 4096, dirtyrate: 1170MB/s
> > >       result: minimum quota dirtyrate is 25MB/s or even less
> > >               minimum vcpu util is 6%
> > > 
> > >       case 2: dirty-ring-size: 65536, dirtyrate: 1170MB/s
> > >       result: minimum quota dirtyrate is 256MB/s
> > >               minimum vcpu util is 24%
> > > 
> > >       I post this just for discussion, i think this is not a big deal
> > >       beacase if we set the dirty-ring-size to the maximum value(65536),
> > >       we assume the server's bandwidth is capable of handling it.
> > 
> > My memory is that I tested your v10 (which has this wait-at-ring-full logic)
> > already and at that time it worked well.
> > 
> > It's possible that I just got lucky with v10, so that can happen with some
> > random conditions and so far we still don't know how to hit it.
> Uh, sorry for not explaining the reason clearly. I think the reason of
> failing to throttle is "vcpu loss chance to sleep", i trace the
> kvm_dirty_ring_full event and found that when throttling a vcpu works bad,
> the kvm_dirty_ring_full event do no arise and sleep never happens
> correspondingly.

I see, that's fine.  I think I'll just try the new version when it's ready.

> 
> Two case lead to this result:
> case 1: dirty-ring-size is large and the ring full time is long, not all
> dirty ring of vcpu get full at one time, so there must be some vcpus that
> miss the chance to sleep.
> 
> case 2: guest has many vcpus, not all dirty ring of vcpu get full at one
> time. So miss the chance of sleeping too as above.

I am just not sure whether my test case matches any of above: I'm using 4096
which is the smaller ring size, meanwhile I only have 1 busy dirty thread,
iirc.

-- 
Peter Xu


