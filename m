Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0A0F911D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 14:54:41 +0100 (CET)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUWcx-000668-FR
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 08:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iUWbT-0005BT-Hk
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 08:53:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iUWbS-0000rp-92
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 08:53:07 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:37878)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iUWbR-0000rO-UL
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 08:53:06 -0500
Received: by mail-oi1-x232.google.com with SMTP id y194so14835284oie.4
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2019 05:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cOZA7fuckIXozgptk+Bar+NHWOMyVXYdWJdIWVRbTtI=;
 b=mEUcDZQB26DpG0UZDqaNttJEFCx5CRB7V57iF19712mVjw34sfeOi41hRUQ/te9KNL
 tnlcEQTHOG5GVqrLVtx5/bi137kHpwo1AOIQPBq+8aaYkD/J5DNmllGLLiXm4e3JEZEa
 DXNGCaTbdQDqzJb8RH2wJPEYYvrQ4TtFE8uwp8zp9SYNVG/rqed0kLONOXxTYk+KRjMn
 VROW+y6wKImF/9A9cNViKsh1Qr9k52XTGFaJMS8n5jUfaALQcTseNvX0r/XpQji8Co3A
 LnHV67rs5JpmRfN0kxt0fDnFNxAWLswBTij+BOvBdsv2FgxUwzlA8xzkR0oUdp5TQQoH
 AFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cOZA7fuckIXozgptk+Bar+NHWOMyVXYdWJdIWVRbTtI=;
 b=ACwTpu5cz5b6LYkh8VQzmVEGTaVcSEndDJqL12WX/xXdwVbMPQOCEL0yw3Bdto8xxv
 B9dltP17ebpr5X/R+Z36qw9L7HrAmWJWEWrV6Zwj/1oMa/VjzBoonNLdYWrllo0shdUz
 0YcEVTsD1mWj1nVNTSHwUXmMVC3qDQtZeHMBYxxfirOPL1mOEGKnVf0XH1M9FZ48sMB0
 ik+K7XYJgffyeaPLi/K24VGHI7j5gwo/d96acKQhVgo+JHmnwxexcMQ71olvp+eHsTD1
 bufFPfYEneV9pBhbh5fYsRrD7gEOALO5/rTZ9XTGTPJCsLjZIPU38JC+Mm1VpQGSb9vt
 y/Bg==
X-Gm-Message-State: APjAAAUzaOARwtSpi44DdmihglDeRHNarnqG9WCDi9rmeoH9OPDEdUpH
 rWnnCIXw3b30ubZ2AspNkaMNJD3jQsmVi+9V6SgfuQ==
X-Google-Smtp-Source: APXvYqyiIp+tebqhLGed8sf/MeS5NHBxKRnUoaPx6janSNE/kXz2MXrI2Z/fofJHd4eU3RhUKZg42PEAs7PamPVnXy8=
X-Received: by 2002:aca:cf12:: with SMTP id f18mr3982462oig.48.1573566785050; 
 Tue, 12 Nov 2019 05:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20191112100429.11957-1-laurent@vivier.eu>
In-Reply-To: <20191112100429.11957-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Nov 2019 13:52:53 +0000
Message-ID: <CAFEAcA_TvPZrjXmx0hC2jjEG_ur=QWqX8dD2T1VAi5LVRWbfWA@mail.gmail.com>
Subject: Re: [PULL 0/5] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
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
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Nov 2019 at 10:07, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 9f2ce35dfa4ea4a31dbb765dd02bed2500891887:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20191111' into staging (2019-11-11 16:54:16 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 5c62979ed5f75976ae215098566ebd93dfe4e22a:
>
>   ivshmem-server: Terminate also on SIGINT (2019-11-12 10:37:20 +0100)
>
> ----------------------------------------------------------------
> Trivial fixes (20191112)
> ivshmem-server, error messages (numa, qom) and
> Makefile (bios-microvm) fixes
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

