Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022BA55BF98
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:50:00 +0200 (CEST)
Received: from localhost ([::1]:42878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66v0-0000Ce-1M
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o66He-0003XS-T1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o66HX-0001LR-E1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656403749;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oArZdWdT93n4IMvCgrpOlADPuJJEz1M0CLKoSx/jcww=;
 b=J9L8Npz3Zku/Z6T+mDhmC3nVD47qqhosCi/bkLsCEGLbN+AikM7mPjx7u4ZZoW0Tb7LVT2
 KoqGbGCzgsbRN+kh67hgEOQiuk8F4eJQ8P5DWR1RExvpCXHzmspxdQgaDEYybsLMp2TisT
 NhpXRIjsXVcn6VQP9g/hd3ZRFrpYirw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-a4DkHlaAPyyRFuC2oQaOCg-1; Tue, 28 Jun 2022 04:09:05 -0400
X-MC-Unique: a4DkHlaAPyyRFuC2oQaOCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9B3981B910;
 Tue, 28 Jun 2022 08:09:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED31C4011A3E;
 Tue, 28 Jun 2022 08:09:03 +0000 (UTC)
Date: Tue, 28 Jun 2022 09:09:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
Message-ID: <Yrq3HUEghZ7IFh//@redhat.com>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 27, 2022 at 12:58:44PM +0530, Ani Sinha wrote:
> Biosbits is a software written by Josh Triplett that can be downloaded by
> visiting https://biosbits.org/. The github codebase can be found here:
> https://github.com/biosbits/bits/tree/master. It is a software that exercizes
> the bios components such as acpi and smbios tables directly through acpica
> bios interpreter (a freely available C based library written by Intel,
> downloadable from https://acpica.org/ and is included with biosbits) without an
> operating system getting involved in between.
> There are several advantages to directly testing the bios in a real physical
> machine or VM as opposed to indirectly discovering bios issues through the
> operating system. For one thing, the OSes tend to hide bios problems from the
> end user. The other is that we have more control of what we wanted to test
> and how by directly using acpica interpreter on top of the bios on a running
> system. More details on the inspiration for developing biosbits and its real
> life uses can be found in (a) and (b).
> This patchset contains QEMU qtests written in python that exercizes the QEMU
> bios components using biosbits and reports test failures.
> 
> Details of each of the files added by this patchset are provided in the README
> file which is part of Patch 11. Every effort to contact Josh, through various
> means including email, twitter, linkedIn etc has failed. Hence, the changes to
> build biosbits with the newer compiler, upgrade acpica and other changes are
> currently maintained in a forked project in my personal github. We may want to
> maintain bits in a separate fork in a stable repository that is accessible by
> QEMU developers.
> 
> The newly introduced qtest currently only run for x86_64 platform. They pass
> both when running make check on a baremetal box as well as from inside a vm.
> 
> Thanks to Igor M for pointing me to this work.
> 
> (a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
> (b) https://www.youtube.com/watch?v=36QIepyUuhg
> 
> Ani Sinha (12):
>   qtest: meson.build changes required to integrate python based qtests
>   acpi/tests/bits: add prebuilt bios bits zip archive
>   acpi/tests/bits: add prebuilt bits generated grub modules and scripts

These two files didn't arrive on the mailing list, presumaby because
pre-built binaries made the patches way too large.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


