Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE41EBB8F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 14:22:44 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg5wJ-0007Be-8I
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 08:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jg5uu-0006MD-5t
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 08:21:16 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:38096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jg5ur-00063L-A9
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 08:21:15 -0400
Received: by mail-ot1-x32a.google.com with SMTP id o13so10712506otl.5
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZ6A5YAyq7ZOznUktm3nu5qTyxeM5gdA3WbfVidyKAY=;
 b=b9UB4vEfsXEysrbYykjuxnmeOaN+5mVSsyonxADYlZUCSmTS/vZzkLRE8kUxeC9DIK
 Nx74mzEL2BwrtRrCMgCE1aOjHx+dpnlkYA5f1gdOhozHFdoXWrInvY6XUE9imO24hOR4
 m+SrWqtixsPGzcmZnRNoRm1zaIRQXcy26rgvYPKajLb+oixI0+ZD4a1ryTRDSZnH0x4p
 eSYeQF2Ccs/uF+/lEMykcxRKO5pj76DH7KGDL4M47YzleV046zYdv5PoQUVbTl2YhTb8
 4hcEbvTA1FCQu4uvEI9N96i838Kh3rwNB8W4LgABD/+KzdJtf5+3xZzS0SXNZFcttFSC
 aObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZ6A5YAyq7ZOznUktm3nu5qTyxeM5gdA3WbfVidyKAY=;
 b=iclnbwMfygeKRvOvmwKdByS8XDkDZJbmbyW9DwrsUXjryj4B5ejsfM6Ft4SunPkQaJ
 5QV84oaTwKBVeMJ2FU4WBpxQosp+kxJ5E/QD1oLL1gsMRhwBifObDW3RPC9jvdS11To8
 +qMeqsDYo9Nmr4T71ytVeDG1eiUJvbXmuKVT30RSw4xnSODMse+0j3m90+OFAweyq4n9
 t/h6Y2XCTlyXDFDOHlpMJbQZUAEkhjIHnpDXVsI0QoZW+Pn2uoaE6j7YSq0TdNRtVbuw
 8bVFo5+Zmtw3CXr/VrbbhVPwxPkJBDrKl6YvoUNEiMp/1COICNTplK+u6qzCNmDIfTaq
 Ho4g==
X-Gm-Message-State: AOAM533jqTU28RnVeVx2uhr7qR2rse2lgs0nVmiI2q2JOuiXr6Bw0Jy4
 W+U8TPWJJYPxTrLblQJ3sBhf49AR3cGDGizbK9oYEA==
X-Google-Smtp-Source: ABdhPJy8Q59J55+/2gyRmlkxqBYv2HLlWBCfJW7dPGGULFVik6szwDwuTlACwH0ntriBoOkWS8PkMzfmtNMJP9iUQww=
X-Received: by 2002:a9d:3623:: with SMTP id w32mr19902594otb.91.1591100471954; 
 Tue, 02 Jun 2020 05:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200513140057.576234-1-ehabkost@redhat.com>
In-Reply-To: <20200513140057.576234-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jun 2020 13:21:01 +0100
Message-ID: <CAFEAcA86tmeLm9mDPCAM2CvStser3cOoToADBr6gAge=W8T7tQ@mail.gmail.com>
Subject: Re: [PULL 0/1] machine queue, 2020-05-13
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 May 2020 at 15:01, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit de2f658b6bb422ec0e0fa94a49e476018602eeea:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200511' into staging (2020-05-11 14:34:27 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to 70b6d525dfb51d5e523d568d1139fc051bc223c5:
>
>   hostmem: don't use mbind() if host-nodes is empty (2020-05-12 12:48:57 -0400)
>
> ----------------------------------------------------------------
> machine queue, 2020-05-13
>
> Bug fixes:
> * hostmem: don't use mbind() if host-nodes is empty (Igor Mammedov)


Applied, thanks (I was able to pull your updated key from the
keyserver).

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

