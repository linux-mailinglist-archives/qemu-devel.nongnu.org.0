Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6DA31DD4A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:28:06 +0100 (CET)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCPgL-0006gh-6R
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCPed-0005NA-9R
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:26:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCPea-0004Xy-FT
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613579175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=csB2p9pg1Qg1TpMVqQHL7FE+XFCCXMPzX2RQ20UcqWI=;
 b=FQ/13X4Igk7auFw5zu7cAcnQ5y8YRWslEV/zuCZEhV3Bd2A3Wn8VwHyVw5h3EuzvUyQ81h
 Fbe75CVzc4FidSMy+k4wm3Gq6PRmTFbYomz9TfOu/4toxbg2hGXcIyQIszhPODW+DvHblJ
 XlsH9lbXtB1PdEsB4KsYn9dZlxylhJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-46CTzdMvMV-AyPYp98rxKw-1; Wed, 17 Feb 2021 11:26:10 -0500
X-MC-Unique: 46CTzdMvMV-AyPYp98rxKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760B680196E;
 Wed, 17 Feb 2021 16:26:09 +0000 (UTC)
Received: from [10.3.113.211] (ovpn-113-211.phx2.redhat.com [10.3.113.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5DBC1007617;
 Wed, 17 Feb 2021 16:26:06 +0000 (UTC)
Subject: Re: [PATCH] qsd: Document FUSE exports
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210217115844.62661-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <dfe78693-0ce5-c7a2-369c-ce47598a6651@redhat.com>
Date: Wed, 17 Feb 2021 10:26:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217115844.62661-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 5:58 AM, Max Reitz wrote:
> Implementing FUSE exports required no changes to the storage daemon, so
> we forgot to document them there.  Considering that both NBD and
> vhost-user-blk exports are documented in its man page (and NBD exports
> in its --help text), we should probably do the same for FUSE.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  docs/tools/qemu-storage-daemon.rst   | 19 +++++++++++++++++++
>  storage-daemon/qemu-storage-daemon.c |  4 ++++
>  2 files changed, 23 insertions(+)

> @@ -142,6 +153,14 @@ domain socket ``vhost-user-blk.sock``::
>        --blockdev driver=qcow2,node-name=qcow2,file=file \
>        --export type=vhost-user-blk,id=export,addr.type=unix,addr.path=vhost-user-blk.sock,node-name=qcow2
>  
> +Export a qcow2 image file ``disk.qcow2`` via FUSE on itself, so the disk image
> +file will then appear as a raw image::
> +
> +  $ qemu-storage-daemon \
> +      --blockdev driver=file,node-name=file,filename=disk.qcow2 \
> +      --blockdev driver=qcow2,node-name=qcow2,file=file \
> +      --export type=fuse,id=export,node-name=qcow2,mountpoint=disk.qcow2,writable=on
> +

Should the example also mention how to unmount the file when you're done?

Otherwise looks good to me.  Any documentation is better than none, even
if we can add more, so

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


