Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7280C2D7021
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:25:08 +0100 (CET)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knbrW-00078T-Tu
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knble-0003ma-LD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 01:19:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knblZ-0007Xi-1F
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 01:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607667536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dfj1CKZOBNk7tZeD10i7f3QMxv+oTBhEWgsqSEkOXHs=;
 b=WJR5a2ziT20rz0yMYho5VzJGl/LMDxlrYCWgNlBSnx/QUGUEyd5Snr6StT/S7yMCB2MAvC
 GnmcmIW9We28tiGQC3ERTHTQNWBJRGTqF/BHEKrpKLmJgLBcCdNI27CVC2GwPXU24ZCH+i
 zApMivcj6pP0LPAOIhN75zEUMViNmlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-oQErJHI6OEmwcfqU_3Kefw-1; Fri, 11 Dec 2020 01:18:54 -0500
X-MC-Unique: oQErJHI6OEmwcfqU_3Kefw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B72B107ACF5;
 Fri, 11 Dec 2020 06:18:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C4AA10016F6;
 Fri, 11 Dec 2020 06:18:39 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] configure: include moxie-softmmu in
 deprecated_targets_list
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f050dd32-bdce-c6c1-32de-194022d742ab@redhat.com>
Date: Fri, 11 Dec 2020 07:18:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 Anthony Green <green@moxielogic.com>, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 cota@braap.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2020 20.04, Alex Bennée wrote:
> We still build it but there is no point including it in the normal
> builds as it is ushered out of the door.
> 
> Fixes: 4258c8e221 ("docs/system/deprecated: Mark the 'moxie' CPU as deprecated")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure      | 2 +-
>  .gitlab-ci.yml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 18c26e0389..8f2095a2db 100755
> --- a/configure
> +++ b/configure
> @@ -1610,7 +1610,7 @@ if [ "$ARCH" = "unknown" ]; then
>  fi
>  
>  default_target_list=""
> -deprecated_targets_list=ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
> +deprecated_targets_list=moxie-softmmu,ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
>  deprecated_features=""
>  mak_wilds=""
>  
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 98bff03b47..b3bcaacf7b 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -355,7 +355,7 @@ build-deprecated:
>      IMAGE: debian-all-test-cross
>      CONFIGURE_ARGS: --disable-docs --disable-tools
>      MAKE_CHECK_ARGS: build-tcg
> -    TARGETS: ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
> +    TARGETS: moxie-softmmu ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
>        unicore32-softmmu
>    artifacts:
>      expire_in: 2 days
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


