Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40594D4F36
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:28:04 +0100 (CET)
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLdz-0001q9-KZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:28:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSLco-0000q2-RS
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSLcn-0003z7-2q
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646929607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9k8J8R0ay59Mrk1Cd+JqCqUfjn1F+9D9vZHU6m7GMs=;
 b=gQArZqcxS+RU8dIBhkWBLB2EKPzZH/9hVO+1l7/LQ/1uGKVCHebmvUX6QsjPz8PeqIHRMK
 Gpvs1qSMCWxA2Kit2cBELcXtMj8isRgMgPJ7e5rFR8CdBMKwotXmsAmXTcfRL4gkOGrhTG
 BDVu4kAxVQQeOVwgDzIwM2Hb/s4sURY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-5j7Y1G7gPjKZ_VJ9UvDg9Q-1; Thu, 10 Mar 2022 11:26:46 -0500
X-MC-Unique: 5j7Y1G7gPjKZ_VJ9UvDg9Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso3402895ejj.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 08:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9k8J8R0ay59Mrk1Cd+JqCqUfjn1F+9D9vZHU6m7GMs=;
 b=x9Lps8zZy6XbuvvRwR3Hfq5ufWP2MZiS3DYkJ0E5x8kO3piCHooJIRIh842qNKV8q3
 twhkcAiiwqMI7TenRrSyZTe8QiTTS4tOxHTQ8pfOzQRHNWTH+7GyJyhXVA9okU4S4N55
 OlSSqVgqTCNZcVgViG0ZKYjkDPBvS62webv1PbRVV/7btBG+QpTIGs3kXMazDETxMgUj
 hcM3T5L3slYhNEud84dsTYZ6xdnYWiglBbDOnyTt8AuSnsPK7HKPSHdyuxCKpL+aDa3m
 vK9Qi65E/sjo2v6V3QHp/uNpePqOYJvrkcZC9oG3FJNBFD3bpnDszD9Czb8s1zvO0tT/
 eu6A==
X-Gm-Message-State: AOAM531n8eOjDWVlTl/46D6fWJhaLAdDYZeFUnKFjYpHQRt0Jh6ko2Ga
 e+VqbVTgpwMbm/MKMoe/AEKOwRRyrN7hYxUBFaYhWzdYCVxFbrFhhxq0sOyoxE8YaIIZrShQPFG
 gBAZgWG5AGkOHkLc=
X-Received: by 2002:a17:906:3014:b0:6da:f381:4dfe with SMTP id
 20-20020a170906301400b006daf3814dfemr4888734ejz.670.1646929604914; 
 Thu, 10 Mar 2022 08:26:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVcibnj7o1TP+y6r7CRu30K9pVBfxNgVqc/zUhu86REvfXdhErDzlGNrwnml0THa4ixRkIbw==
X-Received: by 2002:a17:906:3014:b0:6da:f381:4dfe with SMTP id
 20-20020a170906301400b006daf3814dfemr4888713ejz.670.1646929604635; 
 Thu, 10 Mar 2022 08:26:44 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 qb30-20020a1709077e9e00b006d6f8c77695sm1942964ejc.101.2022.03.10.08.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 08:26:44 -0800 (PST)
Date: Thu, 10 Mar 2022 17:26:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: any opinion on the patch "[RFC PATCH] hw/i386/e820: remove
 legacy reserved entries for e820"? EOM
Message-ID: <20220310172643.39fa20cb@redhat.com>
In-Reply-To: <CAARzgwximWns6yiWhTUogPjNVN3iGOPfs4z_i5BR2DLTH4ancg@mail.gmail.com>
References: <CAARzgwyjqEs96QXthDs_yQi_s7qmMsLuH+4YQcq2Hx01_vY3EA@mail.gmail.com>
 <20220303094134.tuhhrvtstxwpksmh@sirius.home.kraxel.org>
 <CAARzgwxFuY=xMQmHU0cocG3ecznhVwQVTF0naaA6wwFkhwvOyA@mail.gmail.com>
 <20220304101846.ct3ge56w6gjq355o@sirius.home.kraxel.org>
 <CAARzgwy33DZwoXzMMYCd1e4-88hyzChX-VpHH65P71PW6Ko4Ng@mail.gmail.com>
 <CAARzgwximWns6yiWhTUogPjNVN3iGOPfs4z_i5BR2DLTH4ancg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 16:16:38 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Fri, Mar 4, 2022 at 4:11 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Fri, Mar 4, 2022 at 3:48 PM Gerd Hoffmann <kraxel@redhat.com> wrote:  
> > >
> > > On Thu, Mar 03, 2022 at 03:12:51PM +0530, Ani Sinha wrote:  
> > > > On Thu, Mar 3, 2022 at 15:11 Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > >  
> > > > > Sorry, no.  Noticed the discussions but don't remember the details and
> > > > > didn't took the time to wade through the code to refresh my memory.  
> > > >
> > > > Could you please take a look when you get time? You have the most context
> > > > in this space I believe.  
> > >
> > > Should indeed not be needed unless you use a stone-aged seabios version.
> > > But I think you can't simply drop it for live migration compatibility
> > > reasons.  So you'll need do the compatibility dance and drop it for new
> > > machine types only.  I doubt the benefits outweigh that effort ..

well, it's mostly dead and unused code path that needlessly complicates code
and silently bit-rots for several years. (on both SeaBIOS and QEMU sides)
  
> > Igor what do you think?  
> Since the static entries are separate from the rom file entries, I
> think we are in trouble only if the destination is using an old bios?
> Otherwise, the non-existence of the static entries should be simply
> ignored right?

If you take into account migration from older QEMU, it will migrate
with old SeaBIOS (one that VM was started with on source side), then you
can't just remove interfaces it might access from under its foot.
So compat knobs are necessary.

Considering that SeaBIOS switched to QEMU provided ACPI tables since 1.7,
this machine type can serve as point where compat knob should be.
Newer machine type (though technically possible) and SeaBIOS should
not build its own ACPI tables and not use legacy interfaces necessary
for it.

Also since machine types older that 1.7 are deprecated now,
we can remove them in 2 releases, which rules pre-QEMU-ACPI
SeaBIOS out of the picture. So I'd think about preparing cleanup
for SeaBIOS which removes legacy ACPI tables from it, and merge
that once deprecated machine types are removed on QEMU side.
And after that drop legacy ABI on QEMU side as no longer used.


