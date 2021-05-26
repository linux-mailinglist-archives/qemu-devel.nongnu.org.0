Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB1392280
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 00:06:02 +0200 (CEST)
Received: from localhost ([::1]:56068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1f7-00036w-3I
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 18:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lm1YQ-00078M-Vr
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lm1YO-0005U2-58
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622066342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TI9IAij/X4qMbj1zmJAJ0L1A8YSRG9t2tsgOUWbh9bA=;
 b=HORzOiUABPRTHeh85UEnRHjxjCtPV9Vj7ynfom8kDgbs8cmudG/mtDViYdfgkOLXnfRy6R
 R+Fx0QD27eH6PoMJ8Lv4+i0GXhNz48GpCht/mL1MejUNLF4TYD60mfhWMF5WDbz36nJwQW
 z1qb20W6cDb/JHaW9TVVoQaeHycVhQQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-qYcWgRs2PauxoQ8k6040sQ-1; Wed, 26 May 2021 17:59:00 -0400
X-MC-Unique: qYcWgRs2PauxoQ8k6040sQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 d3-20020a0cdb030000b029021313001eeeso2158152qvk.15
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TI9IAij/X4qMbj1zmJAJ0L1A8YSRG9t2tsgOUWbh9bA=;
 b=grKzxsHLuKk190Js+GvGMtLX6mKTX0N2nnxLEaiBVbRXShydVqTiCKF8fNj86oY6Ae
 2hotweN3HLaZT5F2s9IwvS/yhXk9llCxxp5WN4qXyPUQyjtHnbPX0omdV0EfhhWnMtb0
 otIFvPaayz0uedHEbAt0FkV450cIuEK7u2PWWXZxI5Qt1LG7ulojrn4q6F1SpJwhC38u
 QVQgz3O9cCVqWTY86pAFdYdnpfauHpDW7kBkyCjiOclWzX2LEXqDR1m2ZnOUT1+PwsKq
 K/kQ9MaUuDPVYiMRnck1Zvttp3iDC8MXz2iYrw0+8JUlcbOOy3KWtzj1UZ2LMvOgOXWn
 dKoQ==
X-Gm-Message-State: AOAM53320+CQE1z053dRme7dYm4bOorUX6609Z7G6XszTTuG2yyK/4CT
 /4+cJ4fvgOA/Y6AxokeSnipYMznZzB19wrIo4A7DOOYES+6cTwrHN8XNB4hqtBXtKZ7miZY6AMG
 gN2WAkLuKlpKqeRs=
X-Received: by 2002:a05:6214:2125:: with SMTP id
 r5mr325675qvc.28.1622066340001; 
 Wed, 26 May 2021 14:59:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhbyhFCBhMopQqwhEtnJoeyDDdgoL9JjjAErtqQhLKKzUj46c9X2O8puZGtYg85cmcI1rscA==
X-Received: by 2002:a05:6214:2125:: with SMTP id
 r5mr325661qvc.28.1622066339786; 
 Wed, 26 May 2021 14:58:59 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id x194sm146583qkb.79.2021.05.26.14.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:58:59 -0700 (PDT)
Date: Wed, 26 May 2021 17:58:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
Message-ID: <YK7EotQbx/F9avls@t490s>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
 <YK6yQ9EVNlVPDMaS@t490s> <20210526232103.39e2a7d0@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210526232103.39e2a7d0@gecko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras.c@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 11:21:03PM +0200, Lukas Straub wrote:
> On Wed, 26 May 2021 16:40:35 -0400
> Peter Xu <peterx@redhat.com> wrote:
> 
> > On Wed, May 26, 2021 at 05:05:40PM -0300, Leonardo Bras wrote:
> > > After yank feature was introduced, whenever migration is started using TLS,
> > > the following error happens in both source and destination hosts:
> > > 
> > > (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> > > Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> > > 
> > > This happens because of a missing yank_unregister_function() when using
> > > qio-channel-tls.
> > > 
> > > Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> > > yank_unregister_function() in channel_close() and multifd_load_cleanup().
> > > 
> > > Fixes: 50186051f ("Introduce yank feature")
> > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>  
> > 
> > Leo,
> > 
> > Thanks for looking into it!
> > 
> > So before looking int the fix... I do have a doubt on why we only enable yank
> > on socket typed, as I think tls should also work with qio_channel_shutdown().
> > 
> > IIUC the confused thing here is we register only for qio-socket, however tls
> > will actually call migration_channel_connect() twice, first with a qio-socket,
> > then with the real tls-socket.  For tls I feel like we have registered with the
> > wrong channel - instead of the wrapper socket ioc, we should register to the
> > final tls ioc?
> > 
> > Lukas, is there a reason?
> > 
> 
> Hi,
> There is no specific reason. Both ways work equally well in preventing
> qemu from hanging. shutdown() for tls-channel just makes it abort a
> little sooner (by not attempting to encrypt and send data anymore).
> 
> I don't lean either way. I guess registering it on the tls-channel
> makes is a bit more explicit and clearer.

Agreed, because IMHO logically the migration code should not be aware of
internals of IOChannels, e.g., we shouldn't need to know ioc->master is the
socket ioc of tls ioc to unregister.

-- 
Peter Xu


