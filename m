Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC4636947
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 19:51:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxuoX-0001eC-Vb; Wed, 23 Nov 2022 13:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oxuoW-0001db-59
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 13:49:40 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oxuoT-0004Ss-6N
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 13:49:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 781E8210F5;
 Wed, 23 Nov 2022 18:49:24 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 23 Nov
 2022 19:49:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0017854b4ad-0608-4a79-871c-3f8552342898,
 044850B998F460D31CAC33A40C0E65C93B21D494) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f12c4b6f-8125-696c-5699-802ccc7c5f39@kaod.org>
Date: Wed, 23 Nov 2022 19:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com> <87fse9bvmf.fsf@linaro.org>
 <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 40afb719-2d1c-496b-92f2-2cb4d557dc39
X-Ovh-Tracer-Id: 7724799263469112111
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeivdffueeuveduhffgheegtdekvdeihfegvefgieejhfejffevfeehffeuveekjeenucffohhmrghinhepkhgvrhhnvghltghirdhorhhgpdhinhhsthgvrggurdgtihdpughonhgvrdhnohifpdhlihhnrghrohdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrg
 esrhgvughhrghtrdgtohhmpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/23/22 19:13, Philippe Mathieu-Daudé wrote:
> On 23/11/22 15:12, Alex Bennée wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>> On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
>>>> On 18/11/22 12:33, Alex Bennée wrote:
>>>>> The old URL wasn't stable. I suspect the current URL will only be
>>>>> stable for a few months so maybe we need another strategy for hosting
>>>>> rootfs snapshots?
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> ---
>>>>>    tests/avocado/boot_linux_console.py | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/tests/avocado/boot_linux_console.py
>>>>> b/tests/avocado/boot_linux_console.py
>>>>> index 4c9d551f47..5a2923c423 100644
>>>>> --- a/tests/avocado/boot_linux_console.py
>>>>> +++ b/tests/avocado/boot_linux_console.py
>>>>> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>>>>>            dtb_path =
>>>>> '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>>>>>            dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>>>            rootfs_url =
>>>>> ('http://storage.kernelci.org/images/rootfs/buildroot/'
>>>>> -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
>>>>> -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
>>>>> +                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
>>>>> +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
>>>> If Avocado doesn't find an artifact in its local cache, it will fetch it
>>>> from the URL.
>>>> The cache might be populated with artifacts previously downloaded, but
>>>> their URL is not valid anymore (my case for many tests).
>>>> We can also add artifacts manually, see [1].
>>>> I'd rather keep pre-existing tests if possible, to test older
>>>> (kernel / user-space) images. We don't need to run all the tests all
>>>> the time:
>>>> tests can be filtered by tags (see [2]).
>>>> My preference here is to refactor this test, adding the
>>>> "kci-2019.02"
>>>> and "baseline-20221116.0" releases. I can prepare the patch if you /
>>>> Thomas don't object.
>>>
>>> IMHO we shouldn't keep tests in the upstream git repository where the
>>> binaries are not available in public anymore. They won't get run by
>>> new contributors anymore, and also could vanish from the disks of the
>>> people who previously downloaded it, once they wipe their cache or
>>> upgrade to a new installation, so the test code will sooner or later
>>> be bitrotting. But if you want to keep the tests around on your hard
>>> disk, you could also stick the test in a local branch on your hard
>>> disk instead.
>>
>> CI/Workstation splits aside I tend to agree with Thomas here that having
>> tests no one else can run will lead to an accretion of broken tests.
> 
> Following this idea, should we remove all boards for which no open
> source & GPL software is available? I.e:
> 
> 40p                  IBM RS/6000 7020 (40p)

This machine can run debian :

   qemu-system-ppc -M 40p -cpu 604 -nic user -hda ./prep.qcow2 -cdrom ./zImage.hdd -serial mon:stdio -nographic
   
   >> =============================================================
   >> OpenBIOS 1.1 [Mar 7 2022 23:07]
   >> Configuration device id QEMU version 1 machine id 0
   >> CPUs: 0
   >> Memory: 128M
   >> UUID: 00000000-0000-0000-0000-000000000000
   >> CPU type PowerPC,604
   milliseconds isn't unique.
   Welcome to OpenBIOS v1.1 built on Mar 7 2022 23:07
   Trying hd:,\\:tbxi...
   >> Not a bootable ELF image
   >> switching to new context:
   loaded at:     04000400 04015218
   relocated to:  00800000 00814E18
   board data at: 07C9E870 07CA527C
   relocated to:  0080B130 00811B3C
   zimage at:     0400B400 0411DC98
   avail ram:     00400000 00800000
   
   Linux/PPC load: console=/dev/ttyS0,9600 console=tty0 ether=5,0x210,eth0 ether=11,0x300,eth1 ramdisk_size=8192 root=/dev/sda3
   Uncompressing Linux................................................done.
   Now booting the kernel
   
   Debian GNU/Linux 3.0 6015 ttyS0
   
   6015 login:

Please keep it ! :)

