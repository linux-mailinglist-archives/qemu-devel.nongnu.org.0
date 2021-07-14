Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04EF3C896A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:10:49 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iPI-0000jb-Sh
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3iNd-0007Ok-Pq
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:09:05 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3iNc-0002yd-6O
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:09:05 -0400
Received: by mail-ej1-x636.google.com with SMTP id gb6so4498045ejc.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UaHEVgb03IjX3zQl868c9iELB2Srw05HBIyjVOC0ZNM=;
 b=NVTshgD6FNewgDhTQN/i8XKtrGFL+EYAw5MkeHv/5Xfs6Eu0b5l3AYRT7K5qJ78VMw
 gwKr8f/dooWfnGlDnRk1cSCcaiU225tKOgoyzrKvemQ3Q0rY2yvyyrmL37Psn+BTKHI/
 sodjg+FDqIzfRhpkWOLcEmThREGvpiRhGY9ZUpUYm4yNIoOdNT9vkCwXdr6gfj7PPDtY
 S3YNx+PKmCqzLxXOB3Z8Xy2/G0q3Ll6qAhors6kx2djBku/O6s7rs680lKuyFiBYHBbQ
 c31YSpxk10sRsFCe/Ww7c3+rSejkLdSZF3I3dMTzmMuXo/Qpt8Ug6W9RR8BhA7HBq9a1
 vbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UaHEVgb03IjX3zQl868c9iELB2Srw05HBIyjVOC0ZNM=;
 b=cIi16oSF9GLgZZhY24Hl8vwrfjJvNLfFq3hRKWAk+HKbJl2xmulSSLs76+0aOt8Hc7
 bDSB+wiWM+6gEaZ1epgT7cCn+llaDvxSuZ8xfLpjZC+aCamF+1AKrmHYFySnb7uRSOAn
 SFAoJUuVKIau1tuteIlTkAs4rnHt5CLI8qgfWn0wo62fhmP++qQujjRRfEV6RiN9QF0d
 IKXhLpKJQtwXYCLaoZCujdlUM+tj4o/hYSsN0g8elAjnXxAIEj4kk4Yec3OZEwU/7lsH
 pkE4Tb0rJvHkKay8ROXycp5RkOsTehYfFDQhwdeBmNqmTDp6VAWCreHGwu1YdB5WS7hF
 7Iow==
X-Gm-Message-State: AOAM533LguJ5WqU5LNyqD9DIQn/Y6SL7Wz0wtxRBYGaq8ok8PQyosiQW
 gkNZzoCc+5RXBrjueBz/8An+cglwq20TbZVEDl4KgA==
X-Google-Smtp-Source: ABdhPJzLzPKUwGmoVyw41U8J3rH/rKK43SKisc9nppibUI/aUHHK9IC9LzI71HkNVJ6Sah6uybhj8NKwDcMWQPeonDA=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr13251270ejy.407.1626282540908; 
 Wed, 14 Jul 2021 10:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210713182621.258065-1-michael.roth@amd.com>
In-Reply-To: <20210713182621.258065-1-michael.roth@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 18:08:21 +0100
Message-ID: <CAFEAcA-sLVkm6yQ_ZH1ryOB1MembqOAfemgrdyTsuwD3OQe_rA@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-ga patch queue for soft-freeze
To: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Tue, 13 Jul 2021 at 19:26, Michael Roth <michael.roth@amd.com> wrote:
>
> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mdroth/qemu.git tags/qga-pull-2021-07-13-tag
>
> for you to fetch changes up to c141814d4f495bd9efdabb1229ce0a5b5a239bf3:
>
>   qga-win: Add support of Windows Server 2022 in get-osinfo command (2021-07-12 11:26:47 -0500)
>
> ----------------------------------------------------------------
> qemu-ga patch queue for soft-freeze
>
> * add support for Windows Server 2022 in get-osinfo command
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

