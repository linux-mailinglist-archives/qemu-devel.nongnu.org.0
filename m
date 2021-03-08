Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01268330ADE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:11:36 +0100 (CET)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJCrP-0000YE-26
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJCp6-0008C4-1V
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJCp3-00052C-De
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615198148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aep4llMlCXtJI5NVxnku4Q/R9hbSHet3sH8rlDiZYcQ=;
 b=IRfEdr8xDQPepNN/kmmpQ/ZLOY0HsjRenmpjKvNiR0h8kDatM4xHyrK+wTH2FfRihH1ICB
 a0GOaWcMgvUQ0D+fXAJi57mCx04kHDF3KfAccU/i0c+t+mFqiEfWg/nSjct/vGTKwekz7a
 61oIx/Mlqgt8sWtXwyvU9hur1zjeDtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-aEYTw_fmNAeWvWoyTNVYcQ-1; Mon, 08 Mar 2021 05:09:05 -0500
X-MC-Unique: aEYTw_fmNAeWvWoyTNVYcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 816CF1007C86;
 Mon,  8 Mar 2021 10:09:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E27101E24A;
 Mon,  8 Mar 2021 10:09:01 +0000 (UTC)
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210307155654.993-1-imp@bsdimp.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
Message-ID: <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
Date: Mon, 8 Mar 2021 11:09:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307155654.993-1-imp@bsdimp.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2021 16.56, Warner Losh wrote:
> The FreeBSD project has a number of enhancements to bsd-user. Add myself
> as maintainer and Kyle Evans as a reviewer. Also add our github repo.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26c9454823..ec0e935038 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2896,9 +2896,12 @@ F: thunk.c
>   F: accel/tcg/user-exec*.c
>   
>   BSD user
> -S: Orphan
> +M: Warner Losh <imp@bsdimp.com>
> +R: Kyle Evans <kevans@freebsd.org>
> +S: Maintained
>   F: bsd-user/
>   F: default-configs/targets/*-bsd-user.mak
> +T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1

BSD is not really my home turf, but since nobody else picked this up and I 
plan to send a pull request for a bunch of patches anyway this week, I can 
also put it into my queue.

  Thomas


