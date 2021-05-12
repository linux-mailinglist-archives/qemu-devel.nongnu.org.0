Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B7A37B736
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:55:32 +0200 (CEST)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjiN-0005IM-Tx
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgjhY-0004WX-W2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:54:41 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgjhX-0007qv-6A
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:54:40 -0400
Received: by mail-ej1-x629.google.com with SMTP id s20so28073547ejr.9
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=89JTdzjqH0MzBtcj5FQ5Wta1o92hxlyfY/4zPMT51nc=;
 b=AmwKaIac3fwAgm5Jxh6QvnLn0ti/xqzux3MAiLl1xeo3P0I8aP4+H2g3woRgIXg4Bh
 aKPXR2zHtQChk520s/4o+sX7NZH+jHkHDt0ztIaoi60F9bonlc8O3/VACPJiNzx4KOwu
 XAzsU6lxqOTHAiL6GzgJ86mVhrcJv4QVRGlrq4eVXMnTXX2BqacrCNgdWJRu2tDNqcyD
 qCyeB2uaCei2MltGC0MS0IVev+oKePKRorMougGt2Gv95DhaV/UPV8Sy8SOUm9H2cQYT
 CPS49DnfW6mkJ58rXWiB2y5vVqZZ6pwl46RXzd3Pd/zXzQwsPVfp9bx8I1tIdRU+Xo/K
 V4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=89JTdzjqH0MzBtcj5FQ5Wta1o92hxlyfY/4zPMT51nc=;
 b=FK+L480v25pUte0PV83CSAi4cMBH/TCIILdN/IUSZoJTBngvZk7wWppW4CEqVbzeBL
 VzJMuUCYkLpdo8CHNT7cGFadGX+mUGYblLzlVqN2EZfMmgpGuzRgF7S845tK16534xPW
 MHrW4c8IIGmWOmDEXD/M/jiLwxbfgtHFaKMz7GmvS+dJPyt0y1kiSF5Z7+9dLGQ3d5oq
 kv581XcgIWeXXfOukUHFv8JmFAf1ldrhSjLo0lSTZkQFMGZKxA1Eof1PeDOKawJ2RRiX
 77aEedjMsOJECBZXUCcJbNt0Xk0L9gJHZcERV/sW6vJhcPkNFMibUZ/Zg3pIr9BJ73fx
 i/xw==
X-Gm-Message-State: AOAM532SErrUENXTSCsofdZaSpMXv8+MzomxKHl8xFdJDOc2tK8neOxW
 S/QQm49LgwOok8Zguji9NZdLzhk0VlsJnGyDinGMYQ==
X-Google-Smtp-Source: ABdhPJwplzA09F02UUnP4WSiYdFutoRMasRf5449u3JiB6/jSyOktE1XvgwtHSuGKB716VdHIf8igifLI65dw+S96Co=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr6784313ejb.482.1620806077069; 
 Wed, 12 May 2021 00:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210510073524.85951-1-thuth@redhat.com>
In-Reply-To: <20210510073524.85951-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 08:53:23 +0100
Message-ID: <CAFEAcA8bd+Pkq2RrydXtoTD=ZWC9KmMPDi176Dh3xQoQ8AFLdA@mail.gmail.com>
Subject: Re: [PULL 0/9] s390-ccw bios update
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 May 2021 at 08:35, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/s390-ccw-bios-2021-05-10
>
> for you to fetch changes up to f612e211e515d3699b30be6fd1b5cd73c0259785:
>
>   pc-bios/s390: Update the s390-ccw bios binaries with the Clang and other fixes (2021-05-10 08:08:40 +0200)
>
> ----------------------------------------------------------------
> * Make the s390-ccw bios compilable with Clang
> * Fix ECKD booting with null block numbers in the chain
> ----------------------------------------------------------------
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

