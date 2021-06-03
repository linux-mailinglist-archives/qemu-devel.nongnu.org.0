Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9439A3BA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:54:07 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loojW-00063E-Ss
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loohw-0003XJ-R1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:52:28 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loohu-0008WT-Vj
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:52:28 -0400
Received: by mail-qk1-x731.google.com with SMTP id 76so6117731qkn.13
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=9FCq5eR/0VpbB713oRggY726LTqK15wglCYtx+yV03w=;
 b=oDua6DTKKhmjWF7LGwpXVtHmjUfFrIoST4wcihbD1HnyfIyMRbGr7MXcNrDPldAnne
 ctwBDdpLC+UoHJZIxAdpKy1I78MVtdwAnFaLPSTpO6MqpSQ6YcPSfG6Q0E17QKKH2cCd
 M8rtNbwYAedNpFKIV+8fHLAt14k1H3Juic4BbyYzoCDNh+tvChLojZGQbnba1XwLUbp3
 y5l43qNM1/yb7+Uf+mNKBvM2np41NNe/NRu8Pil1QGFGngj6a12lONhsjlmkZlZEnT5B
 jvb5KXa40uxiUPGuB4buJHlM7ciNjKkWeXbsNYW3wk7SHg/vJsxf2XjyAITo4wZKj7Kp
 r10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=9FCq5eR/0VpbB713oRggY726LTqK15wglCYtx+yV03w=;
 b=HPDYOqPue4n2JWJxuR4rxlI6/HbJJbykFPHIY+n65oJVofgJDQEhoc7tdvBPAOz6RP
 wDFvQPfu8Le9atOxd8q34y8+a3Bq/44vMdR435dTZhIDN7jwkTwViWRoLbDmYLvBs2MS
 DsBhCXdehcQGxOE6sY1cn8KtbaSaLzP9Sk4qkePmwECRzYpvrSyq3CzC0M3QDu+dUNH+
 R4YTDMmPLG2mKTAwTgwFVKevttCtmKks/14y9GotWHD1IWDS3L6KuL7LnBNfw9rpKhBY
 l8RNfVCkcE6FzJiCco3agavH2sYVSIv8Prv+4SUAAp9KLqDqxViFevdnECDa2g+eKSUY
 snqg==
X-Gm-Message-State: AOAM533X5g2AVXKDl0quKeYBlFO/e4L8kn/+y5YGQDA9zatrwD7VV3Os
 Q5kCzz3beITL2onH2jJmaCrJ8Q==
X-Google-Smtp-Source: ABdhPJxBeBX311617neOFBhQdWJCACBY/9XYMqKmxGJtT/YcnkEG4vEToHEmyxEwoaS5tE29BYP7ZA==
X-Received: by 2002:a37:7844:: with SMTP id t65mr32878385qkc.429.1622731945976; 
 Thu, 03 Jun 2021 07:52:25 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id d28sm2029562qkl.105.2021.06.03.07.52.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Jun 2021 07:52:25 -0700 (PDT)
Date: Thu, 3 Jun 2021 10:52:24 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <080352B7-06A2-4F59-B49B-B4E0574974A4@getmailspring.com>
In-Reply-To: <CAFEAcA-mGR3S_z7OEYhQwCOyYO_mX3QkbTOO_vcY3yz6OtbDUA@mail.gmail.com>
References: <CAFEAcA-mGR3S_z7OEYhQwCOyYO_mX3QkbTOO_vcY3yz6OtbDUA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR
 writes
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="60b8eca8_7253685_139d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--60b8eca8_7253685_139d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Yes it does.

Thanks
Shashi

On Jun 3 2021, at 8:56 am, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Thu, 3 Jun 2021 at 12:01, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> > check logic") added an assert_not_reached() if the guest writes the EOIR
> > register while no interrupt is active.
> >
> > It turns out some software does this: EDK2, in GicV3ExitBootServicesEvent(),
> > unconditionally write EOIR for all interrupts that it manages. This now
> > causes QEMU to abort when running UEFI on a VM with GICv3. Although it
> > is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment
> > seems a little harsh, especially since icc_eoir_write() already
> > tolerates writes of nonexistent interrupt numbers. Simply ignore
> > spurious EOIR writes.
> >
> > Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > hw/intc/arm_gicv3_cpuif.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 81f94c7f4a..1d0964c9bf 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > }
> > break;
> > default:
> > - g_assert_not_reached();
> > + /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */
> > + return;
> >
>
> Makes sense (and looking at the comment in icc_highest_active_group()
> that says "return -1 so the caller ignores the spurious EOI attempt"
> it is what the code originally intended).
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Shashi, I guess this also fixes the assert you were seeing here ?
> thanks
> -- PMM
>


