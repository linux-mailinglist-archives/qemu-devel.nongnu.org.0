Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577541CECF9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 08:23:47 +0200 (CEST)
Received: from localhost ([::1]:57300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYOKQ-0002sq-Do
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 02:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jYOIn-0001YO-RF
 for qemu-devel@nongnu.org; Tue, 12 May 2020 02:22:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37562
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jYOIn-0004IR-2U
 for qemu-devel@nongnu.org; Tue, 12 May 2020 02:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589264522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=1HQTdxjBEpGIyjgdIPCiV/6/3iE1I9+2al6dRVoDtNw=;
 b=QbI6zitWUFRGi3q8mXA3ptiZZ6Xv1wrG5ZKgaWYFgHZCO6DBzO+HUFe7D+w4I40mABwrOD
 lCkuhwNtv86nIR7ETd4icHwiGzr3HmPsZU1g6DR9vofP60Ti1bMBNXiRu5cttS2YGGCwxS
 VxNLq7W0E6ow5yCwMADxt85iZdmkTTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-F76wCez3P4KaVVy4JzzVJQ-1; Tue, 12 May 2020 02:20:13 -0400
X-MC-Unique: F76wCez3P4KaVVy4JzzVJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 348CFA0C01;
 Tue, 12 May 2020 06:20:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-112.ams2.redhat.com [10.36.112.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2A35D9DD;
 Tue, 12 May 2020 06:20:06 +0000 (UTC)
Subject: Re: [PATCH v2] tests/acceptance: Add a test for the canon-a1100
 machine
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200129090420.13954-1-thuth@redhat.com>
 <a967c93c-58b2-9a8d-02fe-e7fc9e833827@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <55becaae-cde0-3fcb-dd81-ece1dcb68113@redhat.com>
Date: Tue, 12 May 2020 08:20:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a967c93c-58b2-9a8d-02fe-e7fc9e833827@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:02:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/02/2020 17.59, Thomas Huth wrote:
> On 29/01/2020 10.04, Thomas Huth wrote:
>> The canon-a1100 machine can be used with the Barebox firmware. The
>> QEMU Advent Calendar 2018 features a pre-compiled image which we
>> can use for testing.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  v2:
>>  - Rename file and add class docstring to please pylint
>>  - Add entry to MAINTAINERS
>>  - Add :avocado: tags=device:pflash_cfi02
>>
>>  MAINTAINERS                                |  1 +
>>  tests/acceptance/machine_arm_canona1100.py | 35 ++++++++++++++++++++++
>>  2 files changed, 36 insertions(+)
>>  create mode 100644 tests/acceptance/machine_arm_canona1100.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index efd3f3875f..ddf6fe0794 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -561,6 +561,7 @@ S: Odd Fixes
>>  F: include/hw/arm/digic.h
>>  F: hw/*/digic*
>>  F: include/hw/*/digic*
>> +F: tests/acceptance/machine_arm_canona1100.py
> [...]
> 
>  Hi Peter,
> 
> could you maybe take this patch through your ARM tree?

Ping?

 Thomas


