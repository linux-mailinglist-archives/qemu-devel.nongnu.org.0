Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA53BE66E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:38:36 +0200 (CEST)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14wt-0006Ix-P5
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m14vz-0004sO-C8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m14vw-0000nN-An
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625654254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eHGbyNtsw80y5fl6q2AI6FG3wZXkmsRFcS4nkMFbcyU=;
 b=NVxo+EV4pV+/ugB04NaXy3ZEPLiu5uw5xJIkcVjypd9X+861ip9WalkO8nWsG3KAkkEi+a
 +yfP33CbIJvflCotdjgnVPOh+P0Id2P4PCn8eV9AIUIvgJ+jBCdCUgF9+NWvHLu0gN/7Qv
 aWkR/JH3V6hX+T+w7hV7L+9O5+npBXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-rOC3gDFhN0aHdTX0o5SKKQ-1; Wed, 07 Jul 2021 06:37:33 -0400
X-MC-Unique: rOC3gDFhN0aHdTX0o5SKKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B20985074B;
 Wed,  7 Jul 2021 10:37:32 +0000 (UTC)
Received: from redhat.com (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E216B5D9D3;
 Wed,  7 Jul 2021 10:37:31 +0000 (UTC)
Date: Wed, 7 Jul 2021 12:37:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 2/6] export/fuse: Add allow-other option
Message-ID: <YOWD6rMgVC4Sh3Lf@redhat.com>
References: <20210625142317.271673-1-mreitz@redhat.com>
 <20210625142317.271673-3-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210625142317.271673-3-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 25.06.2021 um 16:23 hat Max Reitz geschrieben:
> Without the allow_other mount option, no user (not even root) but the
> one who started qemu/the storage daemon can access the export.  Allow
> users to configure the export such that such accesses are possible.
> 
> While allow_other is probably what users want, we cannot make it an
> unconditional default, because passing it is only possible (for non-root
> users) if the global fuse.conf configuration file allows it.  Thus, the
> default is an 'auto' mode, in which we first try with allow_other, and
> then fall back to without.
> 
> FuseExport.allow_other reports whether allow_other was actually used as
> a mount option or not.  Currently, this information is not used, but a
> future patch will let this field decide whether e.g. an export's UID and
> GID can be changed through chmod.
> 
> One notable thing about 'auto' mode is that libfuse may print error
> messages directly to stderr, and so may fusermount (which it executes).
> Our export code cannot really filter or hide them.  Therefore, if 'auto'
> fails its first attempt and has to fall back, fusermount will print an
> error message that mounting with allow_other failed.
> 
> This behavior necessitates a change to iotest 308, namely we need to
> filter out this error message (because if the first attempt at mounting
> with allow_other succeeds, there will be no such message).
> 
> Furthermore, common.rc's _make_test_img should use allow-other=off for
> FUSE exports, because iotests generally do not need to access images
> from other users, so allow-other=on or allow-other=auto have no
> advantage.  OTOH, allow-other=on will not work on systems where
> user_allow_other is disabled, and with allow-other=auto, we get said
> error message that we would need to filter out again.  Just disabling
> allow-other is simplest.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  qapi/block-export.json       | 33 ++++++++++++++++++++++++++++++++-
>  block/export/fuse.c          | 28 +++++++++++++++++++++++-----
>  tests/qemu-iotests/308       |  6 +++++-
>  tests/qemu-iotests/common.rc |  6 +++++-
>  4 files changed, 65 insertions(+), 8 deletions(-)
> 
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index e819e70cac..0ed63442a8 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -120,6 +120,23 @@
>  	    '*logical-block-size': 'size',
>              '*num-queues': 'uint16'} }
>  
> +##
> +# @FuseExportAllowOther:
> +#
> +# Possible allow_other modes for FUSE exports.
> +#
> +# @off: Do not pass allow_other as a mount option.
> +#
> +# @on: Pass allow_other as a mount option.
> +#
> +# @auto: Try mounting with allow_other first, and if that fails, retry
> +#        without allow_other.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'FuseExportAllowOther',
> +  'data': ['off', 'on', 'auto'] }

Why not use the generic OnOffAuto type from common.json?

But since the external interface is unaffected so we can later change
this as a code cleanup and soft freeze is approaching, I won't consider
this a blocker.

Kevin


