Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506E43414EA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 06:35:37 +0100 (CET)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN7nL-0002qc-Dt
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 01:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lN7mJ-0002RO-Sk
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 01:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lN7mH-0004JV-GQ
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 01:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616132067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFW4Tw9cktEvNvAZsPMrK6nyEKevHXSx36YMSSBRHLs=;
 b=UT3u9+/7eRK4Yw5jynmBDHGWiJ9x0nJEFi1FkPLLyFhMcXTbmUrTLKo4/lH94dIBuKfdw7
 U4nWPsn5Q4Jh2ttde8Isd9MuX8wORgk6qwHeqiwdJZiwWkQwlxQkalYTfpBrKb9X9yLWmg
 /txQwOoEnjw6p1rSMEOYnKD4CdaEnBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-eddXrzoEMImI8OEQn_a84Q-1; Fri, 19 Mar 2021 01:34:25 -0400
X-MC-Unique: eddXrzoEMImI8OEQn_a84Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E52107ACCD;
 Fri, 19 Mar 2021 05:34:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B095360C13;
 Fri, 19 Mar 2021 05:34:19 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFMegwL6SXX2/+kZ@redhat.com>
 <8c804b8a-fc98-0619-21e5-cc5dfe7d4567@amsat.org>
 <71126451-6901-6a20-c1c4-8aee71eb874e@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <611f044b-0c46-a6b4-d66e-05b0a87db137@redhat.com>
Date: Fri, 19 Mar 2021 06:34:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <71126451-6901-6a20-c1c4-8aee71eb874e@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/2021 11.28, Philippe Mathieu-Daudé wrote:
> On 3/18/21 10:50 AM, Philippe Mathieu-Daudé wrote:
>> On 3/18/21 10:33 AM, Daniel P. Berrangé wrote:
[...]
>>> It feels like what you hit here is fallout from your account accidentally
>>> getting blocked, rather than something which is hitting every contributor
>>> to QEMU. Did they restore projects as private perhaps ?
>>
>> Yes my repository was restored as private and I had to switch it to
>> public. I'll try to blew everything (after backing it up) and recreate
>> it as public from start, and see if I get the unlimited minutes back.
> 
> You were right, I forked the project again as public and can run CI
> pipelines. I note this is different that my previous account, I am
> restricted at 15 jobs at a time, so this is slower.

That's not related to your new account. It's a new behaviour that gitlab 
introduced for everybody using the shared runners recently. At least it's 
happening for me, too. I sometimes even only get 5 jobs running at the same 
time, but sometimes also more, I think ... it likely depends on the day and 
the amount of free runners.

Anyway, I think we should try to somehow decrease the amount of 
shared-runner jobs in our CI again. It's grown too big. Some long-running 
jobs should maybe be moved to a dedicated runner instead... Cleber, where 
are we with the custom runners? Any news here?

  Thomas


