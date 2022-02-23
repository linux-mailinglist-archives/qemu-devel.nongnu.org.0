Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E564C0E7B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 09:49:49 +0100 (CET)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnLI-0000tV-Gf
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 03:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMnFY-0006tA-9x
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:43:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMnFU-00069q-OQ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645605827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7LQZFX2Cp8QqnY0B1UgCykFOSNnP/Cpsci6GgXLU1ng=;
 b=BEybgwTeD/JcGNzbw8scPvtw1+NkDUgHIy2+pXg7V4dIIeAZVQgqupdFRHlMmEhGjCL6HP
 VrLpuFbv9cnR8GUO7JLSD+Ec9mLlC6b4mX3wCU9hkvitdbN/KFEAufmM8PUBagqY1CrEMx
 9MymsF+HgxEi9rXMvYIvxV0J87OwodI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-7hH7LzJuMAuHcE6i5x-skw-1; Wed, 23 Feb 2022 03:43:46 -0500
X-MC-Unique: 7hH7LzJuMAuHcE6i5x-skw-1
Received: by mail-ed1-f71.google.com with SMTP id
 dy17-20020a05640231f100b00412897682b4so11488966edb.18
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 00:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LQZFX2Cp8QqnY0B1UgCykFOSNnP/Cpsci6GgXLU1ng=;
 b=fU1lhTV3YmuwCO8h9R7vnb+trr1WEOS0MR9hbRdVxTv96U0JsBv0AH54IVdStVe9KN
 cs5ftwq4wMiVKmqP4GdZYhJd3npgEeAIFjIN9JTzfxzzwZAvoeQs3tgmZAvZ0B34yeDN
 5uzPqEtskjJCoa0zSTBx33ArHiJNvRri5a9ERv9v0Zcwt6E2Xix1Iz3daH6a+uxtZKTx
 zZC/CZEt5qi7IuCfvYGHkqk/UnU/OwSXQ8cIoVe1cEKk+AkYPhq9mSC1QtDcv/RtE5V2
 9FOoAuwiRiC/QgInmsJNYBW6EU/MWIO572vx/ggqxEjSxSBHLCXZjRyce162HegW7DXR
 sl+w==
X-Gm-Message-State: AOAM532rBEG85EhjPiKz4vuCKliBVIeSQ5S51fyuDl0whjJX6nX2B5ER
 oOXQvLuekRDNiKMTq9rG9X3mzgtWb8BttC2OVVOdv6MjPliop+a+dWDn4jBbD8BAVyWLjjNQkk/
 zkNDPbM2N3WXjBaE=
X-Received: by 2002:a17:906:8a98:b0:6b9:fe9:7be4 with SMTP id
 mu24-20020a1709068a9800b006b90fe97be4mr22089759ejc.521.1645605825368; 
 Wed, 23 Feb 2022 00:43:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRsOS7sa4A/Tvil9SFqWzaeEiKoKeqLk2eR0z4ktG1R0Cgc05Hx+SIWvh8yVC1N7UkIEbMcA==
X-Received: by 2002:a17:906:8a98:b0:6b9:fe9:7be4 with SMTP id
 mu24-20020a1709068a9800b006b90fe97be4mr22089739ejc.521.1645605825156; 
 Wed, 23 Feb 2022 00:43:45 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d12sm4714329edt.23.2022.02.23.00.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 00:43:44 -0800 (PST)
Date: Wed, 23 Feb 2022 09:43:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220223094343.2e600a22@redhat.com>
In-Reply-To: <20220222094255.as2alzu65rhateml@sirius.home.kraxel.org>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <YgzJE7ufEYm6OFyg@redhat.com> <YhOQfJ8x93+jDSZf@work-vm>
 <20220222094602.66d55613@redhat.com>
 <20220222094255.as2alzu65rhateml@sirius.home.kraxel.org>
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 10:42:55 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > > And the upstream code is now pretty much identical except for the
> > > default;  note that for TCG you do need to keep to 40 I think.  
> > 
> > will TCG work with 40bits on host that supports less than that?  
> 
> When I understand things correctly the problem is that the phys-bits
> limit applies to the npt/ept tables too, effectively restricting guest
> physical address space to host physical address space.
> 
> TCG is not affected by that and should work just fine.
> 
> Not sure what happens if you turn off npt/ept and run on softmmu.
> Possibly that works fine too.
> 
> > Also quick look at host-phys-bits shows that it affects only 'host'
> > cpu model and is NOP for all other models.  
> 
> I don't think so.  microvm forces host-phys-bits=on and that works with
> all cpu models.

I just don't see how host-phys-bits can work for other than 'host' cpu model.
It's true that property is available for all cpu models, but the field it sets
is only used in target/i386/host-cpu.c, the same applies to host-phys-bits-limit.
Am I missing something?

> 
> take care,
>   Gerd
> 


