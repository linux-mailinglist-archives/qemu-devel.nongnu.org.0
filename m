Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267032EE4A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:19:56 +0100 (CET)
Received: from localhost ([::1]:35328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICF9-0000l5-9z
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lIC27-00012u-VT
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:06:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lIC26-0006nj-J2
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614956785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxFySPuAYXIU5Q/a1bgus6bW6vYP0yVJEfNo2zhgPU0=;
 b=gItfC/kSYRJYV8NaLONEyhw6moHgDk3kyQ+omSDgPWVDxmaNMwTIxPJsxl8QJnnirsqcpO
 H2aOVyOC78n1/eIGy7N0msl3dRPgF4hLZzaOg0ibLhuaMxp2Kv2Cf3O62NK1CV5LNSUjzU
 tO6eMn2CigSG4UX9zdfgScXx1LUyy80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-Evv1sEbtNXKxOE7ffRF37Q-1; Fri, 05 Mar 2021 10:06:23 -0500
X-MC-Unique: Evv1sEbtNXKxOE7ffRF37Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D9B7800D53;
 Fri,  5 Mar 2021 15:06:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-137.ams2.redhat.com
 [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B768E5D6B1;
 Fri,  5 Mar 2021 15:06:21 +0000 (UTC)
Subject: Re: [PATCH] docs: qsd: Explain --export nbd,name=... default
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210305094856.18964-1-kwolf@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <1891428e-4509-dd5c-36fc-bde9e3ac19fe@redhat.com>
Date: Fri, 5 Mar 2021 16:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305094856.18964-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.03.21 10:48, Kevin Wolf wrote:
> The 'name' option for NBD exports is optional. Add a note that the
> default for the option is the node name (people could otherwise expect
> that it's the empty string like for qemu-nbd).
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   docs/tools/qemu-storage-daemon.rst | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


