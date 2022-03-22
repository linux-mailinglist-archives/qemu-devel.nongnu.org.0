Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469D74E3BBD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:29:15 +0100 (CET)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWapG-0006BQ-Dc
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:29:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWanq-0004pp-L6
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWann-00013b-L5
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647941262;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=th+mnmAVh061eX/f7HAeAetoQpUM4B65nl+PWZ1KrPE=;
 b=AZxiYczPJXPiEoXGEr81m1s12jt71T1334g6lM+/nbVKLeGRB3FggTHXGTI9Gw10dvzAdO
 wrpPtX7+VPs1p82bgJ/oPW4NcoiC5FqkrVYoyjVetCEpEu9ml/BLF5vKZounPQB9HDmX4d
 qNZGh2OX2WFifjsuu5WI0LwytdBx8sc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-HVqzAQ1RNgOEunQiqpjWag-1; Tue, 22 Mar 2022 05:27:41 -0400
X-MC-Unique: HVqzAQ1RNgOEunQiqpjWag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 942A91161A84;
 Tue, 22 Mar 2022 09:27:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92445C27EA1;
 Tue, 22 Mar 2022 09:27:35 +0000 (UTC)
Date: Tue, 22 Mar 2022 09:27:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Message-ID: <YjmWhMVx80/BFY8z@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 04:54:51PM +0800, Xiaoyao Li wrote:
> On 3/18/2022 10:07 PM, Philippe Mathieu-Daudé wrote:
> > Hi,
> > 
> > On 17/3/22 14:58, Xiaoyao Li wrote:
> > > TDX VM needs to boot with Trust Domain Virtual Firmware (TDVF). Unlike
> > > that OVMF is mapped as rom device, TDVF needs to be mapped as private
> > > memory. This is because TDX architecture doesn't provide read-only
> > > capability for VMM, and it doesn't support instruction emulation due
> > > to guest memory and registers are not accessible for VMM.
> > > 
> > > On the other hand, OVMF can work as TDVF, which is usually configured
> > > as pflash device in QEMU. To keep the same usage (QEMU parameter),
> > > introduce ram_mode to pflash for TDVF. When it's creating a TDX VM,
> > > ram_mode will be enabled automatically that map the firmware as RAM.
> > > 
> > > Note, this implies two things:
> > >   1. TDVF (OVMF) is not read-only (write-protected).
> > > 
> > >   2. It doesn't support non-volatile UEFI variables as what pflash
> > >      supports that the change to non-volatile UEFI variables won't get
> > >      synced back to backend vars.fd file.
> > > 
> > > Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> > > ---
> > >   hw/block/pflash_cfi01.c | 25 ++++++++++++++++++-------
> > >   hw/i386/pc_sysfw.c      | 14 +++++++++++---
> > >   2 files changed, 29 insertions(+), 10 deletions(-)
> > 
> > If you don't need a pflash device, don't use it: simply map your nvram
> > region as ram in your machine. No need to clutter the pflash model like
> > that.
> 
> I know it's dirty to hack the pflash device. The purpose is to make the user
> interface unchanged that people can still use
> 
> 	-drive if=pflash,format=raw,unit=0,file=/path/to/OVMF_CODE.fd
>         -drive if=pflash,format=raw,unit=1,file=/path/to/OVMF_VARS.fd

Note, that in the default pflash config, libvirt will set the 'readonly=on'
flag for OVMF_CODE.fd ie, it will use

    -drive if=pflash,format=raw,unit=0,file=/path/to/OVMF_CODE.fd,readonly=on
    -drive if=pflash,format=raw,unit=1,file=/path/to/OVMF_VARS.fd

IOW, we're requiring OVMF_CODE.fd is ROM, while OVMF_VARS.fd is NVRAM

IIUC, this patch here is changing the semantics of these args:

   - OVMF_CODE.fd is mapped as RAM, but IIUC, QEMU would still be
     prevented from writing to it due to readonly=on in the
     block layer

   - OVMF_VARS.fd is mapped as RAM, but IIUC you're saying that
     none the less, any writes don't propagate back into the file ?



Dealing with OVMF_VARS.fd first, I really wonder why you want to have
a OVMF_VARS.fd file at all, if you don't have writes propagated into
it ? It has no reason to exist if you're not writing to it.

IMHO the AmdSev build for OVMF gets this right by entirely disabling
the split OVMF_CODE.fd vs OVMF_VARS.fd, and just having a single
OVMF.fd file that is exposed read-only to the guest.

This is further represented in $QEMU.git/docs/interop/firmware.json
by marking the firmware as 'stateless', which apps like libvirt will
use to figure out what QEMU command line to pick.

IOW, if you don't want OVMF_VARS.fd to be written to, then follow
what AmdSev has done, and get rid of the split files.


As for exposing OVMF_CODE.fd as RAM instead of ROM. That feels a
little odd, but as long as its backing store file on disk honours
the readony=on request to -drive, that's not terrible IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


