Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F31564FE1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:41:38 +0200 (CEST)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8HeD-0004Ci-Fh
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8HcD-0003HE-4T
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:39:33 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:35109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8Hc9-0005EC-Vt
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:39:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8D33021DA5;
 Mon,  4 Jul 2022 08:39:22 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 4 Jul 2022
 10:39:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00449402aab-2ca5-4bb5-bd83-09df08a76224,
 37F03A08AC6718E95FD3DEE1BCAFFD005826E168) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9424bafe-0c77-8fa5-3ab2-4f3bec35ff6a@kaod.org>
Date: Mon, 4 Jul 2022 10:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] scripts/make-release: Do not include the skiboot
 sources in the tarball anymore
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Gerd Hoffmann
 <kraxel@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Daniel P .
 Berrange" <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 <qemu-ppc@nongnu.org>, <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>, 
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-3-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220704064254.18187-3-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 46f26c0a-aff0-4fac-a6d9-aab3b35b5890
X-Ovh-Tracer-Id: 12049943755605969735
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehledgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhihohhonhesnhgvthgsshgurdhorhhgpdfovfetjfhoshhtpehmohehgeek
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/22 08:42, Thomas Huth wrote:
> The skiboot sources are licensed under the Apache license, so we don't
> have to include them in our tarball as long as we continue to distribute
> the skiboot license information in our release tarball.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   scripts/make-release | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/make-release b/scripts/make-release
> index f79ed7a2ae..176304f30b 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -19,7 +19,6 @@ pushd ${destination}
>   git checkout "v${version}"
>   git submodule update --init
>   (cd roms/seabios && git describe --tags --long --dirty > .version)
> -(cd roms/skiboot && ./make_version.sh > .version)
>   
>   # Fetch edk2 submodule's submodules to get their license information.
>   # Edk2 is distributed under permissive licenses, so we don't have to
> @@ -48,6 +47,20 @@ https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
>   EOF
>   cd ../..
>   
> +# Same for skiboot - it has a permissive Apache license, so we don't
> +# need to ship the sources for this.
> +cd roms/skiboot
> +skibootrev=$(git rev-parse --short=12 HEAD)
> +head -n 38 libstb/tss2/ibmtpm20tss/utils/tss.c > LICENSE-tss.txt
> +head -n 50 libfdt/fdt.c > LICENSE-libfdt.txt
> +rm -r $(ls | grep -v LICEN) .[a-z]*
> +cat > sources.txt <<EOF
> +The skiboot sources can be downloaded from:
> +
> +https://github.com/open-power/skiboot/archive/${skibootrev}.tar.gz
> +EOF
> +cd ../..
> +
>   popd
>   tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
>   rm -rf ${destination}


