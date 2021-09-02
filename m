Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405413FEA4B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:59:39 +0200 (CEST)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhdJ-0007rR-Pm
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLhb7-00068B-Ee
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:57:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLhb4-000500-K0
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630569434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1xTU81ZE9ChlLzb/Cr5jAg3/r92VK1LHtcD7ne4q8Y=;
 b=RNDxRrwnJpgmzsl5Nixd54om6vOUGOlDbZgDBOf7/YZLhE9/YZPu0bMusmhuZjvE2uJgV7
 vtkGJL3eis1fS+t7WfBt0U0mJYBzMYhodlj/DTkVRq8JGUOud0RT+tE0q/PS/r+k000Cho
 jq5ffJMxjCUMkt30o8h905EkU0wgDDc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-RaNBNTBzP3CsUr4vJk1UGw-1; Thu, 02 Sep 2021 03:57:13 -0400
X-MC-Unique: RaNBNTBzP3CsUr4vJk1UGw-1
Received: by mail-lj1-f198.google.com with SMTP id
 x10-20020a05651c024a00b001cf8e423d60so319135ljn.12
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x1xTU81ZE9ChlLzb/Cr5jAg3/r92VK1LHtcD7ne4q8Y=;
 b=Wv/e3/i8rgn2nBl2TXX9WEnYN2cM/hlD+e8T5X7jSxqwalMxoqLVm6bF4b1bOu78SK
 +6nATweNOo891E2NgFthkLJNZ/3KcFYn/uYStT+JtAEmccKz1kiDxnReDLsE8WVHRlhl
 uI/B7QIXrHTREeOBYB41bRN4NlIxYv9ODNNbeQsRpVdHrm8kVFM8I7RF+iSFwH1VdigX
 l5j8GaYkhsCD6QUHHvcSJ4mACwDN0eWFC/6Wa1QMcO84feJO82Zb6R+gsWQ6xQ943QCZ
 S5RZixalAGt/LrZ/L+Btl50uN0Qc/ppVYcQ8jDml2pktv/0iU4vFDpPCg2HTvoidcgzF
 +1Mg==
X-Gm-Message-State: AOAM532F6eqnkfV9Z9vidMaGO2uRjv1VGooITsZ5jILYf652RVXNIb3p
 BDyBaX+TOq/H3b4RnvBLZwmNyBkQgy2REG7S2CNA8cxbjUklvcuyyfzld/5d3tf5bxZOrSDOEk2
 15EMYzay+6S1N2lsDCL0P0nttXqSyOqU=
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr1465132ljn.262.1630569431529; 
 Thu, 02 Sep 2021 00:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXaQStAHdS6G7HjwHLq//Bf15JmxwR4fEImBpNv8DeUgsio9LXTA5J1CzwcBowpkH5XeNGzu/8rAm9pPX1SGU=
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr1465101ljn.262.1630569431247; 
 Thu, 02 Sep 2021 00:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com> <YS6RFcQnZEhE8XpG@t490s>
 <YS8/cxTtiC7QIxTD@redhat.com>
 <YS+dxUBrhogJQkEY@t490s> <YS+f3rgBLMdR2ELE@redhat.com>
In-Reply-To: <YS+f3rgBLMdR2ELE@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 04:57:22 -0300
Message-ID: <CAJ6HWG4kORVOx+=LcFNdgOvbJrtQdYG+tOs7b953p6bTz4OijA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few more comments on this one:

On Wed, Sep 1, 2021 at 12:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> > From the safe side we may want to only enable one of them until we prov=
e
> > they'll work together I guess..
>
> MPTCP is good when we're network limited for migration
>
> KTLS will be good when we're CPU limited on AES for migration,
> which is essentially always when TLS is used.
>
> ZEROCOPY will be good when we're CPU limited for data copy
> on migration, or to reduce the impact on other concurrent
> VMs on the same CPUs.
>
> Ultimately we woudld benefit from all of them at the same
> time, if it were technically possible todo.

Maybe I misunderstood something, but IIRC KTLS kind of does some
'zerocopy'.

I mean, on an usual setup, we would have a buffer A that would contain
the encrypted data, and a buffer B that would receive the encrypted data,
and a buffer C, in kernel, that would receive a copy of buffer B.

On KTLS, the buffer A would be passed to kernel and be encrypted directly
in buffer C, avoiding one copy.
Oh, it's possible Buffer A would be copied to buffer B', which is
inside the kernel,
and then encrypted to buffer C, but I am not sure if this would make sense.

Anyway, other than B' case, it would make no sense having MSG_ZEROCOPY
in QIOChannel_TLS, so that's something that I need to change in this patchs=
et.

>
> > Not a immediate concern as I don't really think any of them is really
> > explicitly supported in qemu.
>
> QEMU has mptcp support already:
>
>   commit 8bd1078aebcec5eac196a83ef1a7e74be0ba67b7
>   Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
>   Date:   Wed Apr 21 12:28:34 2021 +0100
>
>     sockets: Support multipath TCP
>
>     Multipath TCP allows combining multiple interfaces/routes into a sing=
le
>     socket, with very little work for the user/admin.
>
>     It's enabled by 'mptcp' on most socket addresses:
>
>        ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp
>
> > KTLS may be implicitly included by a new gnutls, but we need to mark TL=
S and
> > ZEROCOPY mutual exclusive anyway because at least the userspace TLS cod=
e of
> > gnutls won't has a way to maintain the tls buffers used by zerocopy.  S=
o at
> > least we need some knob to detect whether kTLS is enabled in gnutls.
>
> It isn't possible for gnutls to transparently enable KTLS, because
> GNUTLS doesn't get to see the actual socket directly

Yes, IIRC it uses gnuTLS with callbacks instead.

> - it'll need
> some work in QEMU to enable it.

Maybe it's overkill, but what if we get to implement using KTLS
directly in QEMU,
and fall back to gnuTLS when it's not available?


