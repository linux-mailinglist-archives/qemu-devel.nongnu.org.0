Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0C17BFC6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 15:00:28 +0100 (CET)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jADWd-0000Xy-Qv
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 09:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pr0f3ss0r1492@yahoo.com>) id 1jADTt-00058K-Rj
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pr0f3ss0r1492@yahoo.com>) id 1jADTs-00041A-IK
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:37 -0500
Received: from sonic305-21.consmr.mail.ne1.yahoo.com ([66.163.185.147]:42979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pr0f3ss0r1492@yahoo.com>)
 id 1jADTs-0003lG-Bl
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1583503055; bh=8KndwukGcs4eu5RHDhQRwW+z5XukBHFaafK1Gnjz9IU=;
 h=From:Date:Subject:To:Cc:References:From:Subject;
 b=jZMrjff5XlfYC7DJjZrE460JkLddR94zNG2sUgoNowrdk/Ivz6zf5tggXaBXAwfi2bVFmp1peN6N7oK6ycXzPr0eOnnNKRiRuQ5dcGwQx0W7DxFh58fpl7i2T1mHzJPkd4mKwMwUkgcNIb7AwSPT2EyL9xoea1je4aKxEhqc0TsOVKXKbTXgJIgr4EvaZUf3IxCFGBAxi96JA46stJsU0zNCLuWS/9c/lyA0WPShEnhaBXcJLq+/kmfr6+i67UuXhdJBlnEkpRFrYM7zPBMLN4p7ggSrdqJxGxNrt+sCFaNy5f6FYrWajxCaxAvirwqNOGaHdf/grccHQs3JUeQW4A==
X-YMail-OSG: jQuVyZ8VM1lQa.R6GY7_BeWbT1Ocuzzh0OZCdMKTNY90XPSPG7pB99yiM5_5SGC
 .IhIhqJGRrVhFHLb7uDxQbYUaza7iRLbOnNX_hZtGdzKt0JHyzvdc1G7aBWdyiyfeBu4Q7bjgoDj
 93IgqFZGsjZRQGY2BoDBGGFLSq_sfCGlaBiaJlwyQ0R5VLCh22zUZ_jS1eMuky4eK3tF2bmRNZKr
 lbpJQSqGfV3h58K7UWyAjGdAasYmHprZrCDebdTnCya3QOiCmYKj.z9Qus_ZQ.abQyag9KjLQNGO
 6qDx04MtxAY4uw3Vw44Fcphtem2WE1EJVefv0ou4Zm8PtSgoqqwGamyiOriU9345ZOgLYmFmR_eC
 srr9C4pssSuRUT2X.GRYaO1bd79mNHBBIgp8SrzN3R5HIdD2A4DIOSLNNbntMIovaORjowWpcB71
 erX1AHUG04MT06EmNviA0_amzFAQMYvz.FyK9jbtXlBTBbgzU4dWMLZuYHFjjezsPuu0xtQhI.eM
 ILuBfVvjRjtT1uY7Qh2vJIgf8.fzLYfqSAxqgllQbm_WGz.L9K5EruMsHroxYr9eg_D9mAmOeHVU
 yAp9pcW.iuyio.Mmju4z0aBDqdy3oFndlskgLcLBfQj_zHqfVyh5xA1V.A0uBIDO.jUKtWgpHXfm
 5zm2PJ1mmkWsOpxZAehgEQCtwGB.E_z6fcihg2TaLX0CfFTNrWc3aEm3YVUsca26qmEdlZYH1fde
 p1kwC5BLbFrNM1iD0NI0pp12c2mL9baUEURWHuSLxqxOKjWADduQ.7ZX9EUpcyrs5dsVaVmxqQlK
 ITe27A7AufdX_EF0PtOvTDVAc.uX.eeZf7JYgXx5ubN.rvfyYdEFo394xQf9rw_iZL6B88GTc6mr
 0rYsQ3HGJad4YAEhpFoW0BExLg6x85xk0njo3RVhOiruv6RvKotlUGkeTyBV7PJQPCaveQeOzBdK
 xy4ZI0BOsBX0.Cr2uJepFvMFVP.zpmaPYH9RBhKqrYSyFIzl5ojG._29MC5RNdHoSWtxZ.447H0O
 3VpWljxSZksJ9j4lqDQeEVUyMfJW.WgQEpeBPHEJVxrsd1Pol2qT1aV_cpdEURbLfOoYbTODjtpf
 R97Zy3LKaE3AKYGIIMb.UkKyYFP54D3.9_BQWZ0tVr8xszsFjB7Tx26OYiGURGHdXJiIkPz_wq1s
 KtN2UKzQvgzkRHz.auYgMgTcQupeRbCVckXU2xisDtBHR83auaM56YQkoU8fDxeQyHawhhQ30FdU
 pgF2oq1yTnIY27eE6yLPGTJH0eoobZRfgRwb0smImvox9PTSGNFhU9.MdDvYULqB4tYMt3M6lPsR
 U1E_Bmhin_KJiORtcUc0wrAI5_dKYQKVyC.ete6X4OkZeGTO4qcJyMl2Cel9UZL.ANK.NZoSNM.M
 ndJ_AaP7.E_eHeQZkPnEF_buOECZFr66kUfkv5fHc
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Fri, 6 Mar 2020 13:57:35 +0000
Received: by smtp423.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID eb97a8e4912140956332028c25276864; 
 Fri, 06 Mar 2020 13:57:32 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id m15so1112812pgv.12
 for <kraxel@redhat.com>; Fri, 06 Mar 2020 05:57:32 -0800 (PST)
