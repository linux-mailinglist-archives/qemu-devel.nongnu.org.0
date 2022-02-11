Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048464B20DB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:00:42 +0100 (CET)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIRnE-0002j1-UU
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:00:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIRkg-0001AD-3q
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 03:58:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIRkc-0006OM-CK
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 03:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644569875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GzMBEoIzjqi4W7a4sMapgfuvQerF6yEv2JUOL3X2CCY=;
 b=R1O10OodaGSHXMS/z667mp/obqhTuVQFMJgIQgHaTXEY2AjuryX6NfpRODxKmKgrRHhLpN
 nrPwzv4QOb7FxdO7gQiioNCJiFTp8BI9hzOlBTbXFEeJVVTxSOBjkgraADpWLvALhRq7Za
 8M+uC0QMO1q0+cAidCQ/rGnbteMUcQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-J6bZ9UhBNIqK5R3lly6L6g-1; Fri, 11 Feb 2022 03:57:52 -0500
X-MC-Unique: J6bZ9UhBNIqK5R3lly6L6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F92A19251A3;
 Fri, 11 Feb 2022 08:57:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9E14F863;
 Fri, 11 Feb 2022 08:57:49 +0000 (UTC)
Date: Fri, 11 Feb 2022 09:57:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 2/8] tests/qemu-iotests: Improve the check for GNU sed
Message-ID: <YgYlDBG6UGUuGc95@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
 <20220209101530.3442837-3-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220209101530.3442837-3-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.2022 um 11:15 hat Thomas Huth geschrieben:
> Instead of failing the iotests if GNU sed is not available (or skipping
> them completely in the check-block.sh script), it would be better to
> simply skip the bash-based tests, so that the python-based tests could
> still be run. Thus add the check for BusyBox sed to common.rc and mark
> the tests as "not run" if GNU sed is not available. Then we can also
> remove the sed checks from the check-block.sh script.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I agree that skipping bash tests is slightly better than skipping all
tests. And that the skipping should really be done in qemu-iotests
itself and not in a wrapper around it.

But can't we make it even better and skip only bash tests that actually
use sed?

> +# We need GNU sed for the iotests. Make sure to not use BusyBox sed
> +# which says that "This is not GNU sed version 4.0"
>  SED=
>  for sed in sed gsed; do
> -    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
> +    ($sed --version | grep -v "not GNU sed" | grep 'GNU sed') > /dev/null 2>&1
>      if [ "$?" -eq 0 ]; then
>          SED=$sed
>          break
>      fi
>  done
>  if [ -z "$SED" ]; then
> -    echo "$0: GNU sed not found"
> -    exit 1
> +    _notrun "GNU sed not found"
>  fi

Couldn't we just define 'sed' as a function or alias here that skips the
test with _notrun only when it's actually called?

Kevin


