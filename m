Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154055BE47B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:29:55 +0200 (CEST)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabRc-0002wm-Pc
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaQq-0004R2-Tu
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:24:53 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaQm-0002wn-3w
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:24:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id 29so3154909edv.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=FARkd/geawKARyNW89YvFnsckZMn64TWLKArTQ/0GCM=;
 b=V8O3VmR7E52X/RPoNtb4WSt0h4CfNLsy07pyp9b34uzqymSv/Fnxv266TlOP5+mKo5
 sTalPLrhFz9x0Hiz0AFI5X32YSt48Zj5Ngc0LRcyGgD2+QWmYnBHmz4iW91awRFi6FCt
 VTuZLR0UO+WopDvfLMkgx9fuwq1VpivNR1PbT3QDL4BIgAcqYLHS01df1eF/NpIKEkC2
 3qtWDzO4VrgXstj75ozuRt8lntFnCsTqPnkXaN5Q4WMVXuTlcs3czU3mQWudHJ4H8STF
 doPAvd2W7iZMIH/X3R9jWWVoS94QOL7zz1SE6AOln+LsQO+dEjt0UeAMXXoDOAFRNkMV
 aNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FARkd/geawKARyNW89YvFnsckZMn64TWLKArTQ/0GCM=;
 b=NBbFt77Jvucb+QMRDfD/lIs5a1xNmTU9EJOQCUiTyBK5OyyChu6FEaZgbSKzS3jqos
 uaxqDC/4250HXK2ctDboFstkCZx6bcaPQ2oM/uDYWguVgKjjicAvhDzmtAUWnCoj3SW5
 9jpscYLXDPNUrapQ9fWcG4DCw/NzbkXOscNmEh2LxuenNPo0SRmtxV/GlUQ3e/nX7L13
 E+7WK7xJL0yztnnvY21Z3LMkOKgx/01jt9mjiSdOACS6jwFBTQyocfiLdhAPJlLbOmOi
 5GI5W/jEGH1AajN+V8CSzqzEU8BY4GQjtCG88dbHIHpINeyHNG0oGmHqGqVSEFsUxzSZ
 Efnw==
X-Gm-Message-State: ACrzQf1NkrJCu5KvIRTB7qPzCdZOUxRyxHvlvi2sfjyM2/4f7aMDnDQS
 N8IMEJ9I6MeZvLxDI8OGQpq/VUbjYbnN/n2H5u8kXg==
X-Google-Smtp-Source: AMsMyM4k4cQjWUY2zBF1s8NluqETqTCjdU/8Z8FYwQNwSbKrCulyPWG8KESc7GqNG7hA3FnSd+p5fZE3+DXFfyy7OPw=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr19729004edc.149.1663669481248; Tue, 20
 Sep 2022 03:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220914105058.2787404-1-chigot@adacore.com>
 <dbcca868-afee-2457-33ed-4d0274945c2b@linaro.org>
In-Reply-To: <dbcca868-afee-2457-33ed-4d0274945c2b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:24:29 +0100
Message-ID: <CAFEAcA-v30uCqKJT5mNCW72GJnxNVS6oUY0atfmbPR=nj_hC8Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix alignment for VLD4.32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Sept 2022 at 14:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/14/22 11:50, Cl=C3=A9ment Chigot wrote:
> > When requested, the alignment for VLD4.32 is 8 and not 16.
> >
> > See ARM documentation about VLD4 encoding:
> >      ebytes =3D 1 << UInt(size);
> >      if size =3D=3D '10' then
> >          alignment =3D if a =3D=3D '0' then 1 else 8;
> >      else
> >          alignment =3D if a =3D=3D '0' then 1 else 4*ebytes;
> >
> > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

