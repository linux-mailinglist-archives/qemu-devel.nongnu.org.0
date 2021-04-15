Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6936031A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 09:17:42 +0200 (CEST)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWwFx-0005Yk-4Z
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 03:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWwEN-00053I-TN
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWwEK-0003uS-Vq
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618470959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Elc4B5iEmKjNXlpyAEfkF5lfrQulQTBtOCWRTPAbP5o=;
 b=CyfdwsoYzuO5LBjE7/2Hn/8/PxtHqtpAfeO1NKiTrhSvrFqIk12ILiyAbU4u1tjX3fuywt
 tKSIe/B8L4OwTZbs+9N9aALmrpsEYyaKRfGrqQb076pfqg+8g6og8GdJB2wlzrQPaCdJHA
 B7E7ZFrJLHC/LJwCUtOpHshAb6GY+sY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-mub9RWQHOU6_CRg7omQC9g-1; Thu, 15 Apr 2021 03:15:55 -0400
X-MC-Unique: mub9RWQHOU6_CRg7omQC9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BECF883DD20;
 Thu, 15 Apr 2021 07:15:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7692E5D71F;
 Thu, 15 Apr 2021 07:15:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F2187113525D; Thu, 15 Apr 2021 09:15:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 7/8] qapi/error: Add type hints
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-8-jsnow@redhat.com>
Date: Thu, 15 Apr 2021 09:15:52 +0200
In-Reply-To: <20210330171844.1197918-8-jsnow@redhat.com> (John Snow's message
 of "Tue, 30 Mar 2021 13:18:43 -0400")
Message-ID: <877dl4ggrb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> No functional change.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/error.py | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
> index 2183b8c6b7..6ba54821c9 100644
> --- a/scripts/qapi/error.py
> +++ b/scripts/qapi/error.py
> @@ -11,6 +11,10 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.
>  # See the COPYING file in the top-level directory.
>  
> +from typing import Optional
> +
> +from .source import QAPISourceInfo
> +
>  
>  class QAPIError(Exception):
>      """Base class for all exceptions from the QAPI package."""
> @@ -18,13 +22,16 @@ class QAPIError(Exception):
>  
>  class QAPISourceError(QAPIError):
>      """Error class for all exceptions identifying a source location."""
> -    def __init__(self, info, msg, col=None):
> +    def __init__(self,
> +                 info: Optional[QAPISourceInfo],

The Optional is a bit surprising.  Mind pointing to the / a reason in
the commit message?

> +                 msg: str,
> +                 col: Optional[int] = None):
>          super().__init__()
>          self.info = info
>          self.msg = msg
>          self.col = col
>  
> -    def __str__(self):
> +    def __str__(self) -> str:
>          assert self.info is not None
>          loc = str(self.info)
>          if self.col is not None:


