Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FF3476EA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:17:19 +0100 (CET)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1Vm-0002az-7A
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP1Tc-0001kx-MB
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:15:05 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP1TV-0001QS-1b
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:15:03 -0400
Received: by mail-ej1-x629.google.com with SMTP id jy13so32159351ejc.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QbnY8Gg5zstaGZLWHT1Effcmz3rIV8Z58PQhzS9txP0=;
 b=ksjDL0/LNgdMIZWqImhFncGuyOQcBcE7UxWt0RcJS2jf3CmMg4Ab6XWkeBwWJ7XNqt
 /8kFv5T+AeZrH5WwWQT+P1bWMl2VrTN3Rsq1xvyH29QcMfGdky1qkvq9Lu5WblUg5F6i
 ywSjaTLsRwJXCbvSJ7mzoYRJDN7648PHEd1jgYoiyk09Dxd3RznuH2SHym9JCQC0367v
 7Xye/Vdhs+s19qzBGfifFdiLZIxhNlU6gUPa0OpI6Wde7aMJFi5OCCy/D1nOfVvgtToJ
 fw6q07PedEZzJMVB0CZdUi6UHHeln4dYYcqXpkaVJYKi6D231UHr6qHQ8wujVNZeYY7f
 XqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QbnY8Gg5zstaGZLWHT1Effcmz3rIV8Z58PQhzS9txP0=;
 b=Ih7dNxHofWrlVY30sTF138QU6vZRlQglaBUWchATT3Nc4qibRXy+0zKVUQ8Hnbso41
 m47/OV8mCGZF0sEX3hFbS/dS9ocA6Vz7X0IvUZ4bMhScdRe1zccS5zjsfHYiBhnQ90PN
 AwejZru4Mon1FCGC6UBmmiEgWtELM4QuKYuU6KvmBdh7mJRbUEujCmyE6ZTnD+hSwq7F
 3G0majm52KZCV7X46WurSj+csRX+QDNNoNqtrda97ZPv+PgpOYhWUkZbsTgDdI1kIg8M
 hGDUTwVjj72aN7pFMWoUskLYaLYg0HevgbSwDoEWBpxyTY6yFs/nfaAmEZeQTvzUvCHG
 a7vg==
X-Gm-Message-State: AOAM532tFNMtHa3gQ8A1/avRxK/9q0hUziEmQvrKAZIx7+2vH8UAITpW
 exJJbhzewIpR3wGqdt7rd1+QM7CZzc9lI4l12Br/cw==
X-Google-Smtp-Source: ABdhPJwCgE478X29XP9548Ok0BkxwCHJOFRwdqxmwRNU0F2TTy6BWxq3TIcvjo+kw/UiexeErL6I5jUs458PkwcChXw=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr3163203ejc.250.1616584494926; 
 Wed, 24 Mar 2021 04:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210323153616.873822-1-kraxel@redhat.com>
In-Reply-To: <20210323153616.873822-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Mar 2021 11:14:24 +0000
Message-ID: <CAFEAcA90Mkx3YGjuO64Rg5rzfU23p+EYEASjkjLrZQC30YDDqw@mail.gmail.com>
Subject: Re: [PULL 0/5] Ui 20210323 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 at 15:39, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit c95bd5ff1660883d15ad6e0005e4c8571604f51a:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-fixes-20210322' into=
>  staging (2021-03-22 14:26:13 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210323-pull-request
>
> for you to fetch changes up to 40c503079ffcb5394be2b407e817de6104db9cfc:
>
>   edid: prefer standard timings (2021-03-23 12:37:13 +0100)
>
> ----------------------------------------------------------------
> fixes for 6.0
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

