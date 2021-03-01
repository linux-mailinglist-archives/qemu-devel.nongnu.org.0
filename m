Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606A3282D3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:52:45 +0100 (CET)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkqi-00077S-GE
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGkoT-00062b-5n
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:50:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGkoP-0001bo-4Y
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614613819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QROTVm6i767r9jJ4lmz7ScYYUu95J4nAcDF/5ZlGgks=;
 b=WHBar4k8OEo8pN4M9vNxjUpyuNL8VSHTu1ANoWPwCxFT1oC3LwZiSw/+Z7GJm4wFv5Qj4n
 RNYMql+KC7EXhUZYoA9gvVajRqj84chCIqCcYv1THfFOtcwG6Hb/ZDgIAHbjwcoksw4lhi
 ZuYDE8PxAexjVa4W/pepbveGutH7/jg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-tO6grJXdN-edpIp-PArOYg-1; Mon, 01 Mar 2021 10:50:11 -0500
X-MC-Unique: tO6grJXdN-edpIp-PArOYg-1
Received: by mail-ej1-f70.google.com with SMTP id h14so2905832ejg.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 07:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QROTVm6i767r9jJ4lmz7ScYYUu95J4nAcDF/5ZlGgks=;
 b=UZj4St8uCmHeSIe9sLQkI+5dX/sm8UGs2zVcD5tHOfT2cl1tZR+L5j/tECOWirqgDX
 8jx9vFLripzxRrxANVVr5XUO8qcGsV7NT1NI/Mk2mmNK4hI2OMTFRdtTe2rCMLtArnsW
 rNkjRhTR5as21PkmbDDP/PIGjZOWS9nxRsthAvkslh6W1xVch0eKz1SMzWVdqCk+pt6E
 iISEuf5ygFZUcSdFtrgMnjTvPGXOhid65D9OA9qNkWP7XSBAvnv2TTWCNJNijkuFoXGH
 k2Po2WEPBdBpe3ArZDYjdvMMTpzAPAXFG9T33KEvbg/0xqakcVF6ZJNp05DehfxI4GNL
 031w==
X-Gm-Message-State: AOAM5336NU9bzKF+V/EU/9XTClGAAu111nfV5KudTr63jWJR580H6FWf
 +dRKydGURkdlFty6kDQCnqeuHfUgUZkTPIf6Rvtz3Nnj/g4dhkckdbNna5kGHKehLO5HSidK+be
 n//I9kAAY5EFvu5w=
X-Received: by 2002:a17:906:5e4a:: with SMTP id
 b10mr1820994eju.116.1614613810211; 
 Mon, 01 Mar 2021 07:50:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxk65o7nEOQSI+igvN92CX3fwWIYULoeXzQpSX9/BSPdsBlCxFWTmncwj/7LjU3lMXyEr9sYA==
X-Received: by 2002:a17:906:5e4a:: with SMTP id
 b10mr1820971eju.116.1614613809994; 
 Mon, 01 Mar 2021 07:50:09 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id dz7sm15922179edb.74.2021.03.01.07.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 07:50:09 -0800 (PST)
Date: Mon, 1 Mar 2021 10:50:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [RFC PATCH 4/5] hw/acpi/aml-build: add processor hierarchy node
 structure
Message-ID: <20210301103619-mutt-send-email-mst@kernel.org>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-5-fangying1@huawei.com>
 <20210225114732.5f7gqgl7lym7d4hs@kamzik.brq.redhat.com>
 <5afc6d2b-6e16-d44c-13cf-bd75c63f89db@huawei.com>
 <20210301093919.yt65iz26p6niairw@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301093919.yt65iz26p6niairw@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, Henglong Fan <fanhenglong@huawei.com>,
 alistair.francis@wdc.com, qemu-arm@nongnu.org,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 10:39:19AM +0100, Andrew Jones wrote:
