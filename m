Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28B531C83D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:44:29 +0100 (CET)
Received: from localhost ([::1]:43002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBwuC-0008UG-KC
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lBwt1-00084L-Rq
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:43:15 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lBwsz-0002kz-Lz
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:43:15 -0500
Received: by mail-pj1-x1036.google.com with SMTP id t2so5595008pjq.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 01:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8dIkdZS725F6crHs/wzawaXhWitDInC7D7fSuD5ArSg=;
 b=Q3F4h6PRr24fRtMP/5IRawe4D8m+xgEfOKgwJS7APdYGGM26Pz9tveS5UGmo/deD/o
 dNNvdsjpGReoXXuwe+ohmoLa/JvYNgGFzazUm3OJhI5JBKfspiSi9XSiAkUtLkor8hnK
 kmbqR3hOMziBbbXyflDZNdaqg+1P21a+PVur6b6rfF3Z3redyTllvl4z0ACCVBWH7KX+
 +YbBpNZzWMW1Zz43sBOLsUkp/Klq9LTAALUqwZ6UQ6XGZ8+f01p0qyArthU8TP901bZ5
 yWgRU8i8at03Ekp+byMUweKjMrNkW6C1NIPNi1DArxnYi08gZqRZ8R8GQnFfsga5vfhk
 G2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8dIkdZS725F6crHs/wzawaXhWitDInC7D7fSuD5ArSg=;
 b=mVWeY2cLWNkWznrzqmRvcx6+hcZqPRUYQTTVfRi9UljHa2368HikL7NomtEJKeU6zQ
 KWlOTSV/WeascVq6M632J8+ArHJxVwrqoN0a2OIt6hhSXXJc9eijKAKxin7VfwnH75oY
 nymDwxMGjmvfUHEqGGTNFJUgmcfR8kBeXtCUk+zKRSDLk63WMXWuEPO5BLKzm9ZCrwG8
 GL0kjL3e4brRobRgYrxVK5A+K7rp5sDUHfid3w/EEJsg/2QLJSOu1ejd9DKBY3WouCLU
 d8KO/vhRL4+7KSvDugb0pyWJZF2WVmAZMsw1E3dTcu2cr5s8f4FHsRtVr0WmmUwiP0JQ
 wCSg==
X-Gm-Message-State: AOAM532hoB4OYxbFbihPsLU/qpvM4c4FbFULuTUKTVF5y62aPMJz82kS
 g6k1ClwDFmDi0AYMIZhhOT0=
X-Google-Smtp-Source: ABdhPJwFdKk64dKsSpGh0naybYFSy+hnxw0k6y7Z/IA3MLq6zK/tR90hzvxZAFgMtArYBumq9FMnYA==
X-Received: by 2002:a17:903:181:b029:df:c7e5:8e39 with SMTP id
 z1-20020a1709030181b02900dfc7e58e39mr19464360plg.25.1613468590095; 
 Tue, 16 Feb 2021 01:43:10 -0800 (PST)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id z36sm1490983pgl.23.2021.02.16.01.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 01:43:09 -0800 (PST)
Date: Tue, 16 Feb 2021 01:43:01 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 07/10] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210216094301.GA15303@private.email.ne.jp>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
 <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
 <20210212164038.207e0f54@redhat.com>
 <20210212205157.GA7151@private.email.ne.jp>
 <20210215134832.5a32e851@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Disposition: inline
In-Reply-To: <20210215134832.5a32e851@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 01:48:32PM +0100,
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 12 Feb 2021 12:51:57 -0800
> Isaku Yamahata <isaku.yamahata@gmail.com> wrote:
> 
> > On Fri, Feb 12, 2021 at 04:40:38PM +0100,
> > Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > > On Wed, 10 Feb 2021 22:46:43 -0800
> > > Isaku Yamahata <isaku.yamahata@intel.com> wrote:
> > >   
> > > > +    Aml *dev;
> > > > +    Aml *rbuf;
> > > > +    Aml *resource_template;
> > > > +    Aml *rbuf_name;
> > > > +    Aml *crs;
> > > > +
> > > > +    if (!acpi_get_mcfg(&mcfg)) {
> > > > +        return NULL;
> > > > +    }
> > > > +
> > > > +    /* DRAM controller */
> > > > +    dev = aml_device("DRAC");
> > > > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
> > > > +
> > > > +    resource_template = aml_resource_template();
> > > > +    aml_append(resource_template,
> > > > +               aml_qword_memory(AML_POS_DECODE,
> > > > +                                AML_MIN_FIXED,
> > > > +                                AML_MAX_FIXED,
> > > > +                                AML_NON_CACHEABLE,
> > > > +                                AML_READ_WRITE,
> > > > +                                0x0000000000000000,
> > > > +                                mcfg.base,
> > > > +                                mcfg.base + mcfg.size - 1,  
> > > s/mcfg.base + mcfg.size - 1/mcfg.base/  
> > 
> > AddressMaximum needs to be the highest address of the region.
> > Not base address. By disassemble/assembl it, iasl complains as follows.
> > Also there are similar examples in acpi-build.c.
> I mostly clean up all places to use the same base address for min/max,
> but probably something were left behind.
> 
> spec says:
> 
> acpi 6.3: 19.6.110 QWordMemory
> 
> AddressMaximum evaluates to a 64-bit integer that specifies the highest possible base address of the
> Memory range. The value must have ‘0’ in all bits where the corresponding bit in AddressGranularity is
> ‘1’. For bridge devices which translate addresses, this is the address on the secondary bus. The 64-bit
> field DescriptorName ._MAX is automatically created to refer to this portion of the resource descriptor.

Ok, Linux guest is happy with min=max.
I conlude that it's iasl issue.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

