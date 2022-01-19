Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2096493754
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:31:17 +0100 (CET)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7JE-0005FU-8l
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:31:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nA75T-0006vP-PP
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:17:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nA75Q-00042q-Ka
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642583815;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9f29xMJHHlBM2PF7oMOBM9384f/0zoZHrhYGFGapfZg=;
 b=aUiQ4m86g6L/mT/hD+lPShm9rSIkWe3TgmTyvyTLgzep6uNqNrIBe9murqxQrNXGRKFRcN
 PjHzj/AwJJiq7+K9YXk5FMC39MFNozDUiGdxWBvcSDwOkMteYAMnKoDr1MKANGdd4/ETtT
 UGNS4+w7tEP+NLMd7+A1G215gGBN7O0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-NydaXA9jM3m_KnQC6koMkQ-1; Wed, 19 Jan 2022 04:16:51 -0500
X-MC-Unique: NydaXA9jM3m_KnQC6koMkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03052F4B;
 Wed, 19 Jan 2022 09:16:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3E44F857;
 Wed, 19 Jan 2022 09:16:49 +0000 (UTC)
Date: Wed, 19 Jan 2022 09:16:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH] qapi: Cleanup SGX related comments
Message-ID: <YefW/sAB2SEKHU24@redhat.com>
References: <20220119120014.342180-1-yang.zhong@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220119120014.342180-1-yang.zhong@intel.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 07:00:14AM -0500, Yang Zhong wrote:
> The SGX NUMA patches were merged into Qemu 7.0 release, we need
> clarify detailed version history information and also change
> some related comments, which make SGX related comments clearer.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  qapi/machine.json     |  4 ++--
>  qapi/misc-target.json | 14 +++++++++-----
>  2 files changed, 11 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> diff --git a/qapi/machine.json b/qapi/machine.json
> index b6a37e17c4..cf47cb63a9 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1207,7 +1207,7 @@
>  #
>  # @memdev: memory backend linked with device
>  #
> -# @node: the numa node
> +# @node: the numa node (Since: 7.0)
>  #
>  # Since: 6.2
>  ##
> @@ -1288,7 +1288,7 @@
>  #
>  # @memdev: memory backend linked with device
>  #
> -# @node: the numa node
> +# @node: the numa node (Since: 7.0)
>  #
>  # Since: 6.2
>  ##
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 1022aa0184..558521bd39 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -344,9 +344,9 @@
>  #
>  # @node: the numa node
>  #
> -# @size: the size of epc section
> +# @size: the size of EPC section
>  #
> -# Since: 6.2
> +# Since: 7.0
>  ##
>  { 'struct': 'SGXEPCSection',
>    'data': { 'node': 'int',
> @@ -365,7 +365,7 @@
>  #
>  # @flc: true if FLC is supported
>  #
> -# @sections: The EPC sections info for guest
> +# @sections: The EPC sections info for guest(Since: 7.0)

Minor point - a space is needed before '('

>  #
>  # Since: 6.2
>  ##
> @@ -390,7 +390,9 @@
>  #
>  # -> { "execute": "query-sgx" }
>  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> -#                  "flc": true, "section-size" : 0 } }
> +#                  "flc": true,  "sections":
> +#                  [{"node": 0, "size": 67108864},
> +#                  {"node": 1, "size": 29360128}]} }
>  #
>  ##
>  { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
> @@ -408,7 +410,9 @@
>  #
>  # -> { "execute": "query-sgx-capabilities" }
>  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> -#                  "flc": true, "section-size" : 0 } }
> +#                  "flc": true, "section" :
> +#                  [{"node": 0, "size": 67108864},
> +#                  {"node": 1, "size": 29360128}]} }

The 'section-size' shouldn't be removed here - we still need the
command fixed to bring back the 'section-size' as it should not
have been deleted.

Adding the 'section' docs is ok though.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


