Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E76D64A3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:05:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhHE-0005x9-I4; Tue, 04 Apr 2023 10:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjhH9-0005vl-VI
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjhH7-00075A-Di
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680617080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHpR03WMNBtO2xjSYJWOUWx43ngFeRdHlPePFJIDcLk=;
 b=XfmRBpYXsHqYFlY4ZMLmtagX2j6mxZ5Wf8hxBm0TaAHdEFShvBiFeip2jK+kLKVxcQ0Lj6
 n66nIlAEw1YKeHAiYW8aDt6tLa7yNDAKQTKyWkTXYP7tnJHCg5Y20HVaOGXjWUqztXhVzt
 oxDAwWXXyPsiSa+pep1e9pGQJi1a5hs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-euD6cNxKPwynqNPksdE1CQ-1; Tue, 04 Apr 2023 10:04:38 -0400
X-MC-Unique: euD6cNxKPwynqNPksdE1CQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 j21-20020a508a95000000b004fd82403c91so45899423edj.3
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680617076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oHpR03WMNBtO2xjSYJWOUWx43ngFeRdHlPePFJIDcLk=;
 b=hzNKtt6bospvWXPJ207KezqpvSnNRuH6hPj0G7rkMjZx3RzV7i2Fv+1JPjAoXbvZEL
 F1+hzEwoEez/+YQoxUJdYLXvsm/nmVVBwo9lB0k/mOSQkNh3Epfh0fYmuq/7rAamgQOB
 xMCNNKiMLpEiYSK7gwrTzpFHTYw493NE4fuciUVjF3Ppdsi5wzEpx8EkTKfkbqH0doga
 OKdEWmnn5G4mUNeVSdwrHLfMpqcwsagqMcVbexKNtWdhq+wruE+a2uusi2QHzx+xU7mt
 8neU+VnIB4UyraXEZm+TdChtRJz9CjkM0F9jsFA0NuLSuU4sCEkhD7OeoPD3fRrx6AEI
 Pnuw==
X-Gm-Message-State: AAQBX9dUaJokj3/YNls5VqGPdvJUrsh5xC+nee6LFktxKfxSeHWZj2sm
 08G1+9vYcWkkU69IbdlJG8p9OVMY37jyU5UtUir1cN8eRw8+GNH9H7wyWjosz/tWzW/NBbY5y3X
 Hwlfr19RAkFS35m8=
X-Received: by 2002:aa7:db53:0:b0:502:1299:5fa5 with SMTP id
 n19-20020aa7db53000000b0050212995fa5mr2944555edt.16.1680617076671; 
 Tue, 04 Apr 2023 07:04:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350aUB6hTrF7fGJgKeShb3M+RVFOD71jFoSYtu5c/efl+ThiIGR73O8wP6OJMUwpshadN6GdKPQ==
X-Received: by 2002:aa7:db53:0:b0:502:1299:5fa5 with SMTP id
 n19-20020aa7db53000000b0050212995fa5mr2944533edt.16.1680617076402; 
 Tue, 04 Apr 2023 07:04:36 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 v23-20020a056402175700b004c5d1a15bd5sm5846052edx.69.2023.04.04.07.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:04:35 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:04:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230404084603-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
 <20230404084603-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 4 Apr 2023 08:46:15 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Apr 04, 2023 at 10:28:07AM +0200, Igor Mammedov wrote:
> > On Mon, 3 Apr 2023 13:23:45 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Mon, Apr 03, 2023 at 06:16:18PM +0200, Igor Mammedov wrote:  
> > > > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > > > device is ignored when it's issued before guest OS has been booted.
> > > > And any additional attempt to request device hot-unplug afterwards
> > > > results in following error:
> > > > 
> > > >   "Device XYZ is already in the process of unplug"
> > > > 
> > > > arguably it can be considered as a regression introduced by [2],
> > > > before which it was possible to issue unplug request multiple
> > > > times.
> > > > 
> > > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > > with native PCIe unplug behavior [1] which in its turn refers
> > > > back to ACPI PCI hotplug ability to repeat unplug requests.
> > > > 
> > > > PS:    
> > > > >From ACPI point of view, unplug request sets PCI hotplug status    
> > > > bit in GPE0 block. However depending on OSPM, status bits may
> > > > be retained (Windows) or cleared (Linux) during guest's ACPI
> > > > subsystem initialization, and as result Linux guest looses
> > > > plug/unplug event (no SCI generated) if plug/unplug has
> > > > happend before guest OS initialized GPE registers handling.
> > > > I couldn't find any restrictions wrt OPM clearing GPE status
> > > > bits ACPI spec.
> > > > Hence a fallback approach is to let user repeat unplug request
> > > > later at the time when guest OS has booted.
> > > > 
> > > > 1) 18416c62e3 ("pcie: expire pending delete")
> > > > 2)
> > > > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>    
> > > 
> > > A bit concerned about how this interacts with failover,
> > > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > > Any better ideas of catching such misbehaving guests?  
> > 
> > It shouldn't affect affect failover, pending_delete is not
> > cleared after all (only device removal should do that).
> > So all patch does is allowing to reissue unplug request
> > in case it was lost, delay here doesn't mean much
> > (do you have any preference wrt specific value)?  
> 
> I'd prefer immediately.

ok, lets use 1ms then, I'd rather reuse the preexisting
pending_deleted_expires_ms machinery instead of
special-casing immediate repeat.

> 
> > As for 'misbehaving' - I tried to find justification
> > for it in spec, but I couldn't.
> > Essentially it's upto OSPM to clear or not GPE status
> > bits at startup (linux was doing it since forever),
> > depending on guest's ability to handle hotplug events
> > at boot time.
> > 
> > It's more a user error, ACPI hotplug does imply booted
> > guest for it to function properly. So it's fine to
> > loose unplug event at boot time. What QEMU does wrong is
> > preventing follow up unplug requests.  
> >   
> > > 
> > > Also at this point I do not know why we deny hotplug
> > > pending_deleted_event in qdev core.  
> > > Commit log says:
> > > 
> > >     Device unplug can be done asynchronously. Thus, sending the second
> > >     device_del before the previous unplug is complete may lead to
> > >     unexpected results. On PCIe devices, this cancels the hot-unplug
> > >     process.
> > > 
> > > so it's a work around for an issue in pcie hotplug (and maybe shpc
> > > too?). Maybe we should have put that check in pcie/shpc and
> > > leave acpi along?
> > > 
> > > 
> > > 
> > >   
> > > > ---
> > > > CC: mst@redhat.com
> > > > CC: anisinha@redhat.com
> > > > CC: jusual@redhat.com
> > > > CC: kraxel@redhat.com
> > > > ---
> > > >  hw/acpi/pcihp.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > index dcfb779a7a..cd4f9fee0a 100644
> > > > --- a/hw/acpi/pcihp.c
> > > > +++ b/hw/acpi/pcihp.c
> > > > @@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > > >       * acpi_pcihp_eject_slot() when the operation is completed.
> > > >       */
> > > >      pdev->qdev.pending_deleted_event = true;
> > > > +    pdev->qdev.pending_deleted_expires_ms =
> > > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
> > > >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> > > >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> > > >  }
> > > > -- 
> > > > 2.39.1    
> > >   
> 


