Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5C1629390
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 09:49:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ourcP-0008JE-7K; Tue, 15 Nov 2022 03:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ourc5-0008I3-LQ
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 03:48:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ourc3-0006CZ-Rc
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 03:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668502088;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DE0G9UWYXADz+dBfBCw/e/d9+B+NJkWrsb2OgKN1cTY=;
 b=LhH7f3VbayDAt4+XeY9WjtBxubtY6nkBSUCid3ubq8j5pSdLjZuvTN4CzfzBtU9HW5mykn
 eJjsTx2Im7S9L5fqp+MuSRQdQ81k6997fxU0MOkPe7MVWmiIQJcC6hvFRa3IBx+W0doPp2
 9r4pgl+1Rs7Q23Mfh18Jn6yuvLhACsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-7NfN4qf7ORapMvJUPczbZg-1; Tue, 15 Nov 2022 03:48:05 -0500
X-MC-Unique: 7NfN4qf7ORapMvJUPczbZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5914101A528
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:48:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 142E52028DC1;
 Tue, 15 Nov 2022 08:48:03 +0000 (UTC)
Date: Tue, 15 Nov 2022 08:47:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pawel Polawski <ppolawsk@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Qemu virtual CPU limitation to 1024
Message-ID: <Y3NSPcnMwQ5j2gCm@redhat.com>
References: <CABchEG1Prh-Emo6LoVR4Zmx9NYeigZnYFPce7=jPCZMT3=Mj5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABchEG1Prh-Emo6LoVR4Zmx9NYeigZnYFPce7=jPCZMT3=Mj5w@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 15, 2022 at 12:19:35AM +0100, Pawel Polawski wrote:
> Hi Everyone,
> 
> I am trying to check qemu virtual cpu boundaries when running a custom
> edk2 based firmware build. For that purpose I want to run qemu with more
> than 1024 vCPU:
> $QEMU
> -accel kvm
> -m 4G
> -M q35,kernel-irqchip=on,smm=on
> -smp cpus=1025,maxcpus=1025 -global mch.extended-tseg-mbytes=128
> -drive if=pflash,format=raw,file=${CODE},readonly=on
> -drive if=pflash,format=raw,file=${VARS}
> -chardev stdio,id=fwlog
> -device isa-debugcon,iobase=0x402,chardev=fwlog "$@"
> 
> The result is as follows:
> QEMU emulator version 7.0.50 (v7.0.0-1651-g9cc1bf1ebc-dirty)
> Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
> qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested
> (1025) exceeds the recommended cpus supported by KVM (8)
> Number of SMP cpus requested (1025) exceeds the maximum cpus supported by
> KVM (1024)
> 
> It is not clear to me if I am hitting qemu limitation or KVM limitation
> here.

As per the error message, this is a KVM limit. QEMU queries the KVM
kernel module for this limit at runtime.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


