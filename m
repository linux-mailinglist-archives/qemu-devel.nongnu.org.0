Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9E509D28
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:09:09 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTkI-0000xb-Mz
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhTdf-0004zM-Be
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:02:15 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhTda-0006Dv-Dj
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:02:13 -0400
Received: by mail-yb1-xb30.google.com with SMTP id w20so1626907ybi.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tdhRORxyfAyyR/H5QKOQLBIaFbFKc4hORpZS1zKrVMw=;
 b=vFsAGQ0z+sNK8fcQjfF1oHHz3X3kKwkxFTwwK1R8qTCT2wpwjwdk7+bnclH3L5++DC
 1vxdCXAs8m9Mtj5aRknrvDfyPyguQOnxbUae4sxTiDRWhrRhJLn+NbDfe8CkXA1d/Y75
 a62ak5qXsnPElxy6jrukSzaXb2iepR4+ay5cRmY+4DLbtFRn34OF1Y8nsCRhJxXYjWCo
 zim+0FFjZ7+qkNh+12rIZj5d/Fw3LdTu8UdHq65xZ5CAMtjbLtFXp/umXeywOWfkUsr0
 G6xSMigRQ8e5mvQAAEAJNaHVAvY+kqP/0TMhC+2RRR0ujisi1nG46lTzA7IpEHgEDZj8
 0ZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tdhRORxyfAyyR/H5QKOQLBIaFbFKc4hORpZS1zKrVMw=;
 b=p6DsGyGAzjgCCXogOsT2Vxxde9Ep1w1MmM3RD/zVGqnpBa3Q341Aq8yWm6K0RKnjsZ
 Lr9E4Zam040z+mbijy9MHD1wC67b9a4e+lFx6CDdCiBXMam/SbP+rIBtJR2U1yapq3Hq
 koQPFFqHjKL0h7G8saQtsUfXuzEz3sms27aPtVFjCKhNk/fD/qYvyBno+BdkemOAvMD/
 FxdkprfRW/2bEindpg7GzZyEbESxpmw9wNiSYY3wkqyJ0XWLrkTUL5Pb5cl37G9RPJFV
 Q9gs00hobElUipwp3uHD4U2jofE0Us6fUpQkqPBUWLCU3IX6Mm/Gt/tg2Np467gCeq9i
 PZoA==
X-Gm-Message-State: AOAM530dBBO7nPshkTLr/pmUwrSiUYfUrPfucWaMTvabeVDdwwz6JxNp
 gGfK/P7TmUV/apkn3OliAALW5VfShW7yMyNMYRf8Dg==
X-Google-Smtp-Source: ABdhPJwt3OdakGZi9Ixk7Ww6gl9hyqiRlkyZNO/qettxCuzeb8tRkX1bhHcaKUR2R53wVyIYVPcjxVR+QjHEvI8gRks=
X-Received: by 2002:a25:3b55:0:b0:641:bd5:e3fa with SMTP id
 i82-20020a253b55000000b006410bd5e3famr23719499yba.193.1650535328329; Thu, 21
 Apr 2022 03:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
 <CAFEAcA854-k-c5ZAbb=m2LE_ogi2Gf-3idOxOc37zN844mKyAA@mail.gmail.com>
 <962f7ef4-7dcc-fb5d-5e55-90eb3ba65e47@linaro.org>
 <CAFEAcA9HtPAydeC+C5fbCQCFxjhnV9_tbncRFsH51Mf2MeHQyw@mail.gmail.com>
 <87r15qvkhi.fsf@linaro.org>
In-Reply-To: <87r15qvkhi.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:01:57 +0100
Message-ID: <CAFEAcA8E3g23p4pKyTkyUbnzU1=RdsD6q8ViT6SukOBRvDsisQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 10:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> I think the helper function cpu_virtio_is_big_endian is really just a
> proxy for the data endianess mode of the guest. Perhaps it could be
> re-named and then used by the semihosting code?

We specifically named and documented that as "don't use this unless
you're the silly legacy virtio devices":

    /**
     * @virtio_is_big_endian: Callback to return %true if a CPU which suppo=
rts
     * runtime configurable endianness is currently big-endian.
     * Non-configurable CPUs can use the default implementation of this met=
hod.
     * This method should not be used by any callers other than the pre-1.0
     * virtio devices.
     */

I think you're correct that it is also the right thing for semihosting,
but we should be a bit careful with the naming and commenting so we
can retain the "this is the wrong thing for most situations and
definitely not something to be calling in device model code" information
for developers and code reviewers.

-- PMM

