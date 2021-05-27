Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D239271F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 08:09:46 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm9DF-0005xP-3a
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 02:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lm9CP-00058Q-IV
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:08:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lm9CN-0006MK-7V
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622095730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RHxB19b9bOXWJQDg6EK60W2MUDDbECP58ic98oMTrw=;
 b=gxLvoPvWrN99ZEhaWc9z6kcm3Vc8LuBv6Azo74YE+P1I0VpnS3l7sFvN+3ijyUHn+mJIe3
 GOunVv2Q9+nkLT96syVk5yHBFK/zO8wnFlslAiPnq6ASZwgmH3krKHP1nfmSLQmCXkkbhZ
 zsmAOWXFEYLAUKN9UhbNCSUNg2JRyEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-igcIy931O1--2zioapYaIA-1; Thu, 27 May 2021 02:08:46 -0400
X-MC-Unique: igcIy931O1--2zioapYaIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A49CB801106;
 Thu, 27 May 2021 06:08:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-76.ams2.redhat.com [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD80859465;
 Thu, 27 May 2021 06:08:37 +0000 (UTC)
Subject: Re: [PATCH 8/9] gitlab-ci: Run Avocado tests manually (except
 mainstream CI)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-9-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <82b13c0f-0997-30b8-199f-d07fb4c2f2eb@redhat.com>
Date: Thu, 27 May 2021 08:08:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525082556.4011380-9-f4bug@amsat.org>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/2021 10.25, Philippe Mathieu-Daudé wrote:
> Due to a design problem and misunderstanding between the Avocado
> framework and QEMU, Avocado is fetching many asset artifacts it
> shouldn't be fetching, exhausting the jobs CI timeout.
> 
> Since Avocado artifacts are cached, this is not an issue with old
> forks, which already have populated the cache and do not need to
> download new artifacts to run the tests.
> 
> However this is very confusing to new contributors who start to
> fork the project and keep having failing CI pipelines.
> 
> As a temporary kludge, add the QEMU_CI_AVOCADO_TESTING variable
> to allow old forks to keep running the Avocado tests, while still
> allowing new forks to use the mainstream set of CI tests.

This definitely needs to be documented in docs/devel/testing.rst ... could 
you please come up with a patch that describes this variable for newbies there?

  Thanks,
   Thomas


