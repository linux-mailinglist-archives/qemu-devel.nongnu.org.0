Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1194B4689
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 10:51:50 +0100 (CET)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJY1M-00071g-Qk
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 04:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJXzK-000560-3U
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:49:42 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:41337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nJXzI-00015b-LQ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=UQkX2VTcq/uwqmrMUe3bl99bQhJ1biyAO+lVUALqmbo=; b=mF1C4orsWfiZWjtZXqwM20OepO
 hh4xyaGUnFHl92mUz9PEq5baHjFS9SBg+6TZCIANCNRDJa21U9njiAAxo+YTtm9etmhSDfbgZnCdr
 QW8q+Ec793DYBRCLU6ulU9dfw6mWRguRBp7suPyleJ+URzPpzfUfmqUzupxvetSWkZYn7Eua0M4ei
 IrYWHzsweEVGRYW9jLQEgs5iPCbbYMG7/Royyp4KdbggxIsBsvmL03nDz2DVPC+wynmLcGPtgLcxi
 lMPcVq6O76WqV39viCigkt8xU8r3Paff+sw0V1JH1jwa5TKnUN/i61g23aLE4F4EbTUSNsxz5b9eu
 OWpoS7R+MvxIt6Iee3fiLGGSUGZQuwbrEdXu2XllAyaRfN0jerlpXY5kwX3Zu54721G10gGERdnn9
 aS0P+3uIS8WoRza3gvN2MwcW4MiGj6MRnb6u+iO2ks/6OhGKCn79q0Oq9rubcG1ryrnF2iWnNZEON
 J1A+QRXRXKvy3aO964scd39yyiBN7Vwg4JcSJRFKNmbTIjOzs4FEQVwpJSDN1mvcyV/h5Gi2aaNaS
 mFQXTueBJl8zqhVHL12TcZEXXhr8RfXi0BWOxMnuSZjbDpccwj1RjtJtNhIUlpcLCqPsaB/n8iI9Y
 ZOMGf0YXH5rZn38U3TdomneTDwnN/PIeFl/O8IkWk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add Akihiko Odaki to macOS-relateds
Date: Mon, 14 Feb 2022 10:49:37 +0100
Message-ID: <3808910.lSymqgtrkx@silver>
In-Reply-To: <20220213021215.1974-1-akihiko.odaki@gmail.com>
References: <20220213021215.1974-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sonntag, 13. Februar 2022 03:12:15 CET Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fd74c46426..5aefb5b431a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2333,6 +2333,7 @@ F: audio/alsaaudio.c
>  Core Audio framework backend
>  M: Gerd Hoffmann <kraxel@redhat.com>
>  R: Christian Schoenebeck <qemu_oss@crudebyte.com>
> +R: Akihiko Odaki <akihiko.odaki@gmail.com>
>  S: Odd Fixes
>  F: audio/coreaudio.c
> 
> @@ -2585,6 +2586,7 @@ F: util/drm.c
> 
>  Cocoa graphics
>  M: Peter Maydell <peter.maydell@linaro.org>
> +R: Akihiko Odaki <akihiko.odaki@gmail.com>
>  S: Odd Fixes
>  F: ui/cocoa.m

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>




