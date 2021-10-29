Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4820243FD28
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 15:10:58 +0200 (CEST)
Received: from localhost ([::1]:55700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgReq-00036d-LI
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgRcD-0001Wk-PN
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:08:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgRc7-0005iW-P6
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635512883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zm7ow0FbJrMgnTZt8gNY0oX2T8BCBPiWwTYqBhVUfTo=;
 b=AhLcJZND257bi2kHUJq6rYM1tX9mIOnQOlgizhBcsCON++tPZ+eUiIL6Wn1anFyt7llQ/g
 slkcpMsPEEdNAqF9B59ORBC/H+FilOewDgNkNvnNQ5irVME2+IT/p8bZ+FAp6FVYGIXmEH
 ZNttLS/UnFtWjZ1ahG1foCqmDU8exjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-xEy0iWMuNxm525QrxdLsiQ-1; Fri, 29 Oct 2021 09:07:57 -0400
X-MC-Unique: xEy0iWMuNxm525QrxdLsiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4073A91286;
 Fri, 29 Oct 2021 13:07:56 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7239419C59;
 Fri, 29 Oct 2021 13:07:18 +0000 (UTC)
Date: Fri, 29 Oct 2021 08:07:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/9] qapi: Mark unstable QMP parts with feature 'unstable'
Message-ID: <20211029130717.fy3t5qqvy5u3iphg@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211025052532.3859634-3-armbru@redhat.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 07:25:25AM +0200, Markus Armbruster wrote:
> Add special feature 'unstable' everywhere the name starts with 'x-',
> except for InputBarrierProperties member x-origin and
> MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,
> because these two are actually stable.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> @@ -2495,27 +2508,57 @@
>  #
>  # Properties for throttle-group objects.
>  #
> -# The options starting with x- are aliases for the same key without x- in
> -# the @limits object. As indicated by the x- prefix, this is not a stable
> -# interface and may be removed or changed incompatibly in the future. Use
> -# @limits for a supported stable interface.
> -#
>  # @limits: limits to apply for this throttle group
>  #
> +# Features:
> +# @unstable: All members starting with x- are aliases for the same key
> +#            without x- in the @limits object.  This is not a stable
> +#            interface and may be removed or changed incompatibly in
> +#            the future.  Use @limits for a supported stable
> +#            interface.
> +#
>  # Since: 2.11
>  ##
>  { 'struct': 'ThrottleGroupProperties',
>    'data': { '*limits': 'ThrottleLimits',
> -            '*x-iops-total' : 'int', '*x-iops-total-max' : 'int',

> +            '*x-iops-total': { 'type': 'int',
> +                               'features': [ 'unstable' ] },

This struct has been around since 381bd74 (v6.0); but was not listed
as deprecated at the time.  Do we still need it in 6.2, or have we
gone enough release cycles with the saner naming without x- that we
could drop this?  But that is a question independent of this patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