> On Fri, Feb 26, 2021 at 10:23:03AM +0800, Ying Fang wrote:
> > 
> > 
> > On 2/25/2021 7:47 PM, Andrew Jones wrote:
> > > On Thu, Feb 25, 2021 at 04:56:26PM +0800, Ying Fang wrote:
> > > > Add the processor hierarchy node structures to build ACPI information
> > > > for CPU topology. Since the private resources may be used to describe
> > > > cache hierarchy and it is variable among different topology level,
> > > > three helpers are introduced to describe the hierarchy.
> > > > 
> > > > (1) build_socket_hierarchy for socket description
> > > > (2) build_processor_hierarchy for processor description
> > > > (3) build_smt_hierarchy for thread (logic processor) description
> > > > 
> > > > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > > > Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
> > > > ---
> > > >   hw/acpi/aml-build.c         | 40 +++++++++++++++++++++++++++++++++++++
> > > >   include/hw/acpi/acpi-defs.h | 13 ++++++++++++
> > > >   include/hw/acpi/aml-build.h |  7 +++++++
> > > >   3 files changed, 60 insertions(+)
> > > > 
> > > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > > index a2cd7a5830..a0af3e9d73 100644
> > > > --- a/hw/acpi/aml-build.c
> > > > +++ b/hw/acpi/aml-build.c
> > > > @@ -1888,6 +1888,46 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> > > >                    table_data->len - slit_start, 1, oem_id, oem_table_id);
> > > >   }
> > > > +/*
> > > > + * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
> > > > + */
> > > > +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
> > > > +{
> > > > +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
> > > > +    build_append_byte(tbl, 20);         /* Length, no private resources */
> > > > +    build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
> > > > +    build_append_int_noprefix(tbl, ACPI_PPTT_PHYSICAL_PACKAGE, 4);
> > > 
> > > Missing '/* Flags */'
> > 
> > Will fix.
> > 
> > > 
> > > > +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> > > > +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
> > > > +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
> > > > +}
> > > > +
> > > > +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
> > > > +                               uint32_t parent, uint32_t id)
> > > > +{
> > > > +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR);  /* Type 0 - processor */
> > > > +    build_append_byte(tbl, 20);         /* Length, no private resources */
> > > > +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
> > > > +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
> > > > +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> > > > +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
> > > > +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
> > > > +}
> > > > +
> > > > +void build_thread_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
> > > > +{
> > > > +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
> > > > +    build_append_byte(tbl, 20);           /* Length, no private resources */
> > > > +    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
> > > > +    build_append_int_noprefix(tbl,
> > > > +                              ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
> > > > +                              ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD |
> > > > +                              ACPI_PPTT_ACPI_LEAF_NODE, 4);  /* Flags */
> > > > +    build_append_int_noprefix(tbl, parent , 4); /* parent */
> > > 
> > > 'parent' not capitalized. We want these comments to exactly match the text
> > > in the spec.
> > 
> > Will fix.
> > 
> > > 
> > > > +    build_append_int_noprefix(tbl, id, 4);      /* ACPI processor ID */
> > > > +    build_append_int_noprefix(tbl, 0, 4);       /* Num of private resources */
> > > > +}
> > > > +
> > > >   /* build rev1/rev3/rev5.1 FADT */
> > > >   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> > > >                   const char *oem_id, const char *oem_table_id)
> > > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > > index cf9f44299c..45e10d886f 100644
> > > > --- a/include/hw/acpi/acpi-defs.h
> > > > +++ b/include/hw/acpi/acpi-defs.h
> > > > @@ -618,4 +618,17 @@ struct AcpiIortRC {
> > > >   } QEMU_PACKED;
> > > >   typedef struct AcpiIortRC AcpiIortRC;
> > > > +enum {
> > > > +    ACPI_PPTT_TYPE_PROCESSOR = 0,
> > > > +    ACPI_PPTT_TYPE_CACHE,
> > > > +    ACPI_PPTT_TYPE_ID,
> > > > +    ACPI_PPTT_TYPE_RESERVED
> > > > +};
> > > > +
> > > > +#define ACPI_PPTT_PHYSICAL_PACKAGE          (1)
> > > > +#define ACPI_PPTT_ACPI_PROCESSOR_ID_VALID   (1 << 1)
> > > > +#define ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD  (1 << 2)      /* ACPI 6.3 */
> > > > +#define ACPI_PPTT_ACPI_LEAF_NODE            (1 << 3)      /* ACPI 6.3 */
> > > > +#define ACPI_PPTT_ACPI_IDENTICAL            (1 << 4)      /* ACPI 6.3 */

You need to quote specific place in spec where this appeared, not
just version. and what about previous ones?


> > > > +
> > > >   #endif
> > > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > > index 380d3e3924..7f0ca1a198 100644
> > > > --- a/include/hw/acpi/aml-build.h
> > > > +++ b/include/hw/acpi/aml-build.h
> > > > @@ -462,6 +462,13 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> > > >   void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> > > >                   const char *oem_id, const char *oem_table_id);
> > > > +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
> > > > +
> > > > +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
> > > > +                               uint32_t parent, uint32_t id);
> > > > +
> > > > +void build_thread_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
> > > 
> > > Why does build_processor_hierarchy() take a flags argument, but the
> > > others don't? Why not just have a single 'flags' taking function,
> > > like [*] that works for all of them? I think that answer to that is
> > 
> > Yes, you are right.
> > 
> > > that when cache topology support is added it's better to break these
> > > into separate functions, but should we do that now? It seems odd to
> > > be introducing unused defines and this API before it's necessary.
> > So it is better for us to keep just one common build_processor_hierarchy
> > API here in your opinion.
> 
> Well, a consistent API without unused defines. Whether or not that's
> a single common function or not isn't that important.
> 
> Thanks,
> drew

Yes, the preferred way is code comments:
E.g.

    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR);  /* Type 0 - processor */

should be

    build_append_byte(tbl, 0);  /* Type 0 - processor */


similar:

> > > > +    build_append_int_noprefix(tbl,
> > > > +                              ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
> > > > +                              ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD |
> > > > +                              ACPI_PPTT_ACPI_LEAF_NODE, 4);  /* Flags */

should be

 +    build_append_int_noprefix(tbl, /* Processor Structure Flags */
 +                              (1 << 1)  /* ACPI Processor ID valid */|
 +                              (1 << 2) /* Processor is a Thread */) |
 +                              (1 << 3) /* Node is a Leaf */, 4);

where you would make sure the text matches the spec verbatim.

also note how for multi-line code comments precede the code.
For single-line they can come after the code.

> > 
> > > 
> > > [*] https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11
> > > 
> > > Thanks,
> > > drew
> > > 
> > > > +
> > > >   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> > > >                   const char *oem_id, const char *oem_table_id);
> > > > -- 
> > > > 2.23.0
> > > > 
> > > > 
> > > 
> > > .
> > > 
> > 
> > Thanks,
> > Ying.
> > 


