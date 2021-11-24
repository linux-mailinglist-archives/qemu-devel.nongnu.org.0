Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4066545B749
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:20:39 +0100 (CET)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoSD-0005pp-D1
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mpoP9-0002wH-M7
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:17:27 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:47423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mpoP7-0002yH-6N
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:17:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6BC092009E;
 Wed, 24 Nov 2021 09:17:22 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 24 Nov
 2021 10:17:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003df09a814-94db-4c56-8fc0-38e78abb91bb,
 91DCD1862618CD88E95BCEF119A98FE4AA8C2BE1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <85b4d164-548c-a411-0dbc-d06b842a8baf@kaod.org>
Date: Wed, 24 Nov 2021 10:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 35/35] test/tcg/ppc64le: Add float reference files
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-36-richard.henderson@linaro.org>
 <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
 <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
 <45a736de-efe4-1638-65c7-28764c93248a@linaro.org>
 <673145cf-f64c-2520-3ed5-dae2a16704e7@kaod.org>
 <333b8968-bdfd-bd79-51d7-edaba09e5e92@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <333b8968-bdfd-bd79-51d7-edaba09e5e92@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 852db89d-85b3-4df3-b9f0-c5a24d93d917
X-Ovh-Tracer-Id: 225742932629687203
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeekgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 14:14, Richard Henderson wrote:
> On 11/22/21 2:04 PM, Cédric Le Goater wrote:
>>> But this alone of course causes other "failures", because we've got some incorrect reference files.
>>
>> Looks fine. Will you send this patch independently ?
> 
> Yes.
> 
>> The patchset doesn't seem to break anything.
> 
> You may not have docker cross-compilers enabled.
> The hexagon reference files have incorrect contents.
> I'll pursue an update with Taylor.


I do now. That was not an easy task. All seem fine with a x86/RH9
but I am having issues building the images on power9/ubuntu21.10.

centos8 fails with :
   #6 41.69 Error: Unable to find a match: libpmem-devel spice-server-devel

and some others with :

   #5 3.433  builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
   #5 3.433                   Depends: gcc-alpha-linux-gnu but it is not installable
   #5 3.256 E: Unable to locate package gcc-hppa-linux-gnu

Is that expected ?


Also I am seeing this issue on RH9 when running gdb tests :

   TEST    basic gdbstub support
warning: Remote gdbserver does not support determining executable automatically.
RHEL <=6.8 and <=7.2 versions of gdbserver do not support such automatic executable detection.
The following versions of gdbserver support it:
- Upstream version of gdbserver (unsupported) 7.10 or later
- Red Hat Developer Toolset (DTS) version of gdbserver from DTS 4.0 or later (only on x86_64)
- RHEL-7.3 versions of gdbserver (on any architecture)

I will dig that one. May be it's from the gdb of RH.

Thanks,

C.

