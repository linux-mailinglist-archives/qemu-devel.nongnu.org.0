Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321C25FC56
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 16:55:08 +0200 (CEST)
Received: from localhost ([::1]:43066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFIXz-000063-2p
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 10:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFIX7-0007pa-FU
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 10:54:13 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFIX5-0001te-RO
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 10:54:13 -0400
Received: by mail-ej1-x644.google.com with SMTP id o8so5364154ejb.10
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JaG1bX3fUonxfmjzTMx9tvXZg4N3Wm8y2SxFRdtjfQQ=;
 b=eciw1qYJIAXxmHSarzYO+omdS0IbYQ2xalgh62bpEsy+5T754ZcauU3h0DxBFqNsQT
 0yggUm/CTb0v6aG8oF0F/5l1siOd6lkIK7poR+KUmjJ8gGVKAt4ksFcRaCTyKX+KYwOj
 4RmZtON417w4mqMW58sFemvSVPNstDOX1oQvIwvHWP42+VfHqMo8/Jf2U0NyahxaXY/r
 hyi71ypJO05b3gJ8WA8/merNKP3Jd5w4BJQw+ZPOPswFvvLFNAalZ/7kK/kuZoJMK98b
 77F2NaV2WrxCLerJjSsZ+4+zqPlrJGuYkgAxk6Le8zMcIkEeCQ2Z3teHCkpAJYvMjGyL
 MH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaG1bX3fUonxfmjzTMx9tvXZg4N3Wm8y2SxFRdtjfQQ=;
 b=KEHqv1yzfHpgciyB9lHvShrGBbIc0WjtLxPGegXDohJv6S240Yfz9hiemfvY4in8Ii
 G8yAXw4UF57TLqRUXSu3ocr9dFZGIrag1vkWNLXwpuhhqAG6WwumvVzMKvgw07b576Iy
 XXORc4pvCRIYkpG1j7Ar2Ewo1kRYEr6aL0c/sKQDtkU43vqSTefvWIEf3zj5SBM9AQ8A
 GjPwHxQW8NA4PThKYUZQy/2AUQMBsXqs4FBmY2q3BdNp/EiOz6g07Ib014DAFBRmpM2K
 GAQFTeLh1xI86IM4NUFNvCFKUr8Rr9LDS/EwiiM4bRhlHsNGL90SzqQ0GW5Ha7hoemLm
 Zzmg==
X-Gm-Message-State: AOAM531R5eP+SytiGOUvvZ8cs19ugIlnK5aNn1yLLS/5cVbm4VFyFE1X
 jblLTdk+YZhgkd3qD4N07T82SKpfhKHMG+ZQMBDINw==
X-Google-Smtp-Source: ABdhPJxb/fPh7PotB6RCptKZQquG/+O8mfuLkF02fQIdMoqK+VkTNOsPVlPVyfN4Y33ElDWAx2exKEksIn2lpqFQUVE=
X-Received: by 2002:a17:906:d936:: with SMTP id
 rn22mr16671249ejb.4.1599490449844; 
 Mon, 07 Sep 2020 07:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200320091805.5585-1-armbru@redhat.com>
 <874ko9lke7.fsf@dusky.pond.sub.org>
In-Reply-To: <874ko9lke7.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2020 15:53:58 +0100
Message-ID: <CAFEAcA9KUnyqi6RY4WF-=Ut5kcT5_Oc7VwB5H8EC6pHyTX376w@mail.gmail.com>
Subject: Re: [PATCH 0/2] qapi: A section heading bug fix,
 and maybe an improvement
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Sep 2020 at 15:41, Markus Armbruster <armbru@redhat.com> wrote:
>
> Markus Armbruster <armbru@redhat.com> writes:
>
> > PATCH 1 fixes an old defect in the doc comment parser.  I figure it'll
> > simplify the rST generator's job.
> >
> > PATCH 2 might simplify it further.  It's RFC because I'm not sure it
> > does.  Peter, you tell me :)
>
> I dropped the ball on this one.  I think both patches make sense, but I
> don't want to upset Peter's "Convert QAPI doc comments to generate rST
> instead of texinfo" apple cart.  Peter, please tell me what you'd like
> me to do:
>
> * Post a pull request, so you can base your v6 on it.

Looking back at my comments on the patches I think I was happy
with both and it probably isn't a huge rebase issue, so you
might as well send these in a pullreq. You might consider also
including the first 3 patches from my v5 series, which are just
fixing markup issues in the .json that get detected by the
rst conversion.

thanks
-- PMM

