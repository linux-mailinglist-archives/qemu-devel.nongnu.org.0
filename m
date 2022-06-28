Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7078755E5D7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:56:06 +0200 (CEST)
Received: from localhost ([::1]:37934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DZN-000734-HU
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6DWF-00033t-MH
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:52:51 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6DWD-0002tP-U4
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:52:51 -0400
Received: by mail-yb1-xb33.google.com with SMTP id p7so21515245ybm.7
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bB6NIa/NcaJNvBdTjBIRo4gX7WPhlLDFD+Q6ZMpW/eY=;
 b=sBG2m2rUnFq8LKd8NsZs58al61Q/1rR4w4DKoOQ7vMg2KMJn2GephY+7IQCMST//u7
 QvNeA6pmYA07ASeSncXw5L8wW9gNKBongoR2l3KY3SIvztDHV0kE5sWZCj/Y4JUUBuQI
 wLtBYVrqY2PVIwOOuiExqRxZdlCPTzDFgJK+3htlioTjHjEpriWsc3bnM7qV+Preokkr
 4S37GXN2eCJuTkgAmL9v5sPNJVmAUnqt641qzp40xAEAeU3G2ynDYakUUMrt7fWU9tVN
 2P07I25ewnWlgoZu3aB7rgTNHkS6wxT8vk+f/ngwGHjoP5i0Veqow6KCS2AG46m/3Lwu
 x2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bB6NIa/NcaJNvBdTjBIRo4gX7WPhlLDFD+Q6ZMpW/eY=;
 b=TFlThHqKvvSlamHmIby7yo46GC3vysA0FbLdEx6kToBgoNVWKvOSWytIr+dRyVuyeW
 FTS5uRHCHv7fmOMIrvdtFQjarjpSav1JX9tKDJbvWC+t2rHqhFTSZsrlfn1V0e64hdu6
 l2IYHhdxvEmXK2r6PJvJwnLYyQGD++CVOSAJhBjV/bqpoZw2QOZgIsfdEvpQwMGheK0s
 kwCEyOkmSkMYpqhR+KCEaySZ1cD1c4nBF/5un+cv8wUcEmkUxcF8PJwGSDTgaT78mQvs
 usLTmF/31yDZyN/fug6/t7poKbM3+WoGI262WWIIhHYUf66Y94cSfS2knF1wU5IDRgnQ
 g+Hw==
X-Gm-Message-State: AJIora9YgV7gtscw05rtKBxKlv1TEWUNEr/fkLzLCoSHqhYbvfyjCpZP
 KunS6+c6hCBkp8/a/zFNhmMVmvdaSAmVoHexp8HRJg==
X-Google-Smtp-Source: AGRyM1uIOzPI8FkF1zNvHsJ7FgbPgcGZnvDY11OGVdZjkDLjTbc5hiaq/wpZv3JJ/8EBqbxQ9kHUT2Cg6rundwTpD6A=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr19599511ybr.39.1656431568542; Tue, 28
 Jun 2022 08:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220628154724.3297442-1-peter.maydell@linaro.org>
In-Reply-To: <20220628154724.3297442-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2022 16:52:10 +0100
Message-ID: <CAFEAcA9XdA4H50TKBw4fWskgPo5E-5DZGQatKG_yqwBKtnQUfw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is
 being held high
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Igor_Kotrasi=C5=84ski?= <i.kotrasinsk@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Jun 2022 at 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the M-profile Arm ARM, rule R_CVJS defines when an interrupt should
> be set to the Pending state:
>  A) when the input line is high and the interrupt is not Active
>  B) when the input line transitions from low to high and the interrupt
>     is Active
> (Note that the first of these is an ongoing condition, and the
> second is a point-in-time event.)
>
> This can be rephrased as:
>  1 when the line goes from low to high, set Pending
>  2 when Active goes from 1 to 0, if line is high then set Pending
>  3 ignore attempts to clear Pending when the line is high
>    and Active is 0
>
> where 1 covers both B and one of the "transition into condition A"
> cases, 2 deals with the other "transition into condition A"
> possibility, and 3 is "don't drop Pending if we're already in
> condition A".  Transitions out of condition A don't affect Pending
> state.
>
> We handle case 1 in set_irq_level(). For an interrupt (as opposed
> to other kinds of exception) the only place where we clear Active
> is in armv7m_nvic_complete_irq(), where we handle case 2 by
> checking for whether we need to re-pend the exception. For case 3,
> the only places where we clear Pending state on an interrupt are in
> armv7m_nvic_acknowledge_irq() (where we are setting Active so it
> doesn't count) and for writes to NVIC_CPSRn.

Should read "NVIC_ICPRn"...

> It is the "write to NVIC_ICPRn" case that we missed: we must ignore
> this if the input line is high and the interrupt is not Active.
> (This required behaviour is differently and perhaps more clearly
> stated in the v7M Arm ARM, which has pseudocode in section B3.4.1
> that implies it.)

-- PMM

