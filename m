Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F52DC51B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:12:51 +0100 (CET)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaM6-0004pi-El
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kpa8A-00049m-5G
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:58:26 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58648
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kpa87-0003lg-Nw
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:58:25 -0500
Received: from host86-191-183-22.range86-191.btcentralplus.com
 ([86.191.183.22] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kpa81-0000o5-Bu; Wed, 16 Dec 2020 16:58:21 +0000
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201216141653.213980-1-berrange@redhat.com>
 <CAFEAcA_QnRHEefC5sjDRc4V6GvxTn96wDf-b7gyg5wSRoJ7nmQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <87c9771a-a6fb-cdaf-e26e-9c723ec08b8f@ilande.co.uk>
Date: Wed, 16 Dec 2020 16:58:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_QnRHEefC5sjDRc4V6GvxTn96wDf-b7gyg5wSRoJ7nmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.191.183.22
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] tests: update for rename of CentOS8 PowerTools repo
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/2020 16:10, Peter Maydell wrote:

> On Wed, 16 Dec 2020 at 14:21, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> This was intentionally renamed recently to be all lowercase:
>>
>> https://bugs.centos.org/view.php?id=17920
>> https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_and_repoid_changes
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>
>> This needs to be merged asap, as CI will break for anyone whose branch
>> triggers a rebuild of the centos container image.
>>
>> eg current broken git master:
>>
>>    https://gitlab.com/berrange/qemu/-/jobs/915852165
>>
>> vs with this fix
>>
>>    https://gitlab.com/berrange/qemu/-/jobs/915862731
>>
>>   tests/docker/dockerfiles/centos8.docker | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
>> index 54bc6d54cd..06b67962fd 100644
>> --- a/tests/docker/dockerfiles/centos8.docker
>> +++ b/tests/docker/dockerfiles/centos8.docker
>> @@ -31,6 +31,6 @@ ENV PACKAGES \
>>       zlib-devel
>>
>>   RUN dnf install -y dnf-plugins-core && \
>> -  dnf config-manager --set-enabled PowerTools && \
>> +  dnf config-manager --set-enabled powertools && \
>>     dnf install -y $PACKAGES
>>   RUN rpm -q $PACKAGES | sort > /packages.txt
> 
> I tried a test merge of this but it fails in Gitlab CI:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/916041167
> 
> #6 7.706 Error: No matching repo to modify: powertools.
> #6 ERROR: executor failed running [/bin/sh -c dnf install -y
> dnf-plugins-core && dnf config-manager --set-enabled powertools && dnf
> install -y $PACKAGES]: exit code: 1

That's odd. Could it be that gitlab is still caching the old image here?


ATB,

Mark.

