Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1E1ED952
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 01:36:36 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgcvz-0005ZG-9n
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 19:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1jgcvC-00051r-SU
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 19:35:46 -0400
Received: from nwk-aaemail-lapp02.apple.com ([17.151.62.67]:36184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1jgcvA-0003xa-VI
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 19:35:46 -0400
Received: from pps.filterd (nwk-aaemail-lapp02.apple.com [127.0.0.1])
 by nwk-aaemail-lapp02.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 053NWT1O057034; Wed, 3 Jun 2020 16:35:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=20180706;
 bh=0iOqBzqlhTGWKLogUgRVsqb4mhv1vIEwp8ul2FZSTZs=;
 b=Op36rk1n9I+DE3qW5b0V2izCMhrEYPI3rEgM3cc0VRAoebCdK5SeBtXS696Cxa1VH9WG
 X7WSGkJJcSjqNpTdXg1e1sLDeMn0UnoSyDkL0IaJCaLtnV/JmNHwabahwYTsYdcd/Fjk
 Q5mKMJoePjIlwwVh5fhWHtn8s9cKCmBaO2Ehxt6lgFRxqTGE6+c30196YXFP4vIVj7xq
 OGDlKMeuKPcxsxb7CArNa021AyjQ7Ky+RTe55hd0tF4/oQKFu3J8l9WBAi5KbOgD0Dba
 87RQQwdWDv4EaVCkNoxJ49+lGKa5Gv9FYooZ3DAYDanUmuGfOeUtyJgeRjxAeHPrFXk4 3Q== 
Received: from rn-mailsvcp-mta-lapp03.rno.apple.com
 (rn-mailsvcp-mta-lapp03.rno.apple.com [10.225.203.151])
 by nwk-aaemail-lapp02.apple.com with ESMTP id 31bm2ha1xw-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Wed, 03 Jun 2020 16:35:41 -0700
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.5.20200312 64bit (built Mar 12
 2020)) with ESMTPS id <0QBD00E83IVHQUA0@rn-mailsvcp-mta-lapp03.rno.apple.com>; 
 Wed, 03 Jun 2020 16:35:41 -0700 (PDT)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.5.20200312 64bit (built Mar 12
 2020)) id <0QBD01000IJTE500@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Wed,
 03 Jun 2020 16:35:41 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 03d135aff901d50442fb2d9d3706d6fe
X-Va-E-CD: f350a4ef44a49b58b1eab37e9679856c
X-Va-R-CD: c0504145951f2811758d946b1d63f13c
X-Va-CD: 0
X-Va-ID: 9b0dc579-b843-47d7-b2d1-74c1fdab7a12
X-V-A: 
X-V-T-CD: 03d135aff901d50442fb2d9d3706d6fe
X-V-E-CD: f350a4ef44a49b58b1eab37e9679856c
X-V-R-CD: c0504145951f2811758d946b1d63f13c
X-V-CD: 0
X-V-ID: 11fc7dbc-1cd1-4839-9bad-aa6bdfc7b7c0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
Received: from [17.234.60.254] (unknown [17.234.60.254])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.5.20200312 64bit (built Mar 12
 2020))
 with ESMTPSA id <0QBD00XCJIVGU000@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Wed,
 03 Jun 2020 16:35:41 -0700 (PDT)
Content-type: text/plain; charset=utf-8
MIME-version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 04/11] sysemu/hvf: Only declare hvf_allowed when HVF is
 available
From: Cameron Esfahani <dirty@apple.com>
In-reply-to: <20200509130910.26335-5-f4bug@amsat.org>
Date: Wed, 03 Jun 2020 16:35:40 -0700
Cc: Cameron Esfahani via <qemu-devel@nongnu.org>
Content-transfer-encoding: quoted-printable
Message-id: <EB7DD8A3-A8B6-4AC5-B5AA-48704763FAE9@apple.com>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-5-f4bug@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
Received-SPF: pass client-ip=17.151.62.67; envelope-from=dirty@apple.com;
 helo=nwk-aaemail-lapp02.apple.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 19:35:42
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit message typo tcg_allowed -> hvf_allowed.

If fixed:
Reviewed-by: Cameron Esfahani <dirty@apple.com>

Cameron Esfahani
dirty@apple.com

"You only live once, and the way I live, once is enough"

Frank Sinatra



> On May 9, 2020, at 6:09 AM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> When HVF is not available, the tcg_allowed variable does not exist.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> include/sysemu/hvf.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
> index d211e808e9..fe95743124 100644
> --- a/include/sysemu/hvf.h
> +++ b/include/sysemu/hvf.h
> @@ -18,7 +18,6 @@
> #include "exec/memory.h"
> #include "sysemu/accel.h"
>=20
> -extern bool hvf_allowed;
> #ifdef CONFIG_HVF
> #include <Hypervisor/hv.h>
> #include <Hypervisor/hv_vmx.h>
> @@ -26,11 +25,12 @@ extern bool hvf_allowed;
> #include "target/i386/cpu.h"
> uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
>                                  int reg);
> +extern bool hvf_allowed;
> #define hvf_enabled() (hvf_allowed)
> -#else
> +#else /* !CONFIG_HVF */
> #define hvf_enabled() 0
> #define hvf_get_supported_cpuid(func, idx, reg) 0
> -#endif
> +#endif /* !CONFIG_HVF */
>=20
> /* hvf_slot flags */
> #define HVF_SLOT_LOG (1 << 0)
> --=20
> 2.21.3
>=20
>=20


