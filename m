Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1952EAB8E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:11:24 +0100 (CET)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwm7P-0001a1-HE
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwm5H-00012N-Np
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:09:11 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwm5E-0004EK-Jq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:09:11 -0500
Received: by mail-ed1-x534.google.com with SMTP id b73so30982364edf.13
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OUlaVBsiHMdoy5shNJ35ausH5cUW/+jq8o5p+TUJT/g=;
 b=bIwwNT9FoQoeYs8apHtSD8m6j/wU1aCbHFcsCltfC087fns4iIBEwHd5oIiOjjTi5i
 cAfbHcrzqm4qu5bJaXLh0yji6E2njAooFP7ufqRqTBt8oprkFdrpxpDwgIsoCUqoS8w3
 Hn1C50JoG6+tDooAPRiXi5PdnNxTov4T9cA7B1tOL06LDDDPLLD4wwgHdgiC/bTM7l3X
 uYG/FxL5iqV1c+hYEFgnF9PQQyp771h6WffRa4W6l5YTSf6f4jNO6TraED7/vEOVYcAo
 O75RzvaPM/lUFuChERhKQq+27tleGI8wJe5RF/FYbYhvQS6RtvCPRXLncQzz83MZsuz7
 XOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OUlaVBsiHMdoy5shNJ35ausH5cUW/+jq8o5p+TUJT/g=;
 b=fWe+yOpzA9RrRc2VumRXqpAP1p+Vta40++SPqS0zsHpCivsXHCTkwqUCoe+ebcWnFq
 xTThua9Xkos51JDexghTjL71u5nJSZBDTUWcRplarQVr+FJJnaWaoplnx76OauY54oVH
 dDoGcoHdeR6dxPmW2cCecOD9YlKfoRDQDnIT0cW7k+WZYwzhrdNnJ6xGT/d3A6PRBB0Y
 dxCjabxbwm2QEb4KbKqmqZT1IZZKTquvCL97QXF27VisLbHe6fUB/iAjp0LyK/EA013h
 WBjKYiW4XK06CXFpujo3Qg7ob58AsdQxR93o/JrZFa4nGKENKB37YUdr4XlURP9cMYNv
 ppmg==
X-Gm-Message-State: AOAM533D6gqe2dNO35MCXQ9uRpEXtrpmoj08qyfZGIgDSixWjVfAgSQ5
 K7VIG0v0diFZYVc38Z8H5I3TjlTDfJZNLOC1zNoNow==
X-Google-Smtp-Source: ABdhPJz0MUR1eZaKt/8KAG59mKB90JZhIpNwiX/P6V48WZp4AbTydmi7v34FUqiuZ57mdLKw34z+ckz5eG3LvOKfhKQ=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr76922633eds.146.1609852146301; 
 Tue, 05 Jan 2021 05:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20210104144241.343186-1-pbonzini@redhat.com>
In-Reply-To: <20210104144241.343186-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jan 2021 13:08:55 +0000
Message-ID: <CAFEAcA_1MWezZ_X=V8JKBVjMRMO8Z4tY=_qAHV20ROzU+EEm8w@mail.gmail.com>
Subject: Re: [PULL v2 00/53] Misc patches for 2020-12-21
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Mon, 4 Jan 2021 at 14:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 41192db338588051f21501abc13743e62b0a56=
05:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pul=
l-request' into staging (2021-01-01 22:57:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to bac87e979fcca9f884e1c9190132c51d99a86984:
>
>   win32: drop fd registration to the main-loop on setting non-block (2021=
-01-02 21:03:38 +0100)
>
> ----------------------------------------------------------------
> From Alex's pull request:
> * improve cross-build KVM coverage
> * new --without-default-features configure flag
> * add __repr__ for ConsoleSocket for debugging
> * build tcg tests with -Werror
> * test 32 bit builds with fedora
> * remove last traces of debian9
> * hotfix for centos8 powertools repo
>
> * Move lots of feature detection code to meson (Alex, myself)
> * CFI and LTO support (Daniele)
> * test-char dangling pointer (Eduardo)
> * Build system and win32 fixes (Marc-Andr=C3=A9)
> * Initialization fixes (myself)
> * TCG include cleanup (Richard, myself)
> * x86 'int N' fix (Peter)
>
> ----------------------------------------------------------------

Compile failure on s390x:

../../block/ssh.c: In function =E2=80=98check_host_key_knownhosts=E2=80=99:
../../block/ssh.c:281:28: error: storage size of =E2=80=98state=E2=80=99 is=
n=E2=80=99t known
     enum ssh_known_hosts_e state;
                            ^~~~~
../../block/ssh.c:289:13: error: implicit declaration of function
=E2=80=98ssh_session_is_known_server=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
     state =3D ssh_session_is_known_server(s->session);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../../block/ssh.c:289:13: error: nested extern declaration of
=E2=80=98ssh_session_is_known_server=E2=80=99 [-Werror=3Dnested-externs]

                                            ../../block/ssh.c:293:10:
error: =E2=80=98SSH_KNOWN_HOSTS_OK=E2=80=99 undeclared (first use in this f=
unction);
did you mean =E2=80=98SSH_OPTIONS_HOSTKEYS=E2=80=99?
     case SSH_KNOWN_HOSTS_OK:
          ^~~~~~~~~~~~~~~~~~
          SSH_OPTIONS_HOSTKEYS
../../block/ssh.c:293:10: note: each undeclared identifier is reported
only once for each function it appears in
../../block/ssh.c:297:10: error: =E2=80=98SSH_KNOWN_HOSTS_CHANGED=E2=80=99 =
undeclared
(first use in this function); did you mean =E2=80=98SSH_KNOWN_HOSTS_OK=E2=
=80=99?
     case SSH_KNOWN_HOSTS_CHANGED:
          ^~~~~~~~~~~~~~~~~~~~~~~
          SSH_KNOWN_HOSTS_OK

(and other similar in the same file)

On x86, new warnings from meson when doing the linux-user static build:

Has header "sasl/sasl.h" : YES (cached)
Library sasl2 found: YES
Has header "snappy-c.h" : YES
Library snappy found: YES
../../meson.build:829: WARNING: could not link libsnappy, disabling
Has header "lzo/lzo1x.h" : YES
Library lzo2 found: YES
../../meson.build:843: WARNING: could not link liblzo2, disabling

thanks
-- PMM

