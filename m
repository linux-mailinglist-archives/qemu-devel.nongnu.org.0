Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F10334674C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:11:54 +0100 (CET)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlVR-0007iG-DI
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOlP0-0002Ya-F1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOlOl-0007d3-HX
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616522694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8UYfdGoX6YE/vm7LjY2C8PH/cJpbkrWZ1qLJ9ggbCUE=;
 b=e057xHjau6JF5GezvW4tusJO245vzMrk9QpbHHys7s8ZRBBmJAmbmy1UXOOCxxHxSh4fBP
 3yOM+lE5v6PF9hNyLwnEdDIVhdi0tV55k5GxCceyITI3o0iCtuL0paP5wdVkWfvOLTUPCp
 Ufm07YqVPpRyvY02K9G6JkQej0cFR38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-5Yn0nlxUPqmT43YCHSjYqw-1; Tue, 23 Mar 2021 14:04:52 -0400
X-MC-Unique: 5Yn0nlxUPqmT43YCHSjYqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0C67800D53;
 Tue, 23 Mar 2021 18:04:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-128.ams2.redhat.com [10.36.112.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89A946087C;
 Tue, 23 Mar 2021 18:04:50 +0000 (UTC)
Subject: Re: [PATCH 2/2] yank: Always link full yank code
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
References: <cover.1616521341.git.lukasstraub2@web.de>
 <997aa12a28c555d8a3b7a363b3bda5c3cf1821ba.1616521341.git.lukasstraub2@web.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <69b7d24c-8fc6-f3ee-5ed8-999b10a9c2de@redhat.com>
Date: Tue, 23 Mar 2021 19:04:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <997aa12a28c555d8a3b7a363b3bda5c3cf1821ba.1616521341.git.lukasstraub2@web.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
> Yank now only depends on util and can be always linked in. Also remove
> the stubs as they are not needed anymore.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   MAINTAINERS       |  1 -
>   stubs/meson.build |  1 -
>   stubs/yank.c      | 23 -----------------------
>   util/meson.build  |  2 +-
>   4 files changed, 1 insertion(+), 26 deletions(-)
>   delete mode 100644 stubs/yank.c

This indeed looks like the best solution to me. Thanks!

Reviewed-by: Thomas Huth <thuth@redhat.com>


