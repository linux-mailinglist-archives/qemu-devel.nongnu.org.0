Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA5389E54
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 08:54:14 +0200 (CEST)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljcZS-0003Hd-0w
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 02:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljcY6-00028c-JY
 for qemu-devel@nongnu.org; Thu, 20 May 2021 02:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljcY0-0003KT-TG
 for qemu-devel@nongnu.org; Thu, 20 May 2021 02:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621493564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A54V6nvYbEe+CX8sCYVLHPeB5VpHulUN1sn8FOAtetY=;
 b=X10VMQUVkjwmJTMsfLR9zj/rYFtau+83sWqvQT3k9+VwXDFjAZuf8G2MlbR5UfvMhY14R0
 fr8aPqcP8Y/1JCFC2KQpsxyU3SCuxsVMjPnkl0DxstnmKCCGKmHLjrsqrayJM46lLIwxwq
 EK7cUFAuyG8ZQcqn7mRi4shjD7jgHUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-HKbpjun_MOClKknDQpq0OA-1; Thu, 20 May 2021 02:52:40 -0400
X-MC-Unique: HKbpjun_MOClKknDQpq0OA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E99F8015C6;
 Thu, 20 May 2021 06:52:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8BAA1349A;
 Thu, 20 May 2021 06:52:34 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210519213202.3979359-1-jsnow@redhat.com>
 <20210519213202.3979359-3-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] Gitlab: Add "Feature Request" issue template.
Message-ID: <e79bc75c-93b7-6810-e07e-35c03c9c2983@redhat.com>
Date: Thu, 20 May 2021 08:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210519213202.3979359-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2021 23.32, John Snow wrote:
> Copied from Peter Krempa's libvirt template, feature.md.
> 
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   .gitlab/issue_templates/feature_request.md | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 .gitlab/issue_templates/feature_request.md
> 
> diff --git a/.gitlab/issue_templates/feature_request.md b/.gitlab/issue_templates/feature_request.md
> new file mode 100644
> index 00000000000..26901ff00c4
> --- /dev/null
> +++ b/.gitlab/issue_templates/feature_request.md
> @@ -0,0 +1,13 @@
> +## Goal
> +<!-- Describe the final result you want to achieve. Avoid design specifics. -->

Since some people apparently had wrong expectations when filing a feature 
request in the past, it might be good to add some words about what to 
expect. Maybe something like this (re-using some wording that Daniel already 
added to some tickets in the past IIRC):

  Please note that the QEMU, like most open source projects, relies on 
contributors who have motivation, skills and available time to work on 
implementing particular features. Contributors naturally tend to focus on 
features that result in the greatest benefit to their own use cases. Thus 
the QEMU project doesn't implement new big features (like target 
architectures or board models) on demand based on feature requests here; 
they're a lot of work to do. Instead we simply code-review and incorporate 
new big features as and when people decide to write them and submit the 
patches. So please only submit small requests here. Thanks!

?

  Thomas


