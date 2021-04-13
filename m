Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A7635DE5E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:12:18 +0200 (CEST)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHtx-00032A-Pk
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHnK-0007Xo-Uk
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:05:29 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHn1-0002ym-R9
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:05:19 -0400
Received: by mail-ej1-x630.google.com with SMTP id w3so25529228ejc.4
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EeojiJMfCdU8f5Ma+JFYwIb0JdRKemhbprvyQoZmVL4=;
 b=rQvY6DwPhVn4rw05+uRrenhVjEBDHGN1Ngt+2Pb6AWsn5s+ziBP/zia1jm3POCqFWf
 OvVO9s36mhqQNLdP+kjgCUmljA7TfqufepkgfFfy5VMEDgWHkSXY/R+eB51pOvD/QzZP
 kOVRefWOTo5G5UwA4zaLczC2y8786okcO6KR4391zz/4imXVvErmI7f4BvpdYJnSIkIZ
 QG/yCTV35HoyeVH+SwUzw1oElDve/EU/ZAPeI/aFmnKrDflno59o3XxXWUuU1x0AtH2s
 t8hTnsPYVNLXLBFiIU3jOCRYJmiAQ8Q9O4CTCJ3+z5QK2RKo55a45GvAApHJi/naEoAV
 UGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EeojiJMfCdU8f5Ma+JFYwIb0JdRKemhbprvyQoZmVL4=;
 b=nfZn9Alx1WdY/deVxaBYmw7i/aB59pR6A5xVNtvuqKjUlchl6je2kMdvJNoVsx6vwm
 nuow5PpMYr08WqMU2/Fm/jVmT4rYUMILpS+npIXu1J1Jl2H9hQcub4wGDyKEPSIHZPY0
 CjRCZFOCDea63rCWzq4jvrWVXna7uLjG0w1+uQLzuqG1YxRl+zsrA9MLMwbAjp1uhiuu
 0iwoB6PHKWqC7ZWCoDp1KFnTgaTqqPYXwTM/s9bpJIe2eA4SmbR+p4pZewbN+g2sAsBp
 ROJ95ykrfJTpevAi7URo1zNerLYYcpmi7cpfSlr72ibComKVKDtaGC3O7mdjVpCyTwr6
 JOWQ==
X-Gm-Message-State: AOAM530qOAw71LS98Dzua8NxEaAjJPUqH9aMrK7IQqNb37h6IUWiu+wq
 OIVWsFZtA6ijLukxCYAEHC/Em3egCKAoca0/cLCaDiBSr8U=
X-Google-Smtp-Source: ABdhPJxsHm97gQNlyOx7XD9Fh4aGYpnfKTFb4ea5JtJepvHUQc1ylmV4/q5F0NdHTwKhmo671+OShKVv6VVb48hhBgU=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr31536179ejh.4.1618315505320; 
 Tue, 13 Apr 2021 05:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 13:04:20 +0100
Message-ID: <CAFEAcA9zAZkkDC1PyjWT48SpFTX016cYgNFtu0vAJP2HAvS0LA@mail.gmail.com>
Subject: Re: [PULL 00/13] qemu-sparc queue 20210412
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 12 Apr 2021 at 23:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-sparc-20210412
>
> for you to fetch changes up to ce94fa7aa646a18e9b9105a32eea2152b202b431:
>
>   tests/qtest: add tests for am53c974 device (2021-04-12 22:37:11 +0100)
>
> ----------------------------------------------------------------
> qemu-sparc queue
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

