Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611EB3CA4F4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 20:07:39 +0200 (CEST)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m45lp-0001sU-SN
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 14:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m45kU-00014I-4A
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 14:06:14 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m45kR-0001ZH-VU
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 14:06:13 -0400
Received: by mail-ej1-x62f.google.com with SMTP id v20so10727985eji.10
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TYUZy/fGaZMY02EOH3opW93fWs0XTmXB2xvBnZaqMMY=;
 b=aWrR6S0rKF4sH83WHAYu22rJ0wXHWL6d5uApWk7cRtjrHYFbvwO21VfyA4M4fQ4h/n
 +5psXuhn08YzcI1bZ00x0P0nWsrKr9Fmu8zXF359OAPhnK7bGN5VI6eW25hzYRBbfy1t
 0Jbtf7EVbiDrBGRIvBSv+1KDibtLoxs2mqMzMEqRRvfc7bg9kTiBuYtQ7fDnICmrTIn1
 Lnu4+MRMbEBHlfJvVhF92u8GndeP/I3vIEpkW7QhqqVuuMk4Vftkc5NUNOgyISHLoWWK
 k9RN7VgaST35HR/nkXA3m/AygR0KXweGWKTqaZDoO8J7Adr1JvCxxLyG/I7XiQEJJlc8
 shLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TYUZy/fGaZMY02EOH3opW93fWs0XTmXB2xvBnZaqMMY=;
 b=qEoQYxmmlADZZ1CHbCnB8Nq+4UFjcAL5FSO1kR6xhV9pkkhHRzJTb5ZhzypcUhB88O
 VtIduDCv0Hr0el+DMkL94ytRFXNW4tCYxsIo/9PaKQ2nicyeSUulQ13j9Q/Fet0MQ+4C
 7x9e4+EG1ipxbPojf44c7jLNy9iY5mO4Ric+n4doIJit/5jfkUainz8/H4dit1ZwNne9
 KKhHmo9ivPHIHItbEtgHQ6aXgdBd1E9Ql4nFweR2dPG85lI3Y1Y71QpTyExwqAFM7jRD
 N32g6Tm++HJUnPu9v6FwvC4hvE8SutT0P+rgfAqUBKt+ysstHKk+/BTa45G41i0Zl9Xy
 i3kg==
X-Gm-Message-State: AOAM532TS1ms+/2mDMtrS3LVepnpQZbMG4apHAk2Pyup6NAZ9JTnQLkV
 Y4owec8neucW+uCp4+wSk1LdAoaQvijkwdHXPR8rRw==
X-Google-Smtp-Source: ABdhPJzN4zq2KCNvLJmGN693dVUaiESaBax4qQ0AQcgN81QzjFBhRdXjvwt136u364+ajbe5u2oEg7x2OD7/b2tikAs=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr6792231ejb.382.1626372370154; 
 Thu, 15 Jul 2021 11:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210714150036.21060-1-alex.bennee@linaro.org>
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 19:05:28 +0100
Message-ID: <CAFEAcA9OLvmqLySo_S3MW+gtEdx2WgWO-c9qaVxU1t1JkSYOzg@mail.gmail.com>
Subject: Re: [PULL v5 00/44] testing, build and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Wed, 14 Jul 2021 at 16:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 4aa2454d94cca99d86aa32e71bd7c8159df91c=
59:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-re=
quest' into staging (2021-07-14 12:00:56 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugins-14072=
1-5
>
> for you to fetch changes up to a6b95a9733a94f38b289430bf46987809f53ab16:
>
>   MAINTAINERS: Added myself as a reviewer for TCG Plugins (2021-07-14 15:=
54:13 +0100)
>
> ----------------------------------------------------------------
> Testing and plugin updates:
>
>   - custom runner playbooks for configuring GitLab runners
>   - integrate Cirrus jobs into GitLab via cirrus-run
>   - clean-up docker package lists
>   - bump NetBSD to 9.2
>   - bump OpenBSD to 6.9
>   - make test-mmap more hexagon friendly
>   - fixup handling of hostaddr for plugins
>   - disallow some incompatible plugin configurations
>   - fix handling of -ldl for BSDs
>   - remove some old unused symbols from the plugin symbol map
>   - enable plugins by default for most TCG builds
>   - honour main build -Wall settings for plugins
>   - new execlog plugin
>   - new cache modelling plugin
>   - fix io_uring build regression
>   - disable modular TCG on Darwin
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

