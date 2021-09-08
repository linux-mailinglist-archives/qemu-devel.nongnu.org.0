Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E906403EBA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 19:57:06 +0200 (CEST)
Received: from localhost ([::1]:50884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO1om-0006DM-S2
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 13:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mO1nV-0004mh-Ee
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 13:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mO1nS-0003qB-J0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 13:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631123741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCmN9kUWaPVDUKO2RSVmvDjIGWte1IDieKchhcs1suo=;
 b=JAYLX3GcQ9WSxTEo1SAu/99SPSraADZctKt6lG+coCAnDg+ODRb6gXuP9fCwf0MdwbUWW5
 KcUpKvjYDOOTEDm2Y8gpeulUug+9pUiHzuhnxtMx1Wl7yZ2k4WCJrjbI5vI5mYB++2cql6
 bvha8GF1+iXN1RFoOmQ0U/cSgmk69qU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-voGy2eG3PtSA4-Aqup-50Q-1; Wed, 08 Sep 2021 13:55:38 -0400
X-MC-Unique: voGy2eG3PtSA4-Aqup-50Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 442B7801E72;
 Wed,  8 Sep 2021 17:55:36 +0000 (UTC)
Received: from redhat.com (ovpn-113-24.phx2.redhat.com [10.3.113.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FA6760C7F;
 Wed,  8 Sep 2021 17:55:34 +0000 (UTC)
Date: Wed, 8 Sep 2021 12:55:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh.ext@zeiss.com>
Subject: Re: [PATCH] vmdk: allow specification of tools version
Message-ID: <20210908175436.7xnongfo7st42ixb@redhat.com>
References: <20210908174250.12946-1-thomas.weissschuh.ext@zeiss.com>
MIME-Version: 1.0
In-Reply-To: <20210908174250.12946-1-thomas.weissschuh.ext@zeiss.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, thomas@t-8ch.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 07:42:50PM +0200, Thomas Weißschuh wrote:
> VMDK files support an attribute that represents the version of the guest
> tools that are installed on the disk.
> This attribute is used by vSphere before a machine has been started to
> determine if the VM has the guest tools installed.
> This is important when configuring "Operating system customizations" in
> vSphere, as it checks for the presence of the guest tools before
> allowing those customizations.
> Thus when the VM has not yet booted normally it would be impossible to
> customize it, therefore preventing a customized first-boot.
> 
> The attribute should not hurt on disks that do not have the guest tools
> installed and indeed the VMware tools also unconditionally add this
> attribute.
> (Defaulting to the value "2147483647", as is done in this patch)
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh.ext@zeiss.com>
> ---
>  block/vmdk.c         | 24 ++++++++++++++++++++----
>  qapi/block-core.json |  2 ++
>  2 files changed, 22 insertions(+), 4 deletions(-)

UI review:

> +++ b/qapi/block-core.json
> @@ -4597,6 +4597,7 @@
>  # @adapter-type: The adapter type used to fill in the descriptor. Default: ide.
>  # @hwversion: Hardware version. The meaningful options are "4" or "6".
>  #             Default: "4".
> +# @toolsversion: VMware guest tools version.

Missing a '(since 6.2)' blurb, and a description of its default value.

>  # @zeroed-grain: Whether to enable zeroed-grain feature for sparse subformats.
>  #                Default: false.
>  #
> @@ -4610,6 +4611,7 @@
>              '*backing-file':    'str',
>              '*adapter-type':    'BlockdevVmdkAdapterType',
>              '*hwversion':       'str',
> +            '*toolsversion':    'str',

Is it an arbitrary string, or must a valid value always be parseable
as a numeric value?  If the latter, then make the QMP representation
numeric rather than string.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


