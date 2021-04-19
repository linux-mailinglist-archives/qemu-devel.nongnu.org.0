Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D213E363FF4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:56:03 +0200 (CEST)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRZR-0006Ay-GC
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYR5o-0007sD-7A
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYR5m-0003qP-Hc
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618827922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oi/uXGYPK+QeFxmb3zHxbYDrcSeYf8OiUoVt4nwjkYc=;
 b=iLYJw0BPVi2A9BKUETDDJWne/p1DcACc/gkveHnWdniQas+U+uiVXQsifLJD8f5q9CYlTW
 ZiuuLtUNm5ay0JFVlqc2+o7gmpKxUKGXb/NJKFJBQlJMUSqx4bEjzUonS0f03biCbFkLG/
 GGWA6SYvZdslIJGwQW3LCh4q1lh5SBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-xZoo8fo1O0-fEKLWE9GUEg-1; Mon, 19 Apr 2021 06:25:18 -0400
X-MC-Unique: xZoo8fo1O0-fEKLWE9GUEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B006F6415E;
 Mon, 19 Apr 2021 10:25:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CBAA5C3DF;
 Mon, 19 Apr 2021 10:25:06 +0000 (UTC)
Subject: Re: [PATCH v2 29/29] gitlab-ci: Add KVM mips64el cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418225058.1257014-1-f4bug@amsat.org>
 <20210418225058.1257014-30-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d409bc0b-c798-c4a1-055b-c6fee200a456@redhat.com>
Date: Mon, 19 Apr 2021 12:25:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210418225058.1257014-30-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 00.50, Philippe Mathieu-Daudé wrote:
> Add a new job to cross-build the mips64el target without
> the TCG accelerator (IOW: only KVM accelerator enabled).
> 
> Only build the mips64el target which is known to work
> and has users.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 2d95784ed51..e44e4b49a25 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -176,6 +176,14 @@ cross-s390x-kvm-only:
>       IMAGE: debian-s390x-cross
>       ACCEL_CONFIGURE_OPTS: --disable-tcg
>   
> +cross-mips64el-kvm-only:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: mips64el-debian-cross-container
> +  variables:
> +    IMAGE: debian-mips64el-cross
> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --target-list=mips64el-softmmu

Acked-by: Thomas Huth <thuth@redhat.com>


