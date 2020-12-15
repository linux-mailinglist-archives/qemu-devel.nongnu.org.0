Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E32DAC36
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:45:03 +0100 (CET)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8lK-0003dE-5x
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kp8jr-0002sL-NR
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:43:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kp8jp-0007lX-Hm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608032607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=grRYd+D4dJlUc1CCWDI942UCNTszDrZ9qgUkKxMfSaA=;
 b=Dm2fk31v0BVNw8R876NV9EXZ+1TBsas4GI9SLP/sgimVNqDrwMQyjwwJmj1eE0YizFzNqO
 hxyDSNsr5mLapPJrnJa30FQZfoOGKnV2o+xs9PFyaj+p26wt36x99eiGxkHDlS3ApRxEQH
 0mmw5YLJeq9FgIbZM4HysssXjFn8wsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-f6oJ8sznNw2D2IKY3HbbRg-1; Tue, 15 Dec 2020 06:43:24 -0500
X-MC-Unique: f6oJ8sznNw2D2IKY3HbbRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A776801817;
 Tue, 15 Dec 2020 11:43:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48FA16267A;
 Tue, 15 Dec 2020 11:43:22 +0000 (UTC)
Date: Tue, 15 Dec 2020 12:43:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests: Quote $cmd in _send_qemu_cmd
Message-ID: <20201215114320.GB8185@merkur.fritz.box>
References: <20201214175837.301658-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214175837.301658-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.12.2020 um 18:58 hat Max Reitz geschrieben:
> With bash 5.1, the output of the following script (which creates an
> array with a single element, then takes a single-element slice from that
> array, and echos the result) changes:
> 
>   a=("double  space")
>   a=${a[@]:0:1}
>   echo "$a"
> 
> from "double space" to "double  space", i.e. all white space is
> preserved as-is.  This is probably what we actually want here (judging
> from the "...to accommodate pathnames with spaces" comment), but before
> 5.1, we have to quote the ${} slice to get the same behavior.
> 
> In any case, without quoting, the reference output of many iotests is
> different between bash 5.1 and pre-5.1, which is not very good.  We
> should fix it by quoting here, and then adjusting all the reference
> output of all iotests using _send_qemu_cmd accordingly.  (The only
> ones we do not need to change are those that do not have multiple
> consecutive whitespaces in their _send_qemu_cmd parameters.)
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> Alternatively, we could explicitly collapse all whitespace sequences
> into single spaces, but I believe that would defeat the purpose of
> "accomodat[ing] pathnames with spaces".

I agree that quoting is the better alternative.

The whole thing shouldn't be needed if callers propertly quote
filenames. If I understand correctly, these lines just try to merge
back filenames that have been split into multiple words because the
caller wasn't careful. But we can't reliably do that because we don't
know which and how much whitespace was removed.

> I used this script to verify that the git-diff only changes whitespace
> (except for the hunk in common.qemu):
> 
>   https://gist.github.com/XanClic/41cfcc2ac4619421883e8a97790f5c9e

'git diff --word-diff' is good enough for me.

This seems to be based on your branch (312.out doesn't exist yet for
me), so instead of merging, you can just have my:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


