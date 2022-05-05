Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E824F51BB66
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:06:58 +0200 (CEST)
Received: from localhost ([::1]:39536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXRp-0004lN-F9
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nmXBr-0007q3-6r
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:50:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:28183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nmXBl-0006q6-SJ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651740616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BGpFzYeZu57P6OAixqKpD6IPRKMwhDPZfYg+TVYsrbs=;
 b=P/VUfziCmO7VHoQdcwu7XoipiIfkrrOp/IIlXFdYtUfJiWBk1r0f5Y0mAO3UZuC5kRVzr6
 3RSxUZJH4t6lhxIPZZQkIaLBZYJtRtBrexwqRTUcpLaBSYeJKCvNOQvnsjTQ4QWRSOvadQ
 QmsTDeQhI8/XmVQfIP5+2+HUhgbaTCE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-hMIbcNejNky4CUq_Oj55Bg-1; Thu, 05 May 2022 04:50:15 -0400
X-MC-Unique: hMIbcNejNky4CUq_Oj55Bg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g7-20020adfbc87000000b0020ac76d254bso1215356wrh.6
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGpFzYeZu57P6OAixqKpD6IPRKMwhDPZfYg+TVYsrbs=;
 b=ZscbZaWSwjiuc3O6SbtAjspMz2NIlynJofDif0afOlLBqA8QOulfU/TUIH40IenIJ5
 Lj/sdHk07i0UR8cf75d5s6ZpLA/h766tRYo8ThSHhD8fdjjemH4as7cWem4GYnANpYCB
 /kHQwFbKbK0q44j+uCPsf+op/6fykWWt/E0Fi/DwwxOMWEEuzMAf4LWmoErzAkKUml2j
 iBCwiBNuuioRprTPlN54bNwtgikGNuqCnsT7pzBLsSGVk/8OSbCACyBqhusKXf7+tbjc
 L6UnhJau3sJ6RaqrcvV5IqRZCDA+cXhf5EayCwwsjJX0LKADYwDRvggqy1+Xm3j9A3pT
 OuuQ==
X-Gm-Message-State: AOAM531c/+JMTRaaIdVptjMxPCF2kRF8v5ROpm2OA9SZC69n1Eo+2KX9
 smKpHeBE5c3hRL/bt6TIQZ6ir2AxSTnBbow15iEevAqHoa1h4rd2C7Oy6zpoYNEcWbniNgEWM+U
 R5EAQ719QoCsVz38=
X-Received: by 2002:a7b:c24d:0:b0:393:fac9:3015 with SMTP id
 b13-20020a7bc24d000000b00393fac93015mr3473780wmj.186.1651740613623; 
 Thu, 05 May 2022 01:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY8oX68vYcPAeHxEIYU1dWl5oyQqB2SiBWkWLEXrcAHY4+DzEkB1zibNyyVISouHLe+IQaiw==
X-Received: by 2002:a7b:c24d:0:b0:393:fac9:3015 with SMTP id
 b13-20020a7bc24d000000b00393fac93015mr3473748wmj.186.1651740613230; 
 Thu, 05 May 2022 01:50:13 -0700 (PDT)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 ay33-20020a05600c1e2100b003942a244ec8sm891940wmb.13.2022.05.05.01.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 01:50:12 -0700 (PDT)
Date: Thu, 5 May 2022 10:50:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, ani@anisinha.ca,
 qemu-devel@nongnu.org, dan.j.williams@intel.com, jingqi.liu@intel.com,
 robert.hu@intel.com
Subject: Re: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM
 device
Message-ID: <20220505105006.7c1e78cc@redhat.com>
In-Reply-To: <dc177dd8eb6051ab9ab2752d657188fba83f0773.camel@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-2-robert.hu@linux.intel.com>
 <20220427163401.20c69375@redhat.com>
 <5ceada8ba94790b07a2d651153001eead0f35705.camel@linux.intel.com>
 <20220503102742.0d5bab41@redhat.com>
 <dc177dd8eb6051ab9ab2752d657188fba83f0773.camel@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

On Thu, 05 May 2022 11:07:53 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Tue, 2022-05-03 at 10:27 +0200, Igor Mammedov wrote:
> > On Fri, 29 Apr 2022 17:01:47 +0800
> > Robert Hoo <robert.hu@linux.intel.com> wrote:
> >   
> > > On Wed, 2022-04-27 at 16:34 +0200, Igor Mammedov wrote:  
> > > > On Tue, 12 Apr 2022 14:57:52 +0800
> > > > Robert Hoo <robert.hu@linux.intel.com> wrote:
> > > >     
> > > > > Since ACPI 6.2, previous NVDIMM/_DSM funcions "Get Namespace
> > > > > Label
> > > > > Data
> > > > > Size (function index 4)", "Get Namespace Label Data (function
> > > > > index
> > > > > 5)",
> > > > > "Set Namespace Label Data (function index 6)" has been
> > > > > deprecated
> > > > > by ACPI    
> > > > 
> > > > where it's said that old way was deprecated, should be mentioned
> > > > here
> > > > including
> > > > pointer to spec where it came into effect.    
> > > 
> > > OK. 
> > > https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf,
> > > 3.10 Deprecated Functions.
> > > I put it in cover letter. Will also mention it here.  
> > > >     
> > > 
> > > ...  
> > > > > 
> > > > > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > > > > index 0d43da19ea..7cc419401b 100644
> > > > > --- a/hw/acpi/nvdimm.c
> > > > > +++ b/hw/acpi/nvdimm.c
> > > > > @@ -848,10 +848,10 @@ nvdimm_dsm_write(void *opaque, hwaddr
> > > > > addr,
> > > > > uint64_t val, unsigned size)
> > > > >  
> > > > >      nvdimm_debug("Revision 0x%x Handler 0x%x Function
> > > > > 0x%x.\n",
> > > > > in->revision,
> > > > >                   in->handle, in->function);
> > > > > -
> > > > > -    if (in->revision != 0x1 /* Currently we only support DSM
> > > > > Spec
> > > > > Rev1. */) {
> > > > > -        nvdimm_debug("Revision 0x%x is not supported, expect
> > > > > 0x%x.\n",
> > > > > -                     in->revision, 0x1);
> > > > > +    /* Currently we only support DSM Spec Rev1 and Rev2. */    
> > > > 
> > > > where does revision 2 come from? It would be better to add a
> > > > pointer
> > > > to relevant spec.    
> > > 
> > > https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf,
> > > Section 3 "_DSM Interface for the NVDIMM Device", table 3-A and 3-
> > > B.
> > > 
> > > I'll add this in comments in next version.  
> > > >     
> > > > > +    if (in->revision != 0x1 && in->revision != 0x2) {
> > > > > +        nvdimm_debug("Revision 0x%x is not supported, expect
> > > > > 0x1
> > > > > or 0x2.\n",
> > > > > +                     in->revision);    
> > > > 
> > > > since you are touching nvdimm_debug(), please replace it with
> > > > tracing,
> > > > see docs/devel/tracing.rst and any commit that adds tracing calls
> > > > (functions starting with 'trace_').    
> > > 
> > > OK I'll have a try.  
> > 
> > just make conversion a separate patch  
> 
> Yeah, I supposed so too.
> >   
> > > >     
> > > > >          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT,
> > > > > dsm_mem_addr);
> > > > >          goto exit;
> > > > >      }    
> > > > 
> > > > 
> > > > this whole hunk should be a separate patch, properly documented
> > > >     
> > > 
> > > OK  
> > > > 
> > > > also I wonder if DSM    
> > > 
> > > It's not in SDM, but above-mentioned _DSM Interface spec by Intel.  
> > > >     
> > > > > @@ -1247,6 +1247,11 @@ static void nvdimm_build_fit(Aml *dev)
> > > > >  static void nvdimm_build_nvdimm_devices(Aml *root_dev,
> > > > > uint32_t
> > > > > ram_slots)
> > > > >  {
> > > > >      uint32_t slot;
> > > > > +    Aml *method, *pkg, *buff;
> > > > > +
> > > > > +    /* Build common shared buffer for params pass in/out */
> > > > > +    buff = aml_buffer(4096, NULL);
> > > > > +    aml_append(root_dev, aml_name_decl("BUFF", buff));    
> > > > 
> > > > is there a reason to use global variable instead of LocalX?    
> > > 
> > > Local in root_dev but global to its sub devices? I think it is
> > > doable.
> > > 
> > > But given your below comments on return param _LS{I,R,W}, I now
> > > think,
> > > in v2, I'm not going to reuse existing "NCAL" method, but implement
> > > _LS{I,R,W} their own, stringently follow interface spec. Then, no
> > > buff
> > > required at all. How do you like this?  
> > > >     
> > > > >  
> > > > >      for (slot = 0; slot < ram_slots; slot++) {
> > > > >          uint32_t handle = nvdimm_slot_to_handle(slot);
> > > > > @@ -1264,6 +1269,49 @@ static void
> > > > > nvdimm_build_nvdimm_devices(Aml
> > > > > *root_dev, uint32_t ram_slots)
> > > > >           */
> > > > >          aml_append(nvdimm_dev, aml_name_decl("_ADR",
> > > > > aml_int(handle)));
> > > > >  
> > > > > +        /* Build _LSI, _LSR, _LSW */    
> > > > 
> > > > should be 1 comment per method with spec/ver and chapter where
> > > > it's
> > > > defined    
> > > 
> > > OK  
> > > >     
> > > > > +        method = aml_method("_LSI", 0, AML_NOTSERIALIZED);
> > > > > +        aml_append(method,
> > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > +                            aml_touuid("4309AC30-0D11-11E4-
> > > > > 9191-
> > > > > 0800200C9A66"),
> > > > > +                            aml_int(2), aml_int(4),
> > > > > aml_int(0),
> > > > > +                            aml_int(handle))));
> > > > > +        aml_append(nvdimm_dev, method);    
> > > > 
> > > > _LSI should return Package    
> > > 
> > > Right. See above.  
> > > >     
> > > > > +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> > > > > +        aml_append(method,
> > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > aml_int(0),
> > > > > "DWD0"));
> > > > > +        aml_append(method,
> > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > aml_int(4),
> > > > > "DWD1"));    
> > > > 
> > > > theoretically aml_create_dword_field() takes TermArg as source
> > > > buffer,
> > > > so it doesn't have to be a global named buffer.
> > > > Try keep buffer in LocalX variable and check if it works in
> > > > earliest
> > > > Windows version that supports NVDIMMs. If it does then drop BUFF
> > > > and
> > > > use
> > > > Local variable, if not then that fact should be mentioned in
> > > > commit
> > > > message/patch    
> > > 
> > > Thanks Igor. I'm new to asl grammar, I'll take your advice.
> > >   
> > > >     
> > > > > +        pkg = aml_package(1);
> > > > > +        aml_append(pkg, aml_name("BUFF"));
> > > > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > > > +        aml_append(method, aml_store(aml_arg(0),
> > > > > aml_name("DWD0")));
> > > > > +        aml_append(method, aml_store(aml_arg(1),
> > > > > aml_name("DWD1")));    
> > > > 
> > > > perhaps use less magical names for fields, something like:
> > > >   DOFF
> > > >   TLEN
> > > > add appropriate comments    
> > > 
> > > No problem.  
> > > > 
> > > > Also I'd prepare/fill in buffer first and only then declare
> > > > initialize
> > > > Package + don't use named object for Package if it can be done
> > > > with
> > > > help
> > > > of Local variables.
> > > >     
> > > > > +        aml_append(method,
> > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > +                            aml_touuid("4309AC30-0D11-11E4-
> > > > > 9191-
> > > > > 0800200C9A66"),
> > > > > +                            aml_int(2), aml_int(5),
> > > > > aml_name("PKG1"),
> > > > > +                            aml_int(handle))));    
> > > > 
> > > > this shall return Package not a Buffer    
> > > 
> > > Right, Going to re-implement these methods rather than wrapper
> > > NCAL.  
> > 
> > wrapper is fine, you just need to repackage content of the Buffer
> > into a Package
> >   
> I now prefer re-implementation, i.e. make _LS{I,R,W} their own
> functions, less NACL's burden and don't make it more complex, it's
> already not neat; and more point, I think by this we can save the 4K
> Buff at all.
> Does this sound all right to you?

