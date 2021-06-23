Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50143B20DA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 21:14:47 +0200 (CEST)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw8Kk-0006uc-RX
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 15:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lw8JT-0006Dm-1M
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 15:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lw8JO-0007V8-Ff
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 15:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624475600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sbxzQVCOr1gix5uhKZLxGWvDBuJJhgmmJGnmWDnjm4=;
 b=Vowl80yAIOthDyFjEKXerE9xiPu2yQ9m5BTjufOsWGzt6uuwxJ9dfDW0KNN3QIvxZy5Xuu
 39xmnIaiBCmnxWXjrXct4VlbdVU5UNb3p7sVN7IMRmSkuMO5dSA4bD4mJQYh7vUeUU59z8
 B3yNhBAHeXwxOXYb+0AS3kGqrgM0L7I=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-ZHXT7ZrbPkK_aKh_xc3dmw-1; Wed, 23 Jun 2021 15:13:18 -0400
X-MC-Unique: ZHXT7ZrbPkK_aKh_xc3dmw-1
Received: by mail-ot1-f69.google.com with SMTP id
 i25-20020a9d4a990000b0290304f00e3e3aso1883037otf.15
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 12:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3sbxzQVCOr1gix5uhKZLxGWvDBuJJhgmmJGnmWDnjm4=;
 b=q94UYhQQIN9OEESRfbjDRTt+fk0V/hQt51uJI9X8W9svvZQONOY/iJbhb4fLyyL3Cx
 bmsdD3VIYpAXdzkSQLsEfFapZeei2gF+xRopVw2GO/UajZJhw7Pt716ptVmFwqYjKGJR
 jGO7n36iCkJ+6eucgZs//bHVe7Rg5/e0n9JvzsS8Xj+89bm4ORtzbUFxydq2Lg//xg/M
 ViJcBZ2g+JZvxLnnGx+Ko01kJTGXlPDmLRF7I4zUqMxnTA3v6036vnhmZ+HiAAfoncWj
 aSl1aK/ISdLLFIiubkq2avBIKG5xGHjSjjQm7JifQVUVqfI6rIL6m46HLNY1vqf2syCk
 r7Rw==
X-Gm-Message-State: AOAM531VHKG/PNV5yBV9NTsKHYNDtCc01l24/nqbMwC4Pb3hw5CmP+e7
 ylT9Kfl/2/bbGcEhekeDoPkHTBwxOKa2TDs/ExRV3gWSMdaAMdrxCsY/5q87+9vx471BlQucPTt
 vK/fvbVHUTL1XDeY=
X-Received: by 2002:a05:6808:1415:: with SMTP id
 w21mr1100881oiv.150.1624475598302; 
 Wed, 23 Jun 2021 12:13:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6r9o429icSIZxSRZMVmvCO0TBxLVlm3jWZifVP2WZSMPwAPmtOC5F6qQs4ahZ+UUYMCgaSQ==
X-Received: by 2002:a05:6808:1415:: with SMTP id
 w21mr1100865oiv.150.1624475598068; 
 Wed, 23 Jun 2021 12:13:18 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id 24sm144017oiz.26.2021.06.23.12.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:13:17 -0700 (PDT)
Date: Wed, 23 Jun 2021 13:13:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: David Edmondson <dme@dme.org>
Subject: Re: [PATCH RFC 0/6] i386/pc: Fix creation of >= 1Tb guests on AMD
 systems with IOMMU
Message-ID: <20210623131316.478ba1c8.alex.williamson@redhat.com>
In-Reply-To: <cunv965ni47.fsf@dme.org>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622151629.6c75427c.alex.williamson@redhat.com>
 <cunv965ni47.fsf@dme.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Auger Eric <eric.auger@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 08:40:56 +0100
David Edmondson <dme@dme.org> wrote:

> On Tuesday, 2021-06-22 at 15:16:29 -06, Alex Williamson wrote:
> 
> >> 	   Additionally, an alternative to hardcoded ranges as we do today,
> >> 	   VFIO could advertise the platform valid IOVA ranges without necessarily
> >> 	   requiring to have a PCI device added in the vfio container. That would
> >> 	   fetching the valid IOVA ranges from VFIO, rather than hardcoded IOVA
> >> 	   ranges as we do today. But sadly, wouldn't work for older hypervisors.  
> >
> >
> > $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u
> > 0x00000000fee00000 0x00000000feefffff msi
> > 0x000000fd00000000 0x000000ffffffffff reserved
> >
> > Ideally we might take that into account on all hosts, but of course
> > then we run into massive compatibility issues when we consider
> > migration.  We run into similar problems when people try to assign
> > devices to non-x86 TCG hosts, where the arch doesn't have a natural
> > memory hole overlapping the msi range.
> >
> > The issue here is similar to trying to find a set of supported CPU
> > flags across hosts, QEMU only has visibility to the host where it runs,
> > an upper level tool needs to be able to pass through information about
> > compatibility to all possible migration targets.  Towards that end, we
> > should probably have command line options that either allow to specify
> > specific usable or reserved GPA address ranges.  For example something
> > like:
> > 	--reserved-mem-ranges=host
> >
> > Or explicitly:
> >
> > 	--reserved-mem-ranges=13G@1010G,1M@4078M  
> 
> Would this not naturally be a property of a machine model?

That's an option too, maybe a better one given that we already know how
to manage different machine types.  We probably could not adopt QEMU
v6.1 versions of q35 and 440fx to include this reserved range give the
physical address width downsides Joao mentions.  The above was meant to
be more of an explicit method to match the VM address space to the host
versus the implicit mechanism of the machine type.  A new machine type
at least makes the decision a user policy rather than a magic artifact
of the processor vendor where the VM was first created, but it also
doesn't have the flexibility of the extra command line options.  Thanks,

Alex


