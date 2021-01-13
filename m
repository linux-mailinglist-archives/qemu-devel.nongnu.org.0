Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849282F54D1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:09:25 +0100 (CET)
Received: from localhost ([::1]:56710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzoKS-0000Rf-Kq
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzoJN-0008QJ-SR
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:08:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzoJL-00011y-0X
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610575693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nq/68OAIXM/0FX5zDbI6u12Xr8z3moTxLYA1CytxOok=;
 b=hY+n97lM5lwf+8iO2LM/WxtC3NgoA61vgytJwqZZo/dJCU3sGBQ0z9DsEcXQsPo0xmacmA
 SJBWpz8b1qJhbEQytkO/E//x8OoyrTD4J0LYE3AyTQoDA+kgOZTwQhcp+i6dlxwwfqbVE3
 NSugQvPelIuyoSljQgP9SuGMqaPXgpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-quUQlnrcPoOA0o5XopYgBg-1; Wed, 13 Jan 2021 17:08:11 -0500
X-MC-Unique: quUQlnrcPoOA0o5XopYgBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FC25192D786;
 Wed, 13 Jan 2021 22:08:10 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 386F060C5D;
 Wed, 13 Jan 2021 22:08:10 +0000 (UTC)
Subject: Re: [PATCH 0/2] MAINTAINERS cleanups
To: qemu-devel@nongnu.org
References: <20201030153416.429791-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <2e2482ad-0d71-d34c-320a-b95117559a53@redhat.com>
Date: Wed, 13 Jan 2021 17:08:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201030153416.429791-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/20 11:34 AM, John Snow wrote:
> 
> 
> John Snow (2):
>    MAINTAINERS: Remove Ben Warren
>    MAINTAINERS: Make status spellings consistent
> 
>   MAINTAINERS | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 

A little late for 5.2 now, but ... ping?


