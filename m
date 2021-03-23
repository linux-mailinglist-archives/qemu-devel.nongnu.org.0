Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556AC346834
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:56:26 +0100 (CET)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmCX-0002JY-BW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOlNr-0001hf-L5
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOlNp-0007GD-Nw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616522640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0DSi1LbJmXSKrcN7gYbAuGcHRYveR1OMV6r2ito2cw=;
 b=W5kSNm54SoeBOJgEIcXUjEgb+cDv19yk0Qbu2kimYS1mUejUw3tz+2o2LS1+jq8zTguRAU
 iNRIybJ4coYAf8j6JCo9jvFow/C9Mvoa8BvJfMOkvabZ+hB2Omb7fB1c+w5xbKWvUSVjGA
 8yJTtn33ItkA9sowO1Rdtc1BRPGilgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-NOBKq6voNvKzmbA9r1ur0A-1; Tue, 23 Mar 2021 14:03:52 -0400
X-MC-Unique: NOBKq6voNvKzmbA9r1ur0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B63B081747B;
 Tue, 23 Mar 2021 18:03:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-128.ams2.redhat.com [10.36.112.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 745775C1C5;
 Tue, 23 Mar 2021 18:03:50 +0000 (UTC)
Subject: Re: [PATCH 1/2] yank: Remove dependency on qiochannel
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
References: <cover.1616521341.git.lukasstraub2@web.de>
 <20ff143fc2db23e27cd41d38043e481376c9cec1.1616521341.git.lukasstraub2@web.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7b9cc130-7e9d-238c-7fa1-6dda216444e2@redhat.com>
Date: Tue, 23 Mar 2021 19:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20ff143fc2db23e27cd41d38043e481376c9cec1.1616521341.git.lukasstraub2@web.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 18.52, Lukas Straub wrote:
> Remove dependency on qiochannel by removing yank_generic_iochannel and
> letting migration and chardev use their own yank function for
> iochannel.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   MAINTAINERS                   |  1 +
>   chardev/char-socket.c         | 21 ++++++++++++++-------
>   include/qemu/yank.h           | 10 ----------
>   migration/channel.c           |  6 ++++--
>   migration/meson.build         |  1 +
>   migration/multifd.c           |  3 ++-
>   migration/qemu-file-channel.c |  3 ++-
>   migration/yank_functions.c    | 20 ++++++++++++++++++++
>   migration/yank_functions.h    | 17 +++++++++++++++++
>   stubs/yank.c                  |  6 ------
>   util/yank.c                   |  8 --------
>   11 files changed, 61 insertions(+), 35 deletions(-)
>   create mode 100644 migration/yank_functions.c
>   create mode 100644 migration/yank_functions.h

Reviewed-by: Thomas Huth <thuth@redhat.com>


