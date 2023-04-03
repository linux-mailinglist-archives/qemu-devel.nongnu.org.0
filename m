Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9C6D4B57
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 17:03:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLhR-0006JX-MR; Mon, 03 Apr 2023 11:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas@osdyne.com>) id 1pjLUP-0001ou-On
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:48:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucas@osdyne.com>) id 1pjLUN-0001V4-UJ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:48:57 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z11so19336883pfh.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osdyne.com; s=google; t=1680533334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0h61/wI9jjpH/bSL3wwXAuuD+jXZctLihmldfVQfE4=;
 b=chqYbLervOS4BpzoxOw/RpYI1AaWGwuzEHLzyApjQJuWSSt0bu56tNQDeIdOiylMzW
 DGwycYUJAmaukZ8pQdEKfFVfeb4lhwFxcXuc3UtkDo6ew/LiP47LRicCoOWqSbbisLSr
 Lxqg9BlxwJPJC9iJgigUCsiivcUyr+MTTYlMHh+3OvEC/iGm4gcORPmY88chwc/Mz/Xl
 ePTe9EIMA+Li8mCWuwPGk9A+tkqzdZba1T8C7FCvNZFDUJ8NVUlyUx9dq8aT5ny/J2WX
 27ekxT5cBflaplgTf+YmoJHmiUULfF9E6T6cslEJwR5LQihBEhasnTpIRET+O5yKcUgk
 W7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0h61/wI9jjpH/bSL3wwXAuuD+jXZctLihmldfVQfE4=;
 b=vSSRqPndygJ9VJ+1j7t3hi//73j1t2/r31801sIvc2sJrNr66dEaRbHYNKrWTmXlZR
 2d43VMwyIUjfdRvdqSSKQvChoEFXJyKrhRBN0ThF1oiaMUDiLymu5ncj4noiGv813+kJ
 0nI1+MqBPJ5nUPDjBzwM2uo3+i1ovvXoK9Ww51zVxZmx+L5+5j37DD0Vq7stVEMczX2/
 paEFul49szdHZMy06mvnN5deF9cfVrTH4EpKgS6BwrehMCh6/wphuaaOuylcUQ25NB8P
 tXUn3voVdFJXUppvimAuC4/bI/Im1+13ttXnsZ993sWcP6JX0aHLgO6hCVENQIacB22Z
 5FjQ==
X-Gm-Message-State: AAQBX9dm/AQakMoHjQy4Ppgg5P61LbwHS7cDcwGpi4daq/o0azOPe3E+
 xCDVoRkPx2PkSGbTdLFEzCErhEVW50FRxKXnElH+Aw==
X-Google-Smtp-Source: AKy350a816DxQdYqmdpHBnvzFsRFj0uE4uj3b5R4Cp4gk1Yvxt039Z20tGSEoeeS8Zvr9hj7FK4Wg58I4iDJ/Np5XW4=
X-Received: by 2002:a05:6a00:1301:b0:62d:dfe3:ea2e with SMTP id
 j1-20020a056a00130100b0062ddfe3ea2emr5321709pfu.1.1680533333766; Mon, 03 Apr
 2023 07:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230403121537.71320-1-lucas@osdyne.com>
 <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
In-Reply-To: <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
From: "Lucas C. Villa Real" <lucas@osdyne.com>
Date: Mon, 3 Apr 2023 11:48:43 -0300
Message-ID: <CAL+Dfo6ysWqeKCR5p4_JMazjgdwqq5+kdYxTXVpHE0oZNMVpOQ@mail.gmail.com>
Subject: Re: [PATCH] stm32vldiscovery: allow overriding of RAM size
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Lucas Villa Real <lucasvr@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, erdnaxe@crans.org
Content-Type: multipart/alternative; boundary="000000000000648c4805f86fa836"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=lucas@osdyne.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:02:13 -0400
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

--000000000000648c4805f86fa836
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 10:54=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Mon, 3 Apr 2023 at 13:51, Lucas Villa Real <lucasvr@gmail.com> wrote:
> >
> > stm32vldiscovery comes with 8KB of SRAM, which may be too low when
> > running some workloads on QEMU. The command line argument "-m mem_size"
> > is not recognized by the current implementation, though, so one cannot
> > easily override the default memory size.
> >
> > This patch fixes that by adding a memory subregion according to the
> > value provided on that command line argument. If absent, the default
> > value of 8KB still applies.
> >
> > Signed-off-by: Lucas Villa Real <lucas@osdyne.com>
>
> Does the real hardware have (options for) more than 8K of SRAM here ?
>
> thanks
> -- PMM
>

Yes, it's possible to add more (p)SRAM via the STM32F10xxx's FSMC (flexible
static memory controller). The new memory is mapped to FSMC bank 1 at
0x6000_0000, though (as opposed to the embedded SRAM's fixed address at
0x2000_0000), as I have now realized. I'm happy to send an updated patch so
that "-m mem_size" creates a memory subregion at 0x6000_0000 instead.

Best regards,
Lucas

--000000000000648c4805f86fa836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Apr 3, 2023 at 10:54=E2=80=AFAM Peter Maydell &lt;<a href=3D=
"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 3 Apr 202=
3 at 13:51, Lucas Villa Real &lt;<a href=3D"mailto:lucasvr@gmail.com" targe=
t=3D"_blank">lucasvr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; stm32vldiscovery comes with 8KB of SRAM, which may be too low when<br>
&gt; running some workloads on QEMU. The command line argument &quot;-m mem=
_size&quot;<br>
&gt; is not recognized by the current implementation, though, so one cannot=
<br>
&gt; easily override the default memory size.<br>
&gt;<br>
&gt; This patch fixes that by adding a memory subregion according to the<br=
>
&gt; value provided on that command line argument. If absent, the default<b=
r>
&gt; value of 8KB still applies.<br>
&gt;<br>
&gt; Signed-off-by: Lucas Villa Real &lt;<a href=3D"mailto:lucas@osdyne.com=
" target=3D"_blank">lucas@osdyne.com</a>&gt;<br>
<br>
Does the real hardware have (options for) more than 8K of SRAM here ?<br>
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div><div>Yes, it&#39;s possible to add mo=
re (p)SRAM via the <span style=3D"font-family:sans-serif" role=3D"presentat=
ion" dir=3D"ltr">STM32F10xxx&#39;s </span>FSMC (flexible static memory cont=
roller). The new memory is mapped to FSMC bank 1 at 0x6000_0000, though (as=
 opposed to the embedded SRAM&#39;s fixed address at 0x2000_0000), as I hav=
e now realized. I&#39;m happy to send an updated patch so that &quot;-m mem=
_size&quot; creates a memory subregion at 0x6000_0000 instead.</div><div><b=
r></div><div>Best regards,</div><div>Lucas<br></div><div><br></div></div></=
div>

--000000000000648c4805f86fa836--

