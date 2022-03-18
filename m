Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68EE4DDBCA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:38:08 +0100 (CET)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDjz-0007ic-9J
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:38:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nVDip-00071A-U1
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:36:56 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nVDim-0006D0-0H
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 10:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=IZy/8coWTA94d5/gp2JeT2u/FMJ6AHnwPIOjkrOHXb8=; b=m5jpcXXbI4d7KRkAbCVLICep+z
 3hFXpqBBLpiCiWPlor9S4JQvUeCR7RG9gFH3P8XvgkEdzgDWZgVWtgaZkwHrt6y21b0TwGw8mO1FD
 co75XveL1cbz7G875FFXOq3V8F0Ixu2s84VEBQ7YAvYdupy9RPrnM92sNaFwBT01IaG8MfHn1gMt2
 uXAFRBpETQcCEGu7NzC3u1rASMmj9ATZdRY9Y/i/a9Tv+eFf4hl38l/HeZwVP3lChKM48hAvTxjeH
 LR49cfEKqx2KWBZ60vcOQYa//2ykg7Gp4uowbAe4xWMl52wDp5SYagGzGYJTkHpA/CINAP8/T4KV0
 73Ow1rBnqJ/t3sC3WhBHcFhEwOSz2RdhN+wydCggFqA6+rubat+epjbT0/Dk5Hs9A6fqu9atKYPJh
 OyWf3MR625VeSUc/6f/iHKdg/SOkdudX4o/AxKBgErlVY+MDhC2i+bzP1bSicRP9jqkNvxIPnBzJw
 l5D1S/fnoTIARldTngD4vrWssWNO6VX8vUgFKe7nChmOknwTFt/7qao8Dxiwpit0Eh9n9bLVOHutD
 XicN1BoAD3L58oBi9ZRigUAk22tM1AyAXcPIw3CSa+hv7XrLrS/Pv5Wa6g4tPaCZYlHyLDwA14fgc
 991OlffASPd/uL1K2w+r7CzMF/vNDWsU8HG75Ltr4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] gitattributes: Cover Objective-C source files
Date: Fri, 18 Mar 2022 15:36:45 +0100
Message-ID: <2528763.O0PJEcRQa9@silver>
In-Reply-To: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
References: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Donnerstag, 17. M=E4rz 2022 14:03:26 CET Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> See comments in commit 29cf16db23 ("buildsys: Help git-diff
> adding .gitattributes config file") for details.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  .gitattributes | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/.gitattributes b/.gitattributes
> index 07f430e944..a217cb7bfe 100644
> --- a/.gitattributes
> +++ b/.gitattributes
> @@ -1,3 +1,4 @@
>  *.c.inc         diff=3Dc
>  *.h.inc         diff=3Dc
> +*.m             diff=3Dobjc
>  *.py            diff=3Dpython



