Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858333D3C1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:24:09 +0100 (CET)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8k4-0000et-7j
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM8ZY-0002Y3-3w
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM8ZU-0008Mu-Os
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615896790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTZV6whdbswg6m34YE3YQXQbCCfgquytmAWJ/m1aGvQ=;
 b=OliQxS9mxfsu+FXgqy206enYKkc+4AgS7EWL9yMxSzPSd6gGDB2yN/RZ1UYUdf2oTK3JNe
 /PGOJyp3estHTTK1diD5imoVZeIXSaMHQSsC2YJ1AV2NsB7IrWzFcmSaQWNsTMoCX76Hmx
 YNWm9WXKpxfi5RDz/hpA6e2rXZzakwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-vkv4M4Y-P-6u4d8N7FX19w-1; Tue, 16 Mar 2021 08:13:08 -0400
X-MC-Unique: vkv4M4Y-P-6u4d8N7FX19w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CD22801596;
 Tue, 16 Mar 2021 12:13:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E3F119D61;
 Tue, 16 Mar 2021 12:13:05 +0000 (UTC)
Date: Tue, 16 Mar 2021 13:13:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210316131304.220a53b9@redhat.com>
In-Reply-To: <20210316015503.GA1008366@private.email.ne.jp>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316015503.GA1008366@private.email.ne.jp>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 18:55:03 -0700
Isaku Yamahata <isaku.yamahata@gmail.com> wrote:

> On Mon, Mar 15, 2021 at 11:27:29PM +0100,
> Reinoud Zandijk <reinoud@NetBSD.org> wrote:
> 
> > On Mon, Mar 15, 2021 at 06:53:02PM +0100, Igor Mammedov wrote:  
> > > Windows 10 1607x64 boots fine when I test it with default machine.
> > > 
> > > So
> > >   1) can you provide full QEMU command line used
> > >   2) What Windows build do you use
> > >   3) is it existing guest image (i.e. installed in older QEMU version)  
> > 
> > I've used:
> > 
> > qemu-system-x86_64 -m 4G -smp cores=2 -accel nvmm \
> > 	-snapshot \
> > 	-drive file=/home/reinoud/Downloads/Win10-demo.raw,format=raw \
> > 	-rtc base=localtime,clock=host \
> > 	-spice port=5924,disable-ticketing=on \
> > 	-vga qxl \
> > 	-usb -device usb-tablet \
> > 	-net nic -net tap,ifname=tap0,script=no &
> > 
> > If I add in '-M pc-i440fx-5.2' it works again with the accelerator. If I add
> > in '-M q35' it does work fine with or without the accelerator.  
> 
> Anyhow, can you please try "-global PIIX4_PM.smm-compat=on"
> (or "-global ICH9-LPC.smm-compat=on" if q35 is used) so that the old behavior
> is presented.
> 
> 
> > Surprisingly without accelerator ie with tcg the default machine does seem to
> > get to the login prompt. Is the ACPI data tailored to indicate an
> > accelerator/VM or is it static? Could it be that the CPU reported by my
> > machine is causing the issue? With the NVMM accelerator it passes on the hosts  
> 
> I think tcg case can be explained by x86_machine_is_smm_enabled()
> 
>   bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
>   ...
>       if (tcg_enabled() || qtest_enabled()) {
>           smm_available = true;
>       } else if (kvm_enabled()) {
>           smm_available = kvm_has_smm();
>       }
>   ...
> 
> Although I don't know about nvmm case, this function also needs to be updated
> if smi isn't supported.
can you submit a patch for this please?

> 
> Thanks,
> 
> 
> > CPU:
> > 
> > cpu0: "Intel(R) Celeron(R) 2957U @ 1.40GHz"
> > cpu0: Intel 4th gen Core, Xeon E3-12xx v3 (Haswell) (686-class), 1396.77 MHz
> > cpu0: family 0x6 model 0x45 stepping 0x1 (id 0x40651)
> > 
> > Running with NVMM gives the following warnings that might be relevant though
> > doesn't seem to bother the BSDs nor Linux last time I tried and Google tells
> > me they are power saving related MSRs:
> > 
> > qemu-system-x86_64: NVMM: Unexpected RDMSR 0x611, ignored
> > qemu-system-x86_64: NVMM: Unexpected RDMSR 0x641, ignored
> > qemu-system-x86_64: NVMM: Unexpected RDMSR 0x606, ignored
> > qemu-system-x86_64: NVMM: Unexpected RDMSR 0x606, ignored
> > qemu-system-x86_64: NVMM: Unexpected RDMSR 0x641, ignored
> > qemu-system-x86_64: NVMM: Unexpected RDMSR 0x611, ignored
> > 
> > I am not sure if that makes ACPI take a different route or not.
> > 
> > The Windows used is
> > 	Windows 10 Enterprise Evaluation
> > 	Build 17763.rs5_release.180914-1434
> > 	version 1809
> > 
> > The image file was downloaded pre-installed from Microsoft for Edge browser
> > evaluation. I used it first on Qemu 5.1 IIRC and it kept working in Qemu 5.2.
> > 
> > The NVMM accelerator was presented here before but is not yet committed. Its
> > API/construction is similar to WHPX.
> > 
> > As for the cause, I don't know; q35-6.0 works so why isn't pc-i440fx-6.0 ?
> > 
> > With regards,
> > Reinoud
> > 
> >   
> 


