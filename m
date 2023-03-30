Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DB6D0B53
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:32:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phvB7-00019c-Tb; Thu, 30 Mar 2023 12:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1phvB2-00019H-Uf
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 12:31:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1phvB0-0003xJ-9V
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 12:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680193861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gl0xwbureYUTGszl4XZCdJxn5dFcTbFVKxBaDIuFMf0=;
 b=ENRanQP1/Eca/F+h9nAU6ghMdv3JVnqTq8XYMlkvmpRQ6YDcVTxbUnUq7Vtdb1FVvaELMS
 ZPCgtOxQaRWYm1NL0NB0kFHSrsqVGKk4ACmTBrnV452pRTpX2CR/pZToSY+FzEICwsqOVd
 Dl5B5KyTMTk+k9EjDXC0sNFoQ7AGBW4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-9I7vsNwqNWeJ6GMt26tAfA-1; Thu, 30 Mar 2023 12:29:15 -0400
X-MC-Unique: 9I7vsNwqNWeJ6GMt26tAfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC8883810B10;
 Thu, 30 Mar 2023 16:29:13 +0000 (UTC)
Received: from pinwheel (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E87C15BA0;
 Thu, 30 Mar 2023 16:29:10 +0000 (UTC)
Date: Thu, 30 Mar 2023 18:29:08 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 03/11] MAINTAINERS: add a section for policy documents
Message-ID: <ZCW41Nd562n3H0bR@pinwheel>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230330101141.30199-4-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
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

On Thu, Mar 30, 2023 at 11:11:33AM +0100, Alex Bennée wrote:
> We don't update these often but if you are the sort of person who
> enjoys debating and tuning project policies you could now add yourself
> as a reviewer here so you don't miss the next debate over tabs vs
> spaces ;-)
> 
> Who's with me?

Happy to chip in wherever I can be useful :-)

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com> 

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>
>
> ---
> v2
>   - s/your/you are/
>   - add some willing victims
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e1a60ea24..2c173dbd96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -64,6 +64,19 @@ L: qemu-devel@nongnu.org
>  F: *
>  F: */
>  
> +Project policy and developer guides
> +R: Alex Bennée <alex.bennee@linaro.org>
> +R: Daniel P. Berrangé <berrange@redhat.com>
> +R: Thomas Huth <thuth@redhat.com>
> +R: Markus Armbruster <armbru@redhat.com>
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

-- 
/kashyap


