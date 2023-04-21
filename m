Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70826EAACB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:49:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqBx-0001ay-VB; Fri, 21 Apr 2023 08:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppqBw-0001aM-0n
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:48:44 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppqBu-0004oU-5n
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:48:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 493D42016D;
 Fri, 21 Apr 2023 12:48:38 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 14:48:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b49bc248-54ee-465a-999c-ec4c2d040d37,
 7111A4B1C16D83D618E44FD4B545295E183D9861) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2c2a359b-15eb-48c1-2a2c-edf34b83e9d6@kaod.org>
Date: Fri, 21 Apr 2023 14:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] tests/avocado: Make ssh_command_output_contains()
 globally available
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Cleber Rosa
 <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, <qemu-arm@nongnu.org>
References: <20230421110345.1294131-1-thuth@redhat.com>
 <20230421110345.1294131-2-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230421110345.1294131-2-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 58fd5c0b-8843-4a0f-9cba-52011bc8c984
X-Ovh-Tracer-Id: 9666413650748214124
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvg
 epshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/21/23 13:03, Thomas Huth wrote:
> This function will be useful in other tests, too, so move it to the
> core LinuxSSHMixIn class.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   tests/avocado/avocado_qemu/__init__.py | 8 ++++++++
>   tests/avocado/linux_ssh_mips_malta.py  | 8 --------
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index cb71f50db9..6788837e1b 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -431,6 +431,14 @@ def ssh_command(self, command):
>                            f'Guest command failed: {command}')
>           return stdout_lines, stderr_lines
>   
> +    def ssh_command_output_contains(self, cmd, exp):
> +        stdout, _ = self.ssh_command(cmd)
> +        for line in stdout:
> +            if exp in line:
> +                break
> +        else:
> +            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
> +
>   class LinuxDistro:
>       """Represents a Linux distribution
>   
> diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
> index 0179d8a6ca..d9bb525ad9 100644
> --- a/tests/avocado/linux_ssh_mips_malta.py
> +++ b/tests/avocado/linux_ssh_mips_malta.py
> @@ -101,14 +101,6 @@ def shutdown_via_ssh(self):
>           self.ssh_disconnect_vm()
>           wait_for_console_pattern(self, 'Power down', 'Oops')
>   
> -    def ssh_command_output_contains(self, cmd, exp):
> -        stdout, _ = self.ssh_command(cmd)
> -        for line in stdout:
> -            if exp in line:
> -                break
> -        else:
> -            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
> -
>       def run_common_commands(self, wordsize):
>           self.ssh_command_output_contains(
>               'cat /proc/cpuinfo',


