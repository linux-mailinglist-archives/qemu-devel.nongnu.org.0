Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E882514F7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 11:07:01 +0200 (CEST)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAUuy-0007O8-MC
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 05:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAUto-0006Tz-4f
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 05:05:51 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29563
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAUtm-0004NA-E5
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 05:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598346345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CSMTvranX7RTqidCNcIhsZyNSOoF8+8EiD0SLzmHw0Y=;
 b=B3Zo6qcUt+6SeOQ2MlcqAK+YdUJKsKl0jNOw7GKuJsGoSlmeeMQjbqezgLkAvOAtA/G5Vf
 9CyiIsZ/v70ppUrFsdL2bz65TX11oghY5HrEjHEDuVN5ttjvfL9FD0UWreYYipcO5okPsH
 cp56gDW8eWs33G6F4rqzDWe955zEDgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-fKvGNiBTPieu2WCIecs4Rw-1; Tue, 25 Aug 2020 05:05:43 -0400
X-MC-Unique: fKvGNiBTPieu2WCIecs4Rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F7B0801AF2;
 Tue, 25 Aug 2020 09:05:42 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 149A65C1CF;
 Tue, 25 Aug 2020 09:05:40 +0000 (UTC)
Date: Tue, 25 Aug 2020 10:05:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: luoyonggang@gmail.com
Subject: Re: [PATCH 1/5] meson: SIMPLE_PATH_RE should match the full path
 token. Or the $ and : contained in path would not matched. if the path are
 start with C:/ and E:/
Message-ID: <20200825090537.GF107278@redhat.com>
References: <20200825083500.359-1-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200825083500.359-1-luoyonggang@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit message subject is waaaaay  too long. Put the explanation into
commit message body, not the subject line.

On Tue, Aug 25, 2020 at 04:34:56PM +0800, luoyonggang@gmail.com wrote:
> From: Yonggang Luo <luoyonggang@gmail.com>
> 
> ---
>  scripts/ninjatool.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/ninjatool.py b/scripts/ninjatool.py
> index cc77d51aa8..6ca8be6f10 100755
> --- a/scripts/ninjatool.py
> +++ b/scripts/ninjatool.py
> @@ -55,7 +55,7 @@ else:
>  
>  PATH_RE = r"[^$\s:|]+|\$[$ :]|\$[a-zA-Z0-9_-]+|\$\{[a-zA-Z0-9_.-]+\}"
>  
> -SIMPLE_PATH_RE = re.compile(r"[^$\s:|]+")
> +SIMPLE_PATH_RE = re.compile(r"^[^$\s:|]+$")
>  IDENT_RE = re.compile(r"[a-zA-Z0-9_.-]+$")
>  STRING_RE = re.compile(r"(" + PATH_RE + r"|[\s:|])(?:\r?\n)?|.")
>  TOPLEVEL_RE = re.compile(r"([=:#]|\|\|?|^ +|(?:" + PATH_RE + r")+)\s*|.")
> -- 
> 2.27.0.windows.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


