Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF26F974F5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 10:31:08 +0200 (CEST)
Received: from localhost ([::1]:45280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0M1L-0005xL-Li
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 04:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0M06-0004pu-KR
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0M05-0000Ca-G3
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:29:50 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:51399)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0M05-0000C8-7L; Wed, 21 Aug 2019 04:29:49 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Macaw-1iY37I0avi-00c6fc; Wed, 21 Aug 2019 10:29:30 +0200
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20190708204909.10891-1-marcandre.lureau@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6a282568-ec94-2270-c72a-34658acaba8b@vivier.eu>
Date: Wed, 21 Aug 2019 10:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190708204909.10891-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nZdYq6pQN+uCUVKJAX5vp99mjjQu9ZHKbN0uvSXZOB0qr2K1Jfp
 Rj6I47yZ9gtQNd9mQLEQ/Bnbpbt31gRTEZtB9J5fK3fIDCRqMVnQtsd8esj4H10YSgTtLFM
 W82MfWMCAlYqct+uB+/hEUX5HaXsmp7o8Tj3zteJoBFCS4kQF9DsrAQWrSL2DdXpxVYmaaV
 lxncSjlBU65p5B/MJxl/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PT73seJAjQU=:YT4jMXZ4sbdntkzUoqX3iq
 fWp7ZRCmOgkRd1oeuJSz9W67ge9vwej3QzbFJ1GTIt37JWQuUgu9em2c5wmSqr5ml7rXKtRel
 REmuDdbxmaSSAk5FvesgplCBBvCYHNLJfTeqjW2UpHuIBd3yJpW9PMO0mXFtiQpd1dDmxsiaw
 hRUpRX5utLScx12fZsl7E0LRQiuXtRDLmDrU04scA6hlvkuF2JbfphX2DDsCa2tZ/G6YwU6D+
 jzOB+15rGBwbJ0Ml/uaAtFqSsQwfa+4jRubDwSRpRGl6irsi+Tv66rI8c31nd+H4SBPPZkuWj
 ZUnnzDLU0F5QEYjWXQCQma2m7unikqutuJ59ZQQrdGBdKaYZNNkftweae2rVw2ciwdB2JtrvO
 8OPOh3bYqplLPK5gL58hj+mP06qGU5RYWSPCgfJUdDop0C43yhGnaYw33ZLIfUakBCqeMK7jv
 ZymNuUaD1f3dNu+sF257eVhDaE02GQajP5/mmE9xSjBnydHlhw8txKFgbA5NgRaFV0FgaaiTK
 iU+7flHYgWA45x3mmlltaSumheOI+vxtuKMpWgS4c8F/DQovjNrCNXsPiEWXV4Qy30pAaPkPc
 mECymElLJAXxCem4XhLgnokaRQ1dIrN/D529jn7CT6qZ8AD0YVo0SgcPi6l5ew1nLJErkzGyg
 /QLiIEdOd7NL7V4iYl5caBDM1J12/Y+3YTa70EKwaJYGgHXifm4cOCr+R5GgpPxkYhtdFcntk
 ybDjs8nhe+v52wo2k6v7PXMAowgw4AEtlb3NwSkL1kSjfMLfGBGKNQFAVoc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] misc: fix naming scheme of
 compatiblity arrays
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2019 à 22:49, Marc-André Lureau a écrit :
> Since merge 31ed41889e6e13699871040fe089a2884dca46cb ("Merge
> remote-tracking branch
> 'remotes/elmarco/tags/machine-props-pull-request' into staging"), the
> compat arrays are in lowercase.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/devel/migration.rst | 2 +-
>  hw/i386/pc_piix.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 220059679a..f7668ae389 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -314,7 +314,7 @@ For example:
>  
>     a) Add a new property using ``DEFINE_PROP_BOOL`` - e.g. support-foo and
>        default it to true.
> -   b) Add an entry to the ``HW_COMPAT_`` for the previous version that sets
> +   b) Add an entry to the ``hw_compat_`` for the previous version that sets
>        the property to false.
>     c) Add a static bool  support_foo function that tests the property.
>     d) Add a subsection with a .needed set to the support_foo function
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index c2280c72ef..6a0e29de7c 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -313,7 +313,7 @@ else {
>   * pc_compat_*() functions that run on machine-init time and
>   * change global QEMU state are deprecated. Please don't create
>   * one, and implement any pc-*-2.4 (and newer) compat code in
> - * HW_COMPAT_*, PC_COMPAT_*, or * pc_*_machine_options().
> + * hw_compat_*, pc_compat_*, or * pc_*_machine_options().
>   */
>  
>  static void pc_compat_2_3_fn(MachineState *machine)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

