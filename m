Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8897E274C76
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:51:24 +0200 (CEST)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKr87-00018Y-Je
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKr1Y-0001Z9-LN
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKr1V-0000AV-V9
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dv5S/RuLSXx/cX64hVORvnV/0WKZGi8KJd1obKvKHEo=;
 b=QOfmr4lfQCUQ8CSv+z79GD3nKMJuAeUZxSeHTIDbmfFvViCUF/m1MHGR6eFMq+UtRGyggJ
 cSu2oMgTGmApxkCdnCQvIWaLVhNsjgDF/t+zAUGBAwAdbRhdx6Az0l4psvvml0JYJuB1pe
 LvLSH/ABEFjFCBa53XB++vV831OC8g4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430--a0E_8fMM46CALJ31MIGuw-1; Tue, 22 Sep 2020 18:44:30 -0400
X-MC-Unique: -a0E_8fMM46CALJ31MIGuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C18E81CBE9;
 Tue, 22 Sep 2020 22:44:29 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F087C2C31E;
 Tue, 22 Sep 2020 22:44:28 +0000 (UTC)
Date: Tue, 22 Sep 2020 18:44:28 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 13/38] qapi/common.py: add type hint annotations
Message-ID: <20200922224428.GN2044576@habkost.net>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-14-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-14-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 22, 2020 at 05:00:36PM -0400, John Snow wrote:
> Annotations do not change runtime behavior.
> This commit *only* adds annotations.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/common.py | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 682e74fe65..0ce4a107e6 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -12,6 +12,7 @@
[...]
> @@ -176,7 +179,7 @@ def gen_if(ifcond):
>      return ret
>  
>  
> -def gen_endif(ifcond):
> +def gen_endif(ifcond: Sequence[str]) -> str:

Does this need to require a Sequence?  It looks like it could be
Iterable.

I don't think this should block the patch, though, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>


>      ret = ''
>      for ifc in reversed(ifcond):
>          ret += mcgen('''
> @@ -185,7 +188,9 @@ def gen_endif(ifcond):
>      return ret
>  
>  
> -def build_params(arg_type, boxed, extra=None):
> +def build_params(arg_type,
> +                 boxed: bool,
> +                 extra: Optional[str] = None) -> str:
>      ret = ''
>      sep = ''
>      if boxed:
> -- 
> 2.26.2
> 

-- 
Eduardo


