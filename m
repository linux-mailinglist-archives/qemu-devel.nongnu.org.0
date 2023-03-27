Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4F6C9F31
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:17:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgiyJ-00040E-Dp; Mon, 27 Mar 2023 05:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgiy4-0003yy-C6
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgiy2-0001IT-H1
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679908601;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8IXZ6HFPLCdRcTT+0aA+ihm7QTJgTZWsZbo4T801fg=;
 b=TYmtIoQu0SYOHWIz6lpB3k75Gxqiea2EvNVE5YTkLYgCB4TdPVNaCCrk+GZIcVJ/+zlj0J
 DvQmWVXT5siWt/F0FGAqODclukxxmWdVuexTSAKeRBW+uDPOuBq61qSvG64bfXDzm5LgFC
 F/BYSzMGlGnHR1IxZm2vStCNEPgM0Xc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-EAUGFSCTOrqywSyNB6Y4Yw-1; Mon, 27 Mar 2023 05:16:37 -0400
X-MC-Unique: EAUGFSCTOrqywSyNB6Y4Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53A391C0432D;
 Mon, 27 Mar 2023 09:16:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 913CCC15BB8;
 Mon, 27 Mar 2023 09:16:35 +0000 (UTC)
Date: Mon, 27 Mar 2023 10:16:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add a section for policy documents
Message-ID: <ZCFe68dxx/Wa5xya@redhat.com>
References: <20230324173836.1821275-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230324173836.1821275-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 24, 2023 at 05:38:36PM +0000, Alex Bennée wrote:
> We don't update these often but if your the sort of person who enjoys

s/your/you are/

> debating and tuning project policies you could now add yourself as a
> reviewer here so you don't miss the next debate over tabs vs spaces
> ;-)
> 
> Who's with me?

Sure, you can add me.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b56ccdd92..992deb2667 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -64,6 +64,16 @@ L: qemu-devel@nongnu.org
>  F: *
>  F: */
>  
> +Project policy and developer guides
> +R: Alex Bennée <alex.bennee@linaro.org>
> +W: https://www.qemu.org/docs/master/devel/index.html
> +S: Odd Fixes
> +F: docs/devel/style.rst
> +F: docs/devel/code-of-conduct.rst
> +F: docs/devel/conflict-resolution.rst
> +F: docs/devel/submitting-a-patch.rst
> +F: docs/devel/submitting-a-pull-request.rst
> +
>  Responsible Disclosure, Reporting Security Issues
>  -------------------------------------------------
>  W: https://wiki.qemu.org/SecurityProcess
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


