Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C7528614
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:56:00 +0200 (CEST)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbCY-0002FK-Nx
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqb87-0001TX-V9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:51:23 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqb85-0007RO-HT
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:51:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2CABD2621C;
 Mon, 16 May 2022 13:51:17 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 15:51:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0062fc95aee-1932-4d73-8eed-cb6be73ce4ef,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b89bb57d-bf00-806c-52e6-9e55c24257a8@kaod.org>
Date: Mon, 16 May 2022 15:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>
CC: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 43a4fd21-5de8-42ee-8210-fa8f66b84860
X-Ovh-Tracer-Id: 6256625783632530354
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghlvggrlhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 14:43, Peter Maydell wrote:
> We've made pretty good progress on transitioning our pre-merge CI
> from running ad-hoc on machines the person doing the merge has access to
> to all CI being driven by the Gitlab CI infrastructure. For this (7.1) release
> cycle I think ideally we should try to get rid of the last few bits
> of ad-hoc CI so that for 7.2 we are using only the gitlab CI. (This
> will help in handing over merge request management to Stefan for 7.2.)
> 
> I think the last setups I have been using ad-hoc scripting for are:
> 
> (1) PPC64 big-endian Linux
> (2) NetBSD (x86)
> (3) OpenBSD (x86)
> 
> I think we can get away with just dropping ppc64be -- we have
> coverage for it as a cross-compile setup, and hopefully the
> s390x CI runner will catch the various "fails tests on big-endian host"
> issues. (Alternatively if anybody has a ppc64be machine they'd like
> to let us run a gitlab CI runner on, we could do that :-))

No recent HW (P8 and above) would run a PPC64 BE distro if LE is
supported by HW.
  
The only BE-only HW would be a G5 (970) or a P7 (with OPAL).
These are really scarce now and I doubt they would be accessible
for external jobs.

The simplest would be to run a pseries KVM guest or PowerVM LPAR
with a debian sid, which still supports BE. Where is the question.

C.

> 
> For the BSDs, the ad-hoc CI is just running the tests/vm
> "make vm-build-netbsd" etc. Is there some way we can get
> coverage of this into the gitlab CI setup? (I think we
> have FreeBSD via Cirrus CI, so I have not listed that one.)
> 
> thanks
> -- PMM
> 