and it also boots AIX 4.4/5.1 (with 2 small patches) but that's clearly
not open source. It is downloadable from the net though, like many macos
PPC images.

That said, we might have been putting too much in avocado and it takes
ages to run (when it does not hit some random python issue).


> akita                Sharp SL-C1000 (Akita) PDA (PXA270)
> midway               Calxeda Midway (ECX-2000)
> terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
> tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
> 
>> Given the tests themselves are standalone couldn't the prospective test
>> hoarder keep their own personal repository to be run with the rest of the
>> in-tree code, something like:
>>
>>    cd my/test/zoo/repo
>>    $(QEMU_BUILD)/tests/venv/bin/avocado run my_test_zoo.py
>>
>> for convenience we could maybe support an env variable so the existing
>> test selection tags would work:
>>
>>    set -x QEMU_AVOCADO_EXTRA_TESTS /my/test/zoo/repo
>>    ./tests/venv/bin/avocado list
>>    ...
>>    <list all tests in qemu src tree and extra>
>>    ...
>>
>> ?
> 
> Yes, this is what we use to test the Fuloong2E:
> 
> $ git grep RESCUE_YL_PATH tests/avocado/
> tests/avocado/machine_mips_fuloong2e.py:21: @skipUnless(os.getenv('RESCUE_YL_PATH'), 'RESCUE_YL_PATH not available')
> tests/avocado/machine_mips_fuloong2e.py:34:        kernel_path = self.fetch_asset('file://' + os.getenv('RESCUE_YL_PATH'),
> 
> The firmware is not open source / GPL but if you have a Fuloong2E board
> you can dump it from the flash, then use it to test QEMU from hard reset
> up to userland. Otherwise you are forced to use the -kernel argument.
> 
>>> The other possibility is to upload the binaries to a new public
>>> location in the web ... but for software that contains GPLed software,
>>> you should then also make sure to provide the source code to comply
>>> with the license.
>>
>> This is the traditional reason we've lent so hard on external hosting
>> for binaries because the upstream doesn't want the hassle of maintaining
>> that sort of zoo of binaries. That said we have tests where binaries are
>> served from fileserver.linaro.org but its then only my problem to deal
>> with GPL requirements and not the upstream.
> 
> Maybe we are discussing 2 different topics. I am in possession of
> old Solaris installation CDROMs and could boot some of them with
> qemu-system-sparc. I want to automatize my testing, and wrote Avocado
> scripts doing that. I suppose other QEMU users have similar CDROMs.
> If I contribute my tests, they can run them. Isn't it in the interest
> of the community to have such examples and tests available?

I think so.

Is it time to move some of the tests (and images) in an external tree ?
That would be one way to keep them available for all. I like qemu-zoo.

It would certainly require some legal advice.
  

C.


> 
> Regards,
> 
> Phil.
> 


