Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D4476F28
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:51:32 +0100 (CET)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoMF-0005pZ-BI
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:51:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxoJy-0003ra-8d
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxoJo-0003YS-TJ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639651740;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EK1z5QQ8n/M+3YXGKYQXzL/UsUXXMQ3V/mXGott8c+Y=;
 b=QugQG7vj5YTVglER6bRxFn3gYBo/3tvT7NT50idvPkcMz+2dOvUNEE3XJIe3M3MzgAsrx2
 dhD1KcUVI+68QPButUpBJL2Ty3dmseXbeFk10IVIJ76DqMUILr+hfNFSthJdEbqj2kODnt
 Dxn6sst1P+T1oIaZFljtywu0GiONOEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-6wZt5nnoNoSfVLQdfn_vxA-1; Thu, 16 Dec 2021 05:48:53 -0500
X-MC-Unique: 6wZt5nnoNoSfVLQdfn_vxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02E0F1019983;
 Thu, 16 Dec 2021 10:48:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A1D67E650;
 Thu, 16 Dec 2021 10:48:29 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:48:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [RFC qemu.qmp PATCH 17/24] Makefile: add build and publish targets
Message-ID: <YbsZe9A/Lf2g1Xk8@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <20211215210634.3779791-18-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215210634.3779791-18-jsnow@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 04:06:27PM -0500, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  Makefile | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 97d737a..81bfca8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -110,3 +110,35 @@ distclean: clean
>  	rm -f .coverage .coverage.*
>  	rm -rf htmlcov/
>  	rm -rf test-results/
> +
> +.PHONY: pristine
> +pristine:
> +	@git diff-files --quiet --ignore-submodules -- || \
> +		(echo "You have unstaged changes."; exit 1)
> +	@git diff-index --cached --quiet HEAD --ignore-submodules -- || \
> +		(echo "Your index contains uncommitted changes."; exit 1)
> +	@[ -z "$(shell git ls-files -o)" ] || \
> +		(echo "You have untracked files: $(shell git ls-files -o)"; exit 1)
> +
> +dist: setup.cfg setup.py Makefile README.rst
> +	python3 -m build
> +	@touch dist
> +
> +.PHONY: pre-publish
> +pre-publish: pristine dist
> +	@git describe --exact-match 2>/dev/null || \
> +		(echo -e "\033[0;31mThere is no annotated tag for this commit.\033[0m"; exit 1)
> +	python3 -m twine check --strict dist/*
> +	git push -v --atomic --follow-tags --dry-run
> +
> +.PHONY: publish
> +publish: pre-publish
> +	# Set the username via TWINE_USERNAME.
> +	# Set the password via TWINE_PASSWORD.
> +	# Set the pkg repository via TWINE_REPOSITORY.
> +	python3 -m twine upload --verbose dist/*
> +	git push -v --atomic --follow-tags
> +
> +.PHONY: publish-test
> +publish-test: pre-publish
> +	python3 -m twine upload --verbose -r testpypi dist/*

It doesn't feel very pythonic to have a makefile in the project.

If we want some helpers for publishing releases, I would have
expected to see a python script  eg scripts/publish.py 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


