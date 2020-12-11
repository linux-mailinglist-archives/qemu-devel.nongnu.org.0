Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE742D801C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 21:44:29 +0100 (CET)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knpH9-0000Cb-Pi
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 15:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knpEI-00085y-3U
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:41:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knpEC-0003wg-Jz
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:41:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607719281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHrMcBgQcuCZHB9L3Vc9XFiESjoCm39misdMOnuHAv0=;
 b=dfkNAkNnOMHL+MRtSAq7moPBh3k6pX0N/sMyGkIepgAUneO8/Jyld+iqxZmK4iKoXZVD4V
 fsxvEZv5k/vwp7+ceMYV7BkIKdPfFb0GWUJaGSl+XgvegArDjKQ8UKQd/drlcsWBR1r/wM
 cy+Vph9vN89Mmd8ClbZ8MjuPNeMR/KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-S7nQJpFNM36DyFEp3rQ5Zw-1; Fri, 11 Dec 2020 15:41:18 -0500
X-MC-Unique: S7nQJpFNM36DyFEp3rQ5Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A3910054FF;
 Fri, 11 Dec 2020 20:41:15 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63F291002391;
 Fri, 11 Dec 2020 20:41:11 +0000 (UTC)
Date: Fri, 11 Dec 2020 15:41:09 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v11 05/25] i386: move whpx accel files into whpx/
Message-ID: <20201211204109.GF1289986@habkost.net>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-6-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-6-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 09:31:23AM +0100, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/i386/{ => whpx}/whp-dispatch.h | 0
>  target/i386/{ => whpx}/whpx-cpus.h    | 0
>  target/i386/{ => whpx}/whpx-all.c     | 0
>  target/i386/{ => whpx}/whpx-cpus.c    | 0
>  MAINTAINERS                           | 5 +----
>  target/i386/meson.build               | 5 +----
>  target/i386/whpx/meson.build          | 4 ++++
>  7 files changed, 6 insertions(+), 8 deletions(-)
>  rename target/i386/{ => whpx}/whp-dispatch.h (100%)
>  rename target/i386/{ => whpx}/whpx-cpus.h (100%)
>  rename target/i386/{ => whpx}/whpx-all.c (100%)
>  rename target/i386/{ => whpx}/whpx-cpus.c (100%)
>  create mode 100644 target/i386/whpx/meson.build
> 

Unfortunately this conflicts with commit faf20793b5af ("WHPX:
support for the kernel-irqchip on/off") and needs to be redone.

-- 
Eduardo


