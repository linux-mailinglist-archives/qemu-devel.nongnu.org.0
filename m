Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7E2B808D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:32:02 +0100 (CET)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPRB-0004Rd-9q
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kfPNR-0001My-UW
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:28:09 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kfPNO-00039d-Bh
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:28:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A4E9A6D17AFA;
 Wed, 18 Nov 2020 16:28:03 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 18 Nov
 2020 16:28:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0062d76ae6c-04ef-4811-ac45-eb4b05d86270,
 350A0944D80A876CE3CDBF7AB1DB3CAFAF2C6382) smtp.auth=clg@kaod.org
Subject: Re: [EXTERNAL] [PULL 0/1] ppc-for-5.2 patch queue 2020-11-18
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20201118152639.173860-1-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e26cd2e3-1052-d922-1ca4-10217e90c858@kaod.org>
Date: Wed, 18 Nov 2020 16:28:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118152639.173860-1-groug@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b2bf3909-0d5e-4d81-8374-3d04a7bfae04
X-Ovh-Tracer-Id: 4432386462347332576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefhedgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfelueevgfetheehvdejkedvjeelteduudelleekiedtfeejgedtfedtfeelieegnecuffhomhgrihhnpehprhhoohhfphhoihhnthdrtghomhdpqhgvmhhurdhgihhtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 10:28:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please use clg@kaod.org when possible.

C.


On 11/18/20 4:26 PM, Greg Kurz wrote:
> The following changes since commit 66a300a107ec286725bdc943601cbd4247b82158:
> 
>   Update version for v5.2.0-rc2 release (2020-11-17 22:58:10 +0000)
> 
> are available in the Git repository at:
> 
>   https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_gkurz_qemu.git&d=DwIFaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=XHJsZhhuWSw9713Fp0ciew&m=ilve0kNoChzHfoHYAB7_bffdpkMBVkgrbnU6-3ZtvQg&s=eZqPNVdcEjvBh8rHafjWev1i_XseP5xmNXrsyFKiIrU&e=  tags/ppc-for-5.2-20201118
> 
> for you to fetch changes up to 6d24795ee7e3199d199d3c415312c93382ad1807:
> 
>   Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU contexts" (2020-11-18 11:05:56 +0100)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2020-11-18
> 
> This fixes a regression that badly breaks some guest setups because
> IPIs end up misconfigured in the XIVE interrupt controller. Hopefully,
> the last fix for sPAPR. I'm sending this PR with the blessing of David
> who is currently on holidays.
> 
> ----------------------------------------------------------------
> Greg Kurz (1):
>       Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU contexts"
> 
>  hw/intc/spapr_xive_kvm.c | 102 +++++++++--------------------------------------
>  1 file changed, 18 insertions(+), 84 deletions(-)
> 


