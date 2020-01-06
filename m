Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D92013117D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 12:39:42 +0100 (CET)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioQjV-0006Dp-2e
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 06:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioQil-0005m6-6R
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 06:38:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioQij-0004WT-By
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 06:38:54 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:36037)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioQij-0004W9-4b
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 06:38:53 -0500
Received: by mail-ot1-x330.google.com with SMTP id 19so58874018otz.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 03:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WiVmCwh3sA9fxs30r3NBBbQ70WGwUTF2B5xAUX9rYag=;
 b=RbLqQOwQp1jT4jhXX3dFLU9HoyGV26WxrqXnjrvyHYu1juY5MCjPADLN8hWpf4baQ5
 WBBUEhX/th2G93ELk3OzHrSkiYe7ZtKbq2G9+SYlPYqzvV8FBPf9czDsXnp8iZM4f9A6
 7Yv33x6aB9b7mu715N0uUa1mKzUdaUJBTZrGHPRJzIe31SHmzon4IRgafpjXvaR2aRON
 HStvukM/QXSyGdF6u1KJ1Ns51q6ADgrC7I1rGoc68eHBMCrDYEtBW7JBONV7VJsdBIg6
 aR+s1mbCBXVvxjvKaoztljJitKaHJJP+VOcpG3WLfHUCdZuWa0+Adk5A3VjVb9fcGkbB
 aGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WiVmCwh3sA9fxs30r3NBBbQ70WGwUTF2B5xAUX9rYag=;
 b=n3WZAWOFUTaMjh66BznAXesfYF3I0hzEwgI4jT+12LK7uI+xlTiDDvuWZXVmAzNJGJ
 TccPgiGH6FtW8T/fdf77enCLlhdxBWD8TCvOI4p5dr+A6uKqG3OTM1kBy7Uya+TdHyD6
 NP/QpnH/UNXIywLThxfjQ3mGrwwBGTu18Nqvyko9kce/+XNab5oAddO5xvvrq1hZu4J3
 mEpluSBZZQUnAfH2bZSRx98ulMOn2vIZ4jBuYfCij5m7wgKsgXFaQI0oECvvN2McRKxj
 3vwEfT0CGQ4OWCkAtFK/Z1fvQ8d2c+nkvd5RfZA6TdVoKOfE5E0wBZc0dA9f9tK2PfwM
 5ldw==
X-Gm-Message-State: APjAAAVzX1Xs7uspUQVmzQHsfedXlgrz/aNY8N19six7goSC4CiwtzdT
 E0ancjPnP4rK2GdzWCxuNarYkY01mZKIun9wvN7ALw==
X-Google-Smtp-Source: APXvYqyNAUi0EZ6+b6J+L3qFdBUZ8E9FkU9EyzM5VTewgHoML0JukEFQO4i1/Ey1UUMkVotduDj2eI5wwFMLhrfh6ns=
X-Received: by 2002:a9d:644a:: with SMTP id m10mr11848119otl.97.1578310732149; 
 Mon, 06 Jan 2020 03:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20191220150522.633032-1-marcandre.lureau@redhat.com>
In-Reply-To: <20191220150522.633032-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 11:38:41 +0000
Message-ID: <CAFEAcA_vSU-nObPAV2nL6dJwU+S_H6qbsTrtwvo22He-goEdtQ@mail.gmail.com>
Subject: Re: [PULL 0/9] Add dbus-vmstate
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Dec 2019 at 15:05, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> The following changes since commit 8e5943260a8f765216674ee87ce8588cc4e746=
3e:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-pull-=
request' into staging (2019-12-20 12:46:10 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/elmarco/qemu.git tags/dbus-vmstate7-pull-request
>
> for you to fetch changes up to 011eb80c5748ec599067858e5a940a5605415ede:
>
>   tests: add dbus-vmstate-test (2019-12-20 19:00:49 +0400)
>
> ----------------------------------------------------------------
> Add dbus-vmstate

Hi; I'm afraid this doesn't build for the windows 64 cross-compile:

/home/petmay01/qemu-for-merges/backends/dbus-vmstate.c: In function
'dbus_save_state_proxy':
/home/petmay01/qemu-for-merges/backends/dbus-vmstate.c:313:22: error:
format '%u' expects argument of type 'unsigned int', but argument 3
has type 'gsize {aka long long unsigned int}' [-Werror=3Dformat=3D]
         error_report("%s: Too large vmstate data to save: %" G_GSIZE_FORMA=
T,
                      ^
cc1: all warnings being treated as errors


thanks
-- PMM

