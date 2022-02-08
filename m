Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9817F4ADDEF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:05:56 +0100 (CET)
Received: from localhost ([::1]:36994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHT07-0003nj-2p
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:05:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHQT7-00088B-VI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:23:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHQT3-0002vB-Cm
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644326614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A7lndTzQgkQdalmmceee8xG2mjaEZdBgEYlBKcAFucQ=;
 b=JeG2+0ZPf9Owtk0hyJ0rW3eM3+ad2M0zA8e/u1JuJLjDmD7n2QRY2AetZTYiwvs3XPUtG6
 tB9amohRXmX8/PQwVe/GPcxvfDO8t/5I0aanCVQQbrjzhulafRQ1d1IDnGJC08J5tTWGg1
 x8Z7KO045yDyNSVKrJqrl221u0pyHM8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-oHWeXUpQMkuIlnve-CfANg-1; Tue, 08 Feb 2022 08:23:33 -0500
X-MC-Unique: oHWeXUpQMkuIlnve-CfANg-1
Received: by mail-wr1-f72.google.com with SMTP id
 i19-20020adfa513000000b001e33749ed31so982119wrb.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A7lndTzQgkQdalmmceee8xG2mjaEZdBgEYlBKcAFucQ=;
 b=nC7YpMLgtkBlTeVDhifjmSw8A1kVnJfltaJddanxCO+oZb8LlDsW+oQKqA6IhFc5Ss
 /J9w/BkIEBkPxTGb1F/bLKXAhAkkqtuSo/FVwNBBMikBEMXvXncSofG+qxiRaEGtW28r
 XkTM0+eFEUiiJs7ay9p6duo1PI7zt2RrP+2x4ZIoiMJZ/Af2r0Rvv7cXdaUqtsBEHsT9
 tZFV/CRlAMWGt3V5YQZ2V09ILygFICMH53sFNyAHhaHmTZfoNDp4xBCLQKXMz9YAzseM
 n/aL+xeMFJ7KoOA4hM73oDNoPEBPV0GJSxH5vBj+wZatR6ARjMa8QJRGkCSrTMyc0hXg
 2QDg==
X-Gm-Message-State: AOAM531ZqEoCIS0bh2WEWb/5gtzRhKtTfXxk/4t3KvsCehNIiL5MHiUZ
 nM/rJE72Qj7QZFj0RZfMUnGbuvmulOfsmYHssbd46TF4FMRVsCEMzwJ5IPiElD8CJwmqZLybCVZ
 idFTqITwm2gT2FnI=
X-Received: by 2002:a05:600c:4fc2:: with SMTP id
 o2mr1112876wmq.145.1644326611871; 
 Tue, 08 Feb 2022 05:23:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwul7Wib8Ab2ljqodT0hv/KDNFOzYTnvO6qSlq+qnuIROswj//LmJ9S1ABLgZs3IowBOGWBow==
X-Received: by 2002:a05:600c:4fc2:: with SMTP id
 o2mr1112854wmq.145.1644326611630; 
 Tue, 08 Feb 2022 05:23:31 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id bg23sm2732873wmb.5.2022.02.08.05.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:23:31 -0800 (PST)
Date: Tue, 8 Feb 2022 13:23:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 14/15] migration: Postcopy preemption on separate
 channel
Message-ID: <YgJu0ZoV/Z4JA4Ye@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-15-peterx@redhat.com>
 <YfwUvGfE46G1oXOv@work-vm> <YgHv/4Ep4JUhfLB4@xz-m1.local>
 <YgJS3qUuyopB+JFZ@work-vm> <YgJWeQm3THpv8iG/@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YgJWeQm3THpv8iG/@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Feb 08, 2022 at 11:24:14AM +0000, Dr. David Alan Gilbert wrote:
> > > The current model is we only have 1 postcopy channel and 1 precopy channel, but
> > > it should be easier if we want to make it N post + 1 pre base on this series.
> > 
> > It's not clear to me if we need to be able to do N post + M pre, or
> > whether we have a rule like always at least 1 post, but if there's more
> > pagefaults in the queue then you can steal all of the pre channels.
> 
> Right, >1 queue length should easily happen with workloads in real cloud
> environment.  Though even with only 1post channel we can already hit at least
> <~1ms with this series even if there're 16 pending requests per my test.  I
> think that may cover quite some real workloads.
> 
> One thing to mention is that we should always assume the pre-channels are
> filled up with tons of pages already in the NIC send buffer, so they won't be
> good candidate for postcopy requests, IMHO.  So I'm not sure whether we can
> mixly use the pre/post channels - we may need to leave the post channels idle.

No I'm not sure either; even with separate channels do we have problems
with contention on the NIC?

Dave

> Then, if we keep some of the multifd channels idle, then it will become some
> other thing rather than the existing multifd, since we will start to treat
> threads and channels differently and break the "equality" rule in the strict
> version of multifd world.
> 
> > > This also reminded me that, instead of a new capability, should I simply expose
> > > a parameter "postcopy-channels=N" to CLI so that we can be prepared with multi
> > > postcopy channels?
> > 
> > I'm not sure we know enough yet about what configuration it would have;
> > I'd be tempted to just make it work for the user by enabling both
> > multifd and preemption and then using this new mechanism rather than
> > having to add yet another parameter.
> 
> Let me stick with the current capability bit then, so as to make it 1pre+1post.
> And we can leave Npre+1post for later.
> 
> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


