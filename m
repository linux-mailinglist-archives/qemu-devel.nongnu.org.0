Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00F340DCB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:04:55 +0100 (CET)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxx0-00059l-B7
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMxvQ-0004Du-9K
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:03:16 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMxvO-0005TB-Iu
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:03:15 -0400
Received: by mail-ej1-x632.google.com with SMTP id l4so5646036ejc.10
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 12:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9njPiepWO9q+2W5ygbyr0iVoktGZPwDQO/xaLoNQV/M=;
 b=wzK6en96y99YoMMyBMTbi+8LRMTmxrgkEd89S7WMN7FBBPBHH1gqvbRuI2LnM5JAb7
 c0deLzhUuGbhiz4lQ/HlP0TiY0he1gf1Zps2mxZW4mltPdjouwoPXgk52W2Ozf9cpj7/
 q2EuuD4moCEG4Y8+D+Ts0LZY1e4rF3mRv6U4fJkgINDBNE3oFLlXvogx1/AfH1AzDycO
 ktBJ+3NFZNhTqln6Psg5O6+/xGAJaLXBo4hgq1L3DpFppRzg+JubiOF4oI0yPoUf4a8v
 6jofXss3i4FUOMiiKso2fykhYRVKoLLBwiMXtai7JWa1mB0Se7O1I8N4hs2sXo1ERbgK
 esug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9njPiepWO9q+2W5ygbyr0iVoktGZPwDQO/xaLoNQV/M=;
 b=NnYROz1RjztxPKTUN2/AC7oHjP+cdy9S2epGXjckwzRwt01xK5/dNAKn+oW/Z1lKkN
 kjTrkFzXKatjAa7/smfrpsGL45QeaGtJGwJbG1eOC1u+0U/d3WhIbw7KVnoqFotgsexI
 kg8kiiQuHjNB8D2ka8EjbpOgTcELuDUkhcjQKoCY+oT94mWR3IQlxMtuuyyPY16l2+op
 EhF8aD8csUIhKmQpwcjK6BAdVSXbtgAvMEkoTplj9Jj5bGqaG7REx7smkiY4gsKrCeMl
 PsxcWLCthiP7LfPBLb2vZLSCq7aNTocmtZ6bT7xyGKkD5O4hBRCGeItE/334GDqen6fa
 /1hQ==
X-Gm-Message-State: AOAM532dywL3MCYob92vLeNugnOv6eIWE3OluWYpb7I+oiKmKJC2l295
 Erk9MsUBp0VNSKu/SWnHG7h5ptHMfuEkUIym9jHSug==
X-Google-Smtp-Source: ABdhPJwlCT30ebxJppC2Mx2JlebJSF+XvaaYfm56GKaMuN/MkeHL6nSBhqJfHGgFKA+0sapxB2kUZnv6IX7vptMvU+c=
X-Received: by 2002:a17:906:bd2:: with SMTP id y18mr53541ejg.482.1616094192956; 
 Thu, 18 Mar 2021 12:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
 <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
In-Reply-To: <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 19:02:48 +0000
Message-ID: <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 18:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/18/21 11:48 AM, Peter Maydell wrote:
> > +
> > +void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size)
> > +{
> > +    /*
> > +     * Find any ROM data for the given guest address range.  If there
> > +     * is a ROM blob then return a pointer to the host memory
> > +     * corresponding to 'addr'; otherwise return NULL.
> > +     *
> > +     * We look not only for ROM blobs that were loaded directly to
> > +     * addr, but also for ROM blobs that were loaded to aliases of
> > +     * that memory at other addresses within the AddressSpace.
> > +     *
> > +     * Note that we do not check @as against the 'as' member in the
> > +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
> > +     * AddressSpace which the rom blob should be written to, whereas
> > +     * our @as argument is the AddressSpace which we are (effectively)
> > +     * reading from, and the same underlying RAM will often be visible
> > +     * in multiple AddressSpaces. (A common example is a ROM blob
> > +     * written to the 'system' address space but then read back via a
> > +     * CPU's cpu->as pointer.) This does mean we might potentially
> > +     * return a false-positive match if a ROM blob was loaded into an
> > +     * AS which is entirely separate and distinct from the one we're
> > +     * querying, but this issue exists also for rom_ptr() and hasn't
> > +     * caused any problems in practice.
> > +     */
> > +    FlatView *fv;
> > +    void *rom;
> > +    hwaddr len_unused;
> > +    FindRomCBData cbdata = {};
> > +
> > +    /* Easy case: there's data at the actual address */
> > +    rom = rom_ptr(addr, size);
> > +    if (rom) {
> > +        return rom;
> > +    }
>
> Should you really have this special case?  Nowhere is this going to verify that
> @addr is in @as.

It's the "happens almost all the time" case. Nothing verifies
that @addr is in @as anyway -- see the "Note that" part of the
comment above.

thanks
-- PMM

