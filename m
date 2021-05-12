Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D537C793
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:36:31 +0200 (CEST)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrqY-0000in-5r
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrkl-00047L-2t
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:30:31 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:47003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrkj-00046t-Cx
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:30:30 -0400
Received: by mail-ej1-x636.google.com with SMTP id u21so35856111ejo.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vvpnmfYI2tz2eI5Hpppg/TErdcQySYy8YnsFoW/wVbs=;
 b=Nmql6G7YInvRiKFmi48+cLZieURXBc5PcqZzKGjF3IW+b3TSscz9dIN4i/IgKqg4Vb
 eOAtIcuPfRxbkRWGCd9LfIbxDUw/HmR7q4T14eugt7CpJFx24fe1FQ+eo3Zh3jMkQvvP
 CLNjhY7w3sBEWATmYINSRN5I7PGnp+xV6RX2TzoCWaLSRPNluQWFKz2dcfKVvfneHqJ/
 PJcC0jYvYa8aTzYrjLXRMijS8r9HYj8vt1iJfJzLr4vX8hmSEBQxAylDioUWvhO4R/p9
 VyDgDTLpOPi52vugJZqZrFJDuhqpNxao5hj3ys1Pnv/cIvdLVf3UQ3WbXDEUFkuhz2jm
 UcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vvpnmfYI2tz2eI5Hpppg/TErdcQySYy8YnsFoW/wVbs=;
 b=MG06F5LtpSX5JdBJ1oCqTkr/ZedFxlsyHTiMeFaYpVYd8e6nVATbxiYNF0nUaeNJw+
 UvVxmjutaaHIgI/UlgZc5KDXA2jYaR4r1ys9SpCi3gX7+m7Ng6lUf1jd/0zW33Lc1UVY
 /DFxUh+jtqr4Hp1xXBN31AUrbgS8dfiX6UFTi/wIqr+YQ+K9sSfcWJy5aL/oEIVwfPY3
 QvyoX1XAPZ4m//q0kdeOeoWiGnGa11Z3GibLeEnhT5JMlhZGU+pEEme8DFkAQIjCLGZ1
 EeswZJeEFPAlek4nHOi44WHd4Ilt3z51Hb369qliTnpRlrYA+nD0GMNdeYdeSH3gWrp4
 aOaQ==
X-Gm-Message-State: AOAM533E6vHz68ftFfAfEcDJmvliRSMj5EmOqd61K1zhID39mfEAaUJP
 sZctlmYAFdq0/VNVu8rxQ4zcYqk4iLNpB31LabZTYQ==
X-Google-Smtp-Source: ABdhPJxy18RpcLX9JMD5r/j/rDV5k9bpsmdSHLTff3nR9tjVdSlnefHh+LHrNFaZYiQRCS/BxX9nQCPvJn5wvsNGYWA=
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr8201195ejb.4.1620837028040; 
 Wed, 12 May 2021 09:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210511081350.419428-1-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 17:29:14 +0100
Message-ID: <CAFEAcA-qmCWOF2Xs0zAgvoxH3MwEB-QdZoqvaqK2+BC+cdfg+Q@mail.gmail.com>
Subject: Re: [PULL 00/33] Misc (mostly i386) patches for 2021-05-11
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Tue, 11 May 2021 at 09:16, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit e58c7a3bba3076890592f02d2b0e596bf191b5c2:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210510-1' into staging (2021-05-10 17:28:11 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 8708c1e0182293b51e07c0640848f93a3354376e:
>
>   coverity-scan: list components, move model to scripts/coverity-scan (2021-05-11 04:11:14 -0400)
>
> ----------------------------------------------------------------
> * AccelCPUClass and sysemu/user split for i386 (Claudio)
> * i386 page walk unification
> * Fix detection of gdbus-codegen
> * Misc refactoring
> * snapshot-load bugfix
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

