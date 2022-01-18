Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F093C4925B9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:32:07 +0100 (CET)
Received: from localhost ([::1]:40820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9neh-0004M4-0g
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:32:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9nES-0006Cf-Km
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:05:03 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:44037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9nEI-0005tW-VX
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:04:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 01CEB20C59;
 Tue, 18 Jan 2022 12:03:41 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 13:03:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006fd418b5c-6346-47ff-82ac-f4a6c233e98e,
 78124C4340FA50D00486B2609A05927D7A7C6ABE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <67ae7c4e-f4d4-dbbc-a565-a8c7b7aed334@kaod.org>
Date: Tue, 18 Jan 2022 13:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] rSTify ppc-spapr-hotplug.txt
Content-Language: en-US
To: <lagarcia@linux.ibm.com>, <qemu-ppc@nongnu.org>
References: <cover.1641995057.git.lagarcia@br.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <cover.1641995057.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 262dcbda-8a6b-4628-9345-5a7e870a9aa6
X-Ovh-Tracer-Id: 12438097749633764259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeduveegjeevlefhueefveekvdelkeeijeejudevvdehvdeigedvheetvdevledtteenucffohhmrghinhepthigthdrughotghspdhrshhtrdhlihhnkhdprhhsthdrughotghsnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhgrghgrrhgtihgrsegsrhdrihgsmhdrtghomh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 14:52, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> This patch series depend on previously sent patch "docs: Clarification
> and formatting changes in ppc docs." which is already included in latest
> pull request from Cédric.
> 
> It is important to notice that I focused mainly in the layout of the
> document, and not so much on the content. My understanding is that some
> sections, such as Hot plug/unplug events and Hot plug/unplug event
> structure may need updates based on what I saw in the code, but I don't
> have the expertise today to rewrite these sections. Hopefully someone
> will be able to update them.
> 
> Leonardo Garcia (3):
>    docs: rSTify ppc-spapr-hotplug.txt.
>    docs: Rename ppc-spapr-hotplug.txt to ppc-spapr-hotplug.rst.
>    Link new ppc-spapr-hotplug.rst file to pseries.rst.
> 
>   docs/specs/ppc-spapr-hotplug.rst | 510 +++++++++++++++++++++++++++++++
>   docs/specs/ppc-spapr-hotplug.txt | 409 -------------------------
>   docs/system/ppc/pseries.rst      |   2 +-
>   3 files changed, 511 insertions(+), 410 deletions(-)
>   create mode 100644 docs/specs/ppc-spapr-hotplug.rst
>   delete mode 100644 docs/specs/ppc-spapr-hotplug.txt
> 


Applied to ppc-7.0

Thanks,

C.


