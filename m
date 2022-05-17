Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F1052A921
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:23:58 +0200 (CEST)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0vH-0002h4-Qu
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nr0uB-0001BU-RD
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:22:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nr0u8-0003YD-Bd
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652808159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5M5ybQCJELRKQmZVifH5iGv/+8HHGkuZ3jA7oQmETrc=;
 b=SpdQeJlJy0g15+0k0Z5MJgaDEdC+xbRBuda21iBCtLKZetnIMz6le8dbokqXEEOZf2bZkW
 FUio/f1c0ydkiCXbf+jBTxYHOw+oc6Vq1qkJRSY+ZF5GFus86sjLTc4FXCllf34fEnnIUg
 bV3vYHlU8c2FRNP6q6YqBCYphj1FrIQ=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-ea0U6lg3OtS5uJvH_zZ22Q-1; Tue, 17 May 2022 13:22:35 -0400
X-MC-Unique: ea0U6lg3OtS5uJvH_zZ22Q-1
Received: by mail-il1-f200.google.com with SMTP id
 i11-20020a056e02152b00b002d115c069efso3568532ilu.22
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=5M5ybQCJELRKQmZVifH5iGv/+8HHGkuZ3jA7oQmETrc=;
 b=Lxh90Yn8SLGMH6gbryyCEjCGc9YckPJPrJp2gQ6+ymUrt9AMHFLjpIhq++WGHa1tb8
 6OIyKt1in71uZH6pOUJILxg9K2tnvcZ7o+0t86p8GoMrB9i/dRq9nhJd4I+uao2nolD+
 WQer6+H3lNNWDsCLhSRq7Z9+FnoLQjzQMl/98Rgt7a0MiQ+ad+XZmXMxOA8v1MrRw6BA
 Nz3tR8gPjGVILHncpYVIVi3J4uv9BRRgUno1kxn3/0m4xu4Cdh/WACSTQTiGhBYzM+hO
 OY44lK74F2z02jB/Vhejfv1+VlFmvC5sGRSTy/lRpALxyM2gU0Gm/aXazAoRX/zmjDNI
 wTzQ==
X-Gm-Message-State: AOAM530BI+aDRrifdC6j4ajLY3KHmCdVG5ULnDfxBtm7GlFJBhVQ+tWP
 qo9OYrZX7ew5PsBp9HkKiHC7Mr//Gtlkv7WXH/YRFcvkvC4g0NMzX4HT9eFNxZciRzArq20mYmH
 aIzWbmU32tYt7pNo=
X-Received: by 2002:a05:6602:2c4b:b0:65a:c92a:d3eb with SMTP id
 x11-20020a0566022c4b00b0065ac92ad3ebmr10542074iov.138.1652808155224; 
 Tue, 17 May 2022 10:22:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIf/3RF+MDej8Q9LV2pMBAMPDXMhMnS32wH5wtlzIcgWM8zP5g+EVoFRZ8BHTlIh6Fk1Yhjg==
X-Received: by 2002:a05:6602:2c4b:b0:65a:c92a:d3eb with SMTP id
 x11-20020a0566022c4b00b0065ac92ad3ebmr10542051iov.138.1652808154932; 
 Tue, 17 May 2022 10:22:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n20-20020a027114000000b0032b3a7817a0sm3651788jac.100.2022.05.17.10.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 10:22:34 -0700 (PDT)
Date: Tue, 17 May 2022 11:22:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia
 Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page
 tracking is not supported
Message-ID: <20220517112232.7a9f8be9.alex.williamson@redhat.com>
In-Reply-To: <20220517160844.GV1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
 <20220517100045.27a696c9.alex.williamson@redhat.com>
 <20220517160844.GV1343366@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Tue, 17 May 2022 13:08:44 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, May 17, 2022 at 10:00:45AM -0600, Alex Williamson wrote:
> 
> > > This is really intended to be a NOP from where things are now, as if
> > > you use mlx5 live migration without a patch like this then it causes a
> > > botched pre-copy since everything just ends up permanently dirty.
> > > 
> > > If it makes more sense we could abort the pre-copy too - in the end
> > > there will be dirty tracking so I don't know if I'd invest in a big
> > > adventure to fully define non-dirty tracking migration.  
> > 
> > How is pre-copy currently "botched" without a patch like this?  If it's
> > simply that the pre-copy doesn't converge and the downtime constraints
> > don't allow the VM to enter stop-and-copy, that's the expected behavior
> > AIUI, and supports backwards compatibility with existing SLAs.  
> 
> It means it always fails - that certainly isn't working live
> migration. There is no point in trying to converge something that we
> already know will never converge.

If we eliminate the pre-copy phase then it's not so much live migration
anyway.  Trying to converge is indeed useless work, but afaik it's that
useless work that generates the data that management tools can use to
determine that SLAs cannot be achieved in a compatible way.
 
> > I'm assuming that by setting this new skip_precopy flag that we're
> > forcing the VM to move to stop-and-copy, regardless of any other SLA
> > constraints placed on the migration.    
> 
> That does seem like a defect in this patch, any SLA constraints should
> still all be checked under the assumption all ram is dirty.

The migration iteration function certainly tries to compare remaining
bytes to a threshold based on bandwidth and downtime.  The exit path
added here is the same as it would take if we had achieved our
threshold limit.  It's not clear to me that we're checking the downtime
limit elsewhere or have the data to do it if we don't transfer anything
estimate bandwidth.

> > It seems like a better solution would be to expose to management
> > tools that the VM contains a device that does not support the
> > pre-copy phase so that downtime expectations can be adjusted.  
> 
> I don't expect this to be a real use case though..
> 
> Remember, you asked for this patch when you wanted qemu to have good
> behavior when kernel support for legacy dirty tracking is removed
> before we merge v2 support.

Is wanting good behavior a controversial point?  Did we define this as
the desired good behavior?  Ref?  Thanks,

Alex


