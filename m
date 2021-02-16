Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3031CB66
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:47:49 +0100 (CET)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0hg-0003Df-Sq
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lC0fw-0002bw-D4
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:46:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lC0fr-0003p2-0O
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613483154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92Kih0mSZOuWLZvZdNDuPYq7S7JQ27ZJiI0lw4nbgK4=;
 b=SEBPMnr3hs4AW7oExOR/zL0Am1IC7a+7FavWJXlSX6frQA1JYhMqrwOcpBeF6rlr4yOYXn
 Mbx39+BYhPXXddcMDRVMjTZfHSVg34WShrt6lj5CbRyjw9/9y3/bmXDHED1TDpRMsB6fxY
 x06ZuKmFfKmGATIAG3Gk98c5BLEBJqE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-WOq-jB_eNtCN7iToKXSIcQ-1; Tue, 16 Feb 2021 08:45:53 -0500
X-MC-Unique: WOq-jB_eNtCN7iToKXSIcQ-1
Received: by mail-ej1-f72.google.com with SMTP id yc4so6158592ejb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=92Kih0mSZOuWLZvZdNDuPYq7S7JQ27ZJiI0lw4nbgK4=;
 b=JF+R33p/xB2nehfZcmjQSqWwZ0Iw3tfiQTGqDQkgn1JYOhj4C4Mr4XUUcC7YrwAVOj
 A4XSZaDe8G5TrsDd0QZ7s687eQqLo6sfMBgQSoqVsJSMJHkkZHNQL0eVltJ817U78JlY
 JshOUyeQkK5eozugK2hc9cUcEkHBGjWywhWvwKeD+zaktWam3UAxtGVCtVhrQbHG2eTC
 SmgumSYmoox3WP2RI/e9GSqCS2QfUQSZXASvTq/PRnIdy/t29LRsdbQ9TuY1W4hpwsII
 lxIafOBF+JPWz3HbjwUXv1XdizlcebCSCYCQ3fkJGCxyGL3wkFjiG8kjXb4roaN345RY
 RLZw==
X-Gm-Message-State: AOAM533vXFXRM7NJl90F7bHz3x7ZXQ0ryINpJsfRFKnOml53OMvuEHrb
 fBDx2MEGPLsUDZuukssd7hgqZRqSGwAzljcSNEQtdmo/xBsaZwLY1rS+Jj7BhiizE0v+UvbMpev
 9JjHhWjZvysEfar4=
X-Received: by 2002:a17:906:5d0b:: with SMTP id
 g11mr20516418ejt.542.1613483151837; 
 Tue, 16 Feb 2021 05:45:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6ktHTfYw2eLEP2XL4TYHkzBfvX9lTLtFz4exf4ETGWlm9J9UJf5wNKZ3Io2UtUBHPi5jDjA==
X-Received: by 2002:a17:906:5d0b:: with SMTP id
 g11mr20516396ejt.542.1613483151608; 
 Tue, 16 Feb 2021 05:45:51 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id i13sm6156936edk.38.2021.02.16.05.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 05:45:51 -0800 (PST)
Date: Tue, 16 Feb 2021 08:45:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH v3 07/10] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210216084510-mutt-send-email-mst@kernel.org>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
 <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
 <20210212164038.207e0f54@redhat.com>
 <20210212205157.GA7151@private.email.ne.jp>
 <20210215134832.5a32e851@redhat.com>
 <20210216094301.GA15303@private.email.ne.jp>
MIME-Version: 1.0
In-Reply-To: <20210216094301.GA15303@private.email.ne.jp>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 01:43:01AM -0800, Isaku Yamahata wrote:
> On Mon, Feb 15, 2021 at 01:48:32PM +0100,
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Fri, 12 Feb 2021 12:51:57 -0800
> > Isaku Yamahata <isaku.yamahata@gmail.com> wrote:
> > 
> > > On Fri, Feb 12, 2021 at 04:40:38PM +0100,
> > > Igor Mammedov <imammedo@redhat.com> wrote:
> > > 
> > > > On Wed, 10 Feb 2021 22:46:43 -0800
> > > > Isaku Yamahata <isaku.yamahata@intel.com> wrote:
> > > >   
> > > > > +    Aml *dev;
> > > > > +    Aml *rbuf;
> > > > > +    Aml *resource_template;
> > > > > +    Aml *rbuf_name;
> > > > > +    Aml *crs;
> > > > > +
> > > > > +    if (!acpi_get_mcfg(&mcfg)) {
> > > > > +        return NULL;
> > > > > +    }
> > > > > +
> > > > > +    /* DRAM controller */
> > > > > +    dev = aml_device("DRAC");
> > > > > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
> > > > > +
> > > > > +    resource_template = aml_resource_template();
> > > > > +    aml_append(resource_template,
> > > > > +               aml_qword_memory(AML_POS_DECODE,
> > > > > +                                AML_MIN_FIXED,
> > > > > +                                AML_MAX_FIXED,
> > > > > +                                AML_NON_CACHEABLE,
> > > > > +                                AML_READ_WRITE,
> > > > > +                                0x0000000000000000,
> > > > > +                                mcfg.base,
> > > > > +                                mcfg.base + mcfg.size - 1,  
> > > > s/mcfg.base + mcfg.size - 1/mcfg.base/  
> > > 
> > > AddressMaximum needs to be the highest address of the region.
> > > Not base address. By disassemble/assembl it, iasl complains as follows.
> > > Also there are similar examples in acpi-build.c.
> > I mostly clean up all places to use the same base address for min/max,
> > but probably something were left behind.
> > 
> > spec says:
> > 
> > acpi 6.3: 19.6.110 QWordMemory
> > 
> > AddressMaximum evaluates to a 64-bit integer that specifies the highest possible base address of the
> > Memory range. The value must have ‘0’ in all bits where the corresponding bit in AddressGranularity is
> > ‘1’. For bridge devices which translate addresses, this is the address on the secondary bus. The 64-bit
> > field DescriptorName ._MAX is automatically created to refer to this portion of the resource descriptor.
> 
> Ok, Linux guest is happy with min=max.
> I conlude that it's iasl issue.
> 
> Thanks,

OK but what about all the other places in the code that seem to use this
field differently?

-- 
MST


