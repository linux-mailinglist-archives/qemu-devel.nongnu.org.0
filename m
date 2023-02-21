Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E5C69DD8C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:07:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPXo-0007n5-Uh; Tue, 21 Feb 2023 05:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPXl-0007mJ-L8
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPXk-0001Jx-4y
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676973999;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=H7EaGnMEI02WRh0sPDME1v5xdwxansD5J6eyouc+hlQ=;
 b=Wcz4JrO8CF6iuEd27MViaWl3CIRYMopZgez3BNrAvsrgT8Pxg1e+zOJXBUbF0CungqKNNe
 OuDVQQaAiVFHheu3zG0ov6wk2D+K/+AFzCIU4lxaMykoyt3Pfi9iUVuqmIx4idQ+jm9KY7
 D3/nTjWMpcf+3KuPbK7Fsgg/yBra3Fk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-HYjLLf6OPoGqHC0XzqInxw-1; Tue, 21 Feb 2023 05:06:36 -0500
X-MC-Unique: HYjLLf6OPoGqHC0XzqInxw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2D5629AA384;
 Tue, 21 Feb 2023 10:06:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD51492B02;
 Tue, 21 Feb 2023 10:06:35 +0000 (UTC)
Date: Tue, 21 Feb 2023 10:06:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Detecting qemu from guest on arm/hvf (apple arm)
Message-ID: <Y/SXqGGZhN0OJu7V@redhat.com>
References: <20230215234846.GJ95670@funkthat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215234846.GJ95670@funkthat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Feb 15, 2023 at 03:48:46PM -0800, John-Mark Gurney wrote:
> Hello,
> 
> I was wondering what the best way to detect that FreeBSD is running
> under qemu/hvf on Apple ARM?  FreeBSD doesn't see the ACPI FADT table,
> so I'm wondering if keying off of something like the QEMU0002 device
> in ACPI is the best way?  Or is there another option?

Aside from Peter's suggestion to check for actual features that
matter, if you genuinely need to detect a specific platform,
the virt-what tool is generally what I point people to. It has
loads of checks in it. It can detect QEMU on aarch64, but doesn't
distinguish KVM unless SMBIOS is present too. The 'virt' machine
type will include SMBIOS, so I expect the KVM check will probably
trigger for HVF too.

  http://git.annexia.org/?p=virt-what.git;a=blob;f=virt-what.in;h=01e9acaf689416d9bff6eaca1b849dc4e798a0af;hb=HEAD#l340

This is wrong from virt-what POV, but I presume for your needs,
you'd be happy to detect *any* hypervisor as you'll want to tweak
the clock frequency for both HVF and KVM VMs

If you do come up with any tweaks to it, patches would be welcome.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


