Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A943331A31C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:53:11 +0100 (CET)
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAbgs-0006iC-Nq
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAbfK-0005r0-9s
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:51:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAbfD-0002Sp-UX
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613148685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9jZG34sJdBcaEzg9Q/hTWC4urk/ooxK0TEOBiHEJLU=;
 b=TM0zclb9p8c18C9YjP5NMDF+nhaqgzUF2ID9q+wQtQfnOCDqp0NP9nOUgd/z6rhwBmxRhv
 ghW0IEEi4n9lv5SdnSaaggrKN7oxlDLS71Jp6gTf45EvvD+6RW4SEgQBuX9WeXCRKNYoMH
 EXvPASjNWzkSJwb+U7FJJr+ni9+KFGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-isL9Ab12NoyWN1mlhIvgcw-1; Fri, 12 Feb 2021 11:51:21 -0500
X-MC-Unique: isL9Ab12NoyWN1mlhIvgcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5B171009626;
 Fri, 12 Feb 2021 16:51:20 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 947101A86A;
 Fri, 12 Feb 2021 16:51:14 +0000 (UTC)
Subject: Re: [PATCH] docs/sphinx/qapidoc.py: Handle change of QAPI's builtin
 module name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210212161311.28915-1-peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b648e026-27e0-f432-4cf2-c111a245dc23@redhat.com>
Date: Fri, 12 Feb 2021 10:51:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212161311.28915-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 10:13 AM, Peter Maydell wrote:
> In commit e2bbc4eaa7f0 we changed the QAPI modules to name the built-in
> module "./builtin" rather than None, but forgot to update the Sphinx
> plugin. The effect of this was that when the plugin generated a dependency
> file it was including a bogus dependency on a non-existent file named
> "builtin", which meant that ninja would run Sphinx and rebuild all
> the documentation every time even if nothing had changed.
> 
> Update the plugin to use the new name of the builtin module.
> 
> Fixes: e2bbc4eaa7f0
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/sphinx/qapidoc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Eric Blake <eblake@redhat.com>

(I had wondered why my builds were taking so much longer lately...)

> 
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index e03abcbb959..b7b86b5dffb 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -464,7 +464,7 @@ class QAPISchemaGenDepVisitor(QAPISchemaVisitor):
>          self._qapidir = qapidir
>  
>      def visit_module(self, name):
> -        if name is not None:
> +        if name != "./builtin":
>              qapifile = self._qapidir + '/' + name
>              self._env.note_dependency(os.path.abspath(qapifile))
>          super().visit_module(name)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


