Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE77350DE6C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 13:04:18 +0200 (CEST)
Received: from localhost ([::1]:47202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwVt-0003i9-OB
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 07:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niwSN-0001g0-50
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 07:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niwSL-00026N-BR
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 07:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650884435;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kkxdzNHce6lNk+ubSNsTxK0sN/Gsra5ai2R337GJkRc=;
 b=AUF1W0D9NnpSTNCkupjGpDy2MCzJfjbg2Q1x8CkJWn4fo6Jade6/DIbzLKl8o374Rv35O1
 zW9CfTzOvVN6kQnohpRizKEqIK3LvfsWOcZ7KGtCDNEfzssNwZ1azScyUJDglqeJRVvRvQ
 W0eI90nwW61cEWqj4Pd7E+Wj8pNwemQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-xRANUisZNlOvqTN0FUvdjw-1; Mon, 25 Apr 2022 07:00:34 -0400
X-MC-Unique: xRANUisZNlOvqTN0FUvdjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E3C2185A7B2
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 11:00:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49ECF111F3C7;
 Mon, 25 Apr 2022 11:00:33 +0000 (UTC)
Date: Mon, 25 Apr 2022 12:00:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 09/12] add LGPLv2+ and GPLv2 LICENSE files
Message-ID: <YmZ/T2UHeRTJuRmX@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-10-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422184940.1763958-10-jsnow@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:37PM -0400, John Snow wrote:
> This clarifies that the majority of this package is LGPLv2+. Copyright
> blurbs that pointed to QEMU's "COPYING" file are amended to point to
> this repository's "LICENSE" file instead.
> 
> The only file that is not already licensed as LGPLv2+ is legacy.py,
> which is GPLv2 only. Amend the copyright blurb there to point to
> LICENSE_GPL2, which is a copy of qemu.git's COPYING file.
> 
> legacy.py is scheduled for removal, at which point the license of this
> library will become exclusively LGPLv2+. As the package currently
> contains a mixture of LGPLv2+ and GPLv2 code, the trove classifiers will
> reflect this mixture until such time as the remaining GPLv2 code is
> removed.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  FILES.rst             |   3 +
>  LICENSE               | 481 ++++++++++++++++++++++++++++++++++++++++++
>  LICENSE_GPL2          | 339 +++++++++++++++++++++++++++++
>  qemu/qmp/__init__.py  |   2 +-
>  qemu/qmp/legacy.py    |   2 +-
>  qemu/qmp/qmp_shell.py |   2 +-
>  qemu/qmp/qmp_tui.py   |   2 +-
>  setup.cfg             |   1 +
>  8 files changed, 828 insertions(+), 4 deletions(-)
>  create mode 100644 LICENSE
>  create mode 100644 LICENSE_GPL2

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


