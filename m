Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8BF2BD3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 11:07:25 +0100 (CET)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSehI-0001BX-8d
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 05:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iSefx-0000VB-AO
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 05:06:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iSefu-0004r2-Qf
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 05:05:59 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:44487)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iSefu-0004i5-JD
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 05:05:58 -0500
Received: by mail-oi1-x22b.google.com with SMTP id s71so1422932oih.11
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 02:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7meEMlOTHXolmzWAKrPY8sgNjLk/GhIq+JaSuU2WCZM=;
 b=iWuhGMCnSb8uLYVDzLkygu+1tZlfpaagsrHsoe+wyntQO1HnFFsVtua5zYqPaXrgIP
 pOYuQ03LSlJ1SU3VKWtXgrgaOrOm3GUIxV2GwtZiAlakD1CGt3byE6iW3SkmFgAnEPMk
 0MnfwRQA1tSgUed1AAkYx8SzpYgnBhCoDxD79QcVr2qVXjnLxLoouUOdrFkuVR0fXx42
 QX1kNa6Ne5IFNXqalf95FK032KPyaFnLDMvtAVlHP2h5mVEAIrEUl+74VJGI4A+dyoeU
 vA3haOuH4N80h8N/e4X5fgt8uD5suPFb1cTXe+Hlaf+4XQun38MbXgrHfgewH/Q1xT9J
 M01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7meEMlOTHXolmzWAKrPY8sgNjLk/GhIq+JaSuU2WCZM=;
 b=rr5sMco5U/KWpKBlnI/F1E5way9KADwCCFcA53+TlK1IzzNX7ZjJjVG2RrRXaUgKrc
 KVs2cWxz+f2vJG5QGJ3yA6YPRLOUuFQPa8sBsYKVU+Rv1f2qSFQkQdB6LPer/cSOm24S
 MP+RHRxpdC3NU5IeyD4qukLoI2VQ7KvluvKF107RgA/oyTgmTbsJ7s2NiZvCqjlTJZOQ
 jriPaATfFW5ZEG1RI43psFg6VfL3h4czmygNdwcopyncFw1tYPCous/EoLQZwKqOPygK
 /mL/Tr6USm1595c9GQt814KblryKY/L9kXG2aspVLnlypeIAd0zhcAqMaUwLUl023QnX
 nW/g==
X-Gm-Message-State: APjAAAVIiICpzqIlJ+RxPWtXxwXrkPLmXSgb7q13cEGixyLL3sbO25gD
 nhroY1CzaB0/xp0CCMIlIpD7mQyvT4/ACRUD+p6z3Q==
X-Google-Smtp-Source: APXvYqyt7NOazgn1fO9IpxQcSFzpb3I4wo2o0ZF3U9PSzgcM0MTji6zf86Mbn/SiqywBGJjLDIP5Q2FlUzhpXkY/EvE=
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr2545921oia.146.1573121156286; 
 Thu, 07 Nov 2019 02:05:56 -0800 (PST)
MIME-Version: 1.0
References: <20191106082604.9548-1-kraxel@redhat.com>
In-Reply-To: <20191106082604.9548-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Nov 2019 10:05:44 +0000
Message-ID: <CAFEAcA-FjrXQS8y9XKtYQxf9ywrf-Wc9mr2_vBeObnm9F486jw@mail.gmail.com>
Subject: Re: [PULL 0/1] Audio 20191106 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22b
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Nov 2019 at 08:27, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 36609b4fa36f0ac934874371874416f7533a5408:
>
>   Merge remote-tracking branch 'remotes/palmer/tags/palmer-for-master-4.2-sf1' into staging (2019-11-02 17:59:03 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20191106-pull-request
>
> for you to fetch changes up to 14d4f01191354e9520c47c692007344c30ab358b:
>
>   audio: add -audiodev pa,in|out.latency= to documentation (2019-11-06 08:08:10 +0100)
>
> ----------------------------------------------------------------
> audio: documentation update
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

