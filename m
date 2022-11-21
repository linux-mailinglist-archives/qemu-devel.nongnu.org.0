Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD06320FC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:44:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5D6-0001X3-I6; Mon, 21 Nov 2022 06:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox5D5-0001Wr-60
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:43:35 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox5D3-0006yb-8y
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:43:34 -0500
Received: by mail-pf1-x431.google.com with SMTP id 140so11091069pfz.6
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NY/lL/yH/+e1+JpDr08mqDOjkKsRi3ez0eLWMKgkMTg=;
 b=MrnUmH8tWAVqGkNNwE8pgiDkXpVrFoEFCgpxBiwMAxpcIzukQn+BuDOH89C9BR1YQs
 wpYPmd3AgO8vYxTt7cR+hFOuwhL8xBDxy2ZhrspHuGbZrFVJjSuSJ3CCVT63sekFimz0
 /1ZmTTszMOCb/wkX/nb/M6S1bDQIHGd2MWMzvCNBeM0qL960MKn2ZnzuCHvDKg4RO5Tn
 jfVEDA6ZZj2CxQ3bpQmDEPl/FxgWsNhNZRJpqvlJPtKElXZaIH3Fk33xFFtIuBeHNOSr
 zkUc1LTFAUfziOXdjfQ2WXh+Os6i4ct5crZnv6fAXW9blivwhq+GAMbu3xhm7r6HuO3n
 FkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NY/lL/yH/+e1+JpDr08mqDOjkKsRi3ez0eLWMKgkMTg=;
 b=YntmEUUeN0y28lGpwWyFeyzBTJgAbMGX5r2/wyQfg1U1jCUChOgUzQnhkHeghKxuhI
 ymGDn9XHcxbS2lG9gLuszxRe1th1j0bu3bqiA0Vcw0s13KLpUlfgV/aUOtL7wAQW15Z8
 6fo0eNdxtJkd3zvugQBQBeTocevs5hHb5YTsR5OQ+7T22bReOkQF43+uRFOdsLmLHxRX
 xa7HBQSpeZSkz0h29qeKAlaPlcfwll2ow6bO5x1VhIL1Sm7EjRB7L83L8+r9tsSEl9Uu
 ytxGKUcWYXdDjCHyZX5qhu10PElMSHhYMcvB1HBsHdT2bvrFazu+alG4ivwj1Nge2JDc
 SSAA==
X-Gm-Message-State: ANoB5pkhmP/xnQtL0+yiCJwBGMORsuzfa+rqHnTHgg2CV4EYSzBEATAo
 pm54DuII2XIF4V3I8kvTEIhsCa9hwJNh0Zg0uvaEJw==
X-Google-Smtp-Source: AA0mqf7ISnfvjblviCv44BT4Ow+lJgBpL+TtHjIaslBxswyn/QJ1pxnIFf842K6abNBXGB0UGOLtDXOdQDXI1GEPe/Q=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr1156554pgr.192.1669031011691; Mon, 21
 Nov 2022 03:43:31 -0800 (PST)
MIME-Version: 1.0
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
 <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
 <CAFEAcA8isy4_0iYHWX+3RksCNQwT3U_SH14xg6t-KUPx4b9d=Q@mail.gmail.com>
 <4b4ea622-871f-749a-1de3-b260e1d64b1f@oracle.com>
In-Reply-To: <4b4ea622-871f-749a-1de3-b260e1d64b1f@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 11:43:20 +0000
Message-ID: <CAFEAcA8BpE2N_91J1HXRvC0CqWLwpMhgU6prh6aO3PLO1C4Lww@mail.gmail.com>
Subject: Re: [PATCH] target/arm: build smbios 19 table
To: Mihai Carabas <mihai.carabas@oracle.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 21 Nov 2022 at 11:24, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> La 21.11.2022 13:02, Peter Maydell a scris:
> > On Sun, 20 Nov 2022 at 17:53, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> >> La 18.11.2022 21:11, Peter Maydell a scris:
> >>> On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> >>>> Use the base_memmap to build the SMBIOS 19 table which provides the address
> >>>> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
> >>>>
> >>>> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
> >>>> ("SMBIOS: Build aggregate smbios tables and entry point").
> >>>>
> >>>> [1] https://urldefense.com/v3/__https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf__;!!ACWV5N9M2RV99hQ!KF2xmQw9nxPvqvNCgDleyVHv4MoZseoZFHmR1veww7O2BmRxSH1spOCNWX-c-FvzcaR_o8PunXSWWH2ECvFqlR4E7vw$
> >>>>
> >>>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> >>> Is this a bug fix, or a new feature? What are the consequences
> >>> of it being missing? Is this important enough to go into the 7.2
> >>> release? (My default position would be "no", given this has been
> >>> like this on the virt board for a very long time.)
> >>
> >> This is required by ARM SystemReady Virtual Environment [1]. As
> >> described in the Arm SystemReady Requirements Specification v2.0
> >>    [2] page 9, 2.5.1 SystemReady Virtual Environment (VE) v1.0
> >> requirements,: "FirmwareTestSuite (FWTS) must still be used" -> fwts
> >> checks for the presence of SMBIOS type 19 table and fails the test in
> >> this case.
> > OK, so it's a spec requirement. Are there any actual realworld
> > guests that don't work because we get this wrong ?
>
> We do not have a clear example. The thing we hit was the ARM SystemReady
> certification based on fwts.

Thanks for clarifying; in that case given we're quite far along
in the 7.2 release cycle I think we shouldn't try to get this
patch in to that release but instead put it in for 8.0.

thanks
-- PMM

