Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D52449FB97
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:23:44 +0100 (CET)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSAB-0005Oj-4k
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:23:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDRrH-0001jQ-Jf
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:04:13 -0500
Received: from [2a00:1450:4864:20::429] (port=33538
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDRrF-0008ER-9w
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:04:11 -0500
Received: by mail-wr1-x429.google.com with SMTP id e8so11189590wrc.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hEPzDZjn0x/iLIkMuTmBrzaq/anFidNV3kMNQ7rhZ00=;
 b=lpNwwHreYAr6ABv7CrMpW5tnvO2H6QFoEjgwWRC5lwzdxFKONxlU9XCekUtCbcVTz1
 C3AyZ3QlbqNGnszUlszsH/XETkTAjNCZKgGlsh7/lYkt082A4CX3veDcOTCYwysY9oBR
 AXr3DyEufGGs55MYM/5iiHXS9emWhv/wIj2G/llokmJM5PdBWX4GyvU5bU+ojCK1LIjr
 jOicPUP7FQBeui/LG4S+ta/CFgm7k81B8ITramCsV4ZC8Avm8w6CqrHqNPOGIg2h4GEL
 6RhLoDSMn6n4DwfZwtP9qBG2mOUAUDi8xK1QCGdWHCkJAEA/e1RGlgCCf6Ol/Qkh/D1s
 IqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hEPzDZjn0x/iLIkMuTmBrzaq/anFidNV3kMNQ7rhZ00=;
 b=tf1rLGuIybnsvOVGVI5qiKkNcoOSfaaVjlsUQJXF0DwWKzOpwxTuQoG5KQCrd5G1cg
 tIaytDVWcKqDx42+7QfFtuoxtGoBJdaWr3ICNXNg0ZvZ/KYHpYyQdpkljQKTnJgT93h8
 u6Xrw067G4ZTK6eIhHtxt0BTkPW7brID1pn98P19lT3lzS2h/vPRgBar/wtlQJ1frUe5
 SqSW+9pz7ox/OU+uUZ2gAi38BuqLTzfwZRCElDielDKcBQoaw/CR2sx6BQTLqMdOz0bI
 iP4o0mbCEYxJunGsupDSUpQFkgB2/Wbs30ozqb38BHlHV8+hj7fpyqG3YwFynTs5YbEn
 zNzw==
X-Gm-Message-State: AOAM5332yEp3W6BRAJHnb/Td5Agk75ecnxmazeBjf9B5XlBPUJzmeB3o
 rQFjIyQUElkcMSaxwpkFjObu2wqTh+5nvMXpIGg+rQ==
X-Google-Smtp-Source: ABdhPJxDy8i066KVwC3cJL5R/z6hWzdiVJiJ+G7ZLri3kECAbmn7pk3cYFYfUTwUly/8Sso4up0hGIqClf3y7XNLvZo=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr7046291wrq.295.1643378641067; 
 Fri, 28 Jan 2022 06:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20220127154246.6281-1-anthony.perard@citrix.com>
In-Reply-To: <20220127154246.6281-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 14:03:50 +0000
Message-ID: <CAFEAcA_naATEAVf5nZmqi6oLdPBSwURXF51=Ov-_OXsnH+pinw@mail.gmail.com>
Subject: Re: [PULL 0/2] Xen queue
To: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 15:43, Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20220127
>
> for you to fetch changes up to a021a2dd8b790437d27db95774969349632f856a:
>
>   xen-mapcache: Avoid entry->lock overflow (2022-01-27 15:14:21 +0000)
>
> ----------------------------------------------------------------
> Xen patches
>
> - bug fixes for mapcache and ioreq handling
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

