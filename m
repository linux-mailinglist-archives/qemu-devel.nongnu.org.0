Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD540E1A8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:41:31 +0200 (CEST)
Received: from localhost ([::1]:56662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQuS0-0005OR-QP
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQu4r-0003br-Tk
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 12:17:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQu4o-0007VX-W6
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 12:17:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id t8so10407560wrq.4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G9e37GKaNlkYtZtDgiKzMfOUnlcd5GqVlCxKHQkZtLY=;
 b=Gb5MRQJNm63Lul/+v8EPT/it1pyAhlfnC1gYNeXa+7cAsObXzoeTpXMjG2ZLMsWFD3
 u7sNWIsUPCekfsjNct3GD/MusEIXyfXClYLaKk48UntDlBF070K8JfAsMLh1KRL0sOCr
 6TJJFfbI5sKNbf1vZY1EfbI4qvkj457ixX3WdUVcOpW2sIwO2MgF681OW9crhTlyYlKU
 Ll/BErTK+bXXeGOicrxxGhtcwHmqVksRhm9Bt0iMfulqsb8eYI02QGobmZj+EEnLMLuW
 zk7/btJuONrZtTeXMPfbYTuk0NSsrcUPgmzHnnNZP1da8OsLLAhWhY+dwsSHRxd4CU3O
 1z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9e37GKaNlkYtZtDgiKzMfOUnlcd5GqVlCxKHQkZtLY=;
 b=uqtuOpESo4uLz7OvJooTB2dglAvfZx5BAfl915lw/JFwhw3sRtl2oJN5auMmtKRG3Q
 zI5XZweoHsLUPq/WAip8bk8njXXGeDCbW9ZFL94zmacjZrwIvicJric8LPiENHHbi6BJ
 SEXuzIYHoRN3kUdl1Vigf+sSa2hRt54JpjxlnEIBfxNcSMCIElPstaMMR2acOhkhsmsn
 l+WxJ7hrfiob6p5yA671pVGsBq2uxVfXijevzEqRqJ7T6/eCqIweD7RaKnoanDj6V6hG
 elXgZZpCJVQ5ral4AaXcQWa+kX+xD0rllShqgg73BwBvB7fJkafAGQe7xE7rnNEfTNHh
 qMsw==
X-Gm-Message-State: AOAM531/GHKNosPdUIdIekpeeskMFSg82K81/e4w+HQhLg7NNs956oq0
 7+MgES8otQ4Lmi0/xawzHoNFHvAmZ6nWs+wOp3JB4A==
X-Google-Smtp-Source: ABdhPJw7T4ydHqtepSplYJatuVJ3ugHK91dkxrmMNQ5w2dt2k4fjCWIBL6CnrxdZtWj7iOI26vSL3xSLQHbHpXEutWM=
X-Received: by 2002:adf:f185:: with SMTP id h5mr7174234wro.302.1631809049350; 
 Thu, 16 Sep 2021 09:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
 <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
In-Reply-To: <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 17:16:38 +0100
Message-ID: <CAFEAcA8yd6m-S90Uq1G=HTYFAerp6cZdJk9B=CFrHMn5tEMZ5w@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 17:05, Ard Biesheuvel <ardb@kernel.org> wrote:
> I'd argue that compliance with the architecture means that the
> software should not clear RES1 bits

Architecturally, RES1 means that "software
 * Must not rely on the bit reading as 1.
 * Must use an SBOP policy to write to the bit."
(SBOP=="should be 1 or preserved", ie you can preserve the existing value,
as in "read register, change some bits, write back", or you can write a 1.)

> but I don't think we can blame it
> for not touching bits that were in in invalid state upon entry.

SCTLR_EL1.SPAN == 0 is perfectly valid for a CPU that supports the
PAN feature. It's just not the value OVMF wants, so OVMF should
be setting it to what it does want. Also, as the first thing to
run after reset (ie firmware) OVMF absolutely is responsible for
dealing with system registers which have UNKNOWN values out of
reset.

Put another way, if you want to argue that this is an "invalid
state" you need to point to the specification that defines
the valid state that OVMF should see when it is handed control.

-- PMM