--60b8eca8_7253685_139d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Yes it does.</div><br><div>Thanks</div><div>Shashi</div><br><div cla=
ss=3D=22gmail=5Fquote=5Fattribution=22>On Jun 3 2021, at 8:56 am, Peter M=
aydell &lt;peter.maydell=40linaro.org&gt; wrote:</div><blockquote><div><d=
iv>On Thu, 3 Jun 2021 at 12:01, Jean-Philippe Brucker</div><div>&lt;jean-=
philippe=40linaro.org&gt; wrote:</div><div>&gt;</div><div>&gt; Commit 382=
c7160d1cd (=22hw/intc/arm=5Fgicv3=5Fcpuif: =46ix EOIR write access</div><=
div>&gt; check logic=22) added an assert=5Fnot=5Freached() if the guest w=
rites the EOIR</div><div>&gt; register while no interrupt is active.</div=
><div>&gt;</div><div>&gt; It turns out some software does this: EDK2, in =
GicV3ExitBootServicesEvent(),</div><div>&gt; unconditionally write EOIR f=
or all interrupts that it manages. This now</div><div>&gt; causes QEMU to=
 abort when running UE=46I on a VM with GICv3. Although it</div><div>&gt;=
 is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment</div=
><div>&gt; seems a little harsh, especially since icc=5Feoir=5Fwrite() al=
ready</div><div>&gt; tolerates writes of nonexistent interrupt numbers. S=
imply ignore</div><div>&gt; spurious EOIR writes.</div><div>&gt;</div><di=
v>&gt; =46ixes: 382c7160d1cd (=22hw/intc/arm=5Fgicv3=5Fcpuif: =46ix EOIR =
write access check logic=22)</div><div>&gt; Signed-off-by: Jean-Philippe =
Brucker &lt;jean-philippe=40linaro.org&gt;</div><div>&gt; ---</div><div>&=
gt; hw/intc/arm=5Fgicv3=5Fcpuif.c =7C 3 ++-</div><div>&gt; 1 file changed=
, 2 insertions(+), 1 deletion(-)</div><div>&gt;</div><div>&gt; diff --git=
 a/hw/intc/arm=5Fgicv3=5Fcpuif.c b/hw/intc/arm=5Fgicv3=5Fcpuif.c</div><di=
v>&gt; index 81f94c7f4a..1d0964c9bf 100644</div><div>&gt; --- a/hw/intc/a=
rm=5Fgicv3=5Fcpuif.c</div><div>&gt; +++ b/hw/intc/arm=5Fgicv3=5Fcpuif.c</=
div><div>&gt; =40=40 -1357,7 +1357,8 =40=40 static void icc=5Feoir=5Fwrit=
e(CPUARMState *env, const ARMCPRegInfo *ri,</div><div>&gt; =7D</div><div>=
&gt; break;</div><div>&gt; default:</div><div>&gt; - g=5Fassert=5Fnot=5Fr=
eached();</div><div>&gt; + /* No interrupt was active, this is UNPREDICTA=
BLE. Ignore it. */</div><div>&gt; + return;</div><div>&gt;</div><br><div>=
Makes sense (and looking at the comment in icc=5Fhighest=5Factive=5Fgroup=
()</div><div>that says =22return -1 so the caller ignores the spurious EO=
I attempt=22</div><div>it is what the code originally intended).</div><br=
><div>Reviewed-by: Peter Maydell &lt;peter.maydell=40linaro.org&gt;</div>=
<br><div>Shashi, I guess this also fixes the assert you were seeing here =
=3F</div><br><div>thanks</div><div>-- PMM</div></div></blockquote>
--60b8eca8_7253685_139d--


