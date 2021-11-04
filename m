Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B6444DD5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 04:44:52 +0100 (CET)
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miTgJ-0004Ep-Eb
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 23:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1miTeu-0003Yw-Bt
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 23:43:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1miTer-0005d1-PM
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 23:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635997398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bxApypqaX+j+lU8AdAXV+XrGHCVrij/6BHV//lNy+Pw=;
 b=EJK2R9ct7N2Umb0xJvVJAsCqHpaTahoZRRj1eYkH97Db7OrJxS3FW7dZncct4LndW+wMPY
 u4YoQJahGUXE01RrMMrsdo+dYy/KYodVgiNRlnF9LOHGucQBYD0AAVPUj+dP9P4BwxrKGd
 3B0B010YwCsNl6oS3Z43JksPT05/Ado=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-J67SwQb-MaaCBQFT7WfovA-1; Wed, 03 Nov 2021 23:43:17 -0400
X-MC-Unique: J67SwQb-MaaCBQFT7WfovA-1
Received: by mail-lf1-f70.google.com with SMTP id
 i1-20020a056512340100b003fdd5b951e0so1400781lfr.22
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 20:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxApypqaX+j+lU8AdAXV+XrGHCVrij/6BHV//lNy+Pw=;
 b=f+6r35ppLuIKdh8M1yxiN6FchGfAMEAdSO3hSaOhGDa4oTOP/xGr+qapCeoeyKi5/U
 4yFBl3LwcT3XXmNMfjC/KJkutcCGkEyrDTzNu+ccY2cnQPqa2IaMcDL4ICeWnQ8/onzm
 AjiSefZpq5sR2ThGxeFLJnd6rDeN5N5uuNYwkPJ8LIUxJ+svPsRTDIQ7IiWJpIaTnVor
 JHOsmYebWEx99ab74EN4F3qU4BwJ2zGssd9GZLdHByVU5YPgdx8zHW/BFbQMzJJg8loh
 6sEw7oONVDizoTA4n2hZp3jX3YS7uvVaJMUwjpgL4+6MNg5HjReJ7JTd7BKzPF0iYDVt
 rEzw==
X-Gm-Message-State: AOAM532G032gL/W4WNvQ43gxyPnCmCqg90fid24ZKwveOWcMyDnSRn8x
 a7TtrPmP+iyMyGjRKvEyp7/KGPYlBEI1rsTw5Ly6mPaLMgAA24JvVnaAHvsAlY0e/XAiAGeUlSW
 fwV7KyEit+aos3Gia49JQIVXzUUns3xE=
X-Received: by 2002:a05:651c:507:: with SMTP id
 o7mr30659255ljp.162.1635997395988; 
 Wed, 03 Nov 2021 20:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIo9V0LbNYa7wGYmENtcvupQWvwrE8ku+fNGxeE7JOC3h1mCXXKcOSusr5kqPa1/gQ0nQkHltb2qB9nnWA/k4=
X-Received: by 2002:a05:651c:507:: with SMTP id
 o7mr30659227ljp.162.1635997395726; 
 Wed, 03 Nov 2021 20:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <87sfwekabf.fsf@secure.mitica>
 <CAJ6HWG7erHjN7ZNi=oRC=e-boWexbCJ7bBpgKs9x1D-igVSAqw@mail.gmail.com>
 <87bl30hlgf.fsf@secure.mitica>
In-Reply-To: <87bl30hlgf.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 4 Nov 2021 00:43:25 -0300
Message-ID: <CAJ6HWG48VPV52B4DP4AF0Oe_m7Q71tmPbgETRq-RDe-+s-=Jnw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 8:24 PM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> > Hello Juan,
>
> hi
>
> > Current multifd's sendmsg() will block until all data is sent, is that correct?
> >
> > If that's the case, and supposing the network driver supports
> > multiqueue, maybe there is a small chance for this to happen.
> > I will add the flush at the end of each iteration, just to be sure.
> >
> >>
> >> After each iteration, one needs to be sure that no ram is inflight.
> >>
> >> This means that I think you don't need the last_sync parameter at all,
> >> as you have to do the flush() in every iteration.
>
> It means guest memory corruption, it _needs_ to be there.
> That is the whole reason why multifd code has to wait after each
> iteration for all channels to finish.  Probability of failure is low,
> but it exist, so it needs to be handled correctly.

Sure, I will add a flush after each iteration.

> >> >              '*multifd-zlib-level': 'uint8',
> >> >              '*multifd-zstd-level': 'uint8',
> >> > +         '*multifd-zerocopy': 'bool',
> >> >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> >>
> >> Something weird here.
> >>
> >> >              '*multifd-compression': 'MultiFDCompression',
> >> >              '*multifd-zlib-level': 'uint8',
> >> >              '*multifd-zstd-level': 'uint8',
> >> > +         '*multifd-zerocopy': 'bool',
> >> >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> >> >
> >>
> >> Same here.
> >
> > Could you please elaborate?
>
> Indentation,
>
> +         '*multifd-zerocopy': 'bool',
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>
> This is how it is seen here.  space/tab?

It was supposed to be using only spaces.
I will make sure to fix that.

>
> Later, Juan.
>
Thanks!

Best regards,
Leo


