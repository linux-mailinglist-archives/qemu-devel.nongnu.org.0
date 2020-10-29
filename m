Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4641D29EAB8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 12:34:32 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY6CN-0000gK-5D
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 07:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kY6B2-0000C9-9s
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 07:33:09 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kY6Ax-0007nh-F1
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 07:33:07 -0400
Received: by mail-ej1-x629.google.com with SMTP id k3so3294232ejj.10
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aOctrv6TS8d1ZVMRQ8OYarK2wdTunRAjO5UEk6f6vuo=;
 b=UihMTsHWx9dKIHeDe5O1shiw28jeucOXVO5O59mxiUDjfYmxe/+csYtugioF8IRY9G
 0PbijMoLmRJ2Alh84V5EZpzLcRoLDkEL+yJYcFyDZY/l7kaS+YBMevL44BmwWGP+LoF6
 IF2H3Xwd0TFfwvqxGKpYnxxQGuxOGxcNbSnkvh8tssz1mJLmFiqm4jalY6sGgfHDbdWn
 UlLUj4JxuqfWBIIW+GW6xGafMlzjKPyOp2O+Uej9TJFUJpiwbNtmST7etajWGyvDQ2JX
 NSPJqDqKG8Koi0a0ByrjP+MtL2MdNyeJuffFCihzrHHvStEQIuOTo6UBeAGWYhberxvH
 O1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOctrv6TS8d1ZVMRQ8OYarK2wdTunRAjO5UEk6f6vuo=;
 b=iYwJqvrnYNIrYtB4XSDCksAv4o0GRpSoq6N7h+Puoe+NetWpi2xqEawDS6z7ma98XA
 zq8o+CtGIaMnU9HFhESu+z2VXTjZ5iSKdRBoGak+Y6afE6Ipa1hDYzGr1kVHzG6wlx52
 ljAD6l7Cjk/28O8xG4i30QYO8Iq71Hucpqs8Uh0C0wj63RMJUBVh+BlXmVDSpMNiDw3i
 g2zwiTz65uvq2HO1ThAOC9RrA5hJiZYAyGDSfK12lIWfZhWRh1TQlFqAKmdlxUHZFP+b
 NMg+ucvQ2k5ZVCmewKR4ge62hqez0aLCuXW1yXqrFUw8ItTCycuv8O51cm0gZH/1pyA7
 x+Tw==
X-Gm-Message-State: AOAM531tN1XMb8MICiXAWFrk/3ABuI4IH1PHxykVG+fPpOR9k/wKzjxj
 /NELupL9mxLFOVQcx7G0VnMczEKOKaBrw3iyzKGZKw==
X-Google-Smtp-Source: ABdhPJyVY0PtxXlGF9imd0eW6qqRVqG6fXrYrgVcw3W9pX4x04CTCVpmRaT1B7yw5RfON7O4iej0wKFX7DWPwQBr6w8=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr3458012ejb.85.1603971181619; 
 Thu, 29 Oct 2020 04:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201027101707.2988553-1-armbru@redhat.com>
In-Reply-To: <20201027101707.2988553-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2020 11:32:50 +0000
Message-ID: <CAFEAcA92NuGF=d+55uKAqtoH3a7+PTMbOc-AAdScC5yRq9yO4g@mail.gmail.com>
Subject: Re: [PULL 0/2] QMP patches patches for 2020-10-27
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Tue, 27 Oct 2020 at 10:17, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 1dc887329a10903940501b43e8c0cc67af7c06d5:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/sd-next-20201026' into staging (2020-10-26 17:19:26 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qmp-2020-10-27
>
> for you to fetch changes up to 36006046675228cf2fec904e717d96ca816cc21a:
>
>   scripts/qmp: delete 'qmp' script (2020-10-27 11:11:06 +0100)
>
> ----------------------------------------------------------------
> QMP patches patches for 2020-10-27
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

