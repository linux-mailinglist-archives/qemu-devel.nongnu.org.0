Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B2380FD9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 20:35:59 +0200 (CEST)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhcfG-0000An-Nx
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 14:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhccn-0005oe-LD
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:33:27 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhccl-0004Ze-H3
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:33:25 -0400
Received: by mail-ej1-x62f.google.com with SMTP id lz27so34914ejb.11
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dbB2nDghvrd/+1HD/XBxyDUztwJU9jArymD7gKh0JGg=;
 b=Y4hPtIk1YbJ/Y0j1IeBwdI0z0UZ+1jNnle4ilIIgs20FcPk0kR0xVcJaXmFwZV/+aa
 4GapxrNbq74U2b1UWI+UYJcqLn1nZHXCQWn8w92iWdZbUtbiOBc89F3jIIw5oeX6W4Z+
 0DQQNicHRIsUA+c9zHw1cQvXEr2nU6uOodubKXhV9fJuBGNZUXg7f8U+a3aK63GUD7GT
 Ch3dKPMp7b2otVNL0oRO2Zo6zIFKlt5aZzHMPkMn1lqoMuDTJjl/rK/wj3RRdRRSX6yh
 fl3cw+I8kXOlqhYs94I9o/YxlC4MNSfjEa3/QgKuwdLy+d8Lib+5u9VeBBI5ebxx1cTg
 5NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dbB2nDghvrd/+1HD/XBxyDUztwJU9jArymD7gKh0JGg=;
 b=PF+K0/todWL+ud1zXcoTr/D8wI28jDoWHlRkWu7ocrMIRIbIvjo9Y21gAsfm+AZheV
 eKtMvKHw0YYCIAjA/mAaCk/AIpdACltDWvHlyAytAwND4dZWSZUPqp4fLy+ssJHXUBAa
 i5qMmSMFJV8jdTR2FOPWGd4l9fIQDlqg4sU5KTMn9JwFBnUJs+G3oU6ErdU8dLG8OUQi
 aCFBokIFCVYUtQ5dK2OwZBcLlgfHsr/lCEGaEvOLdhyFdcqCc9v+BUb5nfWJwUklgbyw
 TIkfcMjh+pbUq82qCtD58agkd/f54M9mIZyvFBlXjEa6jFWoKB6M5h4kE56lhzPnyBtk
 0olg==
X-Gm-Message-State: AOAM531REXqYRaccHzzykhp9Tqjc9ZRSJR4I6qpUvrvRSyj/MdizpXOw
 WxCV3uEnaWt6lOA86lhyRmWjZeqssQxfhU8FQa7pVA==
X-Google-Smtp-Source: ABdhPJzILd+bwTm301ztyHTKhvy02sb7QaEF6omfDpo6lfH0E8IFbZbUwNQErOgUpjlvbFcfrq1YeudEj+jCYKzK0eU=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr5620527ejb.482.1621017201492; 
 Fri, 14 May 2021 11:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210514111310.1756593-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210514111310.1756593-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 May 2021 19:33:08 +0100
Message-ID: <CAFEAcA_xf7CAqEsn5EPSht3+7wOXKvnnQ+OGGp8aDw9A_f3AEA@mail.gmail.com>
Subject: Re: [PULL v3 0/1] Rtd patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
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

On Fri, 14 May 2021 at 12:13, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 2d3fc4e2b069494b1e9e2e4a1e3de24cbc0364=
26:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-05-12'=
 into staging (2021-05-13 20:13:24 +0100)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request
>
> for you to fetch changes up to 73e6aec6522e1edd63f631c52577b49a39bc234f:
>
>   sphinx: adopt kernel readthedoc theme (2021-05-14 15:05:03 +0400)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

