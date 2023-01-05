Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7DE65F3EA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 19:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDVCh-00047O-80; Thu, 05 Jan 2023 13:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDVCE-000463-0N
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 13:42:34 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDVCB-0006gY-Mj
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 13:42:33 -0500
Received: by mail-pg1-x536.google.com with SMTP id h192so20262188pgc.7
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 10:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jb/SkZk2d1bZWkigbOmYebgIpk+cWsy9HBl6BoJykO8=;
 b=wRZ78fKq8SH/ZtSbNhb39vWL/mB1LL7IrbMo63trHmvYuX5vEBrnUKV1Ry774cLjfk
 BoHnpACcV6xGGiO9oVd+ydYWkgWK1aw5IGeUml+kDIDogJ8i9VHhrmpRLcGLchWqr/uI
 otovkrFDLjNPRblf5yB2iYKeCTKxmFsSXHyRukOIif0VKN7h0Hs+Ed5oQ9dMD5yA5V7j
 XClNZLgEuXW9/FA9WVY030XBo8k/ib0XbjqJxu7fH8ifCqQ49MDclQqfqlQ2CSv/Ofk6
 MIKz4Kn76w8PhiKMAtmUfkfW6onZBugrWA376G/RuUCQBmpULk3AEH2cV0eaDRRRk47x
 T15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jb/SkZk2d1bZWkigbOmYebgIpk+cWsy9HBl6BoJykO8=;
 b=iDZ9sfJxO3m3vUAacTLopHBbAXp0nJdFlhB7TiyGeGHAfjFp8YKjis8o0BPz8G74QR
 VAth3CR4B6YvpNF7yFPz09xHQXclZUlYrVbzv6PtKYg0+PF7WgEtPQU+bF+7H5ZfqSwv
 aRxmTeRt6Oc/LvfC6KukV8K730GyPl1JGXWO2ZljCyJIFbLv3DS5S/5qckRT2+CMsRd0
 dXSdl859cz5TOWsrN/kbCWaphH6PGT0D4H6OFf6L/TbfxuQQKMzl1oj9KO0TYCQIZxoF
 ezmefBC7gw7fNrZmS9WbQRRrPd8E3EHE8Utb3kJwL6BFX0cZhJDJZGKYsfSWKIe5EftL
 0gzA==
X-Gm-Message-State: AFqh2kozew5Vkl4knBsw/u9eCcjP8xzUv3+m7tQQ9q6BI6E0gagliBZE
 I3AW60le0Ypydi+hzSA+HQ3+9rHaKPD6xkNZVtFRPA==
X-Google-Smtp-Source: AMrXdXta/JhhbP3IozP/LaxRBGWk46AyxZb74m/mCCUVUq5ypsqVk1NhtTQIzabAg2UCW5GYDpKXvqXfc3wwpCCMNaI=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr3318764pgh.105.1672944149938; Thu, 05
 Jan 2023 10:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20230104210455.571473-1-jsnow@redhat.com>
In-Reply-To: <20230104210455.571473-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 18:42:18 +0000
Message-ID: <CAFEAcA8iwXWjhtKsT-0LgwNp74eQok9E8=WBE6J4Pb=uc+s4ZA@mail.gmail.com>
Subject: Re: [PULL 0/5] Python patches
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 4 Jan 2023 at 21:05, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit ecc9a58835f8d4ea4e3ed36832032a71ee08fbb2:
>
>   Merge tag 'pull-9p-20221223' of https://github.com/cschoenebeck/qemu into staging (2023-01-04 14:53:59 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 519f3cfce07a067971ff39d4a989b77e7100a947:
>
>   python: add 3.11 to supported list (2023-01-04 13:46:05 -0500)
>
> ----------------------------------------------------------------
> Python patch roundup
>
> Mostly CI fixes and some small debugging improvements.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

