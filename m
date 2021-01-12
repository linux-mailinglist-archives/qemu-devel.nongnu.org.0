Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93932F2996
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:59:53 +0100 (CET)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEam-0002A2-Rw
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzEY3-0008Tz-0q
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzEY0-0005FY-Pk
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610438219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTerVrAlJuh0IqSFX99885j5Z0lNV1FUCP3CPtTnWiY=;
 b=ivn1X4SSJsRBITVJCa7l500pj8twD64FDV0RQ3Ry1mNef2j311n1ZrkPRf5ZEmT6oIQ1qL
 eLF9vU0Y3fCKxuxczG5P3NCiPWXEhhtbNFiQwWkhS3o81BUYZ1M+qnkNcJFBzYf8lPtXsq
 c7cQ9+g4kFMgpCIOnfHXMpp+tilDIQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Pz5tSGx4OP6ufvsZ9nB5tw-1; Tue, 12 Jan 2021 02:56:56 -0500
X-MC-Unique: Pz5tSGx4OP6ufvsZ9nB5tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B422801AC1;
 Tue, 12 Jan 2021 07:56:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 489B31972B;
 Tue, 12 Jan 2021 07:56:47 +0000 (UTC)
Subject: Re: [PATCH 4/6] docs: update README to use GitLab repo URLs
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210111115017.156802-1-stefanha@redhat.com>
 <20210111115017.156802-5-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3d094320-808d-62c7-5da2-c2326763e30b@redhat.com>
Date: Tue, 12 Jan 2021 08:56:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210111115017.156802-5-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 12.50, Stefan Hajnoczi wrote:
> qemu.org is running out of bandwidth and the QEMU project is moving
> towards a gating CI on GitLab. Use the GitLab repos instead of qemu.org
> (they will become mirrors).
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   README.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/README.rst b/README.rst
> index 58b9f2dc15..ce39d89077 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -60,7 +60,7 @@ The QEMU source code is maintained under the GIT version control system.
>   
>   .. code-block:: shell
>   
> -   git clone https://git.qemu.org/git/qemu.git
> +   git clone https://gitlab.com/qemu-project/qemu.git
>   
>   When submitting patches, one common approach is to use 'git
>   format-patch' and/or 'git send-email' to format & send the mail to the
> @@ -78,7 +78,7 @@ The QEMU website is also maintained under source control.
>   
>   .. code-block:: shell
>   
> -  git clone https://git.qemu.org/git/qemu-web.git
> +  git clone https://gitlab.com/qemu-project/qemu-web.git
>   
>   * `<https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/>`_

Reviewed-by: Thomas Huth <thuth@redhat.com>


