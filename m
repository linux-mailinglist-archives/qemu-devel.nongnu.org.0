Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423584166D2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:40:57 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVWa-0000N2-BS
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mTVUK-0006Ox-Qa
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mTVUJ-0006Ef-CH
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632429514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ZVm6n6SeI4oY3dWKb9jjzzKNzXXktMctyiPcayxWdw=;
 b=AqPctjYQ/o8FYqnRR0eYO8SmrDqxhz8pbuRp2kehdfUxPgqgNjdRwTis5DYjnASH3E0KGI
 YMOnKmDq4K9nuriJVh9BRbmBsBk8NUKgp8LOGFiZk6WZchKbba1+Wq098E0hNFtIoJ50Gw
 k1sx9k7mneNP3fa3uniEh3PD0zyOBlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-0d-6_6y8PEeelfUoSenKvw-1; Thu, 23 Sep 2021 16:38:33 -0400
X-MC-Unique: 0d-6_6y8PEeelfUoSenKvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BE6D802937;
 Thu, 23 Sep 2021 20:38:32 +0000 (UTC)
Received: from localhost (unknown [10.22.8.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4778760BE5;
 Thu, 23 Sep 2021 20:38:25 +0000 (UTC)
Date: Thu, 23 Sep 2021 16:38:24 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 2/2] docs/sphinx: change default role to "any"
Message-ID: <20210923203824.aae4fqs7l6nbmwel@habkost.net>
References: <20210923191323.59726-1-jsnow@redhat.com>
 <20210923191323.59726-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923191323.59726-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 03:13:23PM -0400, John Snow wrote:
> This interprets single-backtick syntax in all of our Sphinx docs as a
> cross-reference to *something*, including Python symbols.
> 
> From here on out, new uses of `backticks` will cause a build failure if
> the target cannot be referenced.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Patch 1/2 demonstrates why patch 2/2 is useful.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> ---
>  docs/conf.py | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/conf.py b/docs/conf.py
> index ff6e92c6e2e..4d9f56601fc 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -85,6 +85,11 @@
>  # The master toctree document.
>  master_doc = 'index'
>  
> +# Interpret `single-backticks` to be a cross-reference to any kind of
> +# referenceable object. Unresolvable or ambiguous references will emit a
> +# warning at build time.
> +default_role = 'any'
> +
>  # General information about the project.
>  project = u'QEMU'
>  copyright = u'2021, The QEMU Project Developers'
> -- 
> 2.31.1
> 

-- 
Eduardo


