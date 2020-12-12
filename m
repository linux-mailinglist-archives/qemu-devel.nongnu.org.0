Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947F2D8A23
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 22:23:21 +0100 (CET)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koCMK-0006jq-9X
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 16:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koAyB-000309-9E
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 14:54:19 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koAy4-0003B3-0m
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 14:54:17 -0500
Received: by mail-ej1-x632.google.com with SMTP id x16so17090904ejj.7
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 11:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kwNI62FTc1DkrXK5YsZeDpNrBc2GFMXgMT9O276d2Ls=;
 b=DXbmeYcBq5g+iv/0GdTELmp7szk2aS7aRvEXrNtvG94qu+dMRB4Bcn8UZSh9S3UNCb
 v1H4xnQge0xPbTyqaIxBNUX6Celms7fB/QSJtbHgc34ewSZpUmPzetY9B4QTzHkG6O1I
 vFGgRysC5neBadRVNbDMCE0LUau8wKVMK03zBYHlUsWnK95vKCjb6PcmhhjBh5nXROVx
 bJBUfth6Zokuven26URiE3Fqo6hk1C7Z1MW7n5RsQwE0Q3ze6bf05XPXvBLBUPqTJPB2
 poHtchz3DvQ9Vm4gtYmFLDy57/rNo2RdEPShcvzjjHTraxPZo8Otus93JVBQqvEGtQBO
 NUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kwNI62FTc1DkrXK5YsZeDpNrBc2GFMXgMT9O276d2Ls=;
 b=quBcHhRFSvQDRFSilHvnob5HF3TQ+gUcb3J8DjLz6YpTWlGE3aj3+9G3lbK66sTJBi
 TMOjJL47ikLnhNsPXy96MU5ThLbcuEBQEJdfQyb/ZzpWCqwPhZWd7daSP2YV+TIj19t+
 0/LRbUzITJqpGYsO1jMfqKkPa9zHhQk7fTNYS62oH1oesPZhv72g4wXZc0eiLyMITX6M
 ZyEMibvhOY5PES5Wd3/ydIAnDt+sWG92M8IKK6rPF/SGhQLPoSzNClsCD96QqrPokdjw
 Idzevz7xKlj3knzp1qtBcolm79qAKlNHplVTNpxKVpQY/YB8JIWuPOYjyxPzmws+O50G
 Ozww==
X-Gm-Message-State: AOAM532Qltj2fvNxLDc27GdqI4r/+geRFx9pOWtOi0lOVIbuQuyXt3e9
 UZwYSuolY2EUgHV8TfOYo2elQTx7YlQ/KEDWyXtKpA==
X-Google-Smtp-Source: ABdhPJydfw0hbAXBEZU4FLrFt4n4KWrDtt7Zchb4zFJOECE5f3wnosWAqKyH04jY8PssWIGFFke8+oeZHzRhO0ZAW2A=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr16456227ejb.56.1607802850427; 
 Sat, 12 Dec 2020 11:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20201212175458.259960-1-laurent@vivier.eu>
In-Reply-To: <20201212175458.259960-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 19:53:59 +0000
Message-ID: <CAFEAcA9h4tsHeJkvEG9DCmt5pOLhBfMQ8UBsKYerMyseGbjV3g@mail.gmail.com>
Subject: Re: [PULL 0/5] M68k for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Sat, 12 Dec 2020 at 18:32, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit ad717e6da3852b5729217d7938eecdb81c546114:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging=
>  (2020-12-12 00:20:46 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request
>
> for you to fetch changes up to ce00ff729ee8461dc94a1593d25ceda65d973d3c:
>
>   m68k: fix some comment spelling errors (2020-12-12 18:12:43 +0100)
>
> ----------------------------------------------------------------
> m68k pull request 20201212
>
> Fix for Coverity CID 1421883
> Fix some comment spelling errors
> Add m68k vmstate


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

