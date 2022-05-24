Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD3D5332D1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 23:08:22 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntblN-0005xO-3z
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 17:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntbk2-0004vP-Op
 for qemu-devel@nongnu.org; Tue, 24 May 2022 17:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntbjz-0003E7-Ej
 for qemu-devel@nongnu.org; Tue, 24 May 2022 17:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653426413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=japWP58M+mFGiJPrnmvc3LaL5brYo3wVVXak/tLF2VM=;
 b=LXde8Nui//7DjOhfxYpVmILQ1hC1WXrkC1lf/eXOo+FrmyUgQtTiQOGf6HOXeYuqYZufnL
 ybFED+f9M6ZvqpM6SL15w0Kyqd1QEi7BIKPb8Wq8JUYaJjjr4LPySVCSZcnJTvgAknV2T4
 ousbarKao2az5iH8yg+Z9LXzScUD/Vs=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-gdKZX1sOOd6_msPq9eQ16g-1; Tue, 24 May 2022 17:06:51 -0400
X-MC-Unique: gdKZX1sOOd6_msPq9eQ16g-1
Received: by mail-il1-f200.google.com with SMTP id
 a2-20020a923302000000b002d1ad5053feso4432095ilf.17
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 14:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=japWP58M+mFGiJPrnmvc3LaL5brYo3wVVXak/tLF2VM=;
 b=to8mMaSaIisN99PJUbWQHH5z0b2Lc/XbOeXomU2U46gwFEMEyON1HqA+XfuuQb0O12
 9OVu1P4okJ+KpPUX3wdJCa1NtSFQ0cKkIbj6XaRAff3Hys15ybKFZEKob4WuaIrw7qUE
 akvqAHRfe8PQDW24nNXVTzCyJZ6T0dhvD38Brrq0WnPhQbBbrKdafWlz+K10ODIq+iOl
 KdExdn11fAkzsbuNaYZRc5t8M2CwY8Jp6DJdKrbv67o1LlBqYbHQEgNQtnGANNOb1z/k
 l8yuD5kdsAtDUXOrI9KUkHZlFqG5dxpI9zuRJoO2kWpFDax9oTwKMBGe9dNblZcqDR+F
 t8Ew==
X-Gm-Message-State: AOAM530EjtnSBj5Z00HPA0imtQIi32DHkeu7GkZ+bxXcOv3/hVqXtCsm
 vO7+NHUEX9Z/2tDsZE+yTQvHZI7Fyr6hMKoYPgQM0ErKCoGlsbPSwePUaWyhPUul+eBlacNP2ex
 X2HaYQti/ZgtQbV4=
X-Received: by 2002:a05:6638:2615:b0:32e:d246:8e27 with SMTP id
 m21-20020a056638261500b0032ed2468e27mr5442975jat.7.1653426410616; 
 Tue, 24 May 2022 14:06:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMTr1ntGar7LQSxCLd9pX010NqYwV5yAKqANpBmhuMV5FhjbW2JdH4GVYVu8ZJnUBPd1zwSg==
X-Received: by 2002:a05:6638:2615:b0:32e:d246:8e27 with SMTP id
 m21-20020a056638261500b0032ed2468e27mr5442963jat.7.1653426410383; 
 Tue, 24 May 2022 14:06:50 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 i30-20020a02601e000000b0032e1e0ac289sm3705281jac.8.2022.05.24.14.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 14:06:49 -0700 (PDT)
Date: Tue, 24 May 2022 17:06:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v6 11/13] tests: Add postcopy tls migration test
Message-ID: <Yo1I6PsxvvJDGVwr@xz-m1.local>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-12-peterx@redhat.com>
 <YoYX1rydzZcZekL3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoYX1rydzZcZekL3@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 19, 2022 at 11:11:34AM +0100, Daniel P. Berrangé wrote:
> On Tue, May 17, 2022 at 03:57:28PM -0400, Peter Xu wrote:
> > We just added TLS tests for precopy but not postcopy.  Add the
> > corresponding test for vanilla postcopy.
> > 
> > Rename the vanilla postcopy to "postcopy/plain" because all postcopy tests
> > will only use unix sockets as channel.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  tests/qtest/migration-test.c | 50 +++++++++++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index d33e8060f9..e8304aa454 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -481,6 +481,10 @@ typedef struct {
> >      bool only_target;
> >      /* Use dirty ring if true; dirty logging otherwise */
> >      bool use_dirty_ring;
> > +    /* Whether use TLS channels for postcopy test? */
> > +    bool postcopy_tls;
> > +    /* Used only if postcopy_tls==true, to cache the data object */
> > +    void *postcopy_tls_data;
> 
> Rather than adding these fields, I think it would be preferrable to
> pass the hooks in the same way I did for the precopy tests.

I can give it a shot.

Ideally I think we should rename MigrationCommon to MigrationPrecopy and
keep all the precopy stuff there, meanwhile we could have MigrationPostcopy
which will also include MigrationStart but keeps the postcopy bits around.
Then I'd need to move start_hook and so into MigrationStart.  But let me
start from simple..

-- 
Peter Xu


