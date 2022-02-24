Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51374C27FB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:21:18 +0100 (CET)
Received: from localhost ([::1]:33722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAJI-0007IL-EM
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:21:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNA2U-0005iy-C1
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNA2P-0002XE-SY
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645693429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+PkY5yVu82KJmjRDnGruqgf+7Y69TdoVp+OlP9WQKI=;
 b=bjHg/EuZH8hw5G3yGUTJeFy60ZmufJeJDqWx2HCJVZQPBMmMmJrN2j1qMVM6sRwRscYbFi
 tuwVbjbJ/E7exNs5VR1DfJGHIZl6vQBjXtXPuD0PrP7fckxfE/eF86NbwbYTJdw3QViD1c
 BWqAJn45cI7HenRCEsMX5DQ3vAFxw9I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-lV3c8b5JNneOQ5hDGOCOnQ-1; Thu, 24 Feb 2022 04:03:48 -0500
X-MC-Unique: lV3c8b5JNneOQ5hDGOCOnQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 m11-20020a056402430b00b00410678d119eso427097edc.21
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 01:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+PkY5yVu82KJmjRDnGruqgf+7Y69TdoVp+OlP9WQKI=;
 b=rkeljLZBHOK14mclKF9cUkTT2McUwRN7g5P86nFPQd9HI+v+gdSFYZvMYg1rXkDqyA
 QzQyeR9NJhKBb+JtTk8D0GJXcUJUq1/8m7DpdmwpQA/Rsw65b3PU1XGXj/l4UOmCOkfY
 bquMBA7/sgFj2PczXcxivUfYjPVSYLkjZOEBJ9HEjmFU6RdiOmIGQwBjousHVyUWTSyx
 BbYyQ2itFq+hYqwoGPoFLJosBPb6IIajHE6Vh6//ZisRGj5v4/j3XKAEXa4xIztW3D9q
 zyOMICuFAQC3srzPA2kL0RRYYsSZC6Hg7Zjx/DfPjOI16A9n27xVLRBm5a9EjlmqLjA7
 vUHg==
X-Gm-Message-State: AOAM531FaC+DLNFhuScJcUw4RKQM4K9NObK0EmAgnkX9xQ45C1IGiCA4
 zY6mSk59Kmu4BnmjuRT2qBC9ZZ4LDZjIvWlqWGeRO7+29dqgxrLoFk3kPDMZT5Qbn6I8QyEC7DJ
 ZClC1WM6bJOqr810=
X-Received: by 2002:a17:906:2a92:b0:6cd:4349:dc1a with SMTP id
 l18-20020a1709062a9200b006cd4349dc1amr1427387eje.648.1645693427067; 
 Thu, 24 Feb 2022 01:03:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/h8YgpUrEbqUht1DptuNCSOTwAGZOib8zw/46RHnCDgAwVSqUVJb59IeQGaxW2DNlpKJZgg==
X-Received: by 2002:a17:906:2a92:b0:6cd:4349:dc1a with SMTP id
 l18-20020a1709062a9200b006cd4349dc1amr1427373eje.648.1645693426875; 
 Thu, 24 Feb 2022 01:03:46 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h27sm1076728ejb.13.2022.02.24.01.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 01:03:46 -0800 (PST)
Date: Thu, 24 Feb 2022 10:03:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/pc: when adding reserved E820 entries do not
 allocate dynamic entries
Message-ID: <20220224100345.2bdfc9d9@redhat.com>
In-Reply-To: <CAARzgwxXAn83xE80o8+YNUeQJVn6NdtAGjC0e+KjEgbYAQaUkw@mail.gmail.com>
References: <20220210132822.2969324-1-ani@anisinha.ca>
 <20220223100410.756ffe35@redhat.com>
 <CAARzgwxXAn83xE80o8+YNUeQJVn6NdtAGjC0e+KjEgbYAQaUkw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 17:30:34 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, Feb 23, 2022 at 2:34 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Thu, 10 Feb 2022 18:58:21 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  
> > > When adding E820_RESERVED entries we also accidentally allocate dynamic
> > > entries. This is incorrect. We should simply return early with the count of
> > > the number of reserved entries added.  
> >
> > can you expand commit message to explain what's wrong and
> > how problem manifests ... etc.  
> 
> The issue has been present for the last 8 years without apparent
> visible issues. I think the only issue is that the bug allocates more
> memory in the firmware than is actually needed.

let me repeat: Why do you think it's an issue or why it's wrong

> 
> >  
> > >
> > > fixes: 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> > > cc: kraxel@redhat.com
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  hw/i386/e820_memory_layout.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> > > index bcf9eaf837..afb08253a4 100644
> > > --- a/hw/i386/e820_memory_layout.c
> > > +++ b/hw/i386/e820_memory_layout.c
> > > @@ -31,6 +31,8 @@ int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
> > >          entry->type = cpu_to_le32(type);
> > >
> > >          e820_reserve.count = cpu_to_le32(index);
> > > +
> > > +        return index;
> > >      }  
> >
> > this changes e820_table size/content, which is added by fw_cfg_add_file() to fwcfg,
> > as result it breaks ABI in case of migration.  
> 
> Ugh. So should we keep the bug? or do we add config setting to handle
> the ABI breakage.
> 


