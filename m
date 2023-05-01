Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2B6F3067
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 13:21:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptRZ4-00087T-Rq; Mon, 01 May 2023 07:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1ptRZ0-000877-51
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:19:27 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1ptRYy-0002pM-2I
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:19:25 -0400
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-32a62613a69so6160005ab.2
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 04:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682939963; x=1685531963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=azxS133ELpCaeK4ATW5ILqzX5jSjsbTKX9zt0k7ciLs=;
 b=ILL5fnvsrDY11SQsRkNu5WPZk8IB445VpbKfkeI9Z475aSx3oMVQ5s3OkUGp1kxQQd
 1pjh9D7SW01ivdv8xLbATZxUoyM01atBoXe2SFLlLxiOFHQDCML1TSqj37nICXfn8vX/
 Dx+CQoyC+XhNSZZ16v3Bl57xKbT795d07D7zbqhJ/tRIrJaLl+pUERTtpbKL6hD+/hRC
 XrlkoUzpljCalz9uUhO4wvP8IrlgjsGIY0CqMUQng9wE2KMXlgy/dHbx9MUCjUmpMgXx
 /EECPZvM137f7nOVZo5fp0FBDfvVPDzOYkVqpAYLZPV+Ip/W5kkKJJ4sn/RcGTz9+Gsj
 8gFg==
X-Gm-Message-State: AC+VfDz213q3VqYZIsGyHYEXwrdfcFEWlWoHC0fTIXJbOAzZmOBPGGKh
 DpfkV8BY0WYRp3AxHgU1WKp0EGfwP/0qmc/YFvo=
X-Google-Smtp-Source: ACHHUZ7NiNY8kCwN8C5GY3T/wLsL0cCVdvo4Nm73RDtih/WqfAdbV8FiH7+Y1vcLRQvWEKCTfXUaOQa9RYE2ZjPnT2k=
X-Received: by 2002:a92:c68e:0:b0:326:2d5b:afef with SMTP id
 o14-20020a92c68e000000b003262d5bafefmr8747179ilg.16.1682939962312; Mon, 01
 May 2023 04:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230212082812.55101-1-ricky@rzhou.org>
 <f337c4f5-4a20-cc29-033c-c5766f9c96f6@linaro.org>
In-Reply-To: <f337c4f5-4a20-cc29-033c-c5766f9c96f6@linaro.org>
From: Ricky Zhou <ricky@rzhou.org>
Date: Mon, 1 May 2023 04:19:11 -0700
Message-ID: <CAFoVXjhjp6ydJbi4oF03+EGV_uu9MnSii_4WLOKrFOtmrh1NYw@mail.gmail.com>
Subject: Re: [PATCH] target/i386: Fix exception classes for SSE/AVX
 instructions.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="000000000000a1cbeb05fa9ffe67"
Received-SPF: pass client-ip=209.85.166.170; envelope-from=ricky.zhou@gmail.com;
 helo=mail-il1-f170.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000a1cbeb05fa9ffe67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 8:19=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Having this patch split in 2 (documentation first, logical change then)
> would ease code review.
>
> > There is one functional change:
> >
> > Before this change, MOVNTPS and MOVNTPD were labeled as Exception Class
> > 4 (only requiring alignment for legacy SSE instructions). This changes
> > them to Exception Class 1 (always requiring memory alignment), as
> > documented in the Intel manual.
>
> This could be a 3rd patch.
>
Apologies for the delayed response - I just noticed your reply today.

I've split this into three separate patches as suggested (
https://lore.kernel.org/qemu-devel/20230501111428.95998-1-ricky@rzhou.org/T=
/),
thanks!

Ricky

--000000000000a1cbeb05fa9ffe67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Apr 14, 2023 at 8:19=E2=80=AFAM P=
hilippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@=
linaro.org</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Having this patch split in 2 (documentation first, logical change then)<br>
would ease code review.<br>
<br>
&gt; There is one functional change:<br>
&gt; <br>
&gt; Before this change, MOVNTPS and MOVNTPD were labeled as Exception Clas=
s<br>
&gt; 4 (only requiring alignment for legacy SSE instructions). This changes=
<br>
&gt; them to Exception Class 1 (always requiring memory alignment), as<br>
&gt; documented in the Intel manual.<br>
<br>
This could be a 3rd patch.<br></blockquote>Apologies for the delayed respon=
se - I just noticed your reply today.<br><br>I&#39;ve split this into three=
 separate patches as suggested (<a href=3D"https://lore.kernel.org/qemu-dev=
el/20230501111428.95998-1-ricky@rzhou.org/T/">https://lore.kernel.org/qemu-=
devel/20230501111428.95998-1-ricky@rzhou.org/T/</a>), thanks!<br><br><div>R=
icky</div></div></div>

--000000000000a1cbeb05fa9ffe67--

