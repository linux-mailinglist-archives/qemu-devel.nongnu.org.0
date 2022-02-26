Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE44C551C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 11:18:30 +0100 (CET)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNu9l-00011n-56
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 05:18:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nNu7n-0008Ez-EF
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 05:16:27 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:47059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nNu7l-0004Sw-P1
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 05:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=gOzJKdiOoHOYqVuLDI9nRn1vA616RuC/oIXoxs2HOOc=; b=QoR0jMflNZ0hGJUcjY6ZP/S1mK
 nlGGKAmELO9t5q65u4TB2bjub142/cegioCAHgxGMCgNywxRRcerLdYGHW7GHOWRknn7ofwmcC8cX
 O5XftifRU+x9mBhDjEKprfhwlUC0IKUIeX3soZAR4bNOfOZ+ksNM4zAYI4z8ZhIaj1MLH1UHmKlJX
 XVabWSSGYuOBXVUmoUWM4RpXaMdTAe4dxIHh35AE8jULX4LsczSVTIXs1RnrqBHcDvWh1vGmvtJbD
 XS0xHI7yT+d8zsSBMlCEDE2dwomzsBtvz4fl+6aC9QyYtlQjlUQE0R5xZ6nNcTPwBI1AqBywLk7Io
 AP7tdIr+5uwMllaHeINu+O2fh6m1jwmJC1uVEXMLl/QAvlIPDzePAIMVAmpOm1TJMNxtmdwmTJwui
 BWW1Rbo2N2tDlc3+6sxlYQ+BaaFqUZveL/2fYb+5byfu+ZuQ+Ax2p8C5rE2mteQHEJgTY/N0ghj4P
 CydDWFaRiUC8cdZocR7UpfGTsM96jBNcansR7VGXiJRCKmJIpdt5alPUb/Hi9PcYcyzUZzJDVnhPW
 X9yW77o5of//gsGFTaUkGDzKEPoj4k3VOOzmSrDFptzRC9qruBdXavr3M7MpsgTykHdi/OGnq4Pl0
 sSuqI//C+bo8Fb09vqfN0DB4mahwQMJ6n3HG7BYh0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] coreaudio: Notify error in coreaudio_init_out
Date: Sat, 26 Feb 2022 11:16:22 +0100
Message-ID: <4536903.fTDxs23YJo@silver>
In-Reply-To: <20220226100248.26847-1-akihiko.odaki@gmail.com>
References: <20220226100248.26847-1-akihiko.odaki@gmail.com>
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

On Samstag, 26. Februar 2022 11:02:48 CET Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  audio/coreaudio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e507..d7cfdcc4fc4 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -604,6 +604,8 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct
> audsettings *as, coreaudio_playback_logerr(status,
>                                        "Could not remove voice property
> change listener\n"); }
> +
> +        return -1;
>      }
> 
>      return 0;

Is this a pure theoretical fix, or does it actually fix an actually 
encountered misbehaviour? I don't see any explanation in the commit log. I 
mean the branch here is about removing a listener only.

Best regards,
Christian Schoenebeck



