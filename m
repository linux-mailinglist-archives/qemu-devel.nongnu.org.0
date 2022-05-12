Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243F052552C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:53:22 +0200 (CEST)
Received: from localhost ([::1]:42462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDw8-0007Wr-4D
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1npD8p-0004l2-Qy
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1npD8o-0002TG-6I
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652378541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J2aGsawIN7TYpb9uLEx34ZiA9hVtwjdQSN9JUWEVr5g=;
 b=L0PA+okgNKFNQ9Rhf3T7X9B0BMbmNBr7mDKMXjK6qDhfo+MFjCzfOxBHOA+oxdlMyEHY46
 sUE5bWnOvMgjaeVUyF8OxY/OoifXMeXh1+vU7E2hLo94F6Yj9lpNgDCpTUycUDxx8cETFS
 N2ecmgBcKeOkukjdBPVNPjbtfceR0z8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-VBorvobPMPONbE1ma0iNmg-1; Thu, 12 May 2022 14:02:20 -0400
X-MC-Unique: VBorvobPMPONbE1ma0iNmg-1
Received: by mail-io1-f72.google.com with SMTP id
 s129-20020a6b2c87000000b00657c1a3b52fso3459357ios.21
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 11:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=J2aGsawIN7TYpb9uLEx34ZiA9hVtwjdQSN9JUWEVr5g=;
 b=dINVCbOOoxwlB445AIGQKdGLTWe5fhCtZq/N6fqycWiTAHPh58bKko96zGyLEpgZoP
 HyKYHveC8CgaXm/r+xxR3+yeaZzm5kuVamMp4uSPrdLDcJ50/fnzw3dPE1oYhem9tOpS
 M3dpUB/eB0mD8ZCGLj9xqqYSvr1Hpl/FYnnyn4tqY7FgOd7DZMLxgWNVCDm2hxJjzMgS
 Y8cCy3/qIyRpU4/MK92ZvYlxJYT2pk52d44R/LPu3JCXFOZGorDzhfuHKK1cO3wgqyq1
 uOwwViQPkv4uVzD5RDp9bxOg6HqaJjGh02nPy3aIOwrfmFV+MLk838gRvaRJuBZDfX3y
 EgMw==
X-Gm-Message-State: AOAM530J7tplg9B018ws9BOSnAS8Q/Z943wyu/1RatyOnVYIV7wNr2Yn
 HYVWTymzYeH405iFOGdfBOTkoqRGLJH4es9AuWUgGFYf0djq1WIE8AHwZM70MK+3n6UhlA74UeO
 ku92pfY4LhO8Hd1o=
X-Received: by 2002:a92:d901:0:b0:2d0:36f6:afab with SMTP id
 s1-20020a92d901000000b002d036f6afabmr632082iln.88.1652378539786; 
 Thu, 12 May 2022 11:02:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6syvaVvowVnsksfRQaNKUD///bVjJcutSPO6ExWKqdv/hV3JUfwtocYC7d5xdlhWbEmjnOg==
X-Received: by 2002:a92:d901:0:b0:2d0:36f6:afab with SMTP id
 s1-20020a92d901000000b002d036f6afabmr632068iln.88.1652378539614; 
 Thu, 12 May 2022 11:02:19 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o18-20020a92c052000000b002cde6e3530dsm18012ilf.87.2022.05.12.11.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 11:02:19 -0700 (PDT)
Date: Thu, 12 May 2022 12:02:18 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 "Cornelia Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, "Mark Bloch" <mbloch@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH 0/9] vfio/migration: Implement VFIO migration protocol v2
Message-ID: <20220512120218.0f871784.alex.williamson@redhat.com>
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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

On Thu, 12 May 2022 18:43:11 +0300
Avihai Horon <avihaih@nvidia.com> wrote:

> Hello,
> 
> Following VFIO migration protocol v2 acceptance in kernel, this series
> implements VFIO migration according to the new v2 protocol and replaces
> the now deprecated v1 implementation.

Let's not bottleneck others waiting on a linux header file update on
also incorporating v2 support.  In the short term we just need the
first two patches here.

Are there any objections to folding those patches together for the sake
of bisection?  Thanks,

Alex


