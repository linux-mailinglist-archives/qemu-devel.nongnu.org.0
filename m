Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A13C8B21
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:42:37 +0200 (CEST)
Received: from localhost ([::1]:36538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jq8-0005I8-83
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3jo1-0003nL-Ma
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:40:26 -0400
Received: from relay64.bu.edu ([128.197.228.104]:55388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3jnw-0006Uj-Rz
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:40:24 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 16EIdQ79012489
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 14 Jul 2021 14:39:29 -0400
Date: Wed, 14 Jul 2021 14:39:26 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 19/21] contrib/gitdm: add an explicit academic entry
 for BU
Message-ID: <20210714183926.x7zw7fpqf65v6a6a@mozz.bu.edu>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-20-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210714182056.25888-20-alex.bennee@linaro.org>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210714 1920, Alex Bennée wrote:
> For some reason Alexander's contributions were not getting grouped
> from the plain "edu" mapping.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks!

> Message-Id: <20210714093638.21077-20-alex.bennee@linaro.org>
> ---
>  contrib/gitdm/group-map-academics | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/contrib/gitdm/group-map-academics b/contrib/gitdm/group-map-academics
> index bf3c894821..44745ca85b 100644
> --- a/contrib/gitdm/group-map-academics
> +++ b/contrib/gitdm/group-map-academics
> @@ -16,3 +16,6 @@ cota@braap.org
>  uni-paderborn.de
>  edu
>  edu.cn
> +
> +# Boston University
> +bu.edu
> -- 
> 2.20.1
> 

