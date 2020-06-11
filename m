Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6091F6F81
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 23:37:32 +0200 (CEST)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjUt7-00041f-SC
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 17:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjUsK-0003FA-Mg
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 17:36:40 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41893)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjUsH-0000si-6H
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 17:36:40 -0400
Received: by mail-oi1-x243.google.com with SMTP id a21so6800930oic.8
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E1eqCW7j/+7Noy0U72Qn8+1vZb+2vI3zLsV2/THI5Ro=;
 b=F7FwtG018mbzrhyHAErctFa164z+G1CUnbvZdHWpqxpEdjKeGYl3p4ESGnWE8sALEi
 jcCvYO3Ae66SCfFhJVIOQg9Nd1nMKR8NFwOrwbDxymgxTsVQCZJ+pyqiUxa+013HxRO2
 9w65SUJzHKcxrk4rNpILY5bwFNvJDQj67DC0TeC29QMnj3CR5614Acfrye054y2zPzMg
 O4W7tNYIWlBtMJ+PI4rMococT5M0Nuc7Gf8FNWfdxLFk55uisXmgyiDISyAjlHH2NrGA
 VMxr4NK2hks4cs1nNXfoVyJmQpveBXuhf5JziJcbey81SYfYN5kG5bQSAprC/NDTAff3
 NCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E1eqCW7j/+7Noy0U72Qn8+1vZb+2vI3zLsV2/THI5Ro=;
 b=Ps1ufOFRsdsaWvFlb+OzPwlbjHP2gZSRL5emY+O5umpH+Ld6Z0gwuTY47SypOjx+kQ
 fyovfkARLp70F1m3FXv7H0ix2UC/yBJe60c9r37qQUt+GBuD1B71OdK829+C5DnVbAQQ
 iKeLNzMoxEpBSg17BxZ/KYJC3e+Soz98R3Z8675hLcwkkFC2H90bB9fOFrys/rxmXATq
 o7iXHHeet6tf1j1l0CryV9mXbTd74fePVwJWM4exdh70qItMXaeknynYfLE6QeXnDz9R
 2H4bdOpnnhgSQHF7FGA0XjtYc3KMow5IpC0kWF6psEtwtHrvkvJGoNceY5S/LePnvSu2
 xNdw==
X-Gm-Message-State: AOAM533jdlaF9vTCvs37EAX6p2FL74laot/265qQ2NR/YTnnBvlEWGRw
 zpckLQcDLmqNaIUG66/lygZ+AA+EeXPD42ZMxgtBag==
X-Google-Smtp-Source: ABdhPJzwDMupT6dsy3F+XBjfrOYP0lrwMIR+YKGFP+50Eise97ypMZ5kZosiOXZL8hO9YQy2adT+lQo7laE11oG6eXc=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr7861127oia.163.1591911388577; 
 Thu, 11 Jun 2020 14:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200610180514.3751958-1-eblake@redhat.com>
In-Reply-To: <20200610180514.3751958-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2020 22:36:17 +0100
Message-ID: <CAFEAcA-MmkMNdLEp_qVOX=Br4TJ_xMPuVYtVYxY5oDE-W3QfGQ@mail.gmail.com>
Subject: Re: [PULL v2 0/3] NBD patches through 2020-06-09
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Wed, 10 Jun 2020 at 19:07, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 31d321c2b3574dcc74e9f6411af06bca6b5d10f4:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/sparc-next-20200609' into staging (2020-06-09 17:29:47 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-06-09-v2
>
> for you to fetch changes up to 5c86bdf1208916ece0b87e1151c9b48ee54faa3e:
>
>   block: Call attention to truncation of long NBD exports (2020-06-10 12:58:59 -0500)
>
> In v2: patch 2 adjusted per review (only sending the changed patch)
>
> ----------------------------------------------------------------
> NBD patches for 2020-06-09
>
> - fix iotest 194 race
> - fix CVE-2020-10761: server DoS from assertion on long NBD error messages
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

