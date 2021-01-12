Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44A52F291F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:46:13 +0100 (CET)
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzENZ-0008B9-0X
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzEM4-0007d5-Qh
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:44:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzEM3-00018h-28
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610437477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WEUrCm7bWN2t/dPIgq/T4nUcvIZX15X8lK0AQyV82s=;
 b=TlVQcFtgSCE+3oyO+rL21EcGTaP/427TwfhXzZhbut6NZlOmPHOhEbVKyWAiBcNwWti6pN
 VvqVW+8t4v8xyZVoBMHGNb9nWApEjBjaMjTSMk3mmQ3POFa34q+Qd6biZDSaBQm1tr8p+Z
 UAL/bHYDnwcYZS+VYkKiCLPfe3j0Y2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-03A-J8ztO1a9aXbFuum2og-1; Tue, 12 Jan 2021 02:44:35 -0500
X-MC-Unique: 03A-J8ztO1a9aXbFuum2og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05C47107ACF7;
 Tue, 12 Jan 2021 07:44:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE8013A47;
 Tue, 12 Jan 2021 07:44:32 +0000 (UTC)
Subject: Re: [PULL v2 00/15] Testing, CI and bsd-user patches
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210111140602.159377-1-thuth@redhat.com>
 <c3ff4be3-0962-8566-10aa-b2adb4304937@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9090fd04-d8e9-08d1-0a6d-790ebbcae486@redhat.com>
Date: Tue, 12 Jan 2021 08:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c3ff4be3-0962-8566-10aa-b2adb4304937@redhat.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 15.40, Philippe Mathieu-Daudé wrote:
> On 1/11/21 3:06 PM, Thomas Huth wrote:
>> The following changes since commit 7b09f127738ae3d0e71716cea086fc8f847a5686:
>>
>>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210108' into staging (2021-01-08 15:37:04 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-11v2
>>
>> for you to fetch changes up to b677001d70529df271a5d9314440bb201da40acf:
>>
>>    fuzz: map all BARs and enable PCI devices (2021-01-11 14:59:21 +0100)
>>
>> ----------------------------------------------------------------
>> * Fuzzer improvements
>> * Add OpenSUSE leap to the gitlab-CI
>> * Some fixes to get our CI "green" again
>> * Some initial patches to update bsd-user
>> ----------------------------------------------------------------
> 
> Doh, missed the Shippable-CI job reduction :/
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771079.html

I don't have a shippable-CI account, so I can't test that one. I hope Alex 
can pick that up.

  Thomas


