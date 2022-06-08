Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6524543E19
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:02:55 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2pK-0000vp-C4
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nz2nm-0000D8-7Y
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:01:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nz2na-0003wS-8W
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654722064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQqCAKqmtt3PHDQ9fKMCD9pst0jh5CmgUlUKqiiSI8k=;
 b=Z59wXWKHskPmlTnfzxIw3NL1W//0QbHczOIF6Do6xU7iGXjsyhr/C6Ryw4P6a+uWq04t1W
 AaqFKPBCP/5FxmvrOfnst9utQit+yQxWMzuDYiml6fgbaexQ4hI6qwlsDVPbT1jt9rCRfI
 ANGQE70zQW6zow+U4iCGUCgLeRXsMm8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-4W-EMfsRP4CtJZkEUdOzYQ-1; Wed, 08 Jun 2022 17:01:03 -0400
X-MC-Unique: 4W-EMfsRP4CtJZkEUdOzYQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 kf3-20020a17090776c300b0070d149300e9so7543060ejc.15
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sQqCAKqmtt3PHDQ9fKMCD9pst0jh5CmgUlUKqiiSI8k=;
 b=JLL7IvESMjVUXqwkBW1+16oBfMNUZ591A1TFQAIJ90LvidPoaQDPOddJD7K0bwFK4T
 vJcHCZfYswVS47vjGsdSyNQL+ss7rZaHsVslVG41yWLYJWS4e80WyWhdAMZoL9PgAB6L
 t6fuH2y4Si9rfMto82lttdu2RKX0G6mTdkZ05sjsEb+koK1REE7e1w61MxPY9jxg5krj
 4TgpKy23GOwNdXauHyFu7CbaOwmnK+rw+9q8TLSHZRZETaJjkpFjJ6ULFYvfU5SHmpqw
 GrqMf3s2RRuKnhQoNpidamu1AyChbKBRRD8VQEIjAPWjuxS+B10ZRS+LcuQQM0nwHcvm
 gnjQ==
X-Gm-Message-State: AOAM531N6qDpnCkZH/UdlSrDT2i7Xw5DnH2GMivzK+OdnEPB6GrlZ+pb
 Xw8+Z2AiG0JGQ+Bx/iZFNDWk+qsM+9ZjM6jD9kmDikL22ADlO7h64VoIR870V4UJc8V1nIH1fwj
 ychZMW+RdsVUWOcFZ0xYaICI4Qan1otg=
X-Received: by 2002:a17:906:aad9:b0:711:d024:4b9b with SMTP id
 kt25-20020a170906aad900b00711d0244b9bmr16523978ejb.490.1654722062217; 
 Wed, 08 Jun 2022 14:01:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKQwVPnP5Ya20NTu3gPx5vUqgqxEqajJTwnk+25CGmpxN1yiYTzM0kgcf/Pb6vITd0wPSi12xgbIPeVnq9s0A=
X-Received: by 2002:a17:906:aad9:b0:711:d024:4b9b with SMTP id
 kt25-20020a170906aad900b00711d0244b9bmr16523968ejb.490.1654722062011; Wed, 08
 Jun 2022 14:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220608181808.79364-1-leobras@redhat.com>
 <YqEF4ikvnsizTQGO@xz-m1.local> <YqEMw4NWo3POMK47@xz-m1.local>
In-Reply-To: <YqEMw4NWo3POMK47@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 8 Jun 2022 18:00:51 -0300
Message-ID: <CAJ6HWG7cEP9f=hifs7rsxdG3789+kSRgDkVJXUY=n3i-U_57AQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] QIOChannelSocket: Fix zero-copy send so socket
 flush works
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 8, 2022 at 5:55 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jun 08, 2022 at 04:26:10PM -0400, Peter Xu wrote:
> > On Wed, Jun 08, 2022 at 03:18:09PM -0300, Leonardo Bras wrote:
> > > Somewhere between v6 and v7 the of the zero-copy-send patchset a cruc=
ial
> > > part of the flushing mechanism got missing: incrementing zero_copy_qu=
eued.
> > >
> > > Without that, the flushing interface becomes a no-op, and there is no
> > > garantee the buffer is really sent.
> > >
> > > This can go as bad as causing a corruption in RAM during migration.
> > >
> > > Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy=
 flag & io_flush for CONFIG_LINUX")
> > > Reported-by: =E5=BE=90=E9=97=AF <xuchuangxclwt@bytedance.com>
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> >
> > Copy Dave/Juan; Leo please remember to do so in the next posts, or no o=
ne
> > will be picking this up. :)
>

Thanks for letting me know.

> My fault, it's an io channel patch.  But still good to copy relevant
> developers..

Np. Sure, I will keep in mind to add them in the next version.

Oh, BTW: I will be sending a v2 shortly.

>
> --
> Peter Xu
>


