Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC052C4777
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 19:22:07 +0100 (CET)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khzQc-00081C-BB
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 13:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khzOw-0007YI-Us
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:20:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khzOt-0000OR-JT
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606328417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldNmRJTo5mF9lzar7AVcGrPzt8H2/RyWIcHpjamylmU=;
 b=I3/vzDenSPbb/aQ46onTiRSTlF6xXcfDcszYDkpE1JOY1bx5wzN44rum6wkpktfBVdoB2d
 4n6WV05HSLeDh/aA+zedXURNz8xzlzH+vu2YWu95RKWPCHW7LJJ9RCy1+Bx67CZam6yZ5Z
 XTKsjejbDfQV05aT2z8Pw4VlERRKh5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-dFX4NG-COZyY1gsgwxcVVA-1; Wed, 25 Nov 2020 13:20:15 -0500
X-MC-Unique: dFX4NG-COZyY1gsgwxcVVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 410E1805BFC
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 18:20:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-81.ams2.redhat.com [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9589260864;
 Wed, 25 Nov 2020 18:20:13 +0000 (UTC)
Subject: Re: [PATCH] tests/docker, tests/vm: remove setuptools from images
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201125175051.3051129-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <363ec9b8-b8dc-b54f-10f8-75309a9baf3f@redhat.com>
Date: Wed, 25 Nov 2020 19:20:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201125175051.3051129-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/11/2020 18.50, Paolo Bonzini wrote:
> Setuptools is not needed anymore by the bundled copy of meson,
> remove it.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .cirrus.yml                                        | 1 -
>  tests/docker/dockerfiles/debian10.docker           | 1 -
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 1 -
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 1 -
>  tests/vm/freebsd                                   | 1 -
>  tests/vm/haiku.x86_64                              | 1 -
>  tests/vm/netbsd                                    | 1 -
>  tests/vm/openbsd                                   | 1 -
>  8 files changed, 8 deletions(-)

Needs to go in after the patch that removes the check in the configure
script. Then:

Reviewed-by: Thomas Huth <thuth@redhat.com>


