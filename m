Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215844D64B1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 16:32:24 +0100 (CET)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nShFf-0001wm-3t
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 10:32:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nShDM-00009z-6w
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nShDJ-0005q4-DJ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647012596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EyJBWm2juXnsisYHXl5eZy52R5B3GnKx16px6W8YwQ=;
 b=eB9bGWcuIlG5yOYbmv08MhVDohJ7y/o8MFX9ZtMt6tZ7DqeQWdIO1LCFdmwJ1umLIi6VNw
 b75VOn90oiT1/zOiK6P0WM6UsZdoYoOHSRhSFGSB8mKZYFQDOcAEMpdhJKH5oJOWak8J1o
 lwlbuOPK/DWE8+FfxiSDArHteh6iLlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-Tf-YFeVcPmWYpZly0d9NXA-1; Fri, 11 Mar 2022 10:29:55 -0500
X-MC-Unique: Tf-YFeVcPmWYpZly0d9NXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B7E3801AB2;
 Fri, 11 Mar 2022 15:29:54 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35AF0837A2;
 Fri, 11 Mar 2022 15:29:52 +0000 (UTC)
Date: Fri, 11 Mar 2022 16:29:50 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] docs/devel: try and impose some organisation
Message-ID: <Yitq7nYwYupm9GtV@paraplu>
References: <20220309135355.4149689-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220309135355.4149689-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 01:53:55PM +0000, Alex Bennée wrote:
> We have a growing set of developer docs but the index is currently in
> order of when stuff was added. Try and make things a bit easier to
> find my adding sub indexes and organising into themes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/index-api.rst       | 15 +++++++++++
>  docs/devel/index-build.rst     | 20 +++++++++++++++
>  docs/devel/index-internals.rst | 22 ++++++++++++++++
>  docs/devel/index-process.rst   | 18 +++++++++++++
>  docs/devel/index-tcg.rst       | 17 +++++++++++++
>  docs/devel/index.rst           | 46 ++++++----------------------------
>  6 files changed, 99 insertions(+), 39 deletions(-)
>  create mode 100644 docs/devel/index-api.rst
>  create mode 100644 docs/devel/index-build.rst
>  create mode 100644 docs/devel/index-internals.rst
>  create mode 100644 docs/devel/index-process.rst
>  create mode 100644 docs/devel/index-tcg.rst

Yeah, the sub-indexes idea looks good to me.  It's good to start this
before it gets out of hand :-)

As discussed on IRC, there seems to be some whitespace damage:

    $> git describe
    v6.2.0-2381-g034e818c93
    
    $>  ~/Mail/patch-temp/cur/1647009097.180136_1.paraplu\:2\,S
    Applying: docs/devel: try and impose some organisation
    .git/rebase-apply/patch:61: trailing whitespace.
          
    .git/rebase-apply/patch:89: trailing whitespace.
          
    .git/rebase-apply/patch:113: trailing whitespace.
          
    .git/rebase-apply/patch:136: trailing whitespace.
          
    .git/rebase-apply/patch:61: new blank line at EOF.
    +
    warning: squelched 3 whitespace errors
    warning: 8 lines add whitespace errors.

FWIW:

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

[...]

-- 
/kashyap


