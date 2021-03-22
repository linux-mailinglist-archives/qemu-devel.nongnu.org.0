Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DC344A1D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:02:49 +0100 (CET)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lON0y-0007B5-N2
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOMl8-000652-Lh
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOMl3-0007nS-Of
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDAe9sDrgR75h/xy6Xy7MdW1AvrStbLxNn9hcs/6gwA=;
 b=GdankXJPGPJWHxlvPKbCvjtwZCTsOgjideuks9ghFF9FL1bpJzm8om+v0llmyk7VSyLq0m
 hzIM9KfGZDothLKmP3YEYG0uxPdLWYdlBRAH10PD7BFNshsJxFvMXwwJhcMq5w77Lvhup3
 btCAiNzWKRxSKdnTb/CnM7DuBaE2miQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-1iMpZybcN9e1O0AS42slzQ-1; Mon, 22 Mar 2021 11:46:16 -0400
X-MC-Unique: 1iMpZybcN9e1O0AS42slzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A33A1922960;
 Mon, 22 Mar 2021 15:46:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-79.ams2.redhat.com [10.36.112.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2ECD19C78;
 Mon, 22 Mar 2021 15:46:07 +0000 (UTC)
Subject: Re: [RFC PATCH] gitlab: extend timeouts for CFI builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210322142110.4766-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <247fd836-68f6-8341-8934-8abb2ad37a86@redhat.com>
Date: Mon, 22 Mar 2021 16:46:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322142110.4766-1-alex.bennee@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 dbuono@linux.vnet.ibm.com, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2021 15.21, Alex Bennée wrote:
> These builds are running very close to the default build limit and as
> they are already pared down the only other option is to extend the
> timeout a little to give some breathing room.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.yml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f746d5fbea..9ffbaa7ffb 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -502,6 +502,7 @@ build-cfi-aarch64:
>         --enable-safe-stack --enable-slirp=git
>       TARGETS: aarch64-softmmu
>       MAKE_CHECK_ARGS: check-build
> +  timeout: 70m
>     artifacts:
>       expire_in: 2 days
>       paths:
> @@ -538,6 +539,7 @@ build-cfi-ppc64-s390x:
>         --enable-safe-stack --enable-slirp=git
>       TARGETS: ppc64-softmmu s390x-softmmu
>       MAKE_CHECK_ARGS: check-build
> +  timeout: 70m
>     artifacts:
>       expire_in: 2 days
>       paths:
> @@ -574,6 +576,7 @@ build-cfi-x86_64:
>         --enable-safe-stack --enable-slirp=git
>       TARGETS: x86_64-softmmu
>       MAKE_CHECK_ARGS: check-build
> +  timeout: 70m
>     artifacts:
>       expire_in: 2 days
>       paths:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

Maybe we could also use some of the --disable-xyz flags to cut down the 
compilation time of some of these jobs?


