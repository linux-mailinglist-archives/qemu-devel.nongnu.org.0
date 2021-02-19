Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F269B31F74A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:27:35 +0100 (CET)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD30Z-0000v0-0h
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD2yz-000090-GM
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:25:57 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD2yx-0000eZ-R7
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:25:57 -0500
Received: by mail-ej1-x62f.google.com with SMTP id t11so11870297ejx.6
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=md+USsNJ9NWi3jTiD5DOvT/o/lZ2w6wR6QVsJUrZsr8=;
 b=AiXFF2nvoqoIbTOtTG+y2O++9NRoqGsTMVC9eLjGZp4IBeP32ipJ+qoCT84iTlC+w7
 9IkTndz+6SfNbVUH/SUrZpaOteix//2uBzVatgyWVn2GHz88+eRNjxPnVJqL6BW1mIxg
 1CYLL1CxzX6sKq9WYH9ZGFn2LsceCqUN5bP5tt/2YLLcsO5EcaQOIdOFdipLB8IXV3CW
 CmHfw1Ka0hFFnzKqcfuXBoh46OKa3pFMDeNB44rXqvIx+KJrPBlp1QqMkKV7EYDNsbpm
 NfksJg1aCT0srauApbX/TEuJ+I7J3nbR/gaK5pqKdriF8tZM9ecNNObQxdO0b3GNy79r
 vLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=md+USsNJ9NWi3jTiD5DOvT/o/lZ2w6wR6QVsJUrZsr8=;
 b=SXHjNPfTa6DZiOT5eR/I2UXiS2PqSDb6gosf3CpX8NXWOPcHsk7E0f7LWpW2305Oia
 5194XaVo9zzVzCD1Es/en5VgBjVRWRM8n3bS3AkYVuIQ0OGD6NtPwOncwQzP+7MhA7fN
 6DheqsylZijolEGXOg0JCXANXM6A/IeZZTF0il2OkUa7og9Itpm7hUZX9qUsYug2LNrX
 GkWS3A7b1M7qqR+Hu3lf1GRei7dLCZxtPImgRomrjZSYYSUv47qf8bdArEUheLIHTWTL
 9SKasAZ6aBmJUUOkdpCTlZhB726Rn+i3NZO4avs+eAIaroiON60tU0o4QbQbi5ESiGa+
 olfA==
X-Gm-Message-State: AOAM530+kb1+3uAbvPI56A/jwvNDa0DujI5tsEVWqrNRfeoNrjF1dvCt
 JSo/hbHkOgEUGmBh3hc1K7aviSYm18N2hYEkRrFSJQ==
X-Google-Smtp-Source: ABdhPJwjaNowtVkvTL3+IIHIDB7Ui/BxL90levHRG6nMtALIdquOCrJvuAtffgdIHgdlcmVgx3Yx8JtoV20sG0PGcPw=
X-Received: by 2002:a17:906:5357:: with SMTP id
 j23mr7996184ejo.407.1613730354155; 
 Fri, 19 Feb 2021 02:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20210219084518.90246-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210219084518.90246-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 10:25:43 +0000
Message-ID: <CAFEAcA9VGhEV=7YAEZQUdtukY=5Kfax9fmX_wj-UtjLN6JOfog@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Use kCGColorSpaceSRGB
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 08:45, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> kCGColorSpaceGenericRGB | Apple Developer Documentation
> https://developer.apple.com/documentation/coregraphics/kcgcolorspacegenericrgb
> > Deprecated
> > Use kCGColorSpaceSRGB instead.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  ui/cocoa.m | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 13fba8103e1..686fbb1b457 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -437,7 +437,7 @@ - (void) drawRect:(NSRect) rect
>              screen.bitsPerPixel, //bitsPerPixel
>              (screen.width * (screen.bitsPerComponent/2)), //bytesPerRow
>  #ifdef __LITTLE_ENDIAN__
> -            CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB), //colorspace for OS X >= 10.4
> +            CGColorSpaceCreateWithName(kCGColorSpaceSRGB), //colorspace for OS X >= 10.5
>              kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst,
>  #else
>              CGColorSpaceCreateDeviceRGB(), //colorspace for OS X < 10.4 (actually ppc)
> --

The comment change here looks a little odd, because previously
it was a matched pair with the one in the other half of the #ifdef:
one side is "for OS X >= 10.4" and the other "for < 10.4". After
this change we have a mismatch. In fact it doesn't matter because
we don't support any OSX version that old any more anyway.

I think we should delete the whole #ifdef...#else...#endif block
here, and replace it with just the
              CGColorSpaceCreateWithName(kCGColorSpaceSRGB),
              kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst,

lines, because we dropped PPC support a long long time ago.
(And we don't need any comment about OSX version if we do that.)

thanks
-- PMM

