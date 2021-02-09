Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200B314CD2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:23:13 +0100 (CET)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9QAp-0008Fp-P9
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Q90-0007o8-01
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:21:18 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Q8v-0008PS-V1
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:21:17 -0500
Received: by mail-ed1-x536.google.com with SMTP id z22so22688156edb.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 02:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vfg3KjsEYc+Td454tujL34fxkbWXJ3Jf0iIS+RP+QBY=;
 b=hRFGX4eDIjsMi1ORTqzd/I3+sbUSEYMMpGUIQ4mNtNm+/MB6KVvAh5APA2KjSkCoVj
 Oq84lv3sbZKMn3L9Ssa/dzP63vUIG5Ws42RtcqPtpAWmMGJc8K7iBauwYRejXMB3eM7G
 hj73VIpVg1gahn6+Y6T8n8m4HEYAgp0HTCrseG11UAlWpS8eLn8PrhPK4L/wZh50se1W
 X/oHGqdDCgJG8d5dbxqGnq9bcdnFg4oxn8IrtJJ8ff8v2budUKqSuFKbC6WGZbI1EUNy
 H0bP9EcUOwEQg9HpE0t9Bc/nL3VIN5rcMhuPAbmXr45rp4ijz3b7sr71ykiUKDGSOJcm
 Rq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vfg3KjsEYc+Td454tujL34fxkbWXJ3Jf0iIS+RP+QBY=;
 b=l0n1ruli59dqyipGBnkZ7Hs/mkv1hC3uVWTUmVAYo5hBaIDZT00DlIhk1FrX5GjEU2
 ul8QYRhKc8MFotIOB+0StyqgFAPZvPyprO2YHXL5/HGx4179HjB5px9ONoQfufJ33vCZ
 FznWA1psVDI1/Tu9A6WOysc/CsWv28YyIyAA99feuvKXyxu77gTDYetJ8vlIDVeUejNj
 /nGUz4USu4+VgIlewf1S/wRn6j/36zwnAJRMbXq/m9f1Xhg5gq/bLRE26atDH2gIPqJX
 re0HfOPD4q4uBeRFrQQfh7KhuJiAHR+Z5gXYegLro7WjwVEpYXUz5pGHHT5OBArCSO8d
 dkPw==
X-Gm-Message-State: AOAM532sXY3oGdkJou93YluBlrmLjJ1UzWQSdfugnc/dynS7CI7Ub6Nk
 NKBxBMcmDcBRgqGEgib3EyuZk/4UazNcZTpMMRMIkQ==
X-Google-Smtp-Source: ABdhPJzomJ7n5g5BpzOf4269+CkfeT/S2VZ1FX2ZU+DYutwW/DgauRfn5cdXxU6thTu7WTYoBZmgflZX7HA01fHU6RU=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr21862749edd.52.1612866070855; 
 Tue, 09 Feb 2021 02:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20210129130330.30820-1-peter.maydell@linaro.org>
 <87y2gbsrc7.fsf@linaro.org>
In-Reply-To: <87y2gbsrc7.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 10:20:59 +0000
Message-ID: <CAFEAcA-+D3Mr4MSknngBSh8erJvCNJe9XxnkggvvG4QSV1xMAA@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Add URL of clang bug to comment about our
 workaround
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 15:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In cpu_exec() we have a longstanding workaround for compilers which
> > do not correctly implement the part of the sigsetjmp()/siglongjmp()
> > spec which requires that local variables which are not changed
> > between the setjmp and the longjmp retain their value.
> >
> > I recently ran across the upstream clang bug report for this; add a
> > link to it to the comment describing the workaround, and generally
> > expand the comment, so that we have a reasonable chance in future of
> > understanding why it's there and determining when we can remove it,
> > assuming clang eventually fixes the bug.
> >
> > Remove the /* buggy compiler */ comments on the #else and #endif:
> > they don't add anything to understanding and are somewhat misleading
> > since they're sandwiching the code path for *non*-buggy compilers.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks. I'll put this in via target-arm.next unless somebody
has a preference for it going in via some other tree ?

-- PMM

