Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D573445AC2F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 20:24:07 +0100 (CET)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpbOg-0000BT-EX
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 14:24:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mpbN8-0007SR-FZ
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 14:22:30 -0500
Received: from [2607:f8b0:4864:20::733] (port=39710
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mpbN6-000249-0R
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 14:22:30 -0500
Received: by mail-qk1-x733.google.com with SMTP id b67so231887qkg.6
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 11:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:date:from:subject:thread-topic:in-reply-to:message-id
 :references:to:cc:content-transfer-encoding;
 bh=VDHthiCFGzPK9xfhGTlrdZ2wAK13mByUWVZ20lfiLAk=;
 b=cu4KAXJ3LKujVE1RXs+01kKyIRJo4WsyBCriIPCl1Lg006IHDJAM2xG5ujOWZHfGBk
 Q/3iFYVGwex4mlNEJSuw1NCgYnttVKk2vKC7Xi2HJW30uEl4kVAWqAI3Xk9ukJs6HXwf
 L5x8ZZhf4VReWApd4defN1VlN1Ho7FGVuBtAwNQTMmm5yXgr4HOOaflVIIOO8Zi6SDff
 5tSX+q9EqS07+XClHGtEY4H3CuV2QEC2ya9WuBq3rU1/UDAbkiimsMfOIQBaTl5HUeSY
 YUhyN7BxFa1xAiTOoEOLRIMhaIvqDyFrdueoa3jWC/z5qb/iSAWECvPgpWHzwhO6HcTF
 J8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :in-reply-to:message-id:references:to:cc:content-transfer-encoding;
 bh=VDHthiCFGzPK9xfhGTlrdZ2wAK13mByUWVZ20lfiLAk=;
 b=cmSJxEV5FYs3ixbTORwgBnsrPdA93DGZEl9ttOCBSJfbmMR1u6h2tb9/WQxqWJdUT2
 P9/yixlY7rMHL/L5egc72V/wK3UbCezoCVOPyMSpzuAOLm4Mm9VdtEsI4eMoEDXvX/oH
 hoqJfk6v+oVBVYuxUEwt7jSOIAwvtWBR+xiR2q0ELy5AleoNzzGGt7Czzg72uES+GklY
 mw5wEenDC536aHBuPkveCSERUFJG/Q51w/hhM+aBD8BfJzO0Br5xAmaDMngRKKi8XQDx
 ebLw3dpmORIcBKn4zAAJWrQI3QmK51tRFURRgELyte16ZYwwTZH5z/slDUx+J1HpKobX
 /JAw==
X-Gm-Message-State: AOAM532adzHc4dJlzYjQE0DslCMUwqjMKabkPiygdMyKrTNPkxkamq1f
 I/iUAEsA1+bC6057BgDXQ8E3sA==
X-Google-Smtp-Source: ABdhPJxAbeHrV1ZYY8sNcw+Xt5xqJHkVlVyIlDQc6WB7RW7UE/SWC/5B8/y1132czRfl2Feauerj8A==
X-Received: by 2002:a37:9f46:: with SMTP id i67mr7266638qke.254.1637695345110; 
 Tue, 23 Nov 2021 11:22:25 -0800 (PST)
Received: from LAPTOP-T2OT88E8
 (bras-base-stsvon1503w-grc-20-142-114-141-224.dsl.bell.ca. [142.114.141.224])
 by smtp.gmail.com with ESMTPSA id v5sm6348744qtc.60.2021.11.23.11.22.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Nov 2021 11:22:24 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 23 Nov 2021 14:22:23 -0500
From: Shashi Mallela <shashi.mallela@linaro.org>
Subject: RE: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
Thread-Topic: RE: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
In-Reply-To: <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
Message-ID: <233AD939-3A37-4075-8430-8FFBC6A04836@hxcore.ol>
References: <20211123171031.975367-1-peter.maydell@linaro.org>,
 <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MIME_HTML_ONLY=0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-CA link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal>Since=
 LPIs do not have an active or active and pending state,the current impleme=
ntation only clears the LPI pending state from the pending table once ICC_I=
AR1_EL1 acknowledges the interrupt.</p><p class=3DMsoNormal>But, as part of=
 gicv3_lpi_pending() processing, cs-&gt;hpplpi is updated with the next bes=
t priotiy lpi (only if the current acknowledged irq was best priority irq).=
</p><p class=3DMsoNormal>By calling gicv3_redist_update() in icc_activate_i=
rq(), we are re-initiating high priority irqs scan in redistributor and if =
applicable trigger of next best pending lpi from the latest cs-&gt;hpplpi i=
nfo(which otherwise would have happened on next irq trigger from source).Is=
 this the behaviour expected?</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p>=
<p class=3DMsoNormal>Thanks</p><p class=3DMsoNormal>Shashi</p><p class=3DMs=
oNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Sent from <a href=3D"http=
s://go.microsoft.com/fwlink/?LinkId=3D550986">Mail</a> for Windows</p><p cl=
ass=3DMsoNormal><o:p>&nbsp;</o:p></p><div style=3D'mso-element:para-border-=
div;border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm'><=
p class=3DMsoNormal style=3D'border:none;padding:0cm'><b>From: </b><a href=
=3D"mailto:peter.maydell@linaro.org">Peter Maydell</a><br><b>Sent: </b>Nove=
mber 23, 2021 12:46 PM<br><b>To: </b><a href=3D"mailto:qemu-arm@nongnu.org"=
>qemu-arm@nongnu.org</a>; <a href=3D"mailto:qemu-devel@nongnu.org">qemu-dev=
el@nongnu.org</a><br><b>Cc: </b><a href=3D"mailto:alex.bennee@linaro.org">A=
lex Benn=C3=A9e</a>; <a href=3D"mailto:shashi.mallela@linaro.org">Shashi Ma=
llela</a><br><b>Subject: </b>Re: [for-6.2] hw/intc/arm_gicv3: Update cached=
 state after acknowledging LPI</p></div><p class=3DMsoNormal><o:p>&nbsp;</o=
:p></p><p class=3DMsoNormal>On Tue, 23 Nov 2021 at 17:10, Peter Maydell &lt=
;peter.maydell@linaro.org&gt; wrote:</p><p class=3DMsoNormal>&gt;<o:p>&nbsp=
;</o:p></p><p class=3DMsoNormal>&gt; In gicv3_redist_lpi_pending() we updat=
e cs-&gt;hpplpi to indicate the</p><p class=3DMsoNormal>&gt; new highest pr=
iority pending LPI after changing the requested LPI</p><p class=3DMsoNormal=
>&gt; pending bit.=C2=A0 However the overall highest priority pending inter=
rupt</p><p class=3DMsoNormal>&gt; information won't be updated unless we ca=
ll gicv3_redist_update().</p><p class=3DMsoNormal>&gt; We do that from the =
callsite in gicv3-redist_process_lpi(), but not</p><p class=3DMsoNormal>&gt=
; from the callsite in icc_activate_irq().=C2=A0 The effect is that when th=
e</p><p class=3DMsoNormal>&gt; guest acknowledges an LPI by reading ICC_IAR=
1_EL1, we mark it as not</p><p class=3DMsoNormal>&gt; pending in the data s=
tructure but still leave it in cs-&gt;hppi so will</p><p class=3DMsoNormal>=
&gt; offer it to the guest again.</p><p class=3DMsoNormal>&gt;<o:p>&nbsp;</=
o:p></p><p class=3DMsoNormal>&gt; The effect is that if we are using an emu=
lated GICv3 and ITS and</p><p class=3DMsoNormal>&gt; using devices which us=
e LPIs (ie PCI devices) then Linux will</p><p class=3DMsoNormal>&gt; compla=
in &quot;irq 54: nobody cared&quot; and then hang (probably because the</p>=
<p class=3DMsoNormal>&gt; stale bogus interrupt info meant we never tried t=
o deliver some other</p><p class=3DMsoNormal>&gt; real interrupt).</p><p cl=
ass=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hmm; this is defi=
nitely a bug, but maybe it's not the cause of</p><p class=3DMsoNormal>the s=
ymptoms listed above -- I've just seen them again even</p><p class=3DMsoNor=
mal>with this fix. I'll keep digging...</p><p class=3DMsoNormal><o:p>&nbsp;=
</o:p></p><p class=3DMsoNormal>-- PMM</p><p class=3DMsoNormal><o:p>&nbsp;</=
o:p></p></div></body></html>=


