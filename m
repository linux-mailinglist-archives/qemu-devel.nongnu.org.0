Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1B2ED725
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:06:46 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxacP-0002Lp-EN
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxabK-0001rD-Q5
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:05:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxabH-000238-Nr
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610046332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHEe+jmnT0Ed6R14rADafDI7FV6dkPAIofiylkzONwQ=;
 b=QKGjp/ZfVVpOqFUH84gaNmh9tnZpR5gAOWGGJv+EaYEhvyV6N6a4zJI+M9lJMWy3vMRLRG
 NjBrTm1FRdJtPTxAiJd5oXXUpTDmwJHrLluIPS7AA4i/WQTPPOWeUw+7kySFOzIOkfKBN+
 ubDlhzJ1cJArP1dLmWt+DCFA215jvSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-idBxl4gyP7Gi3VgQanOU1g-1; Thu, 07 Jan 2021 14:05:30 -0500
X-MC-Unique: idBxl4gyP7Gi3VgQanOU1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C194801817;
 Thu,  7 Jan 2021 19:05:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-16.ams2.redhat.com [10.36.114.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E0F5D9DD;
 Thu,  7 Jan 2021 19:05:23 +0000 (UTC)
Subject: Re: [RFC PATCH] ci: ensure that all jobs use a shallow clone
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210107171719.477856-1-pbonzini@redhat.com>
 <20210107182812.GI1029501@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dff4499e-eb4d-f96b-5f82-51352561d231@redhat.com>
Date: Thu, 7 Jan 2021 20:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210107182812.GI1029501@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2021 19.28, Daniel P. Berrangé wrote:
[...]
> Travis has issues with git cloning and concurrent pushes.
> 
> eg if you push branch A, it schedules a CI job. Then you
> push branch B before jobs for A have started.
> 
> When the job for A starts, it will be unable to checkout
> the commit for branch A's merge because the history will
> be too shallow.

I think we have to get rid of travis.yml soon anyway, since they changed 
their business model, and soon it won't be possible anymore to use it for 
QEMU. travis-ci.org is getting decommissioned and on travis-ci.com you can 
only get free CI minutes for non-sponsored FOSS projects.
So let's simply not worry about Travis-CI anymore.

>>   .cirrus.yml              | 1 +
>>   .gitlab-ci.yml           | 3 +++
>>   .shippable.yml           | 2 ++

Maybe we could rather disable shippable now that we support the cross 
container builds on gitlab-ci, too?

  Thomas


