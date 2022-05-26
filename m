Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76028534B0A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 09:59:24 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu8Ox-0001hR-I3
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 03:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nu8KK-0000Xi-El
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nu8KH-00044e-GI
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653551671;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uUt4l6xqNvJrnqyxlbAwCUDa8LK69wN6eOtfGPqzXGM=;
 b=bMXTzDw4vQO49N9r/fbTPbiAQZ5VSfMrIregfjDO310gaDZmOWOnItZXVfHTAfMDINoELj
 QOURPCiTAvoIpf1TyrbiXa057dFZVmDmthUqa4wOsxF6o+KKgpEsltZX6ulZjipPDB5KKF
 IVM0hJn9L9oEEzSRIbNWQtIbl37wxSI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-_ZQYRs9EO7i8cAqESn-CNA-1; Thu, 26 May 2022 03:54:30 -0400
X-MC-Unique: _ZQYRs9EO7i8cAqESn-CNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E74801E6B;
 Thu, 26 May 2022 07:54:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D584240CFD0B;
 Thu, 26 May 2022 07:54:28 +0000 (UTC)
Date: Thu, 26 May 2022 08:54:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] iotests: fix source directory location
Message-ID: <Yo8yMoNjKsjZROQK@redhat.com>
References: <20220526002512.1585246-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220526002512.1585246-1-jsnow@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 25, 2022 at 08:25:12PM -0400, John Snow wrote:
> If you invoke the check script from outside of the tests/qemu-iotests
> directory, the directories initialized as source_iotests and
> build_iotests will be incorrect.
> 
> We can use the location of the source file itself to be more accurate.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/qemu-iotests/testenv.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index a864c74b123..9b0f01e84db 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -217,10 +217,10 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>              self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
>          else:
>              # called from the source tree
> -            self.source_iotests = os.getcwd()
> +            self.source_iotests = str(Path(__file__, '..').resolve())

Path(__file__).parent

>              self.build_iotests = self.source_iotests
>  
> -        self.build_root = os.path.join(self.build_iotests, '..', '..')
> +        self.build_root = str(Path(self.build_iotests, '../..').resolve())

Path(self.build_iotests).parent.parent

to be portable

>  
>          self.init_directories()
>          self.init_binaries()
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


