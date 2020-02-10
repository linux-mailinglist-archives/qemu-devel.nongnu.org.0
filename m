Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BF1582FA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 19:50:00 +0100 (CET)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1E87-0001Cg-BJ
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 13:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1E6x-0000YG-VN
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 13:48:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1E6w-0003Wi-HH
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 13:48:47 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:37370)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1E6w-0003U5-Bv
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 13:48:46 -0500
Received: by mail-ot1-x330.google.com with SMTP id d3so7433951otp.4
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 10:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tck7Wc4e0znZK+D6kS+GoPvxriS8xDhVgklXe6rxj8M=;
 b=Im5fExOEnTrZC+66oqTqv3bPb7LTgtc4CU9wRMzlAtr7NgT+Md/Whxdn0c5KxPTAbo
 7VVAe7f/CMm23yZ09gml7N39SRgHyJ7mBxp5kO0tfC1aP1D7hiedDZCAdn7NZb8JwRly
 IfG9pd5d8Mx3wPzUb/+YWQGxjKCWju20a5WDlWJHDQ5axf0lavlE6H58OggeFnNI9wzg
 FFdzioc2aDvsvVyYNm46IQX8b97i1X5rLszKTnbLOCxFl1/NKtGinDYNmg3jKCgb7t9l
 r7S2gonsFoZuCJoa9hoGbyH3RRb0nT+iRFImH7PL2ElrpnM2sdfr5cHZYkhNCWFce1W5
 HuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tck7Wc4e0znZK+D6kS+GoPvxriS8xDhVgklXe6rxj8M=;
 b=bNwZ0pqISBA+7Bsja4ugeG6MK0ofmiXvIrJHYKor44cbDn9SM/kABS9v+DY8SgCoaR
 zPvf5dSFYbQo+MeTKnf2PtcQWlWD2Y5ut/UD347ux7JFETQ8COh7aPuQm4rm+XGdTqhF
 nUr491DKYQ3aH9IDAtnGsuHkREL8iXmPxpwBGWFmBA8eUASJyjMw4m9aRD+hmqP5K22u
 zWUbwfliV9aLtDJInJrZJ6VsiAB8VBbs5YRbMXL/eLyT9L3x5sCYhlHbK0wf2Uw13hAy
 nFL6rZHrgJP13JmDbccGWk/rTqoUp7iL/4J3VgHudpD+ZLxdfZhsWW38lhIJ9MftZ5hs
 uwrg==
X-Gm-Message-State: APjAAAW8v0/weY62j9LEAauRYreC/pLyBOjlxclwfI4KEVe2S50RqGj0
 FS/7TDoENImod/d7vONMzpRVGzHeMq4Eb2qRPHrnoA==
X-Google-Smtp-Source: APXvYqz5T49JGQmKj5DkQ3Sam/P8nind5WYgMtWajALuy76WbPdY79k5Nx3G8EHLmDkbKOnnMio2waK0kPky2Wh5o10=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr2126919otd.91.1581360524053; 
 Mon, 10 Feb 2020 10:48:44 -0800 (PST)
MIME-Version: 1.0
References: <20200210172918.95874-1-dgilbert@redhat.com>
In-Reply-To: <20200210172918.95874-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2020 18:48:32 +0000
Message-ID: <CAFEAcA8B7_4k7fudkAN7-hkTLYcLGZArZdvhYbMFUaz3HCcAMA@mail.gmail.com>
Subject: Re: [PULL 0/5] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Feb 2020 at 17:31, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 2b8a51cdb3e8d15a5c35de7a2e76a813ae7358f0:
>
>   Merge remote-tracking branch 'remotes/gkurz/tags/9p-next-2020-02-08' into staging (2020-02-10 16:07:29 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20200210
>
> for you to fetch changes up to 6a7e2bbee5fa5f167959f05319550d2a49a6b8bb:
>
>   docs: add virtiofsd(1) man page (2020-02-10 17:25:52 +0000)
>
> ----------------------------------------------------------------
> virtiofsd pull 2020-02-10
>
> Coverity fixes and a reworked man page.
>
> ----------------------------------------------------------------
> Dr. David Alan Gilbert (4):
>       virtiofsd: Remove fuse_req_getgroups
>       virtiofsd: fv_create_listen_socket error path socket leak
>       virtiofsd: load_capng missing unlock
>       virtiofsd: do_read missing NULL check
>
> Stefan Hajnoczi (1):
>       docs: add virtiofsd(1) man page


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

