Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B9E4CF3F3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:50:19 +0100 (CET)
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR94M-0006j4-AC
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:50:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nR91b-0005KE-NC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:47:27 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:60575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nR91Z-0008EV-NG
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:47:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.72])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 00F9022EF9;
 Mon,  7 Mar 2022 08:47:20 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Mar
 2022 09:47:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001129ed34a-d942-44d1-9c12-0313df79c79f,
 2E53EE1553C3E30B03D111E4FD0BE5C715152E82) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <04d9a7d9-13c7-ee86-96c1-90bf8cf9173f@kaod.org>
Date: Mon, 7 Mar 2022 09:47:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] avocado/replay_kernel.py: make tcg-icount check in
 run_vm()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220303153517.168943-1-danielhb413@gmail.com>
 <20220303153517.168943-6-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220303153517.168943-6-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cde634ad-838c-4b35-b71a-caa7b8358c1c
X-Ovh-Tracer-Id: 14310187817156184937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddufedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdfhheeiueeuleduffehhfejtdehvdefgeeugeelueeuheelfeevgeffiefgudenucffohhmrghinhepfhgvughorhgrphhrohhjvggtthdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgrvhgvlhdrughovhhgrghluhhksehishhprhgrshdrrhhu
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, crosa@redhat.com, qemu-ppc@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 16:35, Daniel Henrique Barboza wrote:
> The icount framework relies on TCG availability. If QEMU is built with
> --disable-tcg we won't have icount either, and then this test will fail
> with the following message in an IBM POWER9 host:
> 
> tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_pseries:
> ERROR: ConnectError: Failed to establish session:
> (...)
> /11-tests_avocado_replay_kernel.py_ReplayKernelNormal.test_ppc64_pseries/replay.bin:
> cannot configure icount, TCG support not available
> 
> Although this was revealed in a specific ppc64 scenario, the TCG check
> is being done in the common code inside run_vm() because all archs need
> TCG to have access to icount.
> 
> Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Pavel,

Should I take this patch through the ppc tree ?

Thanks,

C.


> ---
>   tests/avocado/replay_kernel.py | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index c68a953730..0b2b0dc692 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -36,6 +36,9 @@ class ReplayKernelBase(LinuxKernelTest):
>   
>       def run_vm(self, kernel_path, kernel_command_line, console_pattern,
>                  record, shift, args, replay_path):
> +        # icount requires TCG to be available
> +        self.require_accelerator('tcg')
> +
>           logger = logging.getLogger('replay')
>           start_time = time.time()
>           vm = self.get_vm()
> @@ -243,6 +246,7 @@ def test_ppc64_pseries(self):
>           """
>           :avocado: tags=arch:ppc64
>           :avocado: tags=machine:pseries
> +        :avocado: tags=accel:tcg
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive'
>                         '/fedora-secondary/releases/29/Everything/ppc64le/os'


