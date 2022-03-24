Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C04E5FC9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 08:58:32 +0100 (CET)
Received: from localhost ([::1]:43080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIMZ-0003pR-PJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 03:58:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nXILH-00039A-7e
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 03:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nXILE-0007Cu-NE
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 03:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648108627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y4OLA5AVObVFGzzk4S1HDaz+Qryeu6G84vGOSNzALb0=;
 b=WLdWUZB8qbLRzy6ZYxpPexHFLCshjLg4N54U2U2aqb6PmAYPpZbGf1dgJ4DG+Rm01Dz6Fk
 I59hNskHro5cwCy93ZkhIyxv3GwZWAQCVScZWF/YaBMQMnL0MwR07SPlasI0KHV+wOgZXf
 J09QM5txFj2AwzMQFkWc2vb0wpL7iNw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-rl3qCzXZMJ690avWtQcc5g-1; Thu, 24 Mar 2022 03:57:05 -0400
X-MC-Unique: rl3qCzXZMJ690avWtQcc5g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 353CB899EC2;
 Thu, 24 Mar 2022 07:57:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E59CD401E9C;
 Thu, 24 Mar 2022 07:57:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 54BD818000AA; Thu, 24 Mar 2022 08:57:03 +0100 (CET)
Date: Thu, 24 Mar 2022 08:57:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 12/36] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Message-ID: <20220324075703.7ha44rd463uwnl55@sirius.home.kraxel.org>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-13-xiaoyao.li@intel.com>
 <20220322090238.6job2whybu6ntor7@sirius.home.kraxel.org>
 <b452d357-8fc2-c49c-8c19-a57b1ff287e8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b452d357-8fc2-c49c-8c19-a57b1ff287e8@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 02:52:10PM +0800, Xiaoyao Li wrote:
> On 3/22/2022 5:02 PM, Gerd Hoffmann wrote:
> > On Thu, Mar 17, 2022 at 09:58:49PM +0800, Xiaoyao Li wrote:
> > > Add sept-ve-disable property for tdx-guest object. It's used to
> > > configure bit 28 of TD attributes.
> > 
> > What is this?
> 
> It seems this bit doesn't show up in the public spec yet.
> 
> Bit 28 (SEPT_VE_DISABLE): Disable EPT violation conversion to #VE ON guest
> TD ACCESS of PENDING pages.
> 
> The TDX architecture requires a private page to be accepted before using. If
> guest accesses a not-accepted (pending) page it will get #VE.
> 
> For some OS, e.g., Linux TD guest, it doesn't want the #VE on pending page
> so it will set this bit.

Hmm.  That looks rather pointless to me.  The TDX patches for OVMF add a
#VE handler, so I suspect every guest wants #VE exceptions if even the
firmware cares to install a handler ...

Also: What will happen instead? EPT fault delivered to the host?

take care,
  Gerd


