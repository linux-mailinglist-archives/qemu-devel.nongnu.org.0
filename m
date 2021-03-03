Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1B332B885
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:14:14 +0100 (CET)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSGS-0005Qx-RR
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lHSEt-0004Tz-DI
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lHSEp-00088x-Uu
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614780750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhhuc3v8QdxzN8R0haQZcfEjrhzIZ7z2rFUXQDgi5Qg=;
 b=RClpAa0t1661fYXe5nWjN9nyWr1q8dANlDv3Eq8UtEgR6+toE01wBPXl5FvezTpWyhOV2K
 Y6kTowu0orVC7HIdrTfynpnkuiNSqHQqwYntFWG+LkYFvLectMm4bY2jt6g37Pw894bWED
 +/V3frGMcsAn7Elsd1z5okToT0r9Q3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-6s9nVvwZOEGue-9bmqqwZQ-1; Wed, 03 Mar 2021 09:12:29 -0500
X-MC-Unique: 6s9nVvwZOEGue-9bmqqwZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDF65189C441;
 Wed,  3 Mar 2021 14:12:27 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-245.ams2.redhat.com
 [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A89D95D9C2;
 Wed,  3 Mar 2021 14:12:17 +0000 (UTC)
Subject: Re: [PATCH 2/3] docker: EDK2 build job depends on EDK2 container
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <20210303130646.1494015-1-philmd@redhat.com>
 <20210303130646.1494015-3-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <126118cd-5f8f-5389-a960-8f013ad00f2b@redhat.com>
Date: Wed, 3 Mar 2021 15:12:16 +0100
MIME-Version: 1.0
In-Reply-To: <20210303130646.1494015-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/21 14:06, Philippe Mathieu-Daudé wrote:
> Add missing dependency build-edk2 -> docker-edk2.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/edk2.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
> index e1e04524166..ba7280605c4 100644
> --- a/.gitlab-ci.d/edk2.yml
> +++ b/.gitlab-ci.d/edk2.yml
> @@ -25,6 +25,7 @@ docker-edk2:
>  
>  build-edk2:
>   stage: build
> + needs: ['docker-edk2']
>   rules: # Only run this job when ...
>   - changes: # ... roms/edk2/ is modified (submodule updated)
>     - roms/edk2/*
> 

Acked-by: Laszlo Ersek <lersek@redhat.com>


