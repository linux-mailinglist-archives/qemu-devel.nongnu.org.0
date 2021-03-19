Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BC9341EDA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:54:27 +0100 (CET)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFa6-0001ZD-QQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNFXx-0007zZ-QK; Fri, 19 Mar 2021 09:52:13 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:49055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNFXs-00010q-UC; Fri, 19 Mar 2021 09:52:13 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjPYI-1m7omR2RYI-00ktz1; Fri, 19 Mar 2021 14:52:01 +0100
Subject: Re: [PATCH v2 6/6] iotests: iothreads need ioeventfd
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-7-laurent@vivier.eu>
 <95209fe1-9b85-0eec-ace2-b3eff20ee88e@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b5e6476f-ae52-056b-8ac8-8a3d17118ca3@vivier.eu>
Date: Fri, 19 Mar 2021 14:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <95209fe1-9b85-0eec-ace2-b3eff20ee88e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QclmjX2bRUd9SZbugpE0WYHKKV7bdVV40LeJkXX2F2Wy7DXcdc+
 ZSpeigxs1+sP3KzZjlhC3VIdG1aQAdvKUQSs6t+b4cOD7Rb1hpXpTXEyivqKtFn7ZfqaSoe
 ly7p4peWD61xDURg0AdEfbrb/1INGPSOIyF1AMPIWtYnfq2WBlG47CHXaSx4+r4aZ8iW1rF
 ERefkZyd1/YtuMVzk/QUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gd5oo08wtJ0=:2taPA3zaKH8fMzsJxUW/wr
 BOVtx2bRdyfh9rGnZffdMWZZLwXmp01fUscb3seBS7cToQtEDcnBzaspEglMgjh6hsI0pR1PX
 pNkaKUepLszUNJcVpRbo7o1/ibPC0srnTO24Tbw66kMf0ngIRIpPU4CpyrMaGqPfT4cKibL0e
 YQhqXWkxUMt8kUePfb1gyaxM/0psUgUBHOFFly40ttgyNRELFdVBYdNjgWplcEVxA4SFBWXnw
 6bHFYTRmTt+U0/LehIOGhaDvx7OponA8KyqBCrA+LczwLnecHh8SDLAtAysh/zhkZvHXzSkuh
 OSMJuZKrSaHZWUwArsh7b40bL9k0eZekxyEuOMLYHxfi5VnPLIRX74Ia5aTHIDri57yHXf2sr
 NHbEcoBv5CMwDy6xWeR/EAjTYOSvbU7X+BZK2/70tAK/FGuFI9DyPGE3nlfXX
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2021 à 14:36, Philippe Mathieu-Daudé a écrit :
> On 3/19/21 2:25 PM, Laurent Vivier wrote:
>> And ioeventfd are only available with virtio-scsi-pci or virtio-scsi-ccw,
>> use the alias but add a rule to require virtio-scsi-pci or virtio-scsi-ccw
>> for the tests that use iothreads.
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  tests/qemu-iotests/127        | 3 ++-
>>  tests/qemu-iotests/256        | 6 ++++--
>>  tests/qemu-iotests/iotests.py | 5 +++++
>>  3 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
>> index 98e8e82a8210..abe24861100d 100755
>> --- a/tests/qemu-iotests/127
>> +++ b/tests/qemu-iotests/127
>> @@ -44,7 +44,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>>  _supported_fmt qcow2
>>  _supported_proto file fuse
>>  
>> -_require_devices virtio-scsi scsi-hd
>> +_require_devices scsi-hd
>> +_require_devices virtio-scsi-pci || _require_devices virtio-scsi-ccw

Re-reading the code, I think this cannot work because we have an "exit" if the test fails.

The test is executed anyway because s390x provides virtio-scsi-ccw and virtio-scsi-pci.

Thanks,
Laurent

