Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB254C9170
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 18:24:02 +0100 (CET)
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6EC-0002A0-Og
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 12:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nP6Cu-0001Kk-Eq; Tue, 01 Mar 2022 12:22:40 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:56483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nP6Cs-0005nH-K8; Tue, 01 Mar 2022 12:22:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A2F6F206E2;
 Tue,  1 Mar 2022 17:22:35 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Mar
 2022 18:22:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004cfcdb029-7e98-47a6-9672-e80f8e1e0632,
 24806437EA66095D5A0A0E3C988328111B43E697) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <fa775186-3c9f-166b-86ad-beddd2079d9a@kaod.org>
Date: Tue, 1 Mar 2022 18:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] configure: Fix building on a ppc64 host with Clang
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Thomas Huth <thuth@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20220301132754.1483837-1-thuth@redhat.com>
 <5753847b-0269-e461-7d46-5e4f6b2090de@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5753847b-0269-e461-7d46-5e4f6b2090de@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bb41951f-3b19-4410-b4b6-4eb5f0b3d867
X-Ovh-Tracer-Id: 6222567314230840172
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfeghfelveegffdvgeehgefhgfevleekjeejffevueetffekhfekveekteehheffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmrghthhgvuhhsrdhfvghrshhtsegvlhguohhrrgguohdrohhrghdrsghr
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, matheus.ferst@eldorado.org.br,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/22 15:59, Philippe Mathieu-Daudé wrote:
> On 1/3/22 14:27, Thomas Huth wrote:
>> Clang only supports the -mlittle-endian and -mbig-endian switches,
>> and not -mlittle / -mbig. Since GCC supports both, let's use the
>> long versions that are supported by both instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   configure | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index c56ed53ee3..81618708e4 100755
>> --- a/configure
>> +++ b/configure
>> @@ -630,10 +630,10 @@ case "$cpu" in
>>     ppc)
>>       CPU_CFLAGS="-m32" ;;
>>     ppc64)
>> -    CPU_CFLAGS="-m64 -mbig" ;;
>> +    CPU_CFLAGS="-m64 -mbig-endian" ;;
>>     ppc64le)
>>       cpu="ppc64"
>> -    CPU_CFLAGS="-m64 -mlittle" ;;
>> +    CPU_CFLAGS="-m64 -mlittle-endian" ;;
>>     s390)
>>       CPU_CFLAGS="-m31" ;;
> 
> Mirek sent a similar fix, but it was pending Matheus TCG fixes:
> 
> https://lore.kernel.org/qemu-devel/20220131091714.4825-1-mrezanin@redhat.com/
> https://lists.gnu.org/archive/html/qemu-ppc/2022-02/msg00116.html

Yes.

I kept it for later because I understood there were still problems
with clang. May be I am wrong. Matheus ?

Thanks,

C.

