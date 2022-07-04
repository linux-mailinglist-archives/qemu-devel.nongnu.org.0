Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1C565A1D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:43:34 +0200 (CEST)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8OEX-0002cr-T0
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8O9n-0008QM-IZ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:38:39 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:41748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8O9l-00050m-G3
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:38:39 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31c8bb90d09so31709677b3.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bOcA4D5/jyCW8p7A9WQLrNSsoyPxxWGW1g4zAOPwwMc=;
 b=f2XjpNt/Au3kP1znjCL8dJhK2FNgaldyFNCOEjS9EmMUFyGkT2eWAYu7v/NgaXgStM
 3+fvmFBnNcRfrpdPQLAJk6PExbqyoi695GO8n+F5g4jaAiuRFd9y9btDYdakhscQAoni
 5nzWA4Mi0xg4A3U5p5H7ZhRLOLHIGV3SvFMg9c9RzMVViJBm9qZM418y57feNHkCykAZ
 huVyaNXEqkSH2uGlNbxHqhZrza1QE68T3ZnPllIreuPcZGNKrEnyA1QUYaEEPP2dGyyd
 D2AKA3F7ZF/jBJfLLGlNtQArIQyRfdjJwAj+H9CU6HGmUAh4b9F0oChNT156oUpqvfi3
 iTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bOcA4D5/jyCW8p7A9WQLrNSsoyPxxWGW1g4zAOPwwMc=;
 b=h8bO3lPmDTQlAb18tYQuu24GWbJpYOQjeh4Ecml1KrYHwGjoi3FluufYXTeIzzO1aX
 m38UBdYolV+Sx6WVl6tR7xP35GpGPQbRQJOBCc/c90Yc+d4+B4bMqG2fqXkT/OmVDibj
 L73Bqcf2zMTxJP+rKj0+edi5cMnIlp2IUculFGuMkg40Hfd/FyhvLjkPL9a6C4m1i9Qf
 fyS4b5lz/Z+gY1WrmDmwbfNPt8l4Ce0R43nAC3VfNKzYrhNfm2woXeD6pEzymIyMpHo3
 uUOjqf5whvuKgRx8uA3umgELsYAI/Z3Fzo+3nsZpjG61ZujsGXtmZyuEt9TUDH/NfLEs
 04Wg==
X-Gm-Message-State: AJIora/g+8MnKO+oHWHaO1tuMxKir+i51acDRrhgf6CeGsFEXEDk0zk4
 Q7dKOjiGRTL8vA8LxdphlnYRWzuKPRgP7W1QN3BsPA==
X-Google-Smtp-Source: AGRyM1tqYZJWa+NukVkrHFrs5dPFuUmiX57mHFnxtiZIYSiu14Mpemo0QUkv8bGHWVs+NgU6xOq3tno2AKyh5XrZzMU=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr33082181ywg.329.1656949116218; Mon, 04
 Jul 2022 08:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-3-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-3-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:38:25 +0100
Message-ID: <CAFEAcA9tjFuKxxz-4QU0G-4Nf_RVw-TAmO+3KGMDMqGd27hMUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] misc: fix mixups of bool constants with int
 variables
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  block/vhdx-log.c       | 2 +-
>  hw/xtensa/sim.c        | 4 ++--
>  nbd/client.c           | 4 ++--
>  target/i386/cpu-dump.c | 3 ++-
>  ui/spice-display.c     | 4 ++--
>  5 files changed, 9 insertions(+), 8 deletions(-)

> diff --git a/nbd/client.c b/nbd/client.c
> index 30d5383cb1..fee3959d24 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -832,8 +832,8 @@ static int nbd_list_meta_contexts(QIOChannel *ioc,
>                                    Error **errp)
>  {
>      int ret;
> -    int seen_any =3D false;
> -    int seen_qemu =3D false;
> +    bool seen_any =3D false;
> +    bool seen_qemu =3D false;
>
>      if (nbd_send_meta_query(ioc, NBD_OPT_LIST_META_CONTEXT,
>                              info->name, NULL, errp) < 0) {

The code in this function does a bitwise OR into seen_qemu later --
bitwise OR into a bool also seems like bad style that something
is probably going to complain about. (I guess currently -Wbool-operation
doesn't care about it or else we don't enable that, but it might
in future.)

The other changes look OK.

-- PMM

