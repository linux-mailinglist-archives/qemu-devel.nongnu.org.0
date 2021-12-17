Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C84792E9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 18:33:25 +0100 (CET)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myH6i-0000o3-BS
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 12:33:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1myH5M-0008IY-Dn
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:32:00 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:37373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1myH5J-0005vO-BF
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:31:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id CBA0A22168;
 Fri, 17 Dec 2021 17:31:45 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 17 Dec
 2021 18:31:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001b63ad3b2-82e5-4b2d-8480-17ec926568f3,
 277755725B32849AD4052F723BD6C67625B53A02) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3087991f-eade-b170-9183-23d8541eeae8@kaod.org>
Date: Fri, 17 Dec 2021 18:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL v2 000/101] ppc queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211216202614.414266-1-clg@kaod.org>
 <cf2bd3a9-007a-5881-efb8-9e6195958030@linaro.org>
 <655a7bc0-2063-55ed-9b68-9704db2af3cd@kaod.org>
 <7fb240a9-194d-7e13-a806-f1847c7220f3@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <7fb240a9-194d-7e13-a806-f1847c7220f3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a57ce2d5-86ef-4791-a585-dca2d10a6f06
X-Ovh-Tracer-Id: 14519886674810407904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 18:24, Richard Henderson wrote:
> On 12/17/21 8:46 AM, Cédric Le Goater wrote:
>> On 12/17/21 17:33, Richard Henderson wrote:
>>> Different docs failure:
>>>
>>> Warning, treated as error:
>>> /tmp/qemu-test/src/docs/system/ppc/pseries.rst:241:Unexpected indentation.
>>>
>>> You can test this yourself with
>>>
>>> make docker-test-build@ubuntu1804 TARGET_LIST=i386-softmmu
>>
>> hmm, I will be more careful with documentation patches in the future.
>>
>> How should I send a v3 without resending all patches ?
> 
>  From the question, I assume you're using git publish... I'm not sure how to do so directly with that tool.

no. I am using the make-pullreq script from Peter which does all the work
to generate the emails and also prepares the git branch for you to pull.

I think I found the last problem and the only change is :

$ git diff ppc-next ppc-7.0
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index 72e315eff628..56f5942e13f6 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -235,4 +235,4 @@ Maintainer contact information
  
  Cédric Le Goater <clg@kaod.org>
  
-Daniel Henrique Barboza <danielhb413@gmail.com>
+Daniel Henrique Barboza <danielhb413@gmail.com>
\ No newline at end of file


> Maybe you can generate the email text with --inspect-emails, and then send only the cover letter manually with git send-email.

That's what I wanted to do: only send the cover letter. Is that ok ?

Thanks,

C.


> 
> The by-hand process is
> 
>    git format-patch --subject-prefix=PULL --cover-letter master
>    git request-pull master <url> <tag> >> 0000-*
>    <edit cover-letter>
>    git send-email --to=... --cc=... 0000-*
> 
> 
> r~


