Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E436CC768
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:03:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBlU-0006uK-Ae; Tue, 28 Mar 2023 12:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phBkv-0005zj-Vx
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:01:06 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phBkr-0003mQ-U0
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:01:04 -0400
Received: by mail-ed1-x52b.google.com with SMTP id w9so51824414edc.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680019261;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JVSb0F1cUzK5LS3LAJ8hgYidDtLSxmnWDbbWHPcnu+Q=;
 b=FAO5FcPQGBBjzR1VWiLZRYDtk/wAna4I+rl6uwW7y1UUDifNPdhBaTQli4zxlbTNlW
 rgrrtwPwt2ts7oFXS8yqFN3kqWC87FzWCzo60qUtFFcPPaA3g4LzQUp87ZbDEwFpkGA3
 wWorVtyAhPDmUSCXDCiApGOM7BhH+KXBnrKtu/XrSshy8n739CNKGekG0FzZZukLhE7D
 UlOUpBBm/LzD6RmiCJcJqFkxY8ejcu7Q1zCeuPt0X0QlW/5Aqv90S1Wh9tad8gQRXmrE
 WsVthWiY5JCTUNmEWokR2ZC+7SBt2U7/dEcIVP5vrb5EV+8fkIiOZIQjtWDp/mRzVgv3
 mhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680019261;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVSb0F1cUzK5LS3LAJ8hgYidDtLSxmnWDbbWHPcnu+Q=;
 b=7fTOciKrBpfWbnym4ClsCi7lJsK+EzYK4SrySvexFrWznVxuNFYT1WzjmGYKCDzzfX
 ImBaWqGTZHBCy2p8KhsHFAnr7WH8YnVcfu90Uqndjc5q8MMsEejIWtpPq/gB4xZ4Du8L
 8WEQm1T7FkTt9zJWFMDNHzSTWHg1hx0qG1IWIS35ybiMEoQ0qm3/gWkg7a5clxrkdbVu
 capMFQX8uD3qyjtxOVPxtwlx3TgsprdwNVQz2PzCLRNZlSgxbY5LLPU9rkE8vPfD1Ihq
 0Z9K3fGtuYa8TauAq7JJSRS4DoEWimaSQ/1CD+qZkZHT1aFEvyU17/A8IrezFNt5iDT0
 0QPQ==
X-Gm-Message-State: AAQBX9f3xd9RZFAsfoDiQKs3DBO9tU3DTGp8v3vn0f/z1Pv9spjWDnQe
 Ejpv7yu5Um/38wVb5achQNlguiWViKflhrPHKkax3jmDyrc2zcJl
X-Google-Smtp-Source: AKy350aJWfNrR6kj/GfknKiO/5rjWKzuI+6klgT5AyDtXSalnjcOQLtU7PCxmwU0rXrmD+lFdqvkBOCZRIh0G+2v+/s=
X-Received: by 2002:a50:9fae:0:b0:501:c965:33bd with SMTP id
 c43-20020a509fae000000b00501c96533bdmr7667214edf.6.1680019261069; Tue, 28 Mar
 2023 09:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230328122634.2154949-1-peter.maydell@linaro.org>
In-Reply-To: <20230328122634.2154949-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 17:00:50 +0100
Message-ID: <CAFEAcA_gOf+ffsX5U7dKuJ25NtwQSjeg8tAWZMEK2qoiesXp0A@mail.gmail.com>
Subject: Re: [PULL 0/1] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Tue, 28 Mar 2023 at 13:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit e3debd5e7d0ce031356024878a0a18b9d109354a:
>
>   Merge tag 'pull-request-2023-03-24' of https://gitlab.com/thuth/qemu into staging (2023-03-24 16:08:46 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230328
>
> for you to fetch changes up to 46e3b237c52e0c48bfd81bce020b51fbe300b23a:
>
>   target/arm/gdbstub: Only advertise M-profile features if TCG available (2023-03-28 10:53:40 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * fix part of the "TCG-disabled builds are broken" issue
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

