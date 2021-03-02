Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40C329636
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 06:26:41 +0100 (CET)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGxYO-00022B-76
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 00:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lGxXb-0001ZS-VZ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:25:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lGxXZ-0007pz-WA
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614662749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TD2UmPmOQDONb6qLVLJFqeYkRRe1B/OWM4EVBBrBMA=;
 b=AOx1wp5udEQpZJidu9mH5x9ds8ZjC/o/vUZ/P7/KKhCU/MONv0qkSPPJwaZSCXFB5NP0A/
 8iwf52KfMP0ZPfsiHMCVYTAm6H36cTPmU+ZoiF0PDSxoBEfSEGe32JOjeFW/BgKnR4xHF9
 /Oo3nL+hVnSLUqEsfAcUCNIFuUMJT2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-NM7JHA2gPbK7I9Bms4MGdA-1; Tue, 02 Mar 2021 00:25:45 -0500
X-MC-Unique: NM7JHA2gPbK7I9Bms4MGdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE2B803F48;
 Tue,  2 Mar 2021 05:25:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E27B60BFA;
 Tue,  2 Mar 2021 05:25:36 +0000 (UTC)
Subject: Re: [RFC PATCH] docs/system: add a gentle prompt for the complexity
 to come
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210301112741.31047-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8ea45318-f6ab-f6d3-8ec4-dd752b1d987d@redhat.com>
Date: Tue, 2 Mar 2021 06:25:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301112741.31047-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, armbru@redhat.com,
 f4bug@amsat.org, marcandre.lureau@gmail.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/2021 12.27, Alex Bennée wrote:
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

s/an assumption/assumes/ ?
(I'm not a native speaker, but to me it sounds like a verb is missing here)

> +first non switch argument is a PC compatible disk image with a boot
> +sector. For non-x86 system where we emulate a broad range of machine
> +types the command lines are generally more explicit in defining the
> +machine and boot behaviour. You will find more example command lines
> +in the :ref:`system-targets-ref` section of the manual.
> diff --git a/docs/system/targets.rst b/docs/system/targets.rst
> index 560783644d..145cc64551 100644
> --- a/docs/system/targets.rst
> +++ b/docs/system/targets.rst
> @@ -1,3 +1,5 @@
> +.. _system-targets-ref:
> +
>   QEMU System Emulator Targets
>   ============================

With the first sentence fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


