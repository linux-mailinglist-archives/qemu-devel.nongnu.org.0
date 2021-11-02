Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934E34430E2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:54:04 +0100 (CET)
Received: from localhost ([::1]:40918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvAp-0002W2-4f
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhuqZ-0003Dm-Cl
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhuqS-00025O-OJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635863575;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XgrcA3EAFsbZaNKgGog9OIlB3gZBaY+/Yf5LWB/Vow0=;
 b=WYWVdooOIJmksRUjEag2Nm6bGOf32cIaTcQhcUQ0qgFpoNdBiMXai4UZcdZin6HVTQjO1r
 VTktcZcm3Jk3lV9XJaxfMVrYJf/B9CSwRw18odMn7Kd52m6UfT49al3xbaiKdOv8rDmPYM
 iBThVHHjpiTUxh+Cg4RABiPQTw+2AbQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-oGS7HG9hP4q1J9GadlgO1w-1; Tue, 02 Nov 2021 10:32:54 -0400
X-MC-Unique: oGS7HG9hP4q1J9GadlgO1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so927859wmh.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=XgrcA3EAFsbZaNKgGog9OIlB3gZBaY+/Yf5LWB/Vow0=;
 b=WDehF1ZIIjqIZCaCD80rLzUUaXP4SejOauJenw2+oA70Na3WVI+SYkWIrOVdq9ahYl
 8vD7b7lvQWEKpVSW9ZQfnugyU9GYeA53Du/GXaeGwxW+WSmeUV6K65a771pLONojD009
 Crg/jd0mpjLOONScNGC4hy4zgbVOWVXN2NZfMqCTih5v2JLtMu7fRyby88D993heu9bw
 bybzMadUY+QZfbdm8jRX//s7Ol7B/BJAtgkf1X3R/8W3V5abzQz6L7Y3GPd33cPzHeeX
 FhXJXUaT/V60VnY4zl9uYUwUy3eIP0YjG+rWOFcNOeK96tfM26fAa3BjZbbE9cHyKMIh
 ZJAA==
X-Gm-Message-State: AOAM531EM9ETR/hZ5ZgN6qz9S1v7p735XEdC1WS+/vaa9TOyC7Z8NAea
 miSLPWmN04dk4C4h+7qO41EW0WAKbwA6P2MUGiCKi8W0yVuyqpqjOclBEuj9vGGDU7c/LvNQkbO
 qgIJxQEiQ32JtduI=
X-Received: by 2002:a05:6000:1684:: with SMTP id
 y4mr46995243wrd.252.1635863573416; 
 Tue, 02 Nov 2021 07:32:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEkzT/XjWiiZMv2LKiakFRolcsU5Z3brRfoUFbnUrNqHyiKfcrQKC3hPDCBCKurqrm1P750w==
X-Received: by 2002:a05:6000:1684:: with SMTP id
 y4mr46995212wrd.252.1635863573219; 
 Tue, 02 Nov 2021 07:32:53 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id j12sm2298374wmq.37.2021.11.02.07.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 07:32:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: -only-migrate and the two different uses of migration blockers
In-Reply-To: <YPe/fIBuvGgfiyy3@yekko> (David Gibson's message of "Wed, 21 Jul
 2021 16:32:28 +1000")
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
 <87sg0amuuz.fsf_-_@dusky.pond.sub.org> <YPVzURLf5qqwtYsZ@work-vm>
 <87o8axh7rr.fsf@dusky.pond.sub.org> <YPe/fIBuvGgfiyy3@yekko>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 15:32:51 +0100
Message-ID: <871r3yk4q4.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> wrote:
> On Tue, Jul 20, 2021 at 07:30:16AM +0200, Markus Armbruster wrote:
>
> Right, it may well have been the first usage this way, this fwnmi
> stuff isn't super old.
>
>> >> While this isn't exactly terrible, it may be a weakness in our thinking
>> >> and our infrastructure.  I'm bringing it up so the people in charge are
>> >> aware :)
>> >
>> > Thanks.
>> >
>> > It almost feels like they need a way to temporarily hold off
>> > 'completion' of migratio - i.e. the phase where we stop the CPU and
>> > write the device data;  mind you you'd also probably want it to stop
>> > cold-migrates/snapshots?
>> 
>> Yes, a proper way to delay 'completion' for a bit would be clearer, and
>> wouldn't let -only-migrate interfere.
>
> Right.  If that becomes a thing, we should use it here.  Note that
> this one use case probably isn't a very strong argument for it,
> though.  The only problem here is slightly less that optimal error
> reporting in a rare edge case (hardware fault occurs by chance at the
> same time as a migration).
>
>
> .... and, also, I half-suspect that the whole fwnmi feature exists
> more to tick IBM RAS check boxes than because anyone will actually use
> it.

Right now the problem is when we broke migration stream.  Sometime there
is a field that is only needed on rare ocassions (othrewise we would
have found it right away).  But only thing that we can do now is abort
the migration.  If we were able to say, try it a little later, we could
fix that kind of trouble.

That is more or less what you have here.

Later, Juan.


