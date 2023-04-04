Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EEC6D6C9B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 20:50:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjlhw-0000UK-BC; Tue, 04 Apr 2023 14:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjlhu-0000UC-S8
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:48:38 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjlhs-0007OC-Gb
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:48:38 -0400
Received: by mail-ed1-x534.google.com with SMTP id eg48so134418772edb.13
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 11:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680634115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YEjesRf2tdmqJxd3+io5sORtdo/ZwbHLfrPI2HSy2m0=;
 b=XlF7O7nCWQJCy55gWKMKIeih1ZzRoIH/JIERVOR6nGpAcP5DYnpdyxBhSDxUHXWEox
 ZrHWKtUUUW+yI5uVNkR4MZSwYm/d5sVQuVYAKtMfaE3iTwE56pvYmI+Lqwp/Y+b+oT4K
 mElQnqIGxDnPeAsFiEv+bwkw1MOCU3EXWW3qvxaWX8hJUvwq9Zs27w4pQTBeARQTkztu
 oo4W0SQaHX5D9bRHZpArzPlT68VACjQDEMeye7mimZgC374b0VadSLVbpRIQY5ThLSHf
 c1It0FJa6157MWEqSO6Dx6EmDe8sSEX5Nk3k29i0b10ssoVAX1dTng7+gPkJTNFEK3z+
 D+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680634115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YEjesRf2tdmqJxd3+io5sORtdo/ZwbHLfrPI2HSy2m0=;
 b=apN9Xryi76LQ4cGgiq0B3nNZKMD/pdf14Ul3PKLccwgIHREXgohEroEYjfVNZ4HI74
 Zvms/q2ZyvLmg8kwcv3y0J9T4si7swyEVAUZ0msXkY74q7JPBQmGtSvTgcgi2iGvqBqz
 y1MmKaOsS6IoejiwCzrQQMUrWJRZBDPUzuCDeBrBZTlRq49pMgUrrz4Ij966lpfTFpRd
 SVrDkGhi4AroYkWjQV3zxDKdfh8AzQ8Xo4IfoD3BJG4NkdP8v13OYbgIFMTeVQYPbpF6
 ZfflDw4pnHYt1ks+n3t/wP97qwNZaGOO8+c9qyyplEBPYgZemzBRfMV7imwCNMbPP9ZR
 Pfkw==
X-Gm-Message-State: AAQBX9cHs7WPTSKsh1V5eXOTdzU/FlhxPfBeAdW5a0HPzt1ZgesidJBu
 rjzxhmFlAT0I2D9kKRdhOhN5DxI6BQJqWO8n4CFrpwy4MQQrqntS
X-Google-Smtp-Source: AKy350ZtnuAN5LLZu7dh4U8a0CMMn9GbXwP8NtYQIY/c9OxIG+mW9UdLrn+80lOQPCkymhkJllJM0rgXHFYg4bACyE8=
X-Received: by 2002:a17:906:b6cd:b0:8b1:cd2e:177a with SMTP id
 ec13-20020a170906b6cd00b008b1cd2e177amr283092ejb.6.1680634115036; Tue, 04 Apr
 2023 11:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230404144244.185609-1-eblake@redhat.com>
In-Reply-To: <20230404144244.185609-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 19:48:24 +0100
Message-ID: <CAFEAcA_1siMez5ZB9PnW-ro8DaHXwt+PQmqNzjxOSbLSrsJFEg@mail.gmail.com>
Subject: Re: [PULL 0/1] NBD patches for 8.0-tc3
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 4 Apr 2023 at 15:43, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 51a6dc9d394098e8f4141fad869a1ee9585f54f8:
>
>   Merge tag 'pull-target-arm-20230403' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-04-03 17:01:47 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2023-04-04
>
> for you to fetch changes up to f1426881a827a6d3f31b65616c4a8db1e9e7c45e:
>
>   nbd/server: Request TCP_NODELAY (2023-04-04 08:13:15 -0500)
>
> ----------------------------------------------------------------
> nbd patches for 2023-04-04
>
> - Eric Blake: use TCP_NODELAY in nbd server, as followup to corking
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

