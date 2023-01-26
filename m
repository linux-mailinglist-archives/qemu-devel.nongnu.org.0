Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA61A67C436
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKuff-0004JB-4i; Thu, 26 Jan 2023 00:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKufc-0004Hb-Vh
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:19:33 -0500
Received: from esa13.hc2706-39.iphmx.com ([216.71.137.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKufb-0004iC-5k
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:19:32 -0500
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 254060768
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:veFqB6vWOlr7ik/7pOVQAc7RpefnVOtcMUV32f8akzHdYApBsoF/q
 tZmKT2POPrZa2CgLt52a96y9kwGsJ6BmIBmQQRp/ytjFX4a9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gVkO6gS1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqUC6/tdX0RU8
 cApCxcfQzWzmbK5+pukH7wEasQLdKEHPasas3BkiCjHVLMoH8GFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk2RJUMeUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQrjeS1boKKJIziqcN9m2CCn
 2jCwT/ABRQ8GtrD0WuV2XaDv7qa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx37VLyC9ejDlu3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpM7TKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:nzPMx6NrQXy+vMBcThejsMiBIKoaSvp037Dk7TEXdfVwSL3kqy
 nOpoVg6faQslwssR4b6LK90cW7MBbhHNtOkPUs1NSZLXLbUQmTXfhfBOLZqlWKak7DH6xmpN
 9dmsBFaOEYZmIK6/oSjjPId+oI8Z2s3Jrtq93j70pAeylXVoAI1XYHNu9ZKCFLrct9aKbR2K
 Dz2iOPnVXARUgq
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2023 00:19:27 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 jy13-20020a0562142b4d00b00535302dd1b8so499899qvb.18
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 21:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tvP7kKHKVoZHHE4q3UpTJjBBFiSWXGskvZ++I74T/JQ=;
 b=j7LjMRnv9feitmf1mf7UvM4RmT5cZBY9FecJPavQwJOzPVBo1htqte938G8F+aUhX6
 r4yQ42XFp1Urh61Fto3xc/DWmIpMHEyZeW4FleUBqMvP8RHgKO+IKIdeCvLqu/sDW6r1
 XF51RNQzJxjMrMIczVEttcM7uskcp5eG4UPVSlTxErmW2aV39xkXOH4v8VUcKWa/3M3j
 H5hviz0LseZ8fAYg3Z9NjdLkGZlXzlCxuWIJIi/TYekBAvKs8ywotWLczsfALcIMjnJs
 wIs71tI7LzYOe1EzeRqEfXn+A+0ZB5sLyvBBKz1fCOrhoQEufPIOxPl0NvpE/jMdTqXK
 81qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvP7kKHKVoZHHE4q3UpTJjBBFiSWXGskvZ++I74T/JQ=;
 b=XcR9wa7R514S+G/GWdVbbYSZlw0r4wzmpNwNU2Ee2gTCBa41L7gpqNtXO4Ay8IKc+u
 UykWX5mM7XVq3ipHJunCx5s5NjRrKykmmUZUzqedM2nkt1iERLAzV9ruS4QwmKXh0W67
 a8BZ23Om6XgMaO1hrJSPsaqZWiYMATihY2+JDwowPodbYDnFE54LXRnPJFRTOEZAs712
 JjAqy+0ttdG72zKaMDbCtJ9u312m3MfdXKCGtKUoPM7YX/3cqmzZrioxPB+tGDFBTTmz
 aIo/y4rDxKsawsATwrFPsMma7yR7tDIqMU7kRyokcVsl2d5ftcsryeL3v1j42Ss7iNpt
 E/oQ==
X-Gm-Message-State: AO0yUKVIaNKGEaPyvvBaqe7bzI87AHkRGOGqhi47uQdK56zBs7nljk5c
 jMlEgrebiqwS+ft91a6C/DKOJ3BYHAnItWYsYqR4ZP/ujvmBXVqWTXOf/0ZaxpZ8z1siLtkTt56
 I3wLcFk2qcSuo2OaW8cnOBhj+WXS7mA==
X-Received: by 2002:ad4:4b22:0:b0:537:7f20:54b2 with SMTP id
 s2-20020ad44b22000000b005377f2054b2mr916012qvw.40.1674710366288; 
 Wed, 25 Jan 2023 21:19:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9LrP2dzVkpOQTteg+Mw/2vbbPuVa09iyypDqEAX7pgDMU1bhm02K7I/sVpS3zAWvAubSKuQg==
X-Received: by 2002:ad4:4b22:0:b0:537:7f20:54b2 with SMTP id
 s2-20020ad44b22000000b005377f2054b2mr915993qvw.40.1674710366001; 
 Wed, 25 Jan 2023 21:19:26 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 m4-20020ae9e704000000b006fba0a389a4sm330178qka.88.2023.01.25.21.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 21:19:25 -0800 (PST)
Date: Thu, 26 Jan 2023 00:19:20 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Darren Kenny <darren.kenny@oracle.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v4 1/3] memory: prevent dma-reentracy issues
Message-ID: <20230126051920.skr6ggd73256kbtm@mozz.bu.edu>
References: <20230119070004.321358-1-alxndr@bu.edu>
 <20230119070004.321358-2-alxndr@bu.edu> <m2cz791d68.fsf@oracle.com>
 <CAFEAcA-6jE8ouRjohCTr88kccWMUc0_xOZ6T2NQvfNaedgH+SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-6jE8ouRjohCTr88kccWMUc0_xOZ6T2NQvfNaedgH+SA@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.83; envelope-from=alxndr@bu.edu;
 helo=esa13.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230120 1447, Peter Maydell wrote:
> On Fri, 20 Jan 2023 at 14:42, Darren Kenny <darren.kenny@oracle.com> wrote:
> > Generally, this looks good, but I do have a comment below...
> >
> > On Thursday, 2023-01-19 at 02:00:02 -05, Alexander Bulekov wrote:
> > > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > > This flag is set/checked prior to calling a device's MemoryRegion
> > > handlers, and set when device code initiates DMA.  The purpose of this
> > > flag is to prevent two types of DMA-based reentrancy issues:
> 
> > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > index e05332d07f..90ffaaa4f5 100644
> > > --- a/softmmu/memory.c
> > > +++ b/softmmu/memory.c
> > > @@ -533,6 +533,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> > >      uint64_t access_mask;
> > >      unsigned access_size;
> > >      unsigned i;
> > > +    DeviceState *dev = NULL;
> > >      MemTxResult r = MEMTX_OK;
> > >
> > >      if (!access_size_min) {
> > > @@ -542,6 +543,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> > >          access_size_max = 4;
> > >      }
> > >
> > > +    /* Do not allow more than one simultanous access to a device's IO Regions */
> > > +    if (mr->owner &&
> > > +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> > > +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> >
> > I don't know how likely this is to happen, but according to:
> >
> > - https://qemu-project.gitlab.io/qemu/devel/qom.html#c.object_dynamic_cast
> >
> > it is possible for the object_dynamic_cast() function to return NULL,
> > so it might make sense to wrap the subsequent calls in a test of dev !=
> > NULL.
> 
> Yes. This came up in a previous version of this:
> https://lore.kernel.org/qemu-devel/CAFEAcA8E4nDoAWcj-v-dED-0hDtXGjJNSp3A=kdGF8UOCw0DrQ@mail.gmail.com/
> 
> It's generally a bug to call object_dynamic_cast() and then not check
> the return value.
> 

Sorry I missed that - Will be fixed in V5.
-Alex

> thanks
> -- PMM

