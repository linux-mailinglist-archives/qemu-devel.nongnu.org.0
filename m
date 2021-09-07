Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C9402E39
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:14:09 +0200 (CEST)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfbk-0006j3-Eb
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNfXK-0000xQ-Lj
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNfXI-0003fa-20
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631038171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EeQ1b28/qWilMyFg+R3KGpQTKbzwsvlwaXx9BNnXkZs=;
 b=OtBt9QETFUDp3LqbqJIQDzJp9vIzm8LexU4iA/x6oslMEOzPQqtkOzNrtK4gU8hiCwHoxf
 1vsV3Ek9gkPMW8gT/1DNwvg7L9o4yB5mPim15fwQoM/1h5spDuAcYpU/ULar8+8vP5sNPJ
 XX7ICT6nka/5h54s2VdqZ3+ZA8vNqUM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-3YkA9MaNN62N1ijZq0OHBw-1; Tue, 07 Sep 2021 14:09:30 -0400
X-MC-Unique: 3YkA9MaNN62N1ijZq0OHBw-1
Received: by mail-il1-f197.google.com with SMTP id
 w12-20020a92ad0c000000b00227fc2e6eaeso7012570ilh.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 11:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EeQ1b28/qWilMyFg+R3KGpQTKbzwsvlwaXx9BNnXkZs=;
 b=ot5FCbBYDj3RJcbvb2XbLXeba/Rky16rrdhaorP0tgMqzrqmviHCkNmFWRbhKikk4h
 ZNL4PykDtkgtzgWIu+X8Z/4R2G8E7uGavMabnfdZSxnViqrc/m0tO7omXYhGL2RRhU1S
 ZMbRw4T7Ww4Cq3scClwmnk7kD15dD2LFsTF4+Fk8MgpOLu4H9MTMk1cg4D9MSTevilPP
 iPsa0mFzfVtCuGg+FH2tCGIEPtE4YYnMapHE/vxF3FN8v7Jp8MqMozgZJsfQZ0p7z14p
 /MrbqR4mIxxrMsjZkB3WHrPySbKgggV90V7tUvvDOlFll56lMwvl1R8g/j2Cqwc2MKP5
 AeVg==
X-Gm-Message-State: AOAM530ZwPPUZNiRwG/PEDUGod3VOrHP+lgXt3ll/8mXqyvduPihnEHD
 PfABGYD+x1wM/uDIopBHSK3pgag62mCcx/trzB5wArKh7mcGIh+PNfI3PzTdUcT2It6/LrhuKXD
 LOCR/TcMHL1bTsEM=
X-Received: by 2002:a05:6e02:1d06:: with SMTP id
 i6mr13121048ila.113.1631038169271; 
 Tue, 07 Sep 2021 11:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpiABSzfEr+7Syqhv8irEnTP3LWDZqhZj2s88CPkpyq2XUUBxbb7TPpLoiOqNAtcSo0LZUIQ==
X-Received: by 2002:a05:6e02:1d06:: with SMTP id
 i6mr13121036ila.113.1631038169046; 
 Tue, 07 Sep 2021 11:09:29 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id e1sm6793193ils.76.2021.09.07.11.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 11:09:28 -0700 (PDT)
Date: Tue, 7 Sep 2021 14:09:26 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTeq1jttqpuVC3ZD@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
MIME-Version: 1.0
In-Reply-To: <YTdHpx263WNe7nuZ@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 12:06:15PM +0100, Dr. David Alan Gilbert wrote:
> > > What if we do the 'flush()' before we start post-copy, instead of after each
> > > iteration? would that be enough?
> > 
> > Possibly, yes. This really need David G's input since he understands
> > the code in way more detail than me.
> 
> Hmm I'm not entirely sure why we have the sync after each iteration;

We don't have that yet, do we?

> the case I can think of is if we're doing async sending, we could have
> two versions of the same page in flight (one from each iteration) -
> you'd want those to get there in the right order.

From MSG_ZEROCOPY document:

        For protocols that acknowledge data in-order, like TCP, each
        notification can be squashed into the previous one, so that no more
        than one notification is outstanding at any one point.

        Ordered delivery is the common case, but not guaranteed. Notifications
        may arrive out of order on retransmission and socket teardown.

So no matter whether we have a flush() per iteration before, it seems we may
want one when zero copy enabled?

Thanks,

-- 
Peter Xu


