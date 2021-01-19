Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39AE2FB757
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:23:01 +0100 (CET)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ruP-0007g0-07
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1roK-0002zM-UK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:16:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1roI-00010B-Jy
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611065801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIBQbHlYkZ8BwGcyN+yb9QXzNY4DC2RxyJwGsil++uo=;
 b=K1LJz/imtvE9+mPSe2aXOyghkPYZ0cG0S782obRQCrTmbChlfXowr3lNrOYPkM9hVG+yaG
 l1itUPEoDQyHsVkCood0fj23fuTA1Fm/Ki//Sgz0PULP7ZPIXoQFI38mb2PljoWNCjlUnj
 sh+VqDJybBovBZdW7YPdimOVPYfq+X0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-gdfOq0TcMDquuakgh_yeeQ-1; Tue, 19 Jan 2021 09:16:37 -0500
X-MC-Unique: gdfOq0TcMDquuakgh_yeeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87B1210054FF;
 Tue, 19 Jan 2021 14:16:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-54.ams2.redhat.com
 [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48CE660CCB;
 Tue, 19 Jan 2021 14:16:34 +0000 (UTC)
Subject: Re: [PATCH v2] iotests: Add test for the regression fixed in
 c8bf9a9169
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <20210112170540.2912-1-berto@igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <de36acba-3a7a-e31c-2a7e-dd4be39ddf08@redhat.com>
Date: Tue, 19 Jan 2021 15:16:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210112170540.2912-1-berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.21 18:05, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
> v2: Rebase on top of the latest master
> 
>   tests/qemu-iotests/313     | 103 +++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/313.out |  29 +++++++++++
>   tests/qemu-iotests/group   |   1 +
>   3 files changed, 133 insertions(+)
>   create mode 100755 tests/qemu-iotests/313
>   create mode 100644 tests/qemu-iotests/313.out

Thanks, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


