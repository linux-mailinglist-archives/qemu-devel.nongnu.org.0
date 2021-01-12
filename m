Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E42F29A2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 09:03:34 +0100 (CET)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEeL-0004dI-Gs
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 03:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzEca-0003Y5-HM
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 03:01:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzEcY-0006rn-N3
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 03:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610438501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwCxnnt1XYo6sl1TPdM/7L7oYombACDEw7Gq3mzhJ3M=;
 b=hV83aWDxpCSKDZJvF/CBjH+bxGD6e3jqvdNtpkZukaw06EHDQIle46uW1ndb/JtfVw2+Sd
 OqAYmk7Tq4SAkaP/s81IntBxNWdmF+jjUXkKnZ4Afz1+wljckCzYqUbzf3Vc4e9RFFSw3q
 GBc4HVH5boi18kcJjsKyeunGgZaCkTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-XcgnVTEWOPe3XOaES0GOTA-1; Tue, 12 Jan 2021 03:01:37 -0500
X-MC-Unique: XcgnVTEWOPe3XOaES0GOTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D763100F340;
 Tue, 12 Jan 2021 08:01:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3927460BE2;
 Tue, 12 Jan 2021 08:01:26 +0000 (UTC)
Subject: Re: [PATCH 6/6] get_maintainer: update repo URL to GitLab
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210111115017.156802-1-stefanha@redhat.com>
 <20210111115017.156802-7-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <980d0b92-ccdd-b5bd-e36d-fe86e327c8f7@redhat.com>
Date: Tue, 12 Jan 2021 09:01:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210111115017.156802-7-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
>   scripts/get_maintainer.pl | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 271f5ff42a..e5499b94b4 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -1377,7 +1377,7 @@ sub vcs_exists {
>   	warn("$P: No supported VCS found.  Add --nogit to options?\n");
>   	warn("Using a git repository produces better results.\n");
>   	warn("Try latest git repository using:\n");
> -	warn("git clone https://git.qemu.org/git/qemu.git\n");
> +	warn("git clone https://gitlab.com/qemu-project/qemu.git\n");

Reviewed-by: Thomas Huth <thuth@redhat.com>


