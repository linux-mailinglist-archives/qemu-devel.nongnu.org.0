Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DF2B017D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:04:06 +0100 (CET)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd8WT-0002gZ-Hv
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kd8VR-0002HW-MH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kd8VQ-0000DG-1M
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605171778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zI6+Rv/AmhA7uu+IDm59nbp2oqMHlDfy23ZWR+CxD0=;
 b=GybI3HvcwHCG7+2LM6hAIhngkDiCDspW1G+NSpos4g/0+bu5LQntRFqV5tZ0wZVzBhNhCO
 b4uRoM14w6QCWuUvKoApWE81h20OW6o1p7VJkxXhmqWMPHEWOIvqzXvsR+J9j8UKj4N6Gr
 bStVkNS9CaMJK67TzPQjj2CzPtyzpGI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-tJZKRfVXPFSF8boDRNvrbw-1; Thu, 12 Nov 2020 04:02:55 -0500
X-MC-Unique: tJZKRfVXPFSF8boDRNvrbw-1
Received: by mail-wr1-f69.google.com with SMTP id y2so1647767wrl.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 01:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Gi/JrNtRBtbeVM1wZ7czmFe7o8/5M1SWX3/5TRufzYs=;
 b=sPWDvp3kFzRQLlQuFB8si8xDNmYstRa041sQiBVw9f+fkQM1NnvmCqKu+5Wnm/Ht7Y
 QqBRFCXpk7/v7Z8myjZMUXFAXdntnqtoprK4JF61lXPlVGXWoe6SqBukGItlFCtUQGXG
 i4/hCBGrzKX+rBGTNQ5JJWg1kcTKwQjjDYGC/UsiAfsoMJ97jrD6UWcZxn9MIwAHG2Wg
 A/LBCMVwwMR6WyUI+dglkO6ujpGEqYC8Rwb/1ZiEZJO1iQIMaJAB0lZEihEd7/Hgmb1f
 31RfVQ9LH7ZYQRIWwQQjIwELydXadKT6fdWkysqA+rvuTv+uk033VVsL56UV16SsNWks
 pEUA==
X-Gm-Message-State: AOAM532waJbRp4XHBnjOIo2a6/9b7irGIJp1w8f30X/k/jJ3vjbByb8c
 vMxDl/3j8zj7FiIfKJHuc15I7PiNq6TPFGCCX3H+7linKEih1pT6FC/a5QeG5FRGb/g6qhyY11t
 IhITpdreWswx9t3Y=
X-Received: by 2002:a5d:5689:: with SMTP id f9mr22766297wrv.181.1605171773820; 
 Thu, 12 Nov 2020 01:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGoC5Kt1n/mdi+pzaHWLub6jyqcIAlMfui5AN8Kra0NxxbfJBbDIdH9/KVMJLL4neL5v/npQ==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr22766269wrv.181.1605171773579; 
 Thu, 12 Nov 2020 01:02:53 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id a131sm5198260wmh.30.2020.11.12.01.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 01:02:52 -0800 (PST)
Date: Thu, 12 Nov 2020 04:02:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH-for-5.2 v2] hw/i386/acpi-build: Fix maybe-uninitialized
 error when ACPI hotplug off
Message-ID: <20201112040236-mutt-send-email-mst@kernel.org>
References: <20201107194045.438027-1-philmd@redhat.com>
 <CAARzgwxCXmCZsVWKFX6Fp=SBBj0BvY5=ntLwLZva2NZywD48Lw@mail.gmail.com>
 <752f4cfa-9213-299d-474c-fbccf312009d@redhat.com>
 <CAARzgwzz0qUwj3Wcx+ioXXi35kbefD5i+Ow=oLvC2a0DzDS_sA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwzz0qUwj3Wcx+ioXXi35kbefD5i+Ow=oLvC2a0DzDS_sA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 09:21:47AM +0530, Ani Sinha wrote:
> 
> 
> On Sun, Nov 8, 2020 at 22:40 Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>     On 11/8/20 4:58 AM, Ani Sinha wrote:
>     > On Sun, Nov 8, 2020 at 1:10 AM Philippe Mathieu-Daudé <philmd@redhat.com>
>     wrote:
>     >>
>     >> GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
>     >> is already in the "if (bsel || pcihp_bridge_en)" block statement,
>     >> but it isn't smart enough to figure it out.
>     >>
>     >> Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
>     >> block statement to fix (on Ubuntu):
>     >>
>     >>   ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
>     >>   ../hw/i386/acpi-build.c:496:9: error: 'method' may be used
>     uninitialized
>     >>   in this function [-Werror=maybe-uninitialized]
>     >>     496 |         aml_append(parent_scope, method);
>     >>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     >>   cc1: all warnings being treated as errors
>     >
>     > OK I looked at the patch closely and it makes sense. Can you please
>     > run a "make check" to make sure we have not broken anything?
> 
>     Yes I did...
> 
> 
> Has this been queued Michael?

tagged, thanks!

> 
> 
> 
> 


