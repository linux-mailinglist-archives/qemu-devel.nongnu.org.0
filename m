Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C72C5BF0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 19:24:16 +0100 (CET)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLwF-0004Lp-HV
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 13:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kiLuy-0003ur-Qf
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 13:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kiLuw-0008F7-FN
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 13:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606414972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9BUsFBpPcsatRcg1MOdg2GbAZEELj7c4LvoGQFO0iaE=;
 b=YCb5m2KnM/6UZBkmCLRNrRhLXr6UPuCkTxDDov4Y/b8Dmbiin01Al9e5KyfzoiLsRjNysG
 IdNHeDEd8i0LWCcNn8gfd1qjVAUyRye9utmdXAgjJ8NeAHlDtx5gl8sWxeTJ/j+Y0rIlKQ
 R8r47knqdub47eZ9vjw2x75vn8aq3Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-l1sxIunkM2-FhAIxHOaTfQ-1; Thu, 26 Nov 2020 13:22:50 -0500
X-MC-Unique: l1sxIunkM2-FhAIxHOaTfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 463D310051CC;
 Thu, 26 Nov 2020 18:22:49 +0000 (UTC)
Received: from gondolin (ovpn-113-125.ams2.redhat.com [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D7D160855;
 Thu, 26 Nov 2020 18:22:48 +0000 (UTC)
Date: Thu, 26 Nov 2020 19:22:45 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-6.0] qga/commands-posix: Send CCW address on s390x
 with the fsinfo data
Message-ID: <20201126192245.7c09fd06.cohuck@redhat.com>
In-Reply-To: <20201125105417.380317-1-thuth@redhat.com>
References: <20201125105417.380317-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Nov 2020 11:54:17 +0100
Thomas Huth <thuth@redhat.com> wrote:

> We need the CCW address on the libvirt side to correctly identify
> the disk, so add this information to the GuestDiskAddress on s390x.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1755075
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qga/commands-posix.c | 34 ++++++++++++++++++++++++++++++++++
>  qga/qapi-schema.json | 19 ++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 

(...)

> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 3b3d1d0bd9..8be84b56e9 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -846,6 +846,21 @@
>    'data': {'domain': 'int', 'bus': 'int',
>             'slot': 'int', 'function': 'int'} }
>  
> +##
> +# @GuestCCWAddress:
> +#
> +# @cssid: channel subsystem image id
> +# @ssid: subchannel set id

You're missing subchno here.

> +# @devno:  device number
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'GuestCCWAddress',
> +  'data': {'cssid': 'int',
> +           'ssid': 'int',
> +           'subchno': 'int',
> +           'devno': 'int'} }
> +
>  ##
>  # @GuestDiskAddress:
>  #

(...)

Otherwise LGTM.


