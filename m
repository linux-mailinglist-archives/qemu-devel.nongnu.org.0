Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4A458597
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 18:49:37 +0100 (CET)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moqy8-0008VW-3j
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 12:49:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1moqwb-0006c6-T5
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 12:48:01 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:57315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1moqwZ-0004JQ-GB
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 12:48:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 03456CCF7754;
 Sun, 21 Nov 2021 18:47:48 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 18:47:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005113c1d5c-2ac7-4e53-b8f0-9ce6301d0393,
 1156FC4F069D656200E265E011AD1BB380E978CC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
Date: Sun, 21 Nov 2021 18:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 35/35] test/tcg/ppc64le: Add float reference files
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211119160502.17432-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 61f0f863-7ab3-4c87-8472-eba672916860
X-Ovh-Tracer-Id: 9674857900689492899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgedvgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.022,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/19/21 17:05, Richard Henderson wrote:
> Generated on Power9, PowerNV 9006-22P.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/ppc64le/float_convs.ref | 748 +++++++++++++++++++++++++++++
>   tests/tcg/ppc64le/float_madds.ref | 768 ++++++++++++++++++++++++++++++
>   2 files changed, 1516 insertions(+)
>   create mode 100644 tests/tcg/ppc64le/float_convs.ref
>   create mode 100644 tests/tcg/ppc64le/float_madds.ref
> 
> diff --git a/tests/tcg/ppc64le/float_convs.ref b/tests/tcg/ppc64le/float_convs.ref
> new file mode 100644
> index 0000000000..6e6f636834
> --- /dev/null
> +++ b/tests/tcg/ppc64le/float_convs.ref
> @@ -0,0 +1,748 @@
> +### Rounding to nearest
> +from single: f32(-nan:0xffa00000)
> +  to double: f64(-nan:0x00fff4000000000000) (OK)
> +   to int32: -2147483648 (INVALID)
> +   to int64: -9223372036854775808 (INVALID)
> +  to uint32: 0 (INVALID)
> +  to uint64: 0 (INVALID)


I am getting an error with this test. See below.

C.




make[2]: Leaving directory '/home/legoater/work/qemu/qemu-ppc-7.0.git/build/tests/tcg/ppc64le-linux-user'
(cd tests/tcg/ppc64le-linux-user && make -f ../Makefile.target TARGET="ppc64le-linux-user" SRC_PATH="/home/legoater/work/qemu/qemu-ppc-7.0.git" SPEED=quick run)
make[2]: Entering directory '/home/legoater/work/qemu/qemu-ppc-7.0.git/build/tests/tcg/ppc64le-linux-user'
timeout --foreground 15  /home/legoater/work/qemu/qemu-ppc-7.0.git/build/qemu-ppc64le  float_convs > float_convs.out
diff -q float_convs.out /home/legoater/work/qemu/qemu-ppc-7.0.git/tests/tcg/ppc64le/float_convs.ref || (diff -u float_convs.out /home/legoater/work/qemu/qemu-ppc-7.0.git/tests/tcg/ppc64le/float_convs.ref | head -n 10 && false)
Files float_convs.out and /home/legoater/work/qemu/qemu-ppc-7.0.git/tests/tcg/ppc64le/float_convs.ref differ
--- float_convs.out	2021-11-21 12:39:33.911946974 -0500
+++ /home/legoater/work/qemu/qemu-ppc-7.0.git/tests/tcg/ppc64le/float_convs.ref	2021-11-21 09:43:12.946774006 -0500
@@ -1,6 +1,6 @@
  ### Rounding to nearest
  from single: f32(-nan:0xffa00000)
-  to double: f64(-nan:0x00fff4000000000000) (INVALID)
+  to double: f64(-nan:0x00fff4000000000000) (OK)
     to int32: -2147483648 (INVALID)
     to int64: -9223372036854775808 (INVALID)
    to uint32: 0 (INVALID)



