Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96378543D92
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 22:26:50 +0200 (CEST)
Received: from localhost ([::1]:52810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2GP-0000Si-KX
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 16:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nz2D4-00052V-C7
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:23:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nz2D1-0006YW-M1
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654719798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c9lz+LW0K/FfoUtKhTlhZGFvriSHmUbGH9cYr4gah/w=;
 b=ih7qi0WhLUhD+ZVrLHPqypMvC5bGW+fm/sDZN9Qj00ctN60wsQl0z9D524qGLqo3k2oHYz
 hD1JS/rc0QpyTpDMOAcApV7PD6wUIjbBGig+eQjDMBi1V80YjIM88g5jo3/SrBCaMJ5Mk4
 CbZjd5F41xapW8r5snYTq6XrSXESU64=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-LOlOfnOVOeG4cTKdCMNoYQ-1; Wed, 08 Jun 2022 16:23:17 -0400
X-MC-Unique: LOlOfnOVOeG4cTKdCMNoYQ-1
Received: by mail-il1-f197.google.com with SMTP id
 g8-20020a92cda8000000b002d15f63967eso16341418ild.21
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 13:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c9lz+LW0K/FfoUtKhTlhZGFvriSHmUbGH9cYr4gah/w=;
 b=xi8JuYOt4dccWSwF+NGu9AxyRe63r5cydmoZzmKa5LTVGDh11EnvtYr3ccwTBL1Cg/
 hBxTXq6+AlR6dSmtaFqxsLMM9hYTUQdSwDnNF/lTF6mhzPnmmNKnMEFWmRjylUEnWyvG
 nFHpBCKCB94eQFOXhkRcrfcefHqyhhQzUTDkuq1Dx/ObhdGCku/YjYF9rx6BLZV+Hc8s
 zRgp5tHcZDknvE/UwFMgvrjTI7ZTn0uNuNESZ3uXBXgu2/JeHWu/nDE/tkXAbC55VDKD
 LcCak5oz8WrbFZTVX+qV9u4m74lw9GKDz7MqfLhV1nJga7c5dEU7cqF1QvM56YXzOCEE
 d/Ug==
X-Gm-Message-State: AOAM530e1MwGIw/FjCZkGqyDmqq8d+4Dzb0Kmv8fH1JRZsWFiDw5bQ0O
 ExNUSCFSwln/HC+0/c2AvhSdT+sNF3RZkAKJB4UXn96aAC0WSMAaDN+AQff0zmXwpE9IMOIdWCt
 zQlP6WYhScIdKqpo=
X-Received: by 2002:a05:6e02:194d:b0:2d3:c5aa:a9f4 with SMTP id
 x13-20020a056e02194d00b002d3c5aaa9f4mr21455456ilu.172.1654719796624; 
 Wed, 08 Jun 2022 13:23:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZLH0vE7YBnAzPSfAsuN2Q4BxyEaIiaWccGX5mjfLaR5QrNB/feLUlVz1b5auWHVlfmbAAUQ==
X-Received: by 2002:a05:6e02:194d:b0:2d3:c5aa:a9f4 with SMTP id
 x13-20020a056e02194d00b002d3c5aaa9f4mr21455438ilu.172.1654719796357; 
 Wed, 08 Jun 2022 13:23:16 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a5d8419000000b00657b1ff6556sm8462968ion.2.2022.06.08.13.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 13:23:15 -0700 (PDT)
Date: Wed, 8 Jun 2022 16:23:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
Message-ID: <YqEFMXnMb8FlhvRe@xz-m1.local>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
 <YpdwcHu7I8dGDimt@xz-m1.local>
 <CAJ6HWG7vxRzEN5CRf93m_afHPn9zvMdYe=DZ4pGKKBQ8gyTY+Q@mail.gmail.com>
 <YqCK1UBLjXzo+nm7@xz-m1.local>
 <CAJ6HWG4UwU+em4pgk+uBLNZRx1jBThzYWXXp-nZg3EVLjuHVHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG4UwU+em4pgk+uBLNZRx1jBThzYWXXp-nZg3EVLjuHVHQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 08, 2022 at 03:14:36PM -0300, Leonardo Bras Soares Passos wrote:
> On Wed, Jun 8, 2022 at 8:41 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Jun 08, 2022 at 02:37:28AM -0300, Leonardo Bras Soares Passos wrote:
> > > (1) is not an option, as the interface currently uses ret=1 to make
> > > sure MSG_ZEROCOPY is getting used,
> > > I added that so the user of qio_channel can switch off zero-copy if
> > > it's not getting used, and save some cpu.
> >
> > Yes (1) is not, but could you explain what do you mean by making sure
> > MSG_ZEROCOPY being used?  Why is it relevant to the retval here?
> 
> If sendmsg() is called with MSG_ZEROCOPY, and everything is configured
> correctly, the kernel will attempt to send the buffer using zero-copy.
> 
> Even with the right configuration on a recent enough kernel, there are
> factors that can prevent zero-copy from happening, and the kernel will
> fall back to the copying mechanism.
> An example being the net device not supporting 'Scatter-Gather'
> feature (NETIF_F_SG).
> 
> When this happens, there is an overhead for 'trying zero-copy first',
> instead of just opting for the copying mechanism.
> 
> In a previous iteration of the patchset, it was made clear that it's
> desirable to detect when the kernel falls back to copying mechanism,
> so the user of 'QIOChannelSocket' can switch to copying and avoid the
> overhead. This was done by the return value of flush(), which is 1 if
> that occurs.

Two questions..

  1) When that happens, will MSG_ERRQUEUE keeps working just like zerocopy
     is functional?

     If the answer is yes, I don't see how ret=1 will ever be
     returned.. because we'll also go into the same loop in
     qio_channel_socket_flush() anyway.

     If the answer is no, then since we'll have non-zero zero_copy_queued,
     will the loop in qio_channel_socket_flush() go into a dead one?  How
     could it return?

  2) Even if we have the correct ret=1 returned when that happens, which
     caller is detecting that ret==1 and warn the admin?

Thanks,

-- 
Peter Xu


