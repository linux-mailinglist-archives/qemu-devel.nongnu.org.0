Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFD368F27
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 11:04:09 +0200 (CEST)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZrjM-0006C4-HB
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 05:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZrhK-00059H-PI
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZrhJ-0000bE-0Q
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619168520;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RtHe36fYjiqExYoMV6v0yc88huQEMgLeMtPgsyEMIek=;
 b=jGtkMX8XZ521Q+0FZ6Dv2ACGdF07WaLAOa+heIAJtZaRHVcuGWxLWK/Dlb5zplkdJZaFps
 GIRZMTY5DPtmZKJqG4gLDVb8yESogAplsynXfmDZ7XeFUKJrKBZsSRoImXDG/fY9SQTSgV
 OdElwSqVqeTjkp3UPbOkzcc+J/qKQLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-6kF--EP7PR-tMIhB96vP0A-1; Fri, 23 Apr 2021 05:01:58 -0400
X-MC-Unique: 6kF--EP7PR-tMIhB96vP0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3D8283DD20;
 Fri, 23 Apr 2021 09:01:57 +0000 (UTC)
Received: from redhat.com (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE34D5B4BF;
 Fri, 23 Apr 2021 09:01:52 +0000 (UTC)
Date: Fri, 23 Apr 2021 10:01:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 0/2] pc: last minute bugfixes
Message-ID: <YIKM/TmY/5AYI8JF@redhat.com>
References: <20210422222429.183108-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422222429.183108-1-mst@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:24:48PM -0400, Michael S. Tsirkin wrote:
> The following changes since commit d83f46d189a26fa32434139954d264326f199a45:
> 
>   virtio-pci: compat page aligned ATS (2021-04-06 07:11:36 -0400)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 9106db1038bf3db5e4f8007038b3a1962018fa07:
> 
>   x86: acpi: use offset instead of pointer when using build_header() (2021-04-22 18:22:01 -0400)
> 
> ----------------------------------------------------------------
> pc: last minute bugfixes
> 
> Two bugfixes - both seem pretty obvious and safe ...

Are they fixing regressions from the previous release, and if so
what's the severity of them ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


