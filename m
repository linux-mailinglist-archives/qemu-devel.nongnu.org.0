Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48484275C52
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 17:47:17 +0200 (CEST)
Received: from localhost ([::1]:34368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL6zD-0000gA-MZ
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 11:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kL6x9-00083j-GU
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 11:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kL6x6-0000Vt-Ts
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 11:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600875902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CB14HFS8M2GvHzNv9lFNPF3MS9ivpNMmy4taBt4pfvI=;
 b=gi1md80vKwrdnWoWeSxOMm/amzI6NLyJnVgSUHyTjzgcV71huiZz5CY2pOMnLY7EzLRB7V
 wDHnyCWYD4jpKRwUq/3n7yRKuqo1Q1xMwZN91vRDpC6QYksVEgT7LaY1gRYEwg1LfvrSzz
 9ivldQMEpwmrsLnaz3uDGhj1F9YRkio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-7iyqBQDTPJGDkwWMhKfgUQ-1; Wed, 23 Sep 2020 11:44:58 -0400
X-MC-Unique: 7iyqBQDTPJGDkwWMhKfgUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97A90800597;
 Wed, 23 Sep 2020 15:44:57 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 431A25C5B0;
 Wed, 23 Sep 2020 15:44:57 +0000 (UTC)
Date: Wed, 23 Sep 2020 11:44:56 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 29/38] qapi/gen.py: delint with pylint
Message-ID: <20200923154456.GQ3312949@habkost.net>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-30-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-30-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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

On Tue, Sep 22, 2020 at 05:00:52PM -0400, John Snow wrote:
> 'fp' and 'fd' are self-evident in context, add them to the list of OK
> names.
> 
> _top and _bottom also need to stay class methods because some users
> override the method and need to use `self`. Tell pylint to shush.

Do you mean "stay instance methods"?

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/gen.py   | 2 ++
>  scripts/qapi/pylintrc | 5 +++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index cf340e66d4..ed498397ad 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -50,9 +50,11 @@ def get_content(self) -> str:
>          return self._top() + self._preamble + self._body + self._bottom()
>  
>      def _top(self) -> str:
> +        # pylint: disable=no-self-use
>          return ''
>  
>      def _bottom(self) -> str:
> +        # pylint: disable=no-self-use
>          return ''
>  
>      def write(self, output_dir: str) -> None:
> diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
> index 7438806096..de132d03cf 100644
> --- a/scripts/qapi/pylintrc
> +++ b/scripts/qapi/pylintrc
> @@ -5,7 +5,6 @@
>  ignore-patterns=doc.py,
>                  error.py,
>                  expr.py,
> -                gen.py,
>                  parser.py,
>                  schema.py,
>                  types.py,
> @@ -46,7 +45,9 @@ good-names=i,
>             k,
>             ex,
>             Run,
> -           _
> +           _,
> +           fp,  # fp = open(...)
> +           fd,  # fd = os.open(...)
>  
>  [VARIABLES]
>  
> -- 
> 2.26.2
> 

-- 
Eduardo


