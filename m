Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F1650DE75
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 13:06:21 +0200 (CEST)
Received: from localhost ([::1]:51038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwXs-0006aG-GH
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 07:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niwMw-0005Mc-SR
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niwMv-0000ym-5x
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650884100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Te6f2yZlcV6qnw1TY7gHhpro/z5hWpuEQ+F2YEe/yeA=;
 b=E1zv9AuoNTBs4YDPl/Y/QNsmKx4mdNXhKzBkq68ahnScnW0aF+Styimxgh0zfX5G8/bdu/
 1Q4khuI5NQxWJKhP69GVEomhF+pVP76LsVy9YjTrW01JA5TMSiHMd0D69t1lhfwbbi/t0m
 +wqUfMCrFZh3fr+S1Hcr4VjHxpmZTmg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-wnj9RbTgM4aXUPoWx66NMQ-1; Mon, 25 Apr 2022 06:54:59 -0400
X-MC-Unique: wnj9RbTgM4aXUPoWx66NMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF33E380673F
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 10:54:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB8B2166BA3;
 Mon, 25 Apr 2022 10:54:56 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:54:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 02/12] update maintainer metadata
Message-ID: <YmZ9/qQ/YWU6F3fj@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-3-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422184940.1763958-3-jsnow@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:30PM -0400, John Snow wrote:
> Modify "QEMU Developer Team" to "QEMU Project", as this matches the
> spelling we use for the collective on gitlab.com/qemu-project.
> 
> Add myself as the principal maintainer contact.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  setup.cfg | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> diff --git a/setup.cfg b/setup.cfg
> index 4ffab73..f06f944 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -1,8 +1,10 @@
>  [metadata]
>  name = qemu.qmp
>  version = file:VERSION
> -maintainer = QEMU Developer Team
> -maintainer_email = qemu-devel@nongnu.org
> +author = QEMU Project
> +author_email = qemu-devel@nongnu.org
> +maintainer = John Snow
> +maintainer_email = jsnow@redhat.com

It is up to you to decide, but beware that listing yourself here will
result in random people emailing you directly to ask for help, instead
of emailing the mailing list for help. Personally I always want people
to use the mailing list and never mail me directly [1].

With regards,
Daniel

[1] https://rwmj.wordpress.com/2010/11/08/want-help-dont-email-me-directly/
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


