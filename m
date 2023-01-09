Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B9662F93
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExIN-0008PR-2K; Mon, 09 Jan 2023 13:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pExIL-0008PJ-L8
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:54:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pExIK-0006to-2M
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673290491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LdHU5/VkyfHb1HLem6sVS6kk56PwUHWPN2wozipW/x4=;
 b=c//SXoUwVQ7gQS5IYmrMeU/cxD+ncQu5VlwBRBdOHE0OQHOf15ohtcQm6214GEDebiZv8/
 9CEGMnsBC3ht97mkBUpo0JOEPMo+UbG7W5CcepWXiNGtUcMb3shxJziTcpkmZAMxAQWLoz
 695YK0PL3L4tTauG69kfSFQ/f93NhHc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-292-yfM7aABaP0GpJ5YZtjTUFA-1; Mon, 09 Jan 2023 13:54:50 -0500
X-MC-Unique: yfM7aABaP0GpJ5YZtjTUFA-1
Received: by mail-wm1-f69.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso7701804wmb.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 10:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LdHU5/VkyfHb1HLem6sVS6kk56PwUHWPN2wozipW/x4=;
 b=3QaVZJHfqWqgmgMeoWZbzfNBOSLVrjO3Y2A3kkJhG9Vqc1EZrgDCJf/aj9kzFgd4/g
 FY0RJosXpj6vOZrji2kqX++mTB3jnMLbnwfQ8iroSGxl1RnHeBUg5w4mz3glKg2+0AV1
 mTTRxtI7RhKUYORrZ0WQil9nB8gh1MZaLWwctWq7lD11ijWtJMXlW7XNuJ4dP0loXOfP
 jfHvQaJbKNRsmXEugBNpnUBvKhw6Pm7pSx4arzSdEJw2xQa9qxruN2gw9Bfv1QnSkXq9
 sSroxy9s5LjlwLCZ9FKI9efTuWw/d+JdaW2WpUBaYkrpkQ+0dMofEJ4ctRqPa0Cvdg4P
 vi+g==
X-Gm-Message-State: AFqh2koJdYIslpwUJCvFI12tF5FKA2eH3S8e2cQc3EjK50IRTwIQM1Ci
 kNmV4qBC7cZKRHvmr2hKJ5hAA8hXqSi4FJw3eFtU8Vkv6Nwfdrvz2tgAHLBRGyNr48qjbik1mvG
 5ZDREn4qkTp9nUWw=
X-Received: by 2002:adf:eac9:0:b0:27a:b72a:8193 with SMTP id
 o9-20020adfeac9000000b0027ab72a8193mr32047940wrn.39.1673290488819; 
 Mon, 09 Jan 2023 10:54:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzk2YPbUnlNNXoRYyK5d0z7F/2sKHfadJj8nYGEhD0zrezvV4RmuJB9ZQ86o/kKjMPX033rg==
X-Received: by 2002:adf:eac9:0:b0:27a:b72a:8193 with SMTP id
 o9-20020adfeac9000000b0027ab72a8193mr32047929wrn.39.1673290488583; 
 Mon, 09 Jan 2023 10:54:48 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b00236883f2f5csm9411826wrj.94.2023.01.09.10.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 10:54:48 -0800 (PST)
Date: Mon, 9 Jan 2023 18:54:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Message-ID: <Y7xi9uoa0Ql0YnEC@work-vm>
References: <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
 <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
 <Y7xUVq9PT9ohGfCj@work-vm>
 <af22847d6e8f3a64720c4d4d00b93f57ea63ad3e.camel@linux.ibm.com>
 <f2e036a7-5cff-4f95-902f-b31fce3c0ade@linux.ibm.com>
 <f928986fd4095b1f27c83ede96f3b0dd65ad965e.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f928986fd4095b1f27c83ede96f3b0dd65ad965e.camel@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* James Bottomley (jejb@linux.ibm.com) wrote:
> On Mon, 2023-01-09 at 13:34 -0500, Stefan Berger wrote:
> > 
> > 
> > On 1/9/23 12:55, James Bottomley wrote:
> > > On Mon, 2023-01-09 at 17:52 +0000, Dr. David Alan Gilbert wrote:
> > > > * James Bottomley (jejb@linux.ibm.com) wrote:
> > > [...]
> > > > > external MSSIM TPM emulator has to be kept running to preserve
> > > > > the state.  If you restart it, the migration will fail.
> > > > 
> > > > Document that and we're getting there.
> > > 
> > > 
> > > The documentation in the current patch series says
> > > 
> > > ----
> > > The mssim backend supports snapshotting and migration, but the
> > > state of the Microsoft Simulator server must be preserved (or the
> > > server kept running) outside of QEMU for restore to be successful.
> > > ----
> > > 
> > > What, beyond this would you want to see?
> > 
> > mssim today lacks the functionality of marshalling and unmarshalling
> > the permanent and volatile state of the TPM 2, which are both needed
> > for snapshot support. How does this work with mssim?
> 
> You preserve the state by keeping the simulator running as the above
> says.  As long as you can preserve the state, there's no maximum time
> between snapshots.  There's no need of marshal/unmarshal if you do
> this.

So I think I can understand how that works with a suspend/resume; I'm
less sure about a live migration.

In a live migration, you normally start up the destination VM
qemu process and other processes attached to it, prior to the inwards
live migration of state.  Then you live migrate the state, then kill the
source.

With this mssim setup, will the start up of the destination attempt
to change the vtpm state during the initialisation?

Dave

> James
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


