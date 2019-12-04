Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B331124BA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 09:25:31 +0100 (CET)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icPyS-0006W3-9g
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 03:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1icPho-0002vX-VB
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 03:08:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1icPhP-0000Xe-Il
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 03:08:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50528
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1icPhO-0000RU-PY
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 03:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575446870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=u9J4+7Wccqfo2D1DTzLOQuDMlMbDBxJs8eFbNrS4stU=;
 b=WP26cokCxCX/Mp3bIeoU6ZYMjahQG6SrXpFRoisP5qA7strKa7twM1+X/8yjcRT5/LMHyz
 Cr4ZAr+X69hF52SqHuETwkpnnsCN7IWqp+daVmXUqT+gUAS149joKUGZKDX9hkIJhoH57+
 EBg8T27EB6YxZcKHStyLmoq6NYFiMNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-Uz0b4FwXNimZHJ-BWcVJGQ-1; Wed, 04 Dec 2019 03:07:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88D48183B70A;
 Wed,  4 Dec 2019 08:07:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-39.ams2.redhat.com [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 640B05C1B2;
 Wed,  4 Dec 2019 08:07:44 +0000 (UTC)
Subject: Re: [PATCH] travis.yml: Drop libcap-dev
To: Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <157544579267.3537077.17459176619888583836.stgit@bahia.lan>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <69a9224c-4686-cd09-1a89-81954af6f902@redhat.com>
Date: Wed, 4 Dec 2019 09:07:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <157544579267.3537077.17459176619888583836.stgit@bahia.lan>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Uz0b4FwXNimZHJ-BWcVJGQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/12/2019 09.01, Greg Kurz wrote:
> Commit b1553ab12fe0 converted virtfs-proxy-helper to using libcap-ng. There
> aren't any users of libcap anymore. No need to install libcap-dev.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> 
> Yet another follow-up to Paolo's patch to use libcap-ng instead of libcap.
> Like with the docker and the gitlab CI patches, if I get an ack from Alex
> I'll gladly merge this in the 9p tree and send a PR as soon as 5.0 dev
> begins. I'll make sure the SHA1 for Paolo's patch remains the same.

I hope you don't have to rebase! Otherwise simply say "One of the
previous changes ..." or so in the commit message instead.

>  .travis.yml |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 445b0646c18a..6cb8af6fa599 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -26,7 +26,6 @@ addons:
>        - libaio-dev
>        - libattr1-dev
>        - libbrlapi-dev
> -      - libcap-dev
>        - libcap-ng-dev
>        - libgcc-4.8-dev
>        - libgnutls28-dev

Reviewed-by: Thomas Huth <thuth@redhat.com>


