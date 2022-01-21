Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D83495E4C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:22:14 +0100 (CET)
Received: from localhost ([::1]:57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArzh-00042l-LK
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nArSS-0008FJ-Ee
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 05:47:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nArSO-0000tY-Qs
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 05:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642762067;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+gszmb9AbwAdd+bjq58sTmXTbldDIe0cLJIa4qt/DiE=;
 b=Vmb8kbLyC6jzjy/Zu0g4+kzp/R9LlIwBRAJ+CIX6yAMCqY6oCrIMXlv5RDCPHMGZD3Hkp9
 3aQMXI4p0sUjoEby0mZAsn026P4K4VUDqb7YjhDmVPUqsIVWTA2ttcSYpbs0OzaqlVNNth
 RI1qeC3nJJzkHe5aS73LOPL1k4M5W+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-XziKkW8mNA-z0BBe68wq9w-1; Fri, 21 Jan 2022 05:47:36 -0500
X-MC-Unique: XziKkW8mNA-z0BBe68wq9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1753C1006AA4;
 Fri, 21 Jan 2022 10:47:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9607B6D03D;
 Fri, 21 Jan 2022 10:47:32 +0000 (UTC)
Date: Fri, 21 Jan 2022 10:47:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 2/8] gitmodules: Correct libvirt-ci URL
Message-ID: <YeqPQIiFx+KYrTDz@redhat.com>
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-3-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220121103623.288054-3-f4bug@amsat.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 11:36:17AM +0100, Philippe Mathieu-Daudé wrote:
> Correct the libvirt-ci repository URL to avoid this warning when
> cloning / refreshing the submodule:
> 
>   warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/
> 
> Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitmodules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitmodules b/.gitmodules
> index 84425d87e28..f4b6a9b4012 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -66,4 +66,4 @@
>  	url = https://gitlab.com/qemu-project/vbootrom.git
>  [submodule "tests/lcitool/libvirt-ci"]
>  	path = tests/lcitool/libvirt-ci
> -	url = http://gitlab.com/libvirt/libvirt-ci
> +	url = https://gitlab.com/libvirt/libvirt-ci.git

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


