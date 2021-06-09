Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019293A1D61
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:58:37 +0200 (CEST)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3PP-0005bp-Rv
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr3O1-0004i5-RY
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr3Nz-0008UH-Eh
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623265026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PFI+n5xs/1S+MSJ64VLiheX3EV/4XlIQrzTlr3+TnYs=;
 b=JoSrxI+TUOYSnrhg9sBe4DhSk05HfSdO+3fgIQkXUM9gzUKK2cHM668f7Iu6IluWxShP79
 /b6BdIw31rP8aO5zGDPfr/u8/y3XnKhN39k8gmiiAO+YWxExLtO2lj+Rq0ah5tDEOdQeT+
 IbKdYDkRtU5pKlLTLd79tRZC/u4FX64=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-1qVh20SgPPyLShuhseWXZA-1; Wed, 09 Jun 2021 14:57:05 -0400
X-MC-Unique: 1qVh20SgPPyLShuhseWXZA-1
Received: by mail-qk1-f197.google.com with SMTP id
 k15-20020a05620a138fb02903aadd467ff1so5348228qki.7
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PFI+n5xs/1S+MSJ64VLiheX3EV/4XlIQrzTlr3+TnYs=;
 b=oFxCyWORBVDXGdA7i8e5W3XaecC6T4tZxqWwwFCaiwlrag/kkooG1izH8e6iu17QGp
 3F6y7+NLfVtmPsroILxxlFnsR0fObGY3tjeqAin1ltdc5xHfv1eraFF6llBFn4RHKH+a
 frxtDj/NSbTiGVo1H1Vo1G19bKppSbXnh+KIOQQ67U3Q1Dyu7/ZBwzwnHnIGj+coeLoX
 4qSxTydtSI0AQC3UEE0WuhT0V9fFQI1Ds+cqFd/Rk1mvF1LN8JJsKaXNE4+9xAXPjSGM
 AM5Y4NCqA32zZ0mYOz85ru3zTD4Kzx9lZsdH+FbHsMoJjy4tb9PYsAQDycYAfx0RPUDG
 CO2A==
X-Gm-Message-State: AOAM530uh15b6P5L8sqvc+TS2XStMvOxmq3Rhdw0kIBILJ0YiTaJfEzw
 6ae8Hm103ZaXi6m2678dlBpboJO6vNYB6c3y1/p5DoXQTHCf36FOTuXiTYFj+d+DeRlttYlrQRq
 aSPvyp7IbhWAFbAQ=
X-Received: by 2002:a05:622a:1c1:: with SMTP id
 t1mr1047726qtw.27.1623265025132; 
 Wed, 09 Jun 2021 11:57:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUTroX3TBdiRCR4gjbvslaMF13ih0mEaQ2fq8zYHQwT2aSqPQFz6cW41ct11PLSvHXb0i0VQ==
X-Received: by 2002:a05:622a:1c1:: with SMTP id
 t1mr1047690qtw.27.1623265024718; 
 Wed, 09 Jun 2021 11:57:04 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id z3sm637795qkj.40.2021.06.09.11.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 11:57:04 -0700 (PDT)
Date: Wed, 9 Jun 2021 14:57:03 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Message-ID: <YMEO/xVyiiJLg32g@t490s>
References: <20210601005708.189888-1-peterx@redhat.com>
 <YL+71C9cteDVYJum@work-vm> <YL/C00m4LDZ9EVnY@t490s>
 <YL/Gtw64I0jbSXgn@work-vm>
MIME-Version: 1.0
In-Reply-To: <YL/Gtw64I0jbSXgn@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Chuan Zheng <zhengchuan@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 08:36:23PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Jun 08, 2021 at 07:49:56PM +0100, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > These two commands are missing when adding the QMP sister commands.  Add them,
> > > > so developers can play with them easier.
> > > > 
> > > > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > Cc: Juan Quintela <quintela@redhat.com>
> > > > Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> > > > Cc: Chuan Zheng <zhengchuan@huawei.com>
> > > > Cc: huangy81@chinatelecom.cn
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > 
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > 
> > > > ---
> > > > PS: I really doubt whether this is working as expected... I ran one 200MB/s
> > > > workload inside, what I measured is 20MB/s with current algorithm...  Sampling
> > > > 512 pages out of 1G mem is not wise enough I guess, especially that assumes
> > > > dirty workload is spread across the memories while it's normally not the case..
> > > 
> > > What size of address space did you dirty - was it 20MB?
> > 
> > IIRC it was either 200M or 500M, based on a 1G small VM.
> 
> What was your sample time ?

10 seconds; I used the same sample time for below runs:

https://lore.kernel.org/qemu-devel/YMEFqfYZVhsinNN+@t490s/

A large sample time does make dirty rate less indeed, as the same dirty page
could be written again as 1 single page dirtyed in the host (while it's counted
twice in the guest dirty workload).

This effect should happen too if we further extend calc_dirty_rate with
KVM_GET_DIRTY_LOG in the future as the 3rd method besides dirty ring.

From that pov, dirty ring is easier to be more "accurate" (I don't know whether
it's suitable to say it's accurate; it's just easier to trap cases like
writting to same page multiple times within a period), as the ring size is
normally very limited (e.g. 4096 pages per vcpu), so even the guest workload
writes the same page twice, as long as there's a ring collect between the two
writes, they'll be counted twice too (each collect will reprotect the pages).

-- 
Peter Xu


