Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F4A330BF9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:09:56 +0100 (CET)
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDlr-0004EY-Qg
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJDl3-0003P0-Vb
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJDl2-0006ts-6o
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615201743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFLdHfk2212r8GAGQTUzFsS1fFq9cvMk9wjExJn91KM=;
 b=ON5HwzzI6Bw3AoVGuAEZgQ4XrPcsx/e5xiQbQ4QJ7NNLRmL54lo88yr9QmiukmlLiDRZ8e
 N6afLPGb7LpLSSCYt/z7cgXLdadb67zmtBS/OHNsMw9WjNmtQHJuHm5xf5V6az/J6VAYAX
 hWn0JJi8pm7oO79M8WJ3i2DS/Pguft8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-FcE7Mu7xNTyXU7NfibgjZA-1; Mon, 08 Mar 2021 06:08:58 -0500
X-MC-Unique: FcE7Mu7xNTyXU7NfibgjZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9D187A844;
 Mon,  8 Mar 2021 11:08:57 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB271100239F;
 Mon,  8 Mar 2021 11:08:55 +0000 (UTC)
Subject: Re: [qemu-web PATCH] pages: update deprecation policy links to
 "official" manual
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210308103049.3653-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4f3d0cf7-713e-4984-1181-eadc8003b1c8@redhat.com>
Date: Mon, 8 Mar 2021 12:08:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308103049.3653-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 11.30, Alex Bennée wrote:
> The links are broken now so lets point them at the right place.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   _posts/2017-08-10-deprecation.md | 2 +-
>   download.html                    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/_posts/2017-08-10-deprecation.md b/_posts/2017-08-10-deprecation.md
> index d0a7a35..4d007fc 100644
> --- a/_posts/2017-08-10-deprecation.md
> +++ b/_posts/2017-08-10-deprecation.md
> @@ -16,7 +16,7 @@ it.
>   Thus we are currently considering to get rid of some of the old interfaces
>   and features in a future release and have started to collect a list of such
>   old items in our
> -[QEMU documentation](https://qemu.weilnetz.de/doc/qemu-doc.html#Deprecated-features).
> +[QEMU documentation](https://qemu.org/docs/master/system/deprecated.html).
>   If you are running QEMU directly, please have a look at this deprecation
>   chapter of the QEMU documentation to see whether you are still using one of
>   these old interfaces or features, so you can adapt your setup to use the new
> diff --git a/download.html b/download.html
> index 3c2df66..e3fc789 100644
> --- a/download.html
> +++ b/download.html
> @@ -58,7 +58,7 @@ permalink: /download/
>       <strong>do not</strong> have any bearing on the scope of changes
>       included in the release. Non-backward compatible changes may be made
>       in any master branch release, provided they have followed the
> -    <a href="https://qemu.weilnetz.de/doc/qemu-doc.html#Deprecated-features">deprecation policy</a>
> +    <a href="https://qemu.org/docs/master/system/deprecated.html">deprecation policy</a>
>       which calls for warnings to be emitted for a minimum of two releases
>       prior to the change.
>     </p>
> 

Thanks, pushed.

  Thomas


