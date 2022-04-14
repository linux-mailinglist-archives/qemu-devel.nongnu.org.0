Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59537500850
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 10:27:08 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neuol-00012E-6k
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 04:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1neunl-0000HY-SW
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 04:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1neung-0006wP-Tq
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 04:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649924758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0u6ONe9j1j6k19mj6sFChlmsxQ/kXNGxnIkwP2DTq8=;
 b=VxHRlFXaM4PpcEw/JDPcSezSJxHVU3i2sbdi9MuZa5xTkqrWzkgPZNigBl0R9tvzvWsCiC
 1qMCc/Uj8dNDi6aDgvudXE49f6WqczdLRSfKlUEBUQtu+wuTYDnPqyK25i1CvJVbv5tUQV
 mBGcQ45BrR8bfj9aPihIAp0bBVmNwhc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-cwN2IyT9Ple_Y-9gOymNaA-1; Thu, 14 Apr 2022 04:25:57 -0400
X-MC-Unique: cwN2IyT9Ple_Y-9gOymNaA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so1914651wmj.0
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 01:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g0u6ONe9j1j6k19mj6sFChlmsxQ/kXNGxnIkwP2DTq8=;
 b=1qqSw5q9kZFifuGd3Vf/y7ZrYTavd38uiut8E/vNiMyprTlsVr0NO5FF+YXJYHLzr2
 ZN/ZoUqaiWgP9N6HcTyRvxikZ6cNcyxeo/DmS7SbMlmDiMhTtRMG5gmFSs5x0NwUtV9Z
 skjsZZq5ngTvq9IQZfCKAnVYbykDOKMIkKVrgN/MbQ22yzaFWhoZmWqn798xkH9R+TTE
 WtmMvLogjYB9ebDcmGY+/3XzrrN7jVqmRZLrvVN6zn7PQApi5DuL6Jq2D53bewP31OZJ
 EdM8UAmziSoi3yxwjXB4bErrpSp8J8U6Wnsv053EzFIOCWW76QZ5iV9gjPFx09nO3D5m
 xzQg==
X-Gm-Message-State: AOAM5318o5cVyAWZfxab5hfHKTMEPbMaXhPS0g7CfgcRqFilZaqizmjN
 Hldb/+J32y2ZKmwt2Wbmlwsf3AeujBxCQf4+M/Gp5mZ8A2jso2A1N5aGwU/KqO+2e4CvSieRzNU
 XoF5PbM4v0YW5Cp8=
X-Received: by 2002:a05:6000:1541:b0:207:8ee6:1417 with SMTP id
 1-20020a056000154100b002078ee61417mr1217588wry.504.1649924756056; 
 Thu, 14 Apr 2022 01:25:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJJiDAargXbObsVDj9G3u5k/2S0Fw8jMKh3LM9lqbK1deff4nEQkiYIkjtAou08aM/zPgZzw==
X-Received: by 2002:a05:6000:1541:b0:207:8ee6:1417 with SMTP id
 1-20020a056000154100b002078ee61417mr1217567wry.504.1649924755808; 
 Thu, 14 Apr 2022 01:25:55 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b0038cfb1a43d6sm1349951wmr.24.2022.04.14.01.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:25:55 -0700 (PDT)
Date: Thu, 14 Apr 2022 09:25:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: adding 'official' way to dump SEV VMSA
Message-ID: <YlfakQfkZFOpKWeU@work-vm>
References: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
 <462cbf77-432a-c09c-6ec9-91556dc0f887@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <462cbf77-432a-c09c-6ec9-91556dc0f887@linux.ibm.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Cole Robinson <crobinso@redhat.com>, "Singh, Brijesh" <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dov Murik (dovmurik@linux.ibm.com) wrote:
> Hi Cole,
> 
> On 13/04/2022 16:36, Cole Robinson wrote:
> > Hi all,
> > 
> > SEV-ES and SEV-SNP attestation require a copy of the initial VMSA to
> > validate the launch measurement. For developers dipping their toe into
> > SEV-* work, the easiest way to get sample VMSA data for their machine is
> > to grab it from a running VM.
> > 
> > There's two techniques I've seen for that: patch some printing into
> > kernel __sev_launch_update_vmsa, or use systemtap like danpb's script
> > here: https://gitlab.com/berrange/libvirt/-/blob/lgtm/scripts/sev-vmsa.stp
> > 
> > Seems like this could be friendlier though. I'd like to work on this if
> > others agree.
> > 
> > Some ideas I've seen mentioned in passing:
> > 
> > - debugfs entry in /sys/kernel/debug/kvm/.../vcpuX/
> > - new KVM ioctl
> > - something with tracepoints
> > - some kind of dump in dmesg that doesn't require a patch
> > 
> > Thoughts?
> 
> 
> Brijesh suggested to me to construct the VMSA without getting any info from
> the host (except number of vcpus), because the initial state of the vcpus
> is standard and known if you use QEMU and OVMF (but that's open for discussion).
> 
> I took his approach (thanks Brijesh!) and now it's how we calculate expected
> SNP measurements in sev-snp-measure [1].  The relevant part for VMSA construction
> is in [2].
> 
> I plan to add SEV-ES and SEV measurements calculation to this 
> library/program as well.

Everyone seems to be writing one; you, Dan etc!

I think I agree the right way is to build it programmatically rather
than taking a copy from the kernel;  it's fairly simple, although the
scripts get increasingly hairy as you deal with more and more VMM's and
firmwares.

I think I'd like to see a new ioctl to read the initial VMSA, primarily
as a way of debugging so you can see what VMSA you have when something
goes wrong.

Dave

> 
> [1] https://github.com/IBM/sev-snp-measure
> [2] https://github.com/IBM/sev-snp-measure/blob/main/sevsnpmeasure/vmsa.py
> 
> -Dov
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


