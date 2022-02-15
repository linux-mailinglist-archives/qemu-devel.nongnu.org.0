Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C34B6E2A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:56:24 +0100 (CET)
Received: from localhost ([::1]:59640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyJb-00079i-MO
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJyEz-0001tR-Lo
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:51:41 -0500
Received: from [2a00:1450:4864:20::32c] (port=43838
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJyEx-0001DA-E3
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:51:36 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso1450294wmj.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wuu5RI+ZFh0HyegXHarUvjCXvQJ+miOoIgw0flxvPw0=;
 b=IKn5tS8rCX4Uz2ipT4qCDtK4+gGHPlcj//1m3TYYE+urlrbW7PHKV9xkWq8ilgn4zR
 VQjoRu6N0Zvv1ihwfELh2VTNRN5KXKoVzH8SbfD3GBD6+IybDlBc7ZiSoHyeMLBlJFCI
 N0XWpQAVNrfUJFE9Wa13mg4BZoCyJQ537mS5clHcSKVrmaTfX2RKrRlUtyU3/AnIcMTT
 bmPivUkBEPjiZXqiJJTDW6d35RiCUKql8Hv5nN32GIXPoibGD3xrlD8Cj91elzBPnbDJ
 N7QX9pivcNcdE1Cn2FG1pMeMThSrpYngMKQ8ZBm6BXhbiVkWWSVP/CtqbASAZ/Hvk6uO
 6+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wuu5RI+ZFh0HyegXHarUvjCXvQJ+miOoIgw0flxvPw0=;
 b=xfZkItiLhqWWvkMNtRJ8gPTsMzkeK5/+NyHJDbuvrQjhgO5eM3uc2QhO3KO4WhXmd8
 GSCwNbz2QvGS04vsFkLFRhOzMu7LCp5Apd7D1EQFFqvZG1xqSgJZtJUoKeKeojqdwxVU
 qrermvC2P6f3HcGW/cYsCQ/4YpZf9gFXUKNR/gmpmgUE7Fwfl79Ejsp1/Xlcpc1fstX2
 9XVriPDjWEWUjFXCpsJidmwi9a7s9B7k2cbACNmT+1eeENsPnpT8xAai00hJSHEpqwMy
 YtqsFV5xpNrqdP5+ZWiWTs+2z1tcvgg6HqoSoQwIXqVP9aSaOdx1sDBAOp8CKiMElS0a
 J1xQ==
X-Gm-Message-State: AOAM531dDZZ/NFTDQq+yyBiPc1zTE1AzHrlypeG2JeywXUmYn8W1eK9R
 Thv7YYavReO5uogeR9MxQyk3DoO2L3wRrCsoCmJjLA==
X-Google-Smtp-Source: ABdhPJw2vpBj6Ulo5ENVLyMPznUEJflw5KYwKUnDWmfyAu3LwDIVGyh2YHtWy1vFFzK3JtFgr0Qrk2s2PjWqCkQd0LQ=
X-Received: by 2002:a7b:c5d1:: with SMTP id n17mr3241607wmk.32.1644933092775; 
 Tue, 15 Feb 2022 05:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20220214035957.71339-1-jasowang@redhat.com>
In-Reply-To: <20220214035957.71339-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 13:51:21 +0000
Message-ID: <CAFEAcA_zywEBY98UGjJ42McdLHqRyX4gHFSvkJg5g+4AhhcNDQ@mail.gmail.com>
Subject: Re: [PULL 0/8] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On Mon, 14 Feb 2022 at 04:00, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 48033ad678ae2def43bf0d543a2c4c3d2a93feaf:
>
>   Merge remote-tracking branch 'remotes/vsementsov/tags/pull-nbd-2022-02-09-v2' into staging (2022-02-12 22:04:07 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 9d6267b240c114d1a3cd314a08fd6e1339d34b83:
>
>   net/eth: Don't consider ESP to be an IPv6 option header (2022-02-14 11:50:44 +0800)
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

