Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA43473E8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:47:43 +0100 (CET)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzB0-0002DC-FM
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOz9c-0001jZ-0y
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOz9a-0006Ld-Fw
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616575573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RozTtV5nUkek1IfHbAv6vNmhDyQWcU3pm7c8ZA/ubWU=;
 b=K6y4kXBdrovbjjuGGERIwyfh+zrdZWfcKAz5yr2rVsIwEkvQCaEEToOll0f0E8rihL/THl
 DoEoziDOfzBuGKAKNUdMnnR8jM0cz2F6x0rcLh0Lfs1Cv0qbPVPK23heby03tgUinv3U0V
 reTnh6qZp/3NDsiCwfmmfZSWeR3kHv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-1s8dCFDgOquQJnm3pxM7Ug-1; Wed, 24 Mar 2021 04:46:09 -0400
X-MC-Unique: 1s8dCFDgOquQJnm3pxM7Ug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 968C2612AD;
 Wed, 24 Mar 2021 08:46:08 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0DBC2C8CD;
 Wed, 24 Mar 2021 08:45:52 +0000 (UTC)
Subject: Re: [PATCH v2 02/10] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-3-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8df0d608-6180-af0e-7ac4-299494f05da4@redhat.com>
Date: Wed, 24 Mar 2021 09:45:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-3-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 3/23/21 11:15 PM, Cleber Rosa wrote:
> If the vmlinuz variable is set to anything that evaluates to True,
> then the respective arguments should be set.  If the variable contains
> an empty string, than it will evaluate to False, and the extra
s/than/then
> arguments will not be set.>
> This keeps the same logic, but improves readability a bit.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index 5b74ce2929..ca64b76301 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -251,7 +251,7 @@ def setUp(self):
>  
>          super(VirtiofsSubmountsTest, self).setUp(pubkey)
>  
> -        if len(vmlinuz) > 0:
> +        if vmlinuz:
>              self.vm.add_args('-kernel', vmlinuz,
>                               '-append', 'console=ttyS0 root=/dev/sda1')
>  
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


