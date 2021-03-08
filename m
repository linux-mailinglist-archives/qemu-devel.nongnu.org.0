Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F5233103B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:59:16 +0100 (CET)
Received: from localhost ([::1]:34916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGPj-0000FZ-25
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJGNw-0006yE-QP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJGNt-0003qT-EA
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615211840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxkeyPWXU792ASvADyGn2gh/3odLtVCNrMUCOW8hhPE=;
 b=eOAkSi75a232VU845zu4e8ZfgYLxTxPsNVAkD2ia+qXealFCRfZicNitiNadKMtX5R9Szg
 /k4ZwW9Wm6wmSTvORhTy/y1qqQqEiZZOVpaw61EZWEXpM1hfNu36VLPlPQzSZaqB6SJ7FR
 BDUQUkRUxyhk8L9gXHzq6e/I5OZq6JI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-TlvdZKF7NvyU0Kl8Yv7Huw-1; Mon, 08 Mar 2021 08:57:17 -0500
X-MC-Unique: TlvdZKF7NvyU0Kl8Yv7Huw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46DB8B7841;
 Mon,  8 Mar 2021 13:57:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D53961F55;
 Mon,  8 Mar 2021 13:57:12 +0000 (UTC)
Subject: Re: [qemu-web RFC PATCH] _download/source.html: show the GPG
 fingerprint for releases
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210308111649.14898-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <03f8be00-7ae7-45ed-bc27-02fbb8aeee62@redhat.com>
Date: Mon, 8 Mar 2021 14:57:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308111649.14898-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: pbonzini@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 12.16, Alex Bennée wrote:
> At the moment we mention the signature but don't actually say what it
> is or how to check it. Lets surface the fingerprint on the information
> along with a guide of how to verify the download.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   _download/source.html | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/_download/source.html b/_download/source.html
> index 35fd156..6c2f6f6 100644
> --- a/_download/source.html
> +++ b/_download/source.html
> @@ -8,14 +8,21 @@
>   	<div id="releases">
>   	{% include releases.html %}
>   	</div>
> -	<p>or stay on the bleeding edge with the
> -	   <a href="https://gitlab.com/qemu-project/qemu">git repository!</a></p>
> -
> +	<p>
> +          Our source code tarballs are signed with the release
> +          managers key, fingerprint:

I'd like to suggest to replace the above sentence with:

Our source code tarballs are signed with the
<a 
href="http://hkps.pool.sks-keyservers.net/pks/lookup?op=vindex&fingerprint=on&search=0xCEACC9E15534EBABB82D3FA03353C9CEF108B584">release 
managers key</a>. The fingerprint of this key is:


> +          <pre><code>CEAC C9E1 5534 EBAB B82D  3FA0 3353 C9CE F108 B584</code></pre>.
> +          Alternatively stay on the bleeding edge with the
> +	  <a href="https://gitlab.com/qemu-project/qemu">git repository!</a></p>
>   	<h2>Build instructions</h2>
>   
>   	{% for release in site.data.releases offset: 0 limit: 1 %}
>   	<p>To download and build QEMU {{release.branch}}.{{release.patch}}:</p>
>   <pre>wget https://download.qemu.org/qemu-{{release.branch}}.{{release.patch}}.tar.xz
> +# optional verify signature
> +wget https://download.qemu.org/qemu-{{release.branch}}.{{release.patch}}.tar.xz.sig
> +gpg --output qemu-{{release.branch}}.{{release.patch}}.tar.xz --verify qemu-{{release.branch}}.{{release.patch}}.tar.xz.sig
> +# extract and build
>   tar xvJf qemu-{{release.branch}}.{{release.patch}}.tar.xz
>   cd qemu-{{release.branch}}.{{release.patch}}
>   ./configure
> 

  Thomas


