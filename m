Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF2E4CA543
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:53:29 +0100 (CET)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOTv-0007LO-RG
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:53:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOFk-0005QZ-If
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:38:50 -0500
Received: from [2607:f8b0:4864:20::1136] (port=44154
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOFi-0003BR-Jo
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:38:47 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so15405857b3.11
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ODwG63Yg7pG0E4HhWevF4wLRju/T1nG/DZwu7Bhbzn4=;
 b=D84tZpyQl8F/sMfBCeck3k4+sbdUuRnxLC59QOgqUsCOpcMerkFrC7Hc0pfytXiyG/
 fmS6fJyK+jjdC3fFp0D+r+NqOwqLRuy41BcI91cUdzeJwgboWYLKIpLO8IiHVlS/9Bb0
 rnItDY8tvS0q3/vXBAXE76G+MD5udtTi4/THwKkFvVYWHvt795h3ZzeDkC6qYEjGEgmU
 pdjgEeY8qNgNfLxsQDJpLg7h5epzXiOneTI/ch54+84q0vuwioKDOyT9IfFt+/ilKboS
 01Qi5YlSiWihACM/RdsguhByrArxAQ3moGNA0MF78Tv9J9NhJFAntcEMKUbw9v2VX5Y2
 Yoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ODwG63Yg7pG0E4HhWevF4wLRju/T1nG/DZwu7Bhbzn4=;
 b=gLRXZi5o2bEHE6XJ4ZAM0vYJcbyi+kqsm8+L9iYg5/qVTLpIC7I+mdPAVcwnDTEx2y
 OIQDzaS+ivSqIDmGN9u+17XDJMHohX8NWU6WP+Uuo5mbFnfwAzzfFjOt6wtB4vnm0EZs
 jYL1uMyiJsFJPIi/f3u7uH9vipC58+CsjSPdeONawuoyNMD+i99t2WIyNROg5YZU7pIn
 ARNiuvsnKiLq65XrM90Q+5YO52BYoO/U+XR83eZlst2U81Gf2RYlustNhY/vzBU9DSbv
 z92yTq37LtP+jrO8ahRnZsILL4Ksc8JAJ0s/ftGDB3gggaU0t9DTZgnjkKu3S43eXU0N
 au6w==
X-Gm-Message-State: AOAM531O+wfgByzlrFSG/3T352l9vWQCoclJEca2OveDNKTKHcBB7ywD
 FQClNQxdHdBZKCKzdLIoEXRLH29PDPDtw9lvoi4/kw==
X-Google-Smtp-Source: ABdhPJyk/YwE8LV07bmbgj+G2kMrPG59oojjlDUB14O4PqetIUbc7Gesjq3abiJi23cnoGiAnzS38H0JtF8rdWUQNm0=
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr29290372ywb.64.1646224725627; Wed, 02
 Mar 2022 04:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20220301094715.550871-1-alex.bennee@linaro.org>
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 12:38:34 +0000
Message-ID: <CAFEAcA_DOZ685=ifGb=hKnVBZgR-HE6+c7XMU1HA844k_WAoVQ@mail.gmail.com>
Subject: Re: [PULL 00/18] testing and semihosting updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 at 09:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit fa435db8ce1dff3b15e3f59a12f55f7b3a347b=
08:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-req=
uest' into staging (2022-02-24 12:48:14 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-semihosting-2=
80222-1
>
> for you to fetch changes up to b904a9096f112795e47986448c145f5970d33c33:
>
>   tests/tcg: port SYS_HEAPINFO to a system test (2022-02-28 16:42:42 +000=
0)
>
> ----------------------------------------------------------------
> Testing and semihosting updates:
>
>   - restore TESTS/IMAGES filtering to docker tests
>   - add NOUSER to alpine image
>   - bump lcitool version
>   - move arm64/s390x cross build images to lcitool
>   - add aarch32 runner CI scripts
>   - expand testing to more vectors
>   - update s390x jobs to focal for gitlab/travis
>   - disable threadcount for all sh4
>   - fix semihosting SYS_HEAPINFO and test
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

