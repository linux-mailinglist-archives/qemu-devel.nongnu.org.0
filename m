Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995E4B7AF7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 00:01:33 +0100 (CET)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6p8-0005nv-Ou
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 18:01:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6mg-000502-45
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:58:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6me-0005j7-CW
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644965935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5yO1sRlpEOOCDri5DI7dWCwAG9fPVPIrtrsowdI3AY=;
 b=CtvV92VWy7Rcrqr1Itb84NzxwxXKAazXJk4ouG/DWjhKfOTJ3X9VPQOxDhVInhp5kgSFwn
 3KQEAfMkc5Gfjo3d7jgQEPL9JTYUYP8XfUYknqFbMWm7zmQFpUjDZ2Ax+eQ0WAtwLyeUfy
 4tgf+1BwHSESLI1RdyGdPh7pTtwpk/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-EUB9nmSSOLmQJ9F-PZ8Jrg-1; Tue, 15 Feb 2022 17:58:47 -0500
X-MC-Unique: EUB9nmSSOLmQJ9F-PZ8Jrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E681853026;
 Tue, 15 Feb 2022 22:58:46 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB9E519B9;
 Tue, 15 Feb 2022 22:58:19 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:58:18 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/4] iotests: add VerboseProcessError
Message-ID: <20220215225818.stzmm2ui2yp345v6@redhat.com>
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215220853.4179173-3-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 05:08:51PM -0500, John Snow wrote:
> This adds an Exception that extends the garden variety
> subprocess.CalledProcessError. When this exception is raised, it will
> still be caught when selecting for the stdlib variant.
> 
> The difference is that the str() method of this Exception also adds the
> stdout/stderr logs. In effect, if this exception goes unhandled, Python
> will print the output in a nice, highlighted box to the terminal so that
> it's easy to spot.
> 
> This should save some headache from having to re-run test suites with
> debugging enabled if we augment the exceptions we print more information

This didn't parse well for me.  Maybe
s/enabled/enabled,/ s/print more/print with more/

> in the default case.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>

Otherwise seems useful.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


