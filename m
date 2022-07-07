Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD8256A08D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 12:57:14 +0200 (CEST)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9PC5-0002sA-26
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 06:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9PAm-00021T-94
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 06:55:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9PAi-0001Kp-UM
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 06:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657191347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LH2kPrvdKdLhr4lPkFt6xyRrMUEqnJpXWLeAHfW9I0=;
 b=C3sIaAJluzv4ekwUgDHlkaDanhtvF052dKqjnEFf5moMYauqZfLJO5SavfDESUuYAH1KiD
 6JUGEvj7CZSScbKYL1Z5a/gDpugrGTXUSs7NCh+1HiFpRtSQJ0B7lk5BuXGIeXz89Mx0tR
 pGV1ldaM4+UkgwUIuU//kpEzTx3uP/0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-5Tt7lrDmO6K9vQrjMDPLXw-1; Thu, 07 Jul 2022 06:55:46 -0400
X-MC-Unique: 5Tt7lrDmO6K9vQrjMDPLXw-1
Received: by mail-ed1-f70.google.com with SMTP id
 g7-20020a056402424700b00435ac9c7a8bso13683998edb.14
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 03:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LH2kPrvdKdLhr4lPkFt6xyRrMUEqnJpXWLeAHfW9I0=;
 b=CAy7vS60h3H5MTCRsWUTgUURa3MkUAGYb5Wn37wULJZ/FNcntzwcYZm53pbARdWNBr
 Q1TH2UGv0DjuX3L62DXyQT6iYFn6MXBEHabj28LNLlXQfdC8ciK2Y+5S9QwROzN0Oxky
 NsHjN7l9zVjLJECYZxJlwR3MOtJkYS9HX6yzkjsd4e89+HlUQpuiy6Q0Vm+g3zZFl9At
 8RrFeEBlgAfi+QawDsOGFf9+IJtFtNWpmJVkuZk1iHnuBYQJA8x+LaafAas8oBx+LH8H
 y7FGZBY2cbMRMnf2yi2DAIzmG+NlmtIWCW6zTY41w11FCygPoMWevMmfdoE2Ghme2KDp
 AyCA==
X-Gm-Message-State: AJIora/1oWwdTYJoX3jiQGRr3j7ZyRVj5TgKkHKAuVJVuOcujX1tc4zg
 MkwHIQs/o0lFEVM4Wc1nHyYlsCDEp3BVoeIgi0R9iOoOHJUc5H1plBCsse3R3sMnBYtwzGoJBKJ
 GmIHcNv9GJyd5iRs=
X-Received: by 2002:aa7:d143:0:b0:43a:88f4:4ec1 with SMTP id
 r3-20020aa7d143000000b0043a88f44ec1mr12308728edo.141.1657191345201; 
 Thu, 07 Jul 2022 03:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vPWKyS0fy3neTB9vzTSP8TaP1PtbmdU4/suR+JLcCW4NtljZPup4v+FOOxtLxMjxrziUP04w==
X-Received: by 2002:aa7:d143:0:b0:43a:88f4:4ec1 with SMTP id
 r3-20020aa7d143000000b0043a88f44ec1mr12308690edo.141.1657191344939; 
 Thu, 07 Jul 2022 03:55:44 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a1709062cd300b006ff802baf5dsm18850123ejr.54.2022.07.07.03.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:55:44 -0700 (PDT)
Date: Thu, 7 Jul 2022 12:55:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca
Subject: Re: [PATCH 02/17] acpi: x86: deduplicate HPET AML building
Message-ID: <20220707125543.61a1d72e@redhat.com>
In-Reply-To: <20220707060622-mutt-send-email-mst@kernel.org>
References: <20220701133515.137890-1-imammedo@redhat.com>
 <20220701133515.137890-3-imammedo@redhat.com>
 <20220701121346-mutt-send-email-mst@kernel.org>
 <20220707111616.3f43b503@redhat.com>
 <20220707060622-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 7 Jul 2022 06:08:35 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jul 07, 2022 at 11:16:16AM +0200, Igor Mammedov wrote:
> > On Fri, 1 Jul 2022 12:26:16 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Fri, Jul 01, 2022 at 09:35:00AM -0400, Igor Mammedov wrote:  
> > > > HPET AML doesn't depend on piix4 nor q35, move code buiding it
> > > > to common scope to avoid duplication.
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>    
> > > 
> > > Apropos, tests/data/acpi/rebuild-expected-aml.sh ignores the
> > > fact that some tables might be identical. Also, there's no
> > > way to reuse expected files between machines. And so we have:
> > > 
> > > 
> > > [qemu]$ find tests/data/acpi -type f -exec sha256sum '{}' ';'|sort  
> > [...]
> >   
> > > 
> > > 
> > > It's easy to fix up duplications within virt. But I am not 100% sure how
> > > fix up duplication between q35 and pc.  
> > [...]
> >    
> > > Then we could maybe use the directory "pc" for files common to i440fx
> > > and q35.  Maybe just teach the test to look under tests/data/acpi/x86
> > > too? And I think we should teach tests/data/acpi/rebuild-expected-aml.sh
> > > to check for duplicates and at least warn the user.  
> > 
> > Probably duplicates in 'virt' mostly due to combination of not knowing
> > that there is a fallback lookup (which is hidden in the code)
> > and simplistic way tests/data/acpi/rebuild-expected-aml.sh rebuilds tables.
> > 
> > As you suggest, rebuild-expected-aml.sh can be improved to warn or even
> > better drop duplicates if found.  
> 
> Want to try?

I'll put it on my queue, after PCI refactorings

> 
> > As for reusing tables between different machine types, alternatively
> > we can add explicit remapping rules (possibly auto-generated) versus
> > currently used implicit fallback approach.  
> 
> My worry with this is that if a specific table needs to be split from
> the generic variant then user would have to hack the test code as opposed
> to just updating the tables, so the update can not be done
> automatically. Thoughts?

I'll try to implement it and see if it's possible.


