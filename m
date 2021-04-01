Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA4350F20
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 08:39:05 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRqyu-0007Pb-Dj
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 02:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRqv8-0005lo-5I
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 02:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRqv5-0004Pe-S6
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 02:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617258906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfMXfEOkJH3eWw5Ivc4/u6TdY2XzLymnYJegVwiAbxI=;
 b=PJ3C7Pdltf0dLwd6yaP/bza73/3NIrqzS+zKkwHlPV+IHYLPnuIzFk5DfWoCSrMdIsyzrP
 U0ek6CbfwycZd55Ml0S6uxsU6jGN2lE8nmGXkrGtFAbeyULXwe0ymVKn8rW79g65gqoqL0
 6uxoGaqSkxywLbCPfV1u/ll5aB24JSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-Of8Szd9rN7C3x8KtKQXeDg-1; Thu, 01 Apr 2021 02:35:01 -0400
X-MC-Unique: Of8Szd9rN7C3x8KtKQXeDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43EAB180FCA9;
 Thu,  1 Apr 2021 06:35:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE04E19C44;
 Thu,  1 Apr 2021 06:34:53 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: replace Huawei's email to personal one
To: Dongjiu Geng <gengdongjiu1@gmail.com>, "mst@redhat.com" <mst@redhat.com>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>
References: <1615462144-10864-1-git-send-email-gengdongjiu1@gmail.com>
 <F8970EB7-4D0F-43B1-AACD-B161F505C6EC@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8db12aca-e7c4-0c76-743d-1297eedb71a1@redhat.com>
Date: Thu, 1 Apr 2021 08:34:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <F8970EB7-4D0F-43B1-AACD-B161F505C6EC@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Xiang Zheng <zhengxiang9@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 05.04, Dongjiu Geng wrote:
> ping...
> 
> sorry for the noise.
> On 3/11/2021 19:29，Dongjiu Geng<gengdongjiu1@gmail.com> 
> <mailto:gengdongjiu1@gmail.com> wrote：
> 
>     In order to conveniently receive email, replace the Huawei
>     email address with my personal one.
> 
>     Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>     ---
>     MAINTAINERS | 2 +-
>     1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/MAINTAINERS b/MAINTAINERS
>     index e04ae21..823b98b 100644
>     --- a/MAINTAINERS
>     +++ b/MAINTAINERS
>     @@ -1711,7 +1711,7 @@ F: tests/qtest/acpi-utils.[hc]
>     F: tests/data/acpi/
> 
>     ACPI/HEST/GHES
>     -R: Dongjiu Geng <gengdongjiu@huawei.com>
>     +R: Dongjiu Geng <gengdongjiu1@gmail.com>
>     R: Xiang Zheng <zhengxiang9@huawei.com>
>     L: qemu-arm@nongnu.org
>     S: Maintained

I'm currently assembling a pull-request that contains some other updates to 
MAINTAINERS, too. I'll add your patch there.

  Thomas


