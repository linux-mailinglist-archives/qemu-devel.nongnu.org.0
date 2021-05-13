Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973AE37FDAE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 20:59:01 +0200 (CEST)
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhGY0-0001yx-Am
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 14:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGUT-0008Vu-Pb
 for qemu-devel@nongnu.org; Thu, 13 May 2021 14:55:21 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGU5-0004Ja-Nl
 for qemu-devel@nongnu.org; Thu, 13 May 2021 14:55:21 -0400
Received: by mail-ej1-x62c.google.com with SMTP id s20so35770327ejr.9
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uJwbByDvzw9sgUuThrufzBumT9V/0hRL2V6wACP+2rQ=;
 b=gO9r94TF+aWg77q+NBpgknBimRCU0R5t+9OCthj2PzXmGpW3rU6rWaGEAIHU/5y3+I
 BymJI+v7M2mE7jYHCy8hH1a3zi9fmDfZoNZqJllk2H+FYhw0NwSEaG3E5pbYmFezbQwE
 1yIx8jrNl4DzoXy+9a+M9i4XxHmgDqqkY7oVTyh45fM2VEVSqxr8YFElwP5kj09CfBGx
 CTGVHK+mN3HBwn7rda7lBp77qy0u7qrMiKtibsGMBMLyxfeTbeHH66vf8QHMaTWmnd1e
 pQMnybmR5gMEvmv94paY0PtCM3K6soDiA8Se5djP5oCVgYm/zcY8Qd5OJvcagD0w1tkF
 +ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uJwbByDvzw9sgUuThrufzBumT9V/0hRL2V6wACP+2rQ=;
 b=fqA9OjCuIhI/wsQx4l+cfk1WJeWsyTBD9NKGnONR5jAgDhHW/yakHlchQX4cChFt1L
 9mAqWOb7vVQxqIGn2AJEC6Mm+IXvdj3t3im8yooVM2PxQrtHbrZy9KR49ZXeJym1LHM+
 C4usoqB2pbz2HI4utxr4jHFifEXIGatU6hOvfDBPMSEsGde+m7XMVRlMgulf32Bp71hV
 sqcU6h6v0NXjcGnk8IAbVbF+rDjxk/8E9XFeXvQQiCR28h2O0cPKutEbKeXBXLSSBCEI
 mXx5XGE2r2cMIroAyOpLP6hJoeoA7jS94/VLAG2WnOHSvC0GhDUu7wtI7WdWOAYkNb1i
 zibg==
X-Gm-Message-State: AOAM533vjC2K9DLIYDHP2intYP2TEC8t5F0d5jMQZ4SmsJU7QMmyH8ke
 Tnavkpo45I0yfxVop8BERya+0UKXpCN5OgfO/UqXow==
X-Google-Smtp-Source: ABdhPJyD8rBM25qZNbc8V4oAM/06+HIXzh/QQ1iSC33fLRxDcxji/PmjW/YQip0Tw1pvMAaZucBbqc4DXFGzI0sh+n8=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr44475027ejb.407.1620932096109; 
 Thu, 13 May 2021 11:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190401112945.25592-1-pbonzini@redhat.com>
 <c75b2eb6-4127-61e3-20e0-b572de89668d@redhat.com>
In-Reply-To: <c75b2eb6-4127-61e3-20e0-b572de89668d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 19:54:44 +0100
Message-ID: <CAFEAcA8n22Xoz5TUgQ35gE4jCmUO0dYCtz3HjBb3s0rWuecvWw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: convert to JSON
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Matteo Croce <mcroce@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 at 19:36, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Cc'ing John/Willian/Wainer
>
> On 4/1/19 1:29 PM, Paolo Bonzini wrote:
> > JSON is already in wide use within QEMU for QMP and QAPI, enable
> > wider usage of MAINTAINERS by applying a well-defined machine-readable
> > format.

...why are you bringing up an old april-fool's-patch ? (Luckily
I checked the date on Paolo's original patch before replying :-))

thanks
-- PMM