On one hand what you propose will be bit simpler (but not mach) than
repacking (and only on AML guest side), however it will add to host
side an extra interface/ABI that we will have to maintain, also it
won't save space as buffer will still be there for legacy interface.

So unless we have to add new host/guest ABI, I'd prefer reusing
existing one and complicate only new _LS{I,R,W} AML without
touching NACL or host side.

> 
> > > >     
> > > > > +        aml_append(nvdimm_dev, method);
> > > > > +
> > > > > +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> > > > > +        aml_append(method,
> > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > aml_int(0),
> > > > > "DWD0"));
> > > > > +        aml_append(method,
> > > > > +            aml_create_dword_field(aml_name("BUFF"),
> > > > > aml_int(4),
> > > > > "DWD1"));
> > > > > +        aml_append(method,
> > > > > +            aml_create_field(aml_name("BUFF"), aml_int(64),
> > > > > aml_int(32672), "FILD"));
> > > > > +        pkg = aml_package(1);
> > > > > +        aml_append(pkg, aml_name("BUFF"));
> > > > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > > > +        aml_append(method, aml_store(aml_arg(0),
> > > > > aml_name("DWD0")));
> > > > > +        aml_append(method, aml_store(aml_arg(1),
> > > > > aml_name("DWD1")));
> > > > > +        aml_append(method, aml_store(aml_arg(2),
> > > > > aml_name("FILD")));
> > > > > +        aml_append(method,
> > > > > aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > > > > +                            aml_touuid("4309AC30-0D11-11E4-
> > > > > 9191-
> > > > > 0800200C9A66"),
> > > > > +                            aml_int(2), aml_int(6),
> > > > > aml_name("PKG1"),
> > > > > +                            aml_int(handle))));    
> > > > 
> > > > should return Integer not Buffer, it looks like implicit
> > > > conversion
> > > > will take care of it,
> > > > but it would be better to explicitly convert it to Integer even
> > > > if
> > > > it's only for the sake
> > > > of documenting expected return value (or add a comment)    
> > > 
> > > I observed guest kernel ACPI component complaining this; just
> > > warning,
> > > no harm. I'll re-implement it.  
> > 
> > try to test it with Windows guest (it usually less tolerable to
> > errors
> > than Linux + it's own quirks that you need to carter to)
> > Also it would e nice if you test and put results in cover letter
> > not only for Linux but for Windows as well.
> >   
> I'll try to, but have no Windows resource at hand, I'll ask around if
> any test resource to cover that.
> > > > 
> > > > Also returned value in case of error
> > > > NVDIMM_DSM_RET_STATUS_INVALID,
> > > > in NVDIMM and ACPI spec differ. So fix the spec or remap returned
> > > > value.
> > > > 
> > > >     
> > > > > +        aml_append(nvdimm_dev, method);
> > > > > +
> > > > >          nvdimm_build_device_dsm(nvdimm_dev, handle);
> > > > >          aml_append(root_dev, nvdimm_dev);
> > > > >      }    
> > > > 
> > > >     
> > 
> >   
> 


