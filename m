Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533992E95D3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 14:23:51 +0100 (CET)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwPpt-0002Aj-T7
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 08:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwPoB-0001f9-3i
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:22:03 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwPnq-0002Vh-Bc
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:21:55 -0500
Received: by mail-ej1-x630.google.com with SMTP id qw4so36722697ejb.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D+ogACd+fQg/mUBHmu3wC5whN/wHwkn8jMblK2mNHoU=;
 b=QiGK+siZTmg0e78j00HroH3HnYFsPDb+e1mEq4Lh6+Dmo3l/X0c+gnvAWSNHS/+I4H
 3PJutsOo8r3GVwr7ncn68lOeLzC6ohzngAFuPgHkcb3AB1KzWVyjiVruuE/W5l6Av8Pt
 oAU7IkAyUCmVg2AxVzVw9fFFrVwXN5BINvrzG6rQ9ijlMvRAMDYy911veXZYUPl+AhNS
 Tjv1KVFgaZ8UM2sckvxXYpecsVCnBUXBsK2PiF7WreyaTYE7Sx+sfICV9nekgwitVTXo
 6ICGeYfWYEjIE/Dod/p85bAPkxoqxqKOEeBB+swH1NIqqjR5KFPkAMkE7ykzsG2CkqUj
 WxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D+ogACd+fQg/mUBHmu3wC5whN/wHwkn8jMblK2mNHoU=;
 b=gzZdgrHBwvdv9zyli6ofiUu3i6gM+f2FgjjQYi6WIPMSrrFhSXrLUFqfwt4XdkH4/h
 4R4EmGt+fzsAuaNdmgFzSiVofztqaHoCRhuzjfmFokU+kiPmvTFwhxZkWZIgLNDGDNho
 oarfNX442uroagtW4NsIeU3OKRIwaFDKDEFHFHXanYTleL3IDTIj1nbePSPOVOOciGAf
 hbtsUe44lviarwK3a4gA7vpjktGso+LPy+RT5muuC9PTZOY3AOvISiN3Ypidn787MiBz
 57n1pZIisZh0TvBzfwhdVMyDlvpDoJIud468f+L8Dnshnm8GfbteUzUKTFGjX0X3Kqlg
 F5bw==
X-Gm-Message-State: AOAM532GwPbxM/uFGX51KgHMf9d4aK38TCwJ8Ar9Ioxm49Y1MmdI9frW
 D2a2Bfa3UELbyP+K1MeO7W0iy5i1xVfKTgEYS3SDQw==
X-Google-Smtp-Source: ABdhPJzdtDSAwqOkTLtGZidy8a6v3BU0WtwrcHo/GZcO1AuArX6EDcATHA8pyr11PwwPt7++jKG10DpfVo6yGzE7aXM=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr64729638ejb.382.1609766497395; 
 Mon, 04 Jan 2021 05:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <20210104122149.GH640208@redhat.com>
In-Reply-To: <20210104122149.GH640208@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 13:21:26 +0000
Message-ID: <CAFEAcA_3nv2N7zY5kwGWPLRx2dY3KB8wMAFX-MMrk_kXK1SUVg@mail.gmail.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 12:22, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> > Question to Paolo -- it seems pretty fragile to have to explicitly
> > list "these source files need these extra CFLAGS" in half a dozen
> > meson.build files, because it's pretty non-obvious that adding
> > eg '#include "block/nbd.h"' to a .c file means that you also
> > need to update the meson.build file to say "and now it needs these
> > extra CFLAGS". Isn't there some way we can just have the CFLAGS
> > added more globally so that if we use gnutls.h directly or
> > indirectly from more .c files in future it Just Works ?
>
> The actual usage of gnutls should be confined to the crypto/ code.
>
> The rest of QEMU should only ever be using QEMU's TLS abstractions
> and not directly be tied to GNUTLS. So ideally the gnutls flags
> should only ever be added in the crypto/meson.build, and anything
> which depends on that should then get the flags indirectly.

Unfortunately include/crypto/tlscreds.h leaks this implementation
detail, because it defines:

struct QCryptoTLSCreds {
    Object parent_obj;
    char *dir;
    QCryptoTLSCredsEndpoint endpoint;
#ifdef CONFIG_GNUTLS
    gnutls_dh_params_t dh_params;
#endif
    bool verifyPeer;
    char *priority;
};

So every file that uses the tlscreds.h header must be
compiled with the GNUTLS flags, even if it doesn't itself
care about the underlying implementation.

(Maybe there's a way to keep the internals of the QCryptoTLSCreds
struct private to the crypto/ source files ?)

thanks
-- PMM

