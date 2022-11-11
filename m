Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF66258AB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:49:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRZY-0007Kd-L6; Fri, 11 Nov 2022 05:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otRZM-0007Jn-MX
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:47:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otRZK-0007MO-8E
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668163649;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GfV8N7nC/lQuUz5YJxhFCpAUXUdcgUMUXjtcFvMMaEA=;
 b=Y/AIt4AkX1fU6oLoHkpwydiPQ7FnP299DLQqDcN+MXpVUC84pxcYlAym8/uATWtSkPftFH
 G/UvJnxhXmImsZv+eFwQn+I5DEPv46rpderSGYXlta7EN6IBFKBxnTsG7PyLyE47dFZXDY
 U+mQRlfmZpbmDZXqk876LtMKfSw+Ayg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-Uxe8kQvZNnKarHZQceI5Vg-1; Fri, 11 Nov 2022 05:47:25 -0500
X-MC-Unique: Uxe8kQvZNnKarHZQceI5Vg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE685185A7A3;
 Fri, 11 Nov 2022 10:47:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C14B2166B26;
 Fri, 11 Nov 2022 10:47:23 +0000 (UTC)
Date: Fri, 11 Nov 2022 10:47:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: How about increasing max_cpus for q35 ?
Message-ID: <Y24oOMgmf9QYQkXm@redhat.com>
References: <c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Nov 09, 2022 at 01:36:07PM +0000, Dario Faggioli wrote:
> Hello,
> 
> Sorry for the potentially naive question, but I'm not clear what the
> process would be if, say, I'd like to raise the number of maximum CPUs
> a q35 VM can have.
> 
> So, right now we have:
> 
> void pc_q35_2_7_machine_options(MachineClass *m) {
>   ...
>   m->max_cpus = 255;
> }
> 
> And:
> 
> void pc_q35_machine_options(MachineClass *m)
> {
>   ...
>   m->max_cpus = 288;
> }
> 
> Focusing on the latter, it comes from this commit:
> 
> https://gitlab.com/qemu-project/qemu/-/commit/00d0f9fd6602a27b204f672ef5bc8e69736c7ff1
>   
>   pc: q35: Bump max_cpus to 288
> 
>   Along with it for machine versions 2.7 and older keep
>   it at 255.
> 
> So, it was 255 and is now 288. This seems to me to be there since QEMU
> 2.8.0.
> 
> Now, as far as I understand, KVM can handle 1024, at least since this
> commit (and a couple of other related ones):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=074c82c8f7cf8a46c3b81965f122599e3a133450
> "kvm: x86: Increase MAX_VCPUS to 1024"
> 
> Which basically does:
> 
> -#define KVM_MAX_VCPUS 288
> +#define KVM_MAX_VCPUS 1024
> 
> And it's included in kernels >= 5.15.
> 
> So, what's the correct way of bumping up the limit again? Just changing
> that assignment in pc_q35_machine_options() ? Or do we want a new
> version of the machine type or something like that?

Too late for this release, so we need to wait until the new release
cycle opens, with thue addition of the 8.0.0 machine types. Then
just set 'max_cpus' in the new machine type.

In RHEL downstream we've set max_cpus = 710 for x86_64, because this
is the largest that was possible without hitting SMBIOS limits. The
problem was the use of the 32-bit entry point on PC machine types.

If we switch Q35 to use the 64-bit entry point, we should be able
to go straight to 1024 IIUC.  We were blocked changing the entry
point previously by need to have support in both SeaBIOS and UEFI
builds. I'm not sure what the status of this is, for the ROMS we
currently have in QEMU git. If both SeaBIOS and UEFI ROMs now
support 64-bit SMBIOS, then we can switch Q35 to it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


