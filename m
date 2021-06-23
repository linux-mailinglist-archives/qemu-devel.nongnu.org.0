Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27573B2056
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:31:45 +0200 (CEST)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7f4-0000o5-U7
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taylor.qemu@gmail.com>)
 id 1lw7dc-00005L-06
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 14:30:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <taylor.qemu@gmail.com>)
 id 1lw7dW-0005YV-4O
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 14:30:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d11so3761740wrm.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 11:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AM6Z+xtWZtjRLHr8bogqb8Gs2x/dqaRCvBUrkGimcKU=;
 b=Xy+fI4Pm0xRYZDPFCBaU8jcsBwnThAsF3aw0cALAPm85L+jUjRAnBh2zdmU2isl49K
 JZ654mRdWmQ6Uqz1L9TXX8vPT4vU8yIyeD1YPRihWEwRRzg5hNVWscBXUd8tssUgFaLd
 p63VJV/05wJDRd/tOGx2OPi3W47Z/bwCoHNsECyJMNaBgCL1AjZehjLVa7ah4215qZzJ
 RVrrdECgNc4o+TxVD4/K9jynp7NM4c4rbpjMAH6fr/9WpkiBP3pskjnxF5NbZARnXWLT
 jb6uKvtvchD4kBpldSnTpLUZttofXo5lDN3WS9ss7eQXbsy49pFpd9PxP6nmGHMxmrug
 2P2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AM6Z+xtWZtjRLHr8bogqb8Gs2x/dqaRCvBUrkGimcKU=;
 b=EuLqpiVrxa1beqUiXqpiasQ997Lmo98uxlTD88jY5j8qq5EH/fy3Sa8j6u31Ve7hKw
 zLe9yKSBRE1VWwbcPU703PMnQwaPgswSdcSaYuJ/omLOSo3vTnQkJcUl9A73nEsz2v5n
 QljWwLp+F1RVj+HpmEpXmo4yNMXgR8kdTC+8S/x7hcurwehIRRzGuCleCZdfuJs/bLU+
 X6FPzQmmF3UqtXgfAyMfOqQg6bRw6SEVTzgtO/Dkeqn17rYh1oZ3CfjS3UMkSMYLDva8
 26P+PJRQsQ3zENzrP59gkxZX5nLolZwCzUiRh0hdoL+MXoFos1H3yWi9q3xgzlmo7Y6i
 JCOQ==
X-Gm-Message-State: AOAM532Ne2e3JN746ZB7ETO9t8qjUuP4bzeuwZNThN8jAzeKZALQIwPM
 ZYNG2+XEo6upNiWU26AHt6x06uie+6kYUEFqRjQ=
X-Google-Smtp-Source: ABdhPJyue8AR4ruMm3xGCvzfis/xJfx9QP8BVU7I+VxFVBgVrnnQyrJJOTbYDslV8NNAdXpnph9zT8mpCQ9zki9dQc4=
X-Received: by 2002:adf:eacc:: with SMTP id o12mr1650629wrn.3.1624473003139;
 Wed, 23 Jun 2021 11:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-6-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-6-ale.qemu@rev.ng>
From: Taylor Simpson <taylor.qemu@gmail.com>
Date: Wed, 23 Jun 2021 13:29:52 -0500
Message-ID: <CANji28bOY40nSWb2Lq0C6v3k2dYo40MeQgTm0i6R7jr8-_caFg@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] target/hexagon: make helper functions non-static
To: Alessandro Di Federico <ale.qemu@rev.ng>
Content-Type: multipart/alternative; boundary="0000000000004ca58105c57318cd"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=taylor.qemu@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004ca58105c57318cd
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

On Sat, Jun 19, 2021 at 4:44 AM Alessandro Di Federico via <
qemu-devel@nongnu.org> wrote:

> From: Paolo Montesel <babush@rev.ng>
>
> Make certain helper functions non-static, making them available outside
> genptr.c. These functions are required by code generated by the
> idef-parser.
>
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/genptr.c | 7 ++++---
>  target/hexagon/genptr.h | 6 ++++++
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
>
>
>

--0000000000004ca58105c57318cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Taylor Simpson &lt;<a href=3D"mailto:tsi=
mpson@quicinc.com">tsimpson@quicinc.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 19, 2021 at =
4:44 AM Alessandro Di Federico via &lt;<a href=3D"mailto:qemu-devel@nongnu.=
org">qemu-devel@nongnu.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Paolo Montesel &lt;babush@rev.ng&gt;<br>
<br>
Make certain helper functions non-static, making them available outside<br>
genptr.c. These functions are required by code generated by the<br>
idef-parser.<br>
<br>
Signed-off-by: Alessandro Di Federico &lt;ale@rev.ng&gt;<br>
Signed-off-by: Paolo Montesel &lt;babush@rev.ng&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/hexagon/genptr.c | 7 ++++---<br>
=C2=A0target/hexagon/genptr.h | 6 ++++++<br>
=C2=A02 files changed, 10 insertions(+), 3 deletions(-)<br>
<br><br>
<br>
</blockquote></div></div>

--0000000000004ca58105c57318cd--

