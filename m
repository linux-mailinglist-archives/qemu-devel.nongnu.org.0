Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0223B686
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 10:11:29 +0200 (CEST)
Received: from localhost ([::1]:39156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2s2j-0002zj-00
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 04:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k2s22-0002Ze-1N
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 04:10:46 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37066
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k2s20-0006So-7p
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 04:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596528642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=dZjcRrlxjk/pqOxTXP6hI8EPt8L2x4b4CywjYkj9U5s=;
 b=gBYNCJ8Tl50fhY4D48OSdD1mxm8P+bEYYZiQs5HRfgSoOZHXtkHdB7ORHpT/nYA/2kel5P
 UQWsxxEtPLVlIVogoXbqbBrwuZRONaVz8Lk2CbYyFF5+H2PIH04vHgrIvjJsckPPiF50+q
 6ar1Pe70hILWE8ngFtFFKWk484B5AAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-D8F5Dw_POfecqQ8Hg1WmBQ-1; Tue, 04 Aug 2020 04:10:39 -0400
X-MC-Unique: D8F5Dw_POfecqQ8Hg1WmBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9141F8015F3;
 Tue,  4 Aug 2020 08:10:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7117F10013C4;
 Tue,  4 Aug 2020 08:10:33 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] testing: Build WHPX enabled binaries
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190920113329.16787-1-philmd@redhat.com>
 <01f2f0ee-a288-921a-58f4-78aeb4d457e1@redhat.com>
 <BYAPR21MB1208F0D09B3E5CA80F1B7C3BB6880@BYAPR21MB1208.namprd21.prod.outlook.com>
 <2acf854f-c49a-0811-31af-80e1e958f058@redhat.com>
 <324f5002-be0a-563e-b5a6-e08ee5e1ddad@redhat.com>
 <SN4PR2101MB0880AF5A5D752F06DB94A15FC04E0@SN4PR2101MB0880.namprd21.prod.outlook.com>
 <b8afd626-b6ae-d6fa-c8b7-5e5778574c07@redhat.com>
 <82fa39b2-676c-e8c5-72c6-53123983dcda@weilnetz.de>
 <55002560-9741-1e71-85f9-e75d9f0f3bfc@weilnetz.de>
 <fde8dd22-679a-be5e-b36e-d8aeb7e955cc@redhat.com>
 <58f5c48c-cf85-ae2a-ce28-510520c2ae75@weilnetz.de>
 <1eae7ba1-47a2-29f3-9425-aa9d8f617106@redhat.com>
 <7cdc7066-0477-5f8b-9d22-12de97098cfc@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5261de23-cbf9-fa90-bcd3-ad8fe213297d@redhat.com>
Date: Tue, 4 Aug 2020 10:10:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7cdc7066-0477-5f8b-9d22-12de97098cfc@weilnetz.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:01:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "1879672@bugs.launchpad.net" <1879672@bugs.launchpad.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/08/2020 09.42, Stefan Weil wrote:
> Am 04.08.20 um 09:23 schrieb Philippe Mathieu-Daudé:
> 
>> On 8/4/20 8:55 AM, Stefan Weil wrote:
>>> Am 04.08.20 um 08:43 schrieb Thomas Huth:
>>>
>>>> On 03/08/2020 22.25, Stefan Weil wrote:
>>>>> We can add a CI pipeline on Microsoft infrastructure by using a GitHub
>>>>> action.
>>>> Sorry for being ignorant, but how does that solve the legal questions
>>>> just because it is running on GitHub instead of a different CI?
>>>>
>>>>  Thomas
>>>>
>>> Sorry, I though that would be clear by looking at the included shell script.
>>>
>>> The build does not use the Microsoft SDK. It gets the required header
>>> files from Mingw-w64. They added them in git master.

Great, thanks for the clarification!

>> Oh, so we can do that with GitLab too now, we don't need to rely on the
>> GitHub 'Actions' CI in particular, right?
> 
> That's right. The build script was written for Ubuntu, so depending on
> the distribution used for GitLab CI it will need some modifications. If
> GitLab already has a recent Mingw-w64, it might be sufficient to fix the
> case of the header file names. Mingw-w64 uses winhvplatform.h while QEMU
> expects WinHvPlatform.h and so on. I used symbolic links to add the
> camel case filenames.

I'm currently working on a patch series for our gitlab-CI that uses our
containers to all possible kinds of cross-compiler builds (basically the
ones that we are doing on shippable.com so far), including the 32-bit
and 64-bit MinGW cross-compilation jobs. I can have a look whether I can
integrate these headers there!

 Thanks,
  Thomas


