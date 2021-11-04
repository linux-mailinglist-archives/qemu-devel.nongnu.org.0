Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8BC445B3B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 21:51:23 +0100 (CET)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mijhh-0005RV-TP
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 16:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mijgp-0004WI-C1
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 16:50:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mijgn-0001rB-Ob
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 16:50:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id o29so1705518wms.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3DAnWFDJKL8MSUC6DiANPUVM9Jd5d//kKOBIw49u8Q=;
 b=UKHm/5Y6chDX6HV9JGjxLUcl7qFnMG4t1j+zNnYmv3UCBXQE/xgRPVOUu9JtBJwxa6
 OFiUmz/lrx0EIgNzGy4o0xhJ0rFGlS9aTwERrDvqyWvB8816qwnya/kma5gyMPbJAsZR
 /YP/Uq5bDdQyOjjOlgJnwaosGrUaBWO2fpZiC2s9UBMIQn6JYQ17qr7mbxnnUiefgIZ4
 /GuOI61raRLHMfvcymzQACoH9XzyqUfLguJJdOHTkENNDTIZ++IiDLm3O5HDX/dxcfJ4
 k9USa3c6hUZlNijBpzBp45PadbMm5VRT1jvBlvQRsN1+OEOFydM+K01JN8YcOP4/LL3f
 N/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3DAnWFDJKL8MSUC6DiANPUVM9Jd5d//kKOBIw49u8Q=;
 b=wEL2vStf0nWU1g9/409L+9E54QPo/nsJ5D28r13vAKn0oj7KqDaqJeXhaL6CwlepP5
 iNueywjyvqOfGU2i7yJwyMRJNvbjaSe9bZ3wKIOWEJJxER8hyhdozM1c3PFlOS62ftxN
 dCcX0WJnjHorrhyyFxJGkfq7U0XcVwsXS1MMtwgfLrA8kt5Iv2TM4u1TfTaBpVT4ao54
 Rz25gkgiZHp0GCD36HtgSWP3wkUC6qFDZp+HIzOF8ABud9CNfaPe/TLuYOyBKuU6uTq9
 pbfxt5cwMaTdeSUW0UyjA0XFp/d77Hf6DMVksnIgqh+nJwlJP6taHemYWCKA0CjWzAec
 8LQw==
X-Gm-Message-State: AOAM532D6V4yURUynkpKSnJFgsUQJLc7g8pQ0ECivTWxJy4RDimLNde1
 6NQx5vE1R9FUGjToaBv6hqbh9Mf0aFI8sJyvmm/gJQ==
X-Google-Smtp-Source: ABdhPJyczvS6mKc8Xo29hcgZT1H9lTa2uQ8e8tccIfxNWakmNyS3LSMDw8I2DnIQse2ZdYNHm9JtO6nN9VpyCp1UHxY=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr26050854wmj.133.1636059023100; 
 Thu, 04 Nov 2021 13:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-6-wuhaotsh@google.com>
 <CAFEAcA8mwXkPSMubBjmqzFkK6ghmyW_ngz9AejeoF-GKkqSL6A@mail.gmail.com>
 <CAGcCb13jV8r6nRspELZOai_HYJ4t6E1OfOYSx7-wCjaAX8Fodg@mail.gmail.com>
 <1567de73-332b-dcf6-9a8e-fea0cd071f9a@redhat.com>
 <CAGcCb11p1fg_WSRsYzaOE3kD_GUx_gf3KLmfrTFsrJKaiCMbaQ@mail.gmail.com>
In-Reply-To: <CAGcCb11p1fg_WSRsYzaOE3kD_GUx_gf3KLmfrTFsrJKaiCMbaQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Nov 2021 20:50:12 +0000
Message-ID: <CAFEAcA9uG7QD0RjsWoE9766Y0_=oy=BgBnW1TDq2Z3_sTvKaiw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 21:52, Hao Wu <wuhaotsh@google.com> wrote:
>
> Thanks for the comment. I'll upload a new version using IF_OTHER as discussed in that thread.
>
> I don't know if adding the assertion for type != IF_NONE is a good idea now so I didn't add that.
> If you think that's good I can add it as well.

We would have to fix the existing use of IF_NONE in the tree
before we could add an assert. (Awkward because it will
break commandlines for that existing use.)

-- PMM

