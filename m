Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AC650911C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:10:13 +0200 (CEST)
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGeS-0002fc-GD
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGAk-0002Kk-O3
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGAh-0006sh-Rf
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650483566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ2vXncmdyD/W52/UWnDm+yC3BGmz02JNsR8ig5avBw=;
 b=NoF6iBydPYMDMKuRdWFdlao0e0a3eUqQwG8TwI4qu3qOQb+i+GcRc3dCJCpWKfLKYOjeph
 k2Ss0tBY8mr5do4azzxddsRc80xRKB3YGl3IOF19h2E/wnac4I9DjB+5AXDZ8ds78P5t1q
 PaFrrAOOQYzNORC9dFNKDJ0K3LR/szA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-Q-EUHsEQOMiF3nmjBmmtaQ-1; Wed, 20 Apr 2022 15:39:25 -0400
X-MC-Unique: Q-EUHsEQOMiF3nmjBmmtaQ-1
Received: by mail-il1-f200.google.com with SMTP id
 f18-20020a926a12000000b002be48b02bc6so1473063ilc.17
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AJ2vXncmdyD/W52/UWnDm+yC3BGmz02JNsR8ig5avBw=;
 b=vYF+oUgBL3sUm/tda5slUejxjAaDDClHWVIWJYb7CGOti6S1WYaONg4Y8t7lBou/2P
 t6WgM7pmXGrjjztV6MlI5pMcPDS09gGBuPRyxVhKGI1Fpq/BHBxVWgApSNL38BceWhg5
 H8HmyyrPHCW4T8U1IMlaEaEv5yYGbRm53FAVJJy1Dm6opxBfSJVUYyM7qJU4xBprmIXt
 rmMFpy/z+te+LY4NIpBqwc7yoB1Qc78RnELydrBgKw4l404jVh9O87g9b2Rl0HS5kkWh
 Ksp8gz44bUmTOgg+19bI3p/JspuMCQvxl7BDZikrq/l415lYRJmgi8L1WhOpaCdMzg8X
 S2Sw==
X-Gm-Message-State: AOAM532My/ZDSyQpPPf1qjFpq/bx7zr60N3y4Tn8aQ24k4ZM+6FYZBGo
 x8UD8Hcjkop892jBtEAHDxQkjB3qoaXF/UB7xo01JSIiSsLUn0rTPOjuS/KTeM9/gbk8yJO8L66
 z3RhxIeti7nGVubY=
X-Received: by 2002:a02:c617:0:b0:326:741b:525b with SMTP id
 i23-20020a02c617000000b00326741b525bmr10380241jan.30.1650483564353; 
 Wed, 20 Apr 2022 12:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUZULsm65in8OVmh/xdxZjSBUp8UlGLnh94iFCGmN5t8lk7wJex37fPlkUoW9O07KB597zkg==
X-Received: by 2002:a02:c617:0:b0:326:741b:525b with SMTP id
 i23-20020a02c617000000b00326741b525bmr10380228jan.30.1650483563902; 
 Wed, 20 Apr 2022 12:39:23 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm11736498ioc.8.2022.04.20.12.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:39:23 -0700 (PDT)
Date: Wed, 20 Apr 2022 15:39:22 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 10/19] migration: Postcopy preemption enablement
Message-ID: <YmBhauRdlKCV1kQE@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-11-peterx@redhat.com>
 <Yl/o9HCW54hslTbs@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/o9HCW54hslTbs@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 12:05:24PM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 31, 2022 at 11:08:48AM -0400, Peter Xu wrote:
> > This patch enables postcopy-preempt feature.
> > 
> > It contains two major changes to the migration logic:
> > 
> > (1) Postcopy requests are now sent via a different socket from precopy
> >     background migration stream, so as to be isolated from very high page
> >     request delays.
> > 
> > (2) For huge page enabled hosts: when there's postcopy requests, they can now
> >     intercept a partial sending of huge host pages on src QEMU.
> > 
> > After this patch, we'll live migrate a VM with two channels for postcopy: (1)
> > PRECOPY channel, which is the default channel that transfers background pages;
> > and (2) POSTCOPY channel, which only transfers requested pages.
> > 
> > There's no strict rule of which channel to use, e.g., if a requested page is
> > already being transferred on precopy channel, then we will keep using the same
> > precopy channel to transfer the page even if it's explicitly requested.  In 99%
> > of the cases we'll prioritize the channels so we send requested page via the
> > postcopy channel as long as possible.
> > 
> > On the source QEMU, when we found a postcopy request, we'll interrupt the
> > PRECOPY channel sending process and quickly switch to the POSTCOPY channel.
> > After we serviced all the high priority postcopy pages, we'll switch back to
> > PRECOPY channel so that we'll continue to send the interrupted huge page again.
> > There's no new thread introduced on src QEMU.
> 
> Implicit in this approach is that the delay in sending postcopy
> OOB pages is from the pending socket buffers the kernel already
> has, and not any delay caused by the QEMU sending thread being
> busy doing other stuff.

Yes.

> 
> Is there any scenario in which the QEMU sending thread is stalled
> in sendmsg() with a 1GB huge page waiting for the kernel to
> get space in the socket outgoing buffer ?

Another yes..

It doesn't necessarily to be during sending a 1GB huge page, the guest can
be using small pages and IMHO we could get stuck at sendmsg() for a precopy
small page while there's actually postcopy requests in the queue.

We can't solve this as long as we keep using 1 single thread for sending
page.

This patchset doesn't solve this issue, yet.  And it's actually the chunk
discussed and mention in the cover letter too in the section "Avoid precopy
write() blocks postcopy" as an TODO item.

Logically in the future we could try to make two or more sender threads so
postcopy pages can use a separate sender thread.

Note that this change will _not_ require interface change either from qemu
cmdline or on migration protocol, because this patchset should have handled
all the migration protocol already even for that, but then if it'll work
well we could get pure speed up on further shrinked latency when preempt
mode enabled comparing to before.

The other thing is I never measured such an effect, so I can't tell how
would it perform at last.  We need more work on top if we'd like to persue
it, mostly on doing proper synchronizations on senders.

Thanks,

-- 
Peter Xu


