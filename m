Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB86F02A3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:34:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prx4c-0000Sy-8Z; Thu, 27 Apr 2023 04:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prx4a-0000Sc-4V
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prx4Y-0002YU-AU
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682584429;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMGK8WNfX4xrHpuwMbqg4tfbpAJWES7dGatCtSq/JQM=;
 b=dmGp4LHR41yqQrvMpEOQcD3eSjx180KrmPzbckuNTsGq/gF30P2RktxoBu9tkt3wCRhTa5
 exsJHCsJ10xDOAIeZ4tS5WMslAf/z/pv8XxeYFiuPL8YGHg8ZRhVZh6nwWzfr+K/iUlfSK
 QCUFZQzLq05hEq64TT+aw/iCEjX/UYQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602--syHBJDmN9aXli-0X2Cviw-1; Thu, 27 Apr 2023 04:33:46 -0400
X-MC-Unique: -syHBJDmN9aXli-0X2Cviw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0C54885623;
 Thu, 27 Apr 2023 08:33:45 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD1981415304;
 Thu, 27 Apr 2023 08:33:43 +0000 (UTC)
Date: Thu, 27 Apr 2023 09:33:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
Message-ID: <ZEozZX/eH7BzUrWl@redhat.com>
References: <20230425133851.489283-1-thuth@redhat.com>
 <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
 <ZEoyNt0UtSYRt9Go@redhat.com>
 <CABgObfbqD+C4aME0yApeb_9dWA=22Yz+oi_7ECUtf6A4McHrhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfbqD+C4aME0yApeb_9dWA=22Yz+oi_7ECUtf6A4McHrhA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 27, 2023 at 10:31:00AM +0200, Paolo Bonzini wrote:
> On Thu, Apr 27, 2023 at 10:28 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > I wonder if we should take this a step further and rename qemu-system-x86_64
> > > to qemu-system-x86!  Distros can if they wish create symlinks to both
> > > qemu-system-i386 and qemu-system-x86_64.
> >
> > I can't help feeling this just creates a new upgrade burden for distros
> > for no obvious win.
> 
> We can create the symlinks on install as well during the deprecation
> period. It doesn't have to be done by distros.

What's the actual win though ?  Why would anyone want to create guests
using qemu-system-x86, if both qemu-system-i386 / qemu-system-x86_64
still exist indefinitely for backwards compat.  What does having a
qemu-system-x86 add that can't be achieve just though hardlink
between the two existing binaries ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


