Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F307839077C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:24:51 +0200 (CEST)
Received: from localhost ([::1]:54626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llanT-0002UQ-1A
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llakS-0006sm-2R
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llakO-0002JY-Pe
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621963299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlQy93pBIcJWyyYaal+ZHm82FzcXxMHLPPs5ov3TNQw=;
 b=i4Xkj/PBdpRHz1tL2lyRxcX5B4ViE+LS3wnsYbqPfkqQeZN6JSs0Pe4BNtpqnSjfRtmDc+
 f0byB/jLQLDwLGxzz01gZvBeOsPexGk6RTDkIOH8bObt2T1qSgPiEVifWujIKNd1rINuPf
 2Q1lRBB2LcTe/goXqZ8o4kJWoF0Dtdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-kIAw0aY3N1CZELR3x3U4tg-1; Tue, 25 May 2021 13:21:37 -0400
X-MC-Unique: kIAw0aY3N1CZELR3x3U4tg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F1911007481;
 Tue, 25 May 2021 17:21:36 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5805060CCF;
 Tue, 25 May 2021 17:21:26 +0000 (UTC)
Subject: Re: [PATCH v6 18/25] python/qemu: add isort to pipenv
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-19-jsnow@redhat.com>
 <YK0eIsUzQho7zEcA@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <b2ac6611-30d0-0a4b-26e8-8bf0fd7bbe7c@redhat.com>
Date: Tue, 25 May 2021 13:21:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK0eIsUzQho7zEcA@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 11:56 AM, Cleber Rosa wrote:
> On Wed, May 12, 2021 at 07:12:34PM -0400, John Snow wrote:
>> isort 5.0.0 through 5.0.4 has a bug that causes it to misinterpret
>> certain "from ..." clauses that are not related to imports.
>>
>> isort < 5.1.1 has a bug where it does not handle comments near import
>> statements correctly.
>>
>> Require 5.1.2 or greater.
>>
>> isort can be run with 'isort -c qemu' from the python root.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/Pipfile      | 1 +
>>   python/Pipfile.lock | 4 ++--
>>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 

Thanks. I have also updated the commit message a little bit:

isort can be run (in "check" mode) with 'isort -c qemu' from the python
root. isort can also be used to fix/rewrite import order automatically
by using 'isort qemu'.

--js


