Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097212EB4A9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 22:07:45 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwtYO-00027H-4U
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 16:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwtXR-0001ey-ER
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 16:06:45 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwtXP-0003oX-SH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 16:06:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id x16so2349220ejj.7
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 13:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wb1pTDwlph50scn5ZOh32fEw2cjBbOQTQXMIXrafqUs=;
 b=Kxe/fXpHILCmtOVzg0QbaAdQxsAcIOMpstP7MydzxTsAnvpT/n5Wln31FH6OI8hmth
 CylxAAmnsqrYl5diXCIWR/E9Wt4Y6O/2niZ+7JZNu3x0qmSwoztneuUHgHxCgASBPK6P
 WFunjBR0VzP38HBCVHZyf8wQfyGhyYY2fSu9B4WHY6stzPZspEJCLkf7kuX9s56l3CMq
 91FJ9gBdXnJTZXCfnwROExr9ahq2fRIvsI9pp1a1dFWvzbcL5zl55fuyjw6O1/nypMBj
 YiYKANaIPo72Ma6p7db+Xe9S39QEKmzeCSs8HJjPvsQIA9NtrTGBYf6NbEy0/CDOKHrK
 Td+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wb1pTDwlph50scn5ZOh32fEw2cjBbOQTQXMIXrafqUs=;
 b=suUk9NBy/FfN+lNBnta1/1ZIg7E4TuEOgjDydG/S9K5RDDEKi0Q4rcr2CQeAulUd3N
 GUPdDXIrjHriHJ74xFMpZIHdg9uWfiv9TC/4MEDObmSIc+cAUmuN25YCnNfZNWuVt672
 fewtwck6G06jwsBqyertTzkDksBXBYZY0eTNsb6NHangbc2ri477NzHBg3jq1UF1xuAu
 V2d1NRi/d85gbrG1LAxks4F3XT1DTUqIEo8VmpayYMq38SwTg5npZtbctiYGeBXn9Mmm
 mr7IBBRPVixhERVhlbITBPQusBN5WuDNsrISSqICum/USnN+rnhfqx4EEyNYtHeIOsmJ
 rhQQ==
X-Gm-Message-State: AOAM530j1SmJCay2qTDKHFVdA20O+JRIXoLFmh+gpCMsrCtGGGuvwzA+
 XHKTTQMpltzHrVfkTIFfW30EKLxVU8lr4OQ4x7HipQ==
X-Google-Smtp-Source: ABdhPJxksjoyNEQ4vqK2KWC1lUzWCMcMBsgqHMOswtrCLFLXvpINZdAF8ahkdLNAH1SYl3Iu/E++aQQdNb5keLrGp7Y=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr878018eja.250.1609880802045; 
 Tue, 05 Jan 2021 13:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20210104173515.198921-1-richard.henderson@linaro.org>
In-Reply-To: <20210104173515.198921-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jan 2021 21:06:30 +0000
Message-ID: <CAFEAcA_46dUG0FK95n=sSobQUDNzXGAN7QQo=XGdMCTzrrbG3A@mail.gmail.com>
Subject: Re: [PULL 0/3] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 17:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 41192db338588051f21501abc13743e62b0a5605:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging (2021-01-01 22:57:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210104
>
> for you to fetch changes up to a66424ba17d661007dc13d78c9e3014ccbaf0efb:
>
>   tcg: Add tcg_gen_bswap_tl alias (2021-01-04 06:32:58 -1000)
>
> ----------------------------------------------------------------
> Fix vector clear issue.
> Fix riscv host shift issue.
> Add tcg_gen_bswap_tl.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

