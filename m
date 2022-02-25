Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37314C497D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:47:42 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcon-0002F9-2a
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:47:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNckS-0007j0-JW
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNckN-0003Kf-GV
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645803784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aE4If9q8SxDZs4O44eFsleXuK1TdMvrsXamthLuATPU=;
 b=SScuZg6HtrVELiZxtlhJjkM+MW2PQlAI5IsISkX/yMuJ1f1Faiqek/XpPWSY4AmlI0rWq8
 +ZH2J+gdQyuCGvChXunCf47JJPBJAbmEvjoKLQ/LmIjW0BD21spKMSEMokAQR+TE8uUyfd
 ojGg5hc0wO1AWfvtyE6mpaHzaycD/FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-9W-PsEynNJWAanEinwakug-1; Fri, 25 Feb 2022 10:42:52 -0500
X-MC-Unique: 9W-PsEynNJWAanEinwakug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CECC8031E1;
 Fri, 25 Feb 2022 15:42:50 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53455865AB;
 Fri, 25 Feb 2022 15:42:09 +0000 (UTC)
Date: Fri, 25 Feb 2022 09:42:07 -0600
From: Eric Blake <eblake@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 07/19] vfio-user: define vfio-user-server object
Message-ID: <20220225154207.5bcqwzagmoirnczh@redhat.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <309a6afc6f47d7e812a6f18ce591dff092efbb06.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <309a6afc6f47d7e812a6f18ce591dff092efbb06.1645079934.git.jag.raman@oracle.com>
User-Agent: NeoMutt/20211029-364-42e4ad
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, dgilbert@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 02:48:54AM -0500, Jagannathan Raman wrote:
> Define vfio-user object which is remote process server for QEMU. Setup
> object initialization functions and properties necessary to instantiate
> the object
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  qapi/qom.json             |  20 +++-
>  hw/remote/vfio-user-obj.c | 194 ++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS               |   1 +
>  hw/remote/meson.build     |   1 +
>  hw/remote/trace-events    |   3 +
>  5 files changed, 217 insertions(+), 2 deletions(-)
>  create mode 100644 hw/remote/vfio-user-obj.c
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index eeb5395ff3..ff266e4732 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -703,6 +703,20 @@
>  { 'struct': 'RemoteObjectProperties',
>    'data': { 'fd': 'str', 'devid': 'str' } }
>  
> +##
> +# @VfioUserServerProperties:
> +#
> +# Properties for x-vfio-user-server objects.
> +#
> +# @socket: socket to be used by the libvfiouser library
> +#
> +# @device: the id of the device to be emulated at the server
> +#
> +# Since: 6.3

The next release is 7.0, not 6.3.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


