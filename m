Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5632B18A7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:51:04 +0100 (CET)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVjT-0004ml-Mi
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdViX-0003lg-96
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdViU-0002LQ-8X
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605261001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ilPCvmy3xOThJzQXSnihCMKADlGAlZTzySAKyMKkkjc=;
 b=QCXbTpg7lHV/eoCirdOJSgFVka4KxSg3mn6jBoPXeLVn6ovi3s+F0mO225rdQVBXIcGtNf
 x/7TzilVp1/KWG1cq5ED1RTmc599kZp2RDWkspPQHiS+gji5pp1TSHqJZerfTLhQKB7Ewm
 cf72d7nkEeDZseJWBWHHVfQJw5ktfbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-E7WQMbQ8OvWZNXrguuJMfA-1; Fri, 13 Nov 2020 04:49:59 -0500
X-MC-Unique: E7WQMbQ8OvWZNXrguuJMfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EDD1100960C;
 Fri, 13 Nov 2020 09:49:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE3B5B4D8;
 Fri, 13 Nov 2020 09:49:57 +0000 (UTC)
Date: Fri, 13 Nov 2020 10:49:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] docs: Better mention of qemu-img amend limitations
Message-ID: <20201113094956.GC5834@merkur.fritz.box>
References: <20200923203719.732958-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200923203719.732958-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 23.09.2020 um 22:37 hat Eric Blake geschrieben:
> Missed during merge resolution of commit bc5ee6da71.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/tools/qemu-img.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index c35bd6482203..2b5891b54db7 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -265,6 +265,10 @@ Command description:

Adding a little more context:

>    The set of options that can be amended are dependent on the image
>    format, but note that amending the backing chain relationship should
>    instead be performed with ``qemu-img rebase``.
>
>    --force allows some unsafe operations. Currently for -f luks, it allows to
>    erase the last encryption key, and to overwrite an active encryption key.
> 
> +  The set of options that can be amended are dependent on the image
> +  format, but note that amending the backing chain relationship should
> +  instead be performed with ``qemu-img rebase``.
> +

I think the problem is your local conflict resolution. This patch would
duplicate the paragraph.

Kevin


