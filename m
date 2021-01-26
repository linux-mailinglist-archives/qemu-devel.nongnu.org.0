Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAE33048FD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:47:00 +0100 (CET)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4UIl-00077x-7O
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l4UGy-00069f-1O
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l4UGw-0007xT-18
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611690303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbDRDRqu0xum0EGtWEBs1Ayls+ctPOCuu8QX3Fd+wKI=;
 b=SC40TqNWY3saRcaD0aSVp1Q+yl2VMAReyw2WazMZsGo3C0t9TcMFInGMxvoaIZ9yuqAnB6
 D4LOOoD0AndXkAhhojzxXKx+I1hlfVvLkaebfQmVe/iRgE67Ambyzwel1cl8NtrOB+89o0
 piqsufO7sesVxmnXljt2yz+sF4XPsFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-OGHuq1jZON60hbphyyJ76Q-1; Tue, 26 Jan 2021 14:44:59 -0500
X-MC-Unique: OGHuq1jZON60hbphyyJ76Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D227363CF2;
 Tue, 26 Jan 2021 19:44:58 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76FAF71D51;
 Tue, 26 Jan 2021 19:44:55 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci.yml: Exclude some redundant targets in
 build-without-default-features
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210126172345.15947-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <3bde6d05-b86b-3202-c6e9-8265d41973a7@redhat.com>
Date: Tue, 26 Jan 2021 16:44:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210126172345.15947-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 cohuck@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/26/21 2:23 PM, Thomas Huth wrote:
> The build-without-default-features job is running quite long and sometimes
> already hits the 1h time limit. Exclude some targets which do not provide
> additional test coverage here (since we e.g. also already test other targets
> of the same type, just with different endianess, or a 64-bit superset) to
> avoid that we hit the timeout here so easily.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.yml | 1 +
>   1 file changed, 1 insertion(+)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index e2f9c99e27..8e0416f11b 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -610,6 +610,7 @@ build-without-default-features:
>     variables:
>       IMAGE: debian-amd64
>       CONFIGURE_ARGS: --without-default-features --disable-user
> +        --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
>       MAKE_CHECK_ARGS: check-unit
>   
>   check-patch:


