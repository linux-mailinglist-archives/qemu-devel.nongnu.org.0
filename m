Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB98342A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 16:44:47 +0200 (CEST)
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hv0hi-0004Ss-NL
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 10:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hv0hE-0003rP-3M
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 10:44:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hv0hD-0005qN-2Z
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 10:44:16 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39215)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hv0hC-0005q5-TG
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 10:44:15 -0400
Received: by mail-ot1-x341.google.com with SMTP id r21so87079582otq.6
 for <qemu-devel@nongnu.org>; Tue, 06 Aug 2019 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2hN3HEV8FD1aH4udPPrQ9ytw3iq31OCRtgzMcJDejWo=;
 b=PIzDBO9Np3BW/Wx/CCmDdHP2LE86MZsLf86lo5aNl5dFleI1eh9X24KheaKGGlQ0Ud
 EMukouNLNakDlIbbV2jhUenrbMlu4VJ7g+ayH9HxNBEcVGKA1FLpuM5+z30P4wH1qUBo
 aKXfjkk6TSQRXJs3yCyjRwlzi4gYBXYUYVcCF9r4nRUJt3PAAR4yQr7ZeSRnCtZWdGHr
 0vjwHlRFDdmTjKBxqvjnq/vMUlK8+iQT/uJ7JAjABQvfjucASjFEH12z7C1MlqvTAq8U
 vDKUl8OEyYcaYdGhghQTx+AtLWwtSK+RZFTYM/oWe7Qty4m3Cqn3lNthrfrHTOc/4y/v
 +/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2hN3HEV8FD1aH4udPPrQ9ytw3iq31OCRtgzMcJDejWo=;
 b=em5mqifA+g09ThW5OAi23a8wt23qSHhyt1ywnXGEOGSIcraQg1RLtuzpPlsKwvQ7sx
 G4Cx0jSRkXHVzejeZfDzLaB+QzxrXB6xgDUrdTK3dK9gy3e19AmINPzNAPMHDqzOIWa+
 RF0O2yC4JEClvPHRuR1BxH8qZIYy7vvtFK9eaDmXzHLd4hCQtktJnNGCb191RXhdpabD
 Tu/iQMg9ewRmYyZjXYtPTsRAf7wJtJXBaNbw8lWRrG7hTWW96BjdW4CPKPafKYZYQo+q
 jcmXCfYozm6GYhA5+8zs+unP+HRaWhAnP9YDvg7BNNCL9RsSXRx4O1GKL8TMeC870YqP
 +o3w==
X-Gm-Message-State: APjAAAXVI4zy8TXvdmKPikpweJ1cit82V/ClEwDEOvWx4MfUabTGri7f
 8cg0OuMPykmW26w12TxHu1RA4/V26QdK3cTCHK3Oyw==
X-Google-Smtp-Source: APXvYqyyFBVgpqM7scX7wWByUs6lPKyG/mmwghpkplqW+x0zh7yQYFT1WBRDe1S5dZawm3VEMmj+TjVvutSN5QNiNko=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr3134422otk.221.1565102653998; 
 Tue, 06 Aug 2019 07:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190806115952.8456-1-mreitz@redhat.com>
In-Reply-To: <20190806115952.8456-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 15:44:03 +0100
Message-ID: <CAFEAcA__+VKi1K0482pTJFQGzA=4AbPDiZGdKOgox0KAM1UinQ@mail.gmail.com>
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PULL v2 0/7] Block patches for 4.1.0-rc4
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Aug 2019 at 12:59, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit 9bb68d34dda9be60335e73e65c8fb61bca0353=
62:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/edk2-next-2019=
0803' into staging (2019-08-05 11:05:36 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2019-08-06
>
> for you to fetch changes up to 110571be4e70ac015628e76d2731f96dd8d1998c:
>
>   block/backup: disable copy_range for compressed backup (2019-08-06 13:1=
7:27 +0200)
> ----------------------------------------------------------------
> v2: Added =E2=80=9CCc: qemu-stable=E2=80=9D tag where necessary
>
> ----------------------------------------------------------------
> Block patches for 4.1.0-rc4:
> - Fix the backup block job when using copy offloading
> - Fix the mirror block job when using the write-blocking copy mode
> - Fix incremental backups after the image has been grown with the
>   respective bitmap attached to it
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

