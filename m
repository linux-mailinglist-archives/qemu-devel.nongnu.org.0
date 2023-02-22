Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D799569F795
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:20:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUquO-0007qE-HL; Wed, 22 Feb 2023 10:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUquM-0007py-JC
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:19:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUquK-00017E-T3
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677079188;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xgljW9zbBsxJc1oNOSn3NPc0MOv+4sthu9vn+Ejtjg=;
 b=bJYw7nXXHBMkGNGONRkGP2EKMePTrCqWLuWOxo4G4whTknUmdZl4rkicR5sNQlOhRA2hso
 HtUr6a3tYxw9PKcHN7PxJ7o1L5ADYvHvImg+39PKqh/1ACotbhK9kXgujuJLqJ66UzKWwy
 9jdwr9VflNvX9baztr/20J4UQ+IzDL4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-3eiT2bs4PraLM4_NHDsqhQ-1; Wed, 22 Feb 2023 10:19:44 -0500
X-MC-Unique: 3eiT2bs4PraLM4_NHDsqhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 706023C16E88;
 Wed, 22 Feb 2023 15:19:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53AABC15BA0;
 Wed, 22 Feb 2023 15:19:43 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:19:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org,
 thuth@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH 05/10] configure: Look for auxiliary Python installations
Message-ID: <Y/YyjEtqwF4qgAYc@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-6-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222143752.466090-6-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Wed, Feb 22, 2023 at 03:37:47PM +0100, Paolo Bonzini wrote:
> From: John Snow <jsnow@redhat.com>
> 
> At the moment, we look for just "python3" and "python", which is good
> enough almost all of the time. But ... if you are on a platform that
> uses an older Python by default and only offers a newer Python as an
> option, you'll have to specify --python=/usr/bin/foo every time.
> 
> We can be kind and instead make a cursory attempt to locate a suitable
> Python binary ourselves, looking for the remaining well-known binaries.
> 
> This configure loop will use whatever is specified in $PYTHON or, if
> empty, will try the following in order:
> 
> 1. python3
> 2. python
> 3. python3.11 down through python3.6
> 
> Notes:
> 
> - Python virtual environment provides binaries for "python3", "python",
>   and whichever version you used to create the venv,
>   e.g. "python3.8". If configure is invoked from inside of a venv, this
>   configure loop will not "break out" of that venv unless that venv is
>   created using an explicitly non-suitable version of Python that we
>   cannot use.
> 
> - In the event that no suitable python is found, the first python found
>   is the version used to generate the human-readable error message.
> 
> - The error message isn't printed right away to allow later
>   configuration code to pick up an explicitly configured python.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 63 ++++++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 46 insertions(+), 17 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


