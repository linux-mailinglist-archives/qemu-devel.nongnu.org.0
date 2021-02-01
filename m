Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C6830A1E6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 07:25:20 +0100 (CET)
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6SeC-0003pX-TI
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 01:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l6Scz-00039e-Tf
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 01:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l6Scy-0006eP-6k
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 01:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612160639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTEFeYQtY+K1rmsFRjcdr1vhA+h5EszqdMJOLxaZ/w0=;
 b=HT4IS0GZOn+r67R7JydIx/Xc9++T5YNc4sk5xiDQWkxwph32/nnn79yaP+3xxTXMbZSr5m
 7UGTiNhLpfIv32aaNcZpUFMpnEGP8WU0EmLFdF7ap0j7tYYS5Cjb6mUVSHMiJmqM4Pj2M0
 WO2n0V+fobD8khQSo512fcXFrJlsDFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-d38oXKxFM1uAan13CxhwCA-1; Mon, 01 Feb 2021 01:23:56 -0500
X-MC-Unique: d38oXKxFM1uAan13CxhwCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0CE6107ACE4;
 Mon,  1 Feb 2021 06:23:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B89C51002382;
 Mon,  1 Feb 2021 06:23:54 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: update bsd-user maintainers
To: Warner Losh <imp@bsdimp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>
References: <CANCZdfp7VDodG_-Po6r9t+-4YNWOMVQUOeoL1hTm4-C989qa0A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <06fb7d41-73bb-78fd-2432-357d761b8d17@redhat.com>
Date: Mon, 1 Feb 2021 07:23:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CANCZdfp7VDodG_-Po6r9t+-4YNWOMVQUOeoL1hTm4-C989qa0A@mail.gmail.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/01/2021 17.46, Warner Losh wrote:
> bsd-user: Add new mainatiners

s/mainatiners/maintainers/

> The FreeBSD project has a number of enhancements to bsd-user. Add myself
> as maintainer and Kyle Evans as a reviewer. Also add our github repo.

Thanks for taking care of this!

> Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> ---
>   MAINTAINERS | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcd88668bc..1b2c276eca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2845,9 +2845,12 @@ F: thunk.c
>   F: accel/tcg/user-exec*.c
> 
>   BSD user
> -S: Orphan
> +M: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> +R: Kyle Evans <kevans@freebsd.org <mailto:kevans@freebsd.org>>
> +S: Maintained
>   F: bsd-user/
>   F: default-configs/*-bsd-user.mak
> +T: git https://github.com/qemu-bsd-user/qemu-bse-user 
> bsd-user-rebase-3.1

s/qemu-bse-user/qemu-bsd-user/

With the typos fixed:

Reviewed-by: Thomas Huth <thuth@redhat.com>

PS: Please avoid sending patches as HTML e-mails!


