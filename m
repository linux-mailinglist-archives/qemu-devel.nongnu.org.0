Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECC762F1A2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxuF-0003vm-N2; Fri, 18 Nov 2022 04:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ovxuE-0003uj-Fb
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:43:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ovxuD-0001Fp-08
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668764607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zqiJjBLL4Z1TU9HhYWbxVDnqwcMAdpf1mpv7hlPEd30=;
 b=AegOVhVQmEeQz0ll6G09KhbxgY+Q/W7diGekuqquOZomnWOS5AWbtqC1DXdB3Am45Y03zr
 xbPPOCglG6X/51oSpiWCzGndJlZRSXeEb3kR1dCVmoF6vIaE8dqzMCmyxi8WaIj1WwhsSq
 Qxum8aSJJlBnfvB1CSiGu+o6tgf63SA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-HTKenMpEMjO66C3G2HhiHg-1; Fri, 18 Nov 2022 04:43:22 -0500
X-MC-Unique: HTKenMpEMjO66C3G2HhiHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8860F3C0D853;
 Fri, 18 Nov 2022 09:43:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 270421121314;
 Fri, 18 Nov 2022 09:43:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BD0B31800091; Fri, 18 Nov 2022 10:43:18 +0100 (CET)
Date: Fri, 18 Nov 2022 10:43:18 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2] pc: q35: Bump max_cpus to 1024
Message-ID: <20221118094318.l7mpuk56jfnjaxpc@sirius.home.kraxel.org>
References: <166876173513.24238.8968021290016401421.stgit@tumbleweed.Wayrath>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166876173513.24238.8968021290016401421.stgit@tumbleweed.Wayrath>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 18, 2022 at 09:55:35AM +0100, Dario Faggioli wrote:
> Keep the old limit of 288 for machine versions 7.2 and earlier.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ---
> Changes from v1:
> - fix actually keeping the old max value for the 7.2 machine type,
>   which was the original goal, but was done wrongly
> 
> ---
> This is related to:
> 
> https://lore.kernel.org/qemu-devel/c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com/
> 
> With this applied to QEMU, I've been able to start a VM with as high as
> 980 vCPUs (even if I was on an host with 384 pCPUs, so everything was
> super slow!). After that, I started to see messages like this:
> 
> "SMBIOS 2.1 table length 66822 exceeds 65535"

We finally have smbios 3.0 support in both seabios and edk2, so we can
use that to avoid problems like this.  So when raising the limits for
new machine types we should also flip the smbios default to 3.0.

take care,
  Gerd


