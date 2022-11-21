Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E42B631F01
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:04:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4ZL-00018V-KP; Mon, 21 Nov 2022 06:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox4Z8-00016S-EN
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:02:20 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox4Z5-0006yS-W3
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:02:18 -0500
Received: by mail-pf1-x430.google.com with SMTP id v28so10979619pfi.12
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B2DOkmhHiMlanLxEQ8OMaNdxcW9nQg07gCJ3LOga/cg=;
 b=EhCLy8v9IbugGP4JxbNsq3L3cBbyDaTHmId+vcO9wVKbyRGfj7rphrgUDHM82ulmn2
 7auUoI4e/jrYyikRLkInRssUXHKPmA5CkZaq5hq+2hellb6YmE/7qTm3l0HgAdZJ2wTV
 ShB+7vgW1RU0mY0ILskfWU6FlvItt5eOV0WyUOYXBK5KoDlcVwGzQd99DHDjiDxAbTil
 OM1yFJkW/ZiJTGgFCb6w0NDgGWhCX157eKDlwKujxeYMvZAXRE9wGLCxRcTh6dd3hIUL
 wfnPHU3m4s5XfVTU+tqHWR9McAv0cu4l+WwS6BTAYKRz20HLytwUVYOoqmfrjMfTcupy
 RuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B2DOkmhHiMlanLxEQ8OMaNdxcW9nQg07gCJ3LOga/cg=;
 b=75wfEpPdl1ME8FQUExJOCBmXCUDOMvneD/QoP0t8iIa2HXNWT7Grxem6teeui1akUa
 NFpfDHO1Tjdd0KnahseI8fNKwSb/5E85ABhrDHEwWGdXss1QCkpLZMwou6GwxUfeaasO
 aySev9fsciRg1ZpQEURNGveI+zeqO55LQmizeoZWjuMefIAcaWVZrbIVIgbrRkhgYIHA
 0GPna0dKDN61+UOEG6MQT2Yj7EHco76gbMJmuf6fYgE+O365AX9IbQt97Am0B19jWL3j
 sUHg8A6KwuDWT6ltxULl3mz6vx7xaLMEQZBdNuHjJlc5mCA60cHGz1blGsTNyGSsuoFc
 rwVw==
X-Gm-Message-State: ANoB5pnmtf7TDG5yOAK+CdFn+bqmJmjd0nFgzJwJmuIrbpMsSFm4sIIJ
 bEDfJzf41zsgr08qi9i9ozXaatWXVmCFRcn86naXYQ==
X-Google-Smtp-Source: AA0mqf7ryfN/7qUH4dZxUgGdd3/C35IV8PNUGTo3BM9CD7OWdm5GrcW9QlhnZd9uHZ55iRFY2cdM70X3nW07adchlMo=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr8781374pfe.51.1669028533801; Mon, 21 Nov
 2022 03:02:13 -0800 (PST)
MIME-Version: 1.0
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
 <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
In-Reply-To: <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 11:02:02 +0000
Message-ID: <CAFEAcA8isy4_0iYHWX+3RksCNQwT3U_SH14xg6t-KUPx4b9d=Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: build smbios 19 table
To: Mihai Carabas <mihai.carabas@oracle.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, 20 Nov 2022 at 17:53, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> La 18.11.2022 21:11, Peter Maydell a scris:
> > On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> >> Use the base_memmap to build the SMBIOS 19 table which provides the address
> >> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
> >>
> >> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
> >> ("SMBIOS: Build aggregate smbios tables and entry point").
> >>
> >> [1] https://urldefense.com/v3/__https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf__;!!ACWV5N9M2RV99hQ!KF2xmQw9nxPvqvNCgDleyVHv4MoZseoZFHmR1veww7O2BmRxSH1spOCNWX-c-FvzcaR_o8PunXSWWH2ECvFqlR4E7vw$
> >>
> >> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> > Is this a bug fix, or a new feature? What are the consequences
> > of it being missing? Is this important enough to go into the 7.2
> > release? (My default position would be "no", given this has been
> > like this on the virt board for a very long time.)
>
>
> This is required by ARM SystemReady Virtual Environment [1]. As
> described in the Arm SystemReady Requirements Specification v2.0
>   [2] page 9, 2.5.1 SystemReady Virtual Environment (VE) v1.0
> requirements,: "FirmwareTestSuite (FWTS) must still be used" -> fwts
> checks for the presence of SMBIOS type 19 table and fails the test in
> this case.

OK, so it's a spec requirement. Are there any actual realworld
guests that don't work because we get this wrong ?

> > Do we need to care here about pluggable memory devices?
> > (We seem to do something with them in the ACPI tables
> > via build_srat_memory(), so maybe not?)

> Here you are refering to the fact that when we hot plug a memory dim, to
> automatically update smbios type 19 entry/entries?

I don't know anything at all really about any of these ACPI/SMBIOS/etc
data structures. I do know that the virt board has two ways to
have RAM in it:
 * the 'standard RAM" that you get with -m 1024M etc
 * the pluggable DIMMs

So I'm just asking if this bit of code needs to account for
the second kind, or if this SMBIOS table type only cares about
the first kind. If you don't know the answer then we can
check with the person who added the pluggable DIMM support.

thanks
-- PMM