X-Gm-Message-State: ANhLgQ1kGOr13DgBP+6pibt7n3pM/a4JriRkWvxkkbKRMuoshOvs9fzA
 L41uCMQ8m1/fteYiiT7Ltx3n7zQboE5eunR7qws=
X-Google-Smtp-Source: ADFU+vvTGCt9DHrYu398KByEiMp26mrXAZZpwAs+wwWXw95fsYQJIuk54FF/mzjAYWuvT5KpKRtEk+IQLj6IpRXF8xU=
X-Received: by 2002:a63:8c18:: with SMTP id m24mr3558690pgd.70.1583503051818; 
 Fri, 06 Mar 2020 05:57:31 -0800 (PST)
MIME-Version: 1.0
From: Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
Date: Fri, 6 Mar 2020 13:57:15 +0000
X-Gmail-Original-Message-ID: <CAEJNuHy_O23m0ttcPUYDeeFWLCC2dSvGk8WZPEVr9XkTaAx7Yg@mail.gmail.com>
Message-ID: <CAEJNuHy_O23m0ttcPUYDeeFWLCC2dSvGk8WZPEVr9XkTaAx7Yg@mail.gmail.com>
Subject: Re: [PATCH] sercon: vbe modeset is int 10h function 4f02 not 4f00
To: Gerd Hoffmann <kraxel@redhat.com>, seabios@seabios.org
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
References: <CAEJNuHy_O23m0ttcPUYDeeFWLCC2dSvGk8WZPEVr9XkTaAx7Yg.ref@mail.gmail.com>
X-Mailer: WebService/1.1.15302 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_241)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 66.163.185.147
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/03/2020 09:03, Gerd Hoffmann wrote:
> Fixes console redirection for NetBSD primary bootloader.
>
> https://bugs.launchpad.net/bugs/1743191
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
> src/sercon.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/sercon.c b/src/sercon.c
> index a5dadb7261af..66a1f2412e77 100644
> --- a/src/sercon.c
> +++ b/src/sercon.c
> @@ -464,7 +464,7 @@ static void sercon_104f(struct bregs *regs)
> regs->ax = 0x0100;
> } else {
> // Disable sercon entry point on any vesa modeset
> - if (regs->al == 0x00)
> + if (regs->al == 0x02)
> SET_LOW(sercon_enable, 0);
> }
> }
>

Unfortunately, this patch doesn't sort it for me. It also slightly
messes up with the console, see:

https://i.imgur.com/3ANAQC7.png

-- 
Ottavio Caruso

