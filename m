Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5B43C31E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:40:40 +0200 (CEST)
Received: from localhost ([::1]:36354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcc2-0003fT-EZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfcTE-0007BH-R8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:31:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfcSy-00058t-Om
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635316276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTSQ9AWaX0VvomMGviku3CMrgXXSah3b3C1da+x3fSA=;
 b=D7iyioGbMzc4jMoIWbJJOebwzoDbekrb7hrxgTQVFe/x8IE8RP7AW69SQ0ISDg1obIjOuF
 Mf+BpDeTV0Runy3JIvwjHeSJ78gMUjBDUAMSRcvrw+eXebuYSpB9YIfQOEOuwKGEifkcMK
 EdNE0KC0escLMrZWQwFtm6aaiXQa6uU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-1jUfoBniPWewPvQ9tHOICw-1; Wed, 27 Oct 2021 02:31:14 -0400
X-MC-Unique: 1jUfoBniPWewPvQ9tHOICw-1
Received: by mail-lf1-f70.google.com with SMTP id
 b12-20020a0565120b8c00b003ffa7050931so916807lfv.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTSQ9AWaX0VvomMGviku3CMrgXXSah3b3C1da+x3fSA=;
 b=xA6GUeVBFnqHxV7+ZNmW/vh0s+t7SVdxVAIpETq/4w8uBGVeRrWrGcrapXsdCLl4I7
 LNIvg789H77kxA5Fm1kCBquVyd740QcaS7StWc0x8bWC8lw3naBwRCuSFKcmfBfGAEWu
 HnJw46Jh1ZfG4IqUBeiypSzElbHfDzjd3EW/iCltd/YMs0MOrzOnkRCKyL8KkZ3WVOOB
 PR6kVhG3bNWZMGuWhs8gdc5drIlLH5BKjHZu3o/MRJqmBAz8qURb9AAAn1paRc37sifw
 1iA0Iuc7gvmSuPJNu/a+h0LhXkue9s1LlVxbNB/qs7zvZ5xklluKc/AHoJ1RnyCdv9L+
 aXPg==
X-Gm-Message-State: AOAM530u3ZTl5WDyt1DJwQ7SR+FCMCu4lwHYrQhcGpQghMmm8YnWTn7U
 4IZFdpMdmj9EktDuubYEj3Ivmxlow9D5CapZZQVqnY3paRBzwC82H9GivNm5BLhH7EbOvwXkCBL
 wmOfwS7ulrOv6tn7czNMCmK7HrvC/778=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr4326256ljj.318.1635316273374; 
 Tue, 26 Oct 2021 23:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYuGEPJtsftPTNXHySq7GKENfRv3cS/K3Fmqz/71sGZ9t1y7VrTbJtVqwyhnJ1itcvi+TlBxEt3A55etjZKYw=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr4326229ljj.318.1635316273130; 
 Tue, 26 Oct 2021 23:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
 <YWZ3kbsbUmCyr6Ot@t490s> <YWZ9lWKsU83JCZxS@t490s>
 <CAJ6HWG4pvP7dJ1=kgHKGAa8r=bgOcLT+YsZtSum0SnSLBNc3fg@mail.gmail.com>
 <YXjueV6ixuFVgn/7@xz-m1.local>
In-Reply-To: <YXjueV6ixuFVgn/7@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Oct 2021 03:31:14 -0300
Message-ID: <CAJ6HWG7Txr6ppjctfarQaS-ix-dp-OQVLraLQ5KJStXty4KHEg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 3:15 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Oct 27, 2021 at 03:07:13AM -0300, Leonardo Bras Soares Passos wrote:
> > > >
> > > >            if (flags & ZEROCOPY) {
> > > >                assert(fds == NULL && nfds == 0);
> >
> > Quick question: Why is this assert needed?
>
> Not required I think; just want to make sure no one passes in the fds when
> using zero copy mode.

Ok, that makes sense.
I will add it then, thanks!

>
> Thanks,
>
> --
> Peter Xu
>


Best regards,
Leo


