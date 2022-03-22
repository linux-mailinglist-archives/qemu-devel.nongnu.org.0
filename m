Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F194E3B6B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:04:24 +0100 (CET)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWaRD-00058g-2C
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:04:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nWaPh-0004Tn-4V
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nWaPe-0000j2-En
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647939764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kIECeaOGNGThyDsccgXqUeks22kwbKKUnoocC2+ZGhY=;
 b=PhMo9LKaXTLlIYFed9E3XC6Vxy/0fxAAVHYVAI7q+aRd4b2rQqtMN/398dsrw3JJpUGeaz
 rrXw6pFWaywQG84pahL61nQyi9Lr+lPQdzop2mLlDVmZkinhB2x2brouJgCg2g6xTloYeH
 F6XrlT+GCgpdnyDtrVq/0uwFtjsdbHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-Etli3fYZNuKVkCjWzVCwuA-1; Tue, 22 Mar 2022 05:02:41 -0400
X-MC-Unique: Etli3fYZNuKVkCjWzVCwuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFE6938008A1;
 Tue, 22 Mar 2022 09:02:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6747A40C1257;
 Tue, 22 Mar 2022 09:02:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E4EC9180062E; Tue, 22 Mar 2022 10:02:38 +0100 (CET)
Date: Tue, 22 Mar 2022 10:02:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 12/36] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Message-ID: <20220322090238.6job2whybu6ntor7@sirius.home.kraxel.org>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-13-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317135913.2166202-13-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Thu, Mar 17, 2022 at 09:58:49PM +0800, Xiaoyao Li wrote:
> Add sept-ve-disable property for tdx-guest object. It's used to
> configure bit 28 of TD attributes.

What is this?

> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -792,10 +792,13 @@
>  #
>  # @attributes: TDX guest's attributes (default: 0)
>  #
> +# @sept-ve-disable: attributes.sept-ve-disable[bit 28] (default: 0)

I'd suggest to document this here.

thanks,
  Gerd


