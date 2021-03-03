Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843F32B9A1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:56:01 +0100 (CET)
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVj6-0005DK-2G
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHVhu-0004d2-1A
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:54:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHVhs-0000Q6-Fv
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614794083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fa51ydTI/j7Q/6osENH9aMTf4Ir0juOJ+N4wi49mZ0=;
 b=YKNPoRNHufOJwuHoizwJJJ4iHaTClmFnG0P/YVjArJdNROZJKN2uhKswXIM6X7nAjcZhU4
 n5rutScUawJtAIbIgAUeTtT/q0rq04RJLBG6cM5fSW9I0EHn090ZPLptv15DLp9BL/7wJq
 87N3hZSrwvjyMIWo+a84Ui5sanf1lmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-6oegbO80POe8Oroj6P_VdA-1; Wed, 03 Mar 2021 12:54:41 -0500
X-MC-Unique: 6oegbO80POe8Oroj6P_VdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F2BA1868404;
 Wed,  3 Mar 2021 17:54:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB5A919C48;
 Wed,  3 Mar 2021 17:54:34 +0000 (UTC)
Subject: Re: [PATCH 0/3] gitlab-pipeline-status script: provide more
 information on errors
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210222193240.921250-1-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c1b7a4a7-bd07-83cf-c876-326e70e5b6dd@redhat.com>
Date: Wed, 3 Mar 2021 18:54:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222193240.921250-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/2021 20.32, Cleber Rosa wrote:
> When things go wrong with the GitLab API requests, it's useful to give
> users more information about the possible causes.
> 
> Cleber Rosa (3):
>    scripts/ci/gitlab-pipeline-status: split utlity function for HTTP GET
>    scripts/ci/gitlab-pipeline-status: give more information on failures
>    scripts/ci/gitlab-pipeline-status: give more info when pipeline not
>      found
> 
>   scripts/ci/gitlab-pipeline-status | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 

Thanks, I've queued the three patches now to my testing-next branch:

https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


