Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEFD4C4E26
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:56:56 +0100 (CET)
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNflv-0004C5-0N
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:56:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNfkG-0003Nh-4Z
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 13:55:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNfk9-0005hP-CZ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 13:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645815304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9VpK972oIwXk1zO/xdnPjzUviq2c24D1Jdk8POYaYvU=;
 b=Kog6NBnmmAUcyIPf847xvAtC1LUAWvaEGaRljaoKEE9YyYzZNdfTr6uRiFG0evMt6Q0KZH
 uvTUoEb4Dz1PEvft6L/P7DIGGSYsRpNNrJmM8cTICd9WqBQCU6iLD37hYQzk2S6t6w90Si
 s4RnqKj2vbhd6DRytYg3LtiJpqOOlRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-JPM0Q5SiMzmHa9sJRkU-4g-1; Fri, 25 Feb 2022 13:55:00 -0500
X-MC-Unique: JPM0Q5SiMzmHa9sJRkU-4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B7D3801AFE;
 Fri, 25 Feb 2022 18:54:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31635825ED;
 Fri, 25 Feb 2022 18:54:47 +0000 (UTC)
Date: Fri, 25 Feb 2022 12:54:45 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 2/3] iotests: Allow using QMP with the QSD
Message-ID: <20220225185445.qdyzg4dfzspzu7zk@redhat.com>
References: <20220216105355.30729-1-hreitz@redhat.com>
 <20220216105355.30729-3-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216105355.30729-3-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-364-42e4ad
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 11:53:54AM +0100, Hanna Reitz wrote:
> Add a parameter to optionally open a QMP connection when creating a
> QemuStorageDaemon instance.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


