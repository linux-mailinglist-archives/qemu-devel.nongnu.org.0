Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108BF4B49D7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:37:10 +0100 (CET)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYjF-0002Lp-6j
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJYhe-0000nJ-JO
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:35:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJYhb-0000B5-Da
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644834926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4MUZFADlb7vEefAzgC2jllusJtx7caOZQGqLYGqfJZ4=;
 b=gRO49MWOCInoY3OslNlg5qmtlO4H4vukGz1vGkupwgISu/+HXRxSG2oPxHnCmRdIwDqz6x
 wd/s5kVZYREvMRHfEZb2DLZ6KbMgz+dW7uCxPPL6LHbzadYwE2Q12nZC8cTFBNkJf56RLi
 nEPuVlM4Qf5xL3geLka76oAXROgGYKw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-oTRqfidoO-eKXUVPEsBaRg-1; Mon, 14 Feb 2022 05:35:25 -0500
X-MC-Unique: oTRqfidoO-eKXUVPEsBaRg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so9318948wme.1
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 02:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4MUZFADlb7vEefAzgC2jllusJtx7caOZQGqLYGqfJZ4=;
 b=Nrn0JXoTNNrguOAs5remwG8/c/704S88Q+8Dyzo1J3Dx63gAQ5pBHcToW2HqPIa6iX
 O6TI5eCxculETa9or4dgyFHknJdvxFXsST9+PKaln8JNUGyu1OGb9pgslCyxX3TlNV2N
 oZnY1B6lqeB8HM3ddJFKMTYx2ZOCByTJXfV0WpcemnfeUr0qkGYhypspQDgLeMXwFfJS
 TcrITsQvv40zG3tbWe2QY/GaUusOtfbiaLcJtq1W2oJKyE/C8BNWkP7snY27vpWrUH4n
 Vohya2kqMOT22d/0yK3Oo9I7hTa1hoBMKM/3v06xcSnNceMfoISnI0MHw4fvEQRn447c
 igaQ==
X-Gm-Message-State: AOAM532qm8TWh2xDN6YRO5/J5A+O/XpZ3fgHKjXY0xfvkS6gODuC6Aux
 XB9MCekDNzynCYrlZCcF0dpFZiE+vqgc9PXD811BIuoMGTrUrfXb8QwOZXtJZa026mVaowrWcT+
 2wIRASzQ4Q61I5N4=
X-Received: by 2002:a5d:59af:: with SMTP id p15mr9016617wrr.272.1644834924066; 
 Mon, 14 Feb 2022 02:35:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2BR4zNgTRHBi/jXVVSMtzwIUfJ2A4ADPjmh+Gf+S2m50JefYDLyf/PFdgBPQ/MRCs4KBNpw==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr9016599wrr.272.1644834923852; 
 Mon, 14 Feb 2022 02:35:23 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id ay12sm10737997wrb.73.2022.02.14.02.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 02:35:23 -0800 (PST)
Date: Mon, 14 Feb 2022 10:35:21 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] qapi, i386/sev: Add debug-launch-digest to
 launch-measure response
Message-ID: <YgowaU95oX1qXvIN@work-vm>
References: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
 <YffLgx48+mM2SiIX@redhat.com>
 <5f08d6d3-0279-50ed-5223-a9f3217e555d@linux.ibm.com>
 <YffxpK99EibxdXG4@redhat.com> <YgVp1UN8t/nKq2+x@work-vm>
 <YgY1QU/9JfwvFT+5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YgY1QU/9JfwvFT+5@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Feb 10, 2022 at 07:39:01PM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > I wonder if we're thinking of this at the wrong level though. Does
> > > it actually need to be QEMU providing this info to the guest owner ?
> > > 
> > > Guest owners aren't going to be interacting with QEMU / QMP directly,
> > > nor are they likely to be interacting with libvirt directly. Their
> > > way into the public cloud will be via some high level API. eg the
> > > OpenStack Nova REST API, or the IBM Cloud API (whatever that may
> > > be). This high level mgmt infra is likely what is deciding which
> > > of the 'N' possible OVMF builds to pick for a given VM launch. It
> > > could easily just expose the full OVMF data to the user via its
> > > own API regardless of what query-sev does.
> > > 
> > > Similarly if the cloud is choosing which kernel, out of N possible
> > > kernels to boot with, they could expose the raw kernel data somewhere
> > > in their API - we don't neccessarily need to expose that from QEMU.
> > 
> > It gets more interesting where it's the guest which picks the
> > kernel/initrd; imagine the setup where the cloud reads the kernel/initrd
> > from the guest disk and passes that to qemu; one of the update ideas
> > would be just to let the guest update from a repo at it's own pace;
> > so the attestor doesn't know whether to expect a new or old kernel
> > from the guest; but it does know it should be one of the approved
> > set of kernels.
> 
> So that scenario would effectively be the old Xen style pygrub where
> you have some script on the host to pull the kernel/initrd out of
> the guest /boot.

Right.

> On the plus side that would enable you to use a "normal" guest disk
> image with unencrypted /boot, instead of encrypting everything.

Yes; the other plus is that you don't need the guest to send update
information back to the attestor to tell it when it's done an update;
that's potentially a big simplification on an untrusted interface.

> The risk though is that you need a strong guarantee that the *only* data
> from /boot that is used is the kernel+initrd+cmdline that get included
> in the measurement. If the guest boot process reads anything else from
> /boot then your confidentiality is potentially doomed. This feels like
> quite a risky setup, as I don't know how you'd achieve the high level of
> confidence that stuff in /boot isn't going to cause danger to the guest
> during boot, or after boot.

Which I think pygrub type things found out the hard way; but as long as
you copy from /boot, attest on the data you use and then boot using the
data you attested you should be OK.

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


