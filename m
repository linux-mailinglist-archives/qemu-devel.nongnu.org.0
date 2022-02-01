Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03BE4A6780
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:03:29 +0100 (CET)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1FI-0000kL-Nd
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:03:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nExRA-0004bn-HJ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:59:29 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:51849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nExR8-0005CZ-DX
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:59:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5C4AD221CC;
 Tue,  1 Feb 2022 17:59:14 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 18:59:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010d974c86-d670-4402-a4e4-88e33808c793,
 FC28BB27814F05D37416E671BAFA2F1ED858982E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4dda34d4-a84c-183c-52e7-dd996bb610f8@kaod.org>
Date: Tue, 1 Feb 2022 18:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: "make check-acceptance" takes way too long
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
 <20220201112720.4ac9b8df@elisabeth> <87wnieygjp.fsf@linaro.org>
 <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a60d5bf-78a2-4593-8c4a-4a2f8a6060be
X-Ovh-Tracer-Id: 8426797853916302328
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgeefgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefano Brivio <sbrivio@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 17:01, Cleber Rosa wrote:
> On Tue, Feb 1, 2022 at 6:25 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> We have up to now tried really hard as a project to avoid building and
>> hosting our own binaries to avoid theoretical* GPL compliance issues.
>> This is why we've ended up relying so much on distros to build and host
>> binaries we can use. Most QEMU developers have their own personal zoo of
>> kernels and userspaces which they use for testing. I use custom kernels
>> with a buildroot user space in initramfs for example. We even use the
>> qemu advent calendar for a number of our avocado tests but we basically
>> push responsibility for GPL compliance to the individual developers in
>> that case.
>>
>> *theoretical in so far I suspect most people would be happy with a
>> reference to an upstream repo/commit and .config even if that is not to
>> the letter of the "offer of source code" required for true compliance.
>>
> 
> Yes, it'd be fine (great, really!) if a lightweight distro (or
> kernels/initrd) were to
> be maintained and identified as an "official" QEMU pick.  Putting the binaries
> in the source tree though, brings all sorts of compliance issues.

FWIW, before avocado, I am using linux+buildroot images for PPC
and running a simple "boot-net-login-poweroff" script for each
machine/CPU QEMU can test :


ref405ep : Linux /init login DONE (PASSED)
bamboo : Linux /init net login DONE (PASSED)
sam460ex : Linux Linux /init net login DONE (PASSED)
g3beige-604 : FW Linux Linux /init net login DONE (PASSED)
g3beige-g3 : FW Linux Linux /init net login DONE (PASSED)
mac99-g4 : FW Linux Linux /init net login DONE (PASSED)
mac99-7447 : FW Linux Linux /init net login DONE (PASSED)
mac99-7448 : FW Linux Linux /init net login DONE (PASSED)
mac99-7450 : FW Linux Linux /init net login DONE (PASSED)
mpc8544ds : Linux /init net login DONE (PASSED)
e500mc : Linux /init net login DONE (PASSED)
40p : FW login DONE (PASSED) # this one is a special case
e5500 : Linux /init net login DONE (PASSED)
e6500 : Linux /init net login DONE (PASSED)
g5-32 : FW Linux Linux /init net login DONE (PASSED)
g5-64 : FW Linux Linux /init net login DONE (PASSED)
pseries-970 : FW Linux Linux /init net login DONE (PASSED)
pseries-970mp : FW Linux Linux /init net login DONE (PASSED)
pseries-POWER5+ : FW Linux Linux /init net login DONE (PASSED)
pseries : FW Linux Linux /init net login DONE (PASSED)
pseriesle8 : FW Linux Linux /init net login DONE (PASSED)
pseriesle9 : FW Linux Linux /init net login DONE (PASSED)
pseriesle10 : FW Linux Linux /init net login DONE (PASSED)
powernv8 : FW Linux /init net login DONE (PASSED)
powernv9 : FW Linux /init net login DONE (PASSED)

Images are here :

   https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot

Buildroot has a testsuite using QEMU and they have been nice enough
to take new QEMU boards for PPC.

Thanks,

C.


> 
> The downloading of the images at test "setup time" is still a better approach,
> given that tests will simply skip if the download is not possible.
> 
> - Cleber.
> 
> 


