Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72B52B7B2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:24:26 +0200 (CEST)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrGqv-0008G1-Rj
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrGk8-0004Mo-Ca
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrGk5-0007He-Ux
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652869040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgMEjHYpqvDA18Sl6BMvw25HmKs0ysurln7fEnZBR1k=;
 b=DTTPtqP/69AFMi74TVDSIAXCvArqwUIsLqJIneljPNCiOX2uTIdEyRVneupU3FC5VZhUj1
 +jbr1HmZSlN/V75/ZoYKoxRhSy4VAhWQ0f9Sukfr3A2ZW3FhtvsjDhGatOfcIr+UFugQu7
 Lk1RGwWpVU5y+LTUyjL+UPg8Cr3l98Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-CnR0vYhlO1KGyX3RcRbMdQ-1; Wed, 18 May 2022 06:17:19 -0400
X-MC-Unique: CnR0vYhlO1KGyX3RcRbMdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m26-20020a05600c3b1a00b00397220d6329so270322wms.5
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fgMEjHYpqvDA18Sl6BMvw25HmKs0ysurln7fEnZBR1k=;
 b=Koh2VJ6J0J8BlIl27ywBFR4L2aeVaQodfq0UVH6SwlQ7pQYRddwuhD+hgO/uREBi/3
 k1zCykYOmw2SC+eq8hN6bz9mIaWQGyyqtXEHz2sRGXDXcTBkvLArJlapg8/bBE1Mt5Xm
 oWWfNP+r/3/QYXMyZfho+Dy0ditKYChCymHFOgHMwg5RkeZa7yvb0R1ZY7Sq8dYJAZvY
 xm53a9ZOR9xwu26cFgJd/SZUeAvP8cix2UDaWFmztNF484/xeYkglHnpwkL04wQTZqHR
 fRmK1E9AAZ2ouuZSRCdfdv0xNCCISFL9Df47GqVqJDYkDlV7yhD5zL0gOQDk2asXAMqw
 kXqw==
X-Gm-Message-State: AOAM5331rVVjfNX4ivxNeC3tqwJfLhXicP3tDhwU7RkLQikocwXFOuHi
 zV7ghGfqkOYHA6/cM8XnGM+BV+HfyCHdr51wjym23GtsXWirh3X5CRXeoT/W/GZsUJZ41fnkW8o
 FzEnNIHbs7iORqo4=
X-Received: by 2002:a05:600c:204b:b0:394:4028:b0f9 with SMTP id
 p11-20020a05600c204b00b003944028b0f9mr25334179wmg.114.1652869038067; 
 Wed, 18 May 2022 03:17:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2z54mxMJnkKfYsEjJrB4UzQqBSKW/GKyv7M7NnNUaRXdbhteGfnGfdcIVKtiRogMcFhxKfw==
X-Received: by 2002:a05:600c:204b:b0:394:4028:b0f9 with SMTP id
 p11-20020a05600c204b00b003944028b0f9mr25334167wmg.114.1652869037876; 
 Wed, 18 May 2022 03:17:17 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 i203-20020a1c3bd4000000b003942a244ee9sm1317971wma.46.2022.05.18.03.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 03:17:17 -0700 (PDT)
Date: Wed, 18 May 2022 12:17:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: dzejrou@gmail.com, qemu-devel@nongnu.org, david@redhat.com
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
Message-ID: <20220518121716.658ec569@redhat.com>
In-Reply-To: <3994597b-c559-f62f-504d-3cde3493b713@redhat.com>
References: <20220517123858.7933-1-dzejrou@gmail.com>
 <3994597b-c559-f62f-504d-3cde3493b713@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Tue, 17 May 2022 20:46:50 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/17/22 14:38, dzejrou@gmail.com wrote:
> > From: Jaroslav Jindrak <dzejrou@gmail.com>
> > 
> > Prior to the introduction of the prealloc-threads property, the amount
> > of threads used to preallocate memory was derived from the value of
> > smp-cpus passed to qemu, the amount of physical cpus of the host
> > and a hardcoded maximum value. When the prealloc-threads property
> > was introduced, it included a default of 1 in backends/hostmem.c and
> > a default of smp-cpus using the sugar API for the property itself. The
> > latter default is not used when the property is not specified on qemu's
> > command line, so guests that were not adjusted for this change suddenly
> > started to use the default of 1 thread to preallocate memory, which
> > resulted in observable slowdowns in guest boots for guests with large
> > memory (e.g. when using libvirt <8.2.0 or managing guests manually).
> > 
> > This commit restores the original behavior for these cases while not
> > impacting guests started with the prealloc-threads property in any way.
> > 
> > Fixes: 220c1fd864e9d ("hostmem: introduce "prealloc-threads" property")
> > Signed-off-by: Jaroslav Jindrak <dzejrou@gmail.com>
> > ---
> >   backends/hostmem.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/backends/hostmem.c b/backends/hostmem.c
> > index a7bae3d713..624bb7ecd3 100644
> > --- a/backends/hostmem.c
> > +++ b/backends/hostmem.c
> > @@ -274,7 +274,7 @@ static void host_memory_backend_init(Object *obj)
> >       backend->merge = machine_mem_merge(machine);
> >       backend->dump = machine_dump_guest_core(machine);
> >       backend->reserve = true;
> > -    backend->prealloc_threads = 1;
> > +    backend->prealloc_threads = machine->smp.cpus;
> >   }
> >   
> >   static void host_memory_backend_post_init(Object *obj)  
> 
> Queued, thanks.

could you drop this patch pls (there is an more acceptable alternative,
see my other replies in this thread if we decide to put management policy
decisions in QEMU code).

(well unless layer violation is acceptable practice now
and it's really discouraging to do cleanup work if gets discarded)

PS:
There is no good default in this case (whatever number is picked
it could be good or bad depending on usecase).

> Paolo
> 


