Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097E41CBF5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 20:37:19 +0200 (CEST)
Received: from localhost ([::1]:48964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVeSE-0001XK-4z
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 14:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVeOd-00083V-Q9
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 14:33:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVeOb-0007i5-2k
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 14:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632940411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/M9LGTi33XME3vXqiZlZNMHCVzyVvuNu+brku+g1ea8=;
 b=cPZJRRgmPOKk+4OxACzw6UuuyiVmxmYgIVHIYFTW36BMgzjkE1+XB2AmbVKWVSHezXlw6W
 i3BGcFMSBLDaKKyeYf9erH8oCXXr2tfYguh+9kzdO7Bd8zJT1k9KIdu9EIald6V6RPzoNB
 vNOhzMt+DQHd23S8S3nD7G+0BCtBtY0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-WSzpyecCPjW679hlF-pElA-1; Wed, 29 Sep 2021 14:33:29 -0400
X-MC-Unique: WSzpyecCPjW679hlF-pElA-1
Received: by mail-lf1-f69.google.com with SMTP id
 c24-20020ac25318000000b003f257832dfdso3157928lfh.20
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 11:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/M9LGTi33XME3vXqiZlZNMHCVzyVvuNu+brku+g1ea8=;
 b=zRpRNZere8HgGveAo6oKzvKv5/j8rO0Nf/gtctbtEi67pS1ibEp3/1yOsfzYZzsqjQ
 t1ak/vk9xIruFlTkInC+fVEt65iDyyfSbIsEft1PSV6VYJJjMuXHALTh2bmgNiSh2WmD
 kayDvA9/anK1cCgcyI4B/OE2skhKWffsrawkOcU8Xlf5VBjR6jugHLrxMDJMRzCOziMe
 5Kw6u/3nrTdYS5iH13Lu1wyuDCwyK2QoKHDx2aJyrJcNSonT8b2vXHVH6rv2jIG/b8f7
 eQRs2pXrzkWQ97ZDLo+LrKW3eOAXAdfJod8/mNseon7pYBO01tMoZnAPsU/09T2QmqGA
 j24A==
X-Gm-Message-State: AOAM531pePXDy2Q/ps8mH/IGxsLzXG9hEMFQZqv/QUGdcuL2iU9AHnen
 PAknEF/PFZO/j01U36H9FMurCG7bYW7W7fd8/ZIsj/ff+GqqK+05h+QgknmV5oSXt4IG5W3Y0A+
 2c+TaN9LTuzViBIcSsLZqFMLd1MZPK3Q=
X-Received: by 2002:ac2:5984:: with SMTP id w4mr1105982lfn.187.1632940407758; 
 Wed, 29 Sep 2021 11:33:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylSiQmTNrF9ABW4HvL33FoqY2n2GiQc+JoB2Dkc27lx4mkm08Wg8rAEg6vTeEYHcKfULBWfsm398uWiGOYuYE=
X-Received: by 2002:ac2:5984:: with SMTP id w4mr1105929lfn.187.1632940407115; 
 Wed, 29 Sep 2021 11:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210922222423.644444-1-leobras@redhat.com>
 <YVOcT0qv0Sv72BmS@t490s>
In-Reply-To: <YVOcT0qv0Sv72BmS@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 29 Sep 2021 15:34:01 -0300
Message-ID: <CAJ6HWG7kL1jHmZQX1yLciqEksr=bmvx3f4VHRGqQLf_tT2CKnA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] QIOChannel async_write & async_flush +
 MSG_ZEROCOPY + multifd
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Tue, Sep 28, 2021 at 7:51 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Sep 22, 2021 at 07:24:20PM -0300, Leonardo Bras wrote:
> > This patch series intends to enable MSG_ZEROCOPY in QIOChannel, and make
> > use of it for multifd migration performance improvement.
> >
> > Patch #1 creates new callbacks for QIOChannel, allowing the implementation
> > of asynchronous writing.
> >
> > Patch #2 implements async_write and async_flush on QIOChannelSocket,
> >
> > Patch #3 Makes use of async_write + async_flush to enable MSG_ZEROCOPY
> > for migration using multifd nocomp.
> >
> > Results:
> > So far, the resource usage of __sys_sendmsg() reduced 15 times, and the
> > overall migration took 13-18% less time, based in synthetic workload.
> >
> > The objective is to reduce migration time in hosts with heavy cpu usage.
>
> My previous memory is that we'll add a capability bit for migration, so it'll
> not be enabled until user specified it.  Plan to do it in the next version?

You mean like I did in pre-V1, enabling ZEROCOPY for multifd it in QMP?
Or is this something else?


>
> It'll still be okay if you want to separate the work of (1) qio channel
> zero-copy support on sockets, and (2) apply zero copy to migration, then that
> can be done in part 2.  Your call. :)

Ok  :)

>
> Thanks,
>
> --
> Peter Xu
>

Thank you Peter,

Best regards,
Leonardo


