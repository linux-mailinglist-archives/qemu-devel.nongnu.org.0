Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25643F0A50
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 19:32:48 +0200 (CEST)
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGPQl-0006eK-L4
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 13:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGPOL-0005U1-F6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGPOH-0006qs-KV
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629307811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3V2ZrvsLcLzuD7sXX+tg2QB9Ferqj+fAE5O2aEUKiCI=;
 b=TvGCzr3DxrkMxfs/Nrcw7GvvM47dCGiC+jG1tkm8DgRou0klRNwYIVdt7Qjv7P2mdEC5Qn
 bSX1AiYXsbkECMsCTv/BzjMtMlbA31ArZrrVn18aJg9Yxko5aIHQb/UOUu2sKLVLl97odc
 THo0C0rupOyXX5pefNChXaRsrpFz9zs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-O_eN8arUPUy-5kYCaiGrkg-1; Wed, 18 Aug 2021 13:30:10 -0400
X-MC-Unique: O_eN8arUPUy-5kYCaiGrkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g70-20020a1c20490000b02902e6753bf473so2504712wmg.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 10:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3V2ZrvsLcLzuD7sXX+tg2QB9Ferqj+fAE5O2aEUKiCI=;
 b=Zjyoo1R33ZuYl/9tOUHgFsps9PcxStoFMOjXqCB14YUhhr6ZGRhPtqwFNghFuMxA72
 TQJnFpnk+i/Hf7pD7378Re+uStBHWJEYZHd6eI0lOdsczwXdmEjjwEQMYcWcfBa8Avux
 Mw1AehA6xoByY91GJ5Jb4m7w3kDIBQu7WsjOtpJs1W7FoI9qctlwIcpXFA7x5pRe1rjO
 WEEx6gLqSjGqC1/EdpMvO3H8zv5pSEAAWriKFElGVqNbwjIbvTW5FHXVf4W8/UWV4Cov
 pfSlzaZA0X7ErDwTPweP8XysxZv9or8v4O8uUuatkcuwXyzUqKw/8esNZs+HQaezQ2YG
 ofZQ==
X-Gm-Message-State: AOAM5317dUu66GkJieFHv7m9Qx57wmKZFAeKVIPBF51RpgGnss5Gbtls
 47L9Z9HmGYRqALjkmdvUCo24Vuw6Pu7OcrpYb8ymdb31fS5Rqvyh/Pj4fzdHJkRQXOVNobhJkAK
 FTUF0BpmnlIrD81s=
X-Received: by 2002:a05:600c:ac3:: with SMTP id
 c3mr9473701wmr.44.1629307809380; 
 Wed, 18 Aug 2021 10:30:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzmPfBQPDy0ZUJqsyhtmeUS8OiI7eZv0t1xVgOPCZgnHHQjQZuX8pJJrZT8RKWF4pulTEoOw==
X-Received: by 2002:a05:600c:ac3:: with SMTP id
 c3mr9473672wmr.44.1629307809101; 
 Wed, 18 Aug 2021 10:30:09 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id 18sm6323242wmv.27.2021.08.18.10.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 10:30:08 -0700 (PDT)
Date: Wed, 18 Aug 2021 18:30:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YR1Dnl6kDjsz+gWI@work-vm>
References: <20210816144413.GA29881@ashkalra_ubuntu_server>
 <b25a1cf9-5675-99da-7dd6-302b04cc7bbc@redhat.com>
 <20210816151349.GA29903@ashkalra_ubuntu_server>
 <f7cf142b-02e4-5c87-3102-f3acd8b07288@redhat.com>
 <20210818103147.GB31834@ashkalra_ubuntu_server>
 <f0b5b725fc879d72c702f88a6ed90e956ec32865.camel@linux.ibm.com>
 <YR0nwVPKymrAeIzV@work-vm>
 <8ae11fca26e8d7f96ffc7ec6353c87353cadc63a.camel@linux.ibm.com>
 <YR0qoV6tDuVxddL5@work-vm>
 <8a94ce57b4aa28df1504dcf08aace88d594ffb32.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <8a94ce57b4aa28df1504dcf08aace88d594ffb32.camel@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <ashish.kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, tobin@ibm.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* James Bottomley (jejb@linux.ibm.com) wrote:
> On Wed, 2021-08-18 at 16:43 +0100, Dr. David Alan Gilbert wrote:
> > * James Bottomley (jejb@linux.ibm.com) wrote:
> [...]
> > > Given the lack of SMI, we can't guarantee that with plain SEV and
> > > -ES. Once we move to -SNP, we can use VMPLs to achieve this.
> > 
> > Doesn't the MH have access to different slots and running on separate
> > vCPUs; so it's still got some separation?
> 
> Remember that the OVMF code is provided by the host, but its attested
> to and run by the guest.  Once the guest takes control (i.e. after OVMF
> boots the next thing), we can't guarantee that it wont overwrite the MH
> code, so the host must treat the MH as untrusted.

Yeh; if it's in a romimage I guess we could write protect it?
(Not that I'd trust it still)

> > > But realistically, given the above API, even if the guest is
> > > malicious, what can it do?  I think it's simply return bogus pages
> > > that cause a crash on start after migration, which doesn't look
> > > like a huge risk to the cloud to me (it's more a self destructive
> > > act on behalf of the guest).
> > 
> > I'm a bit worried about the data structures that are shared between
> > the migration code in qemu and the MH; the code in qemu is going to
> > have to be paranoid about not trusting anything coming from the MH.
> 
> Given that we have to treat the host MH structure as untrusted, this is
> definitely something we have to do.  Although the primary API is simply
> "here's a buffer, please fill it", so there's not much checking to do,
> we just have to be careful that we don't expose any more of the buffer
> than the guest needs to write to ... and, obviously, clean it before
> exposing it to the guest.

I was assuming life got a bit more complicated than that; and we had
to have lists of pages we were requesting, and a list of pages that were
cooked and the qemu thread and the helper thread all had to work in
parallel.  So I'm guessing some list or bookkeeeping that we need to be
very careful of.

Dave

> James
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


