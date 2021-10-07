Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C6C42546A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:39:10 +0200 (CEST)
Received: from localhost ([::1]:49824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTc5-0001EU-0s
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYTRP-0005ir-18
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYTRM-0001CJ-Bn
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633613283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O8NoXOdF5GOzRj0ZFt03Z7iqXKclPX/7MHZunysBIHw=;
 b=UIQkTYK5J+QKa6gIB/zufhoxndDFf01qbh/Yy+Lzpn8Ldpf5T7bL184UXzMeY4tj7MyRjl
 BXnTUl6ZJX6Cful9hdpm+11lxj6oTOHmWGlO0llyulj66KUj7eBWOl9xq7GQjedaOUyqu8
 fKU1kmqG4dh0/ybIAQ26n3ilRyTz6aY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-ahNm41w_Mf6Qn9BRcySQiw-1; Thu, 07 Oct 2021 09:27:54 -0400
X-MC-Unique: ahNm41w_Mf6Qn9BRcySQiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9F941084683;
 Thu,  7 Oct 2021 13:27:52 +0000 (UTC)
Received: from redhat.com (ovpn-113-216.phx2.redhat.com [10.3.113.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1792010016F5;
 Thu,  7 Oct 2021 13:27:06 +0000 (UTC)
Date: Thu, 7 Oct 2021 08:27:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v7 7/8] qmp: add QMP command x-debug-virtio-queue-element
Message-ID: <20211007132507.ldq27vwqmpym2sgs@redhat.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
 <1633452353-7169-8-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1633452353-7169-8-git-send-email-jonah.palmer@oracle.com>
User-Agent: NeoMutt/20210205-818-e2615c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: fam@euphon.net, mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 12:45:52PM -0400, Jonah Palmer wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
> This new command shows the information of a VirtQueue element.
> 
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
> +++ b/qapi/virtio.json
> +##
> +# @VirtioRingAvail:
> +#
> +# @flags: VRingAvail flags
> +#
> +# @idx: VRingAvail idx

Is it worth being consistent...

> +##
> +# @VirtioQueueElement:
> +#
> +# @device-name: VirtIODevice name (for reference)
> +#
> +# @index: index of the element in the queue

...and spelling things 'index' everywhere instead of sometimes
abbreviating?

But overall, it looks like you did a nice job of making the command
machine-parseable, while still leaving the flexibility to alter it as
needed since it is only for developers under the x-debug- namespace.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


