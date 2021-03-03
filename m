Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327D32B9FD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:44:44 +0100 (CET)
Received: from localhost ([::1]:33192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWUF-0000zL-6r
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHWQv-0006rc-Gr
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHWQr-00063m-E0
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614796872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tva1rR4Xp7JvBzec7IvlT09xFosqM+k2L0mCceqB/Mo=;
 b=XhUIbmu/NFjHkQx1PvF3nw/qG2qs0XHP2BLzIxdk9UH1ge/DxxhkUaYLTGlXdi7Zu1WUO+
 ASfugi0o5hcEeKTKPgJ/biPTf1TelVhSFq6+Iz69IcKYxi3RyRW/ZGxuwxF6fSIQr+XwAi
 kLvSV00D0bbjIkoXelSgGyMcEZnG5/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-FYMcfXbaNW-rrn-SNZ2AzA-1; Wed, 03 Mar 2021 13:41:09 -0500
X-MC-Unique: FYMcfXbaNW-rrn-SNZ2AzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C39BD801980;
 Wed,  3 Mar 2021 18:41:07 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1E185C241;
 Wed,  3 Mar 2021 18:41:02 +0000 (UTC)
Subject: Re: [RFC PATCH] docs/system: add a gentle prompt for the complexity
 to come
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210301112741.31047-1-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <eb5cc2cd-111d-84ea-910d-42aedfceef2f@redhat.com>
Date: Wed, 3 Mar 2021 13:41:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301112741.31047-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 armbru@redhat.com, f4bug@amsat.org, marcandre.lureau@gmail.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 6:27 AM, Alex Bennée wrote:
> We all know the QEMU command line can become a fiendishly complex
> beast. Lets gently prepare our user for the horrors to come by
> referencing where other example command lines can be found in the
> manual.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/system/quickstart.rst | 8 ++++++++
>   docs/system/targets.rst    | 2 ++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/docs/system/quickstart.rst b/docs/system/quickstart.rst
> index 3a3acab5e7..3498c5a29f 100644
> --- a/docs/system/quickstart.rst
> +++ b/docs/system/quickstart.rst
> @@ -11,3 +11,11 @@ Download and uncompress a PC hard disk image with Linux installed (e.g.
>      |qemu_system| linux.img
>   
>   Linux should boot and give you a prompt.
> +
> +Users should be aware the above example elides a lot of the complexity
> +of setting up a VM with x86_64 specific defaults and an assumption the
"and assumes the ...", like Thomas says.

> +first non switch argument is a PC compatible disk image with a boot
> +sector. For non-x86 system where we emulate a broad range of machine

Either "For a non-x86 system ..." or "For non-x86 systems ..."

> +types the command lines are generally more explicit in defining the

You need a comma between "machine types" and "the".

> +machine and boot behaviour. You will find more example command lines
> +in the :ref:`system-targets-ref` section of the manual.

Reviewed-by: John Snow <jsnow@redhat.com>


