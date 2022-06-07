Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A391953FF44
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:46:15 +0200 (CEST)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyYb8-0003PD-Db
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nyY4E-0007Gz-8Z
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 08:12:14 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nyY4B-0005jw-VE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 08:12:14 -0400
Received: by mail-pg1-x52a.google.com with SMTP id c18so7350475pgh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 05:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GijARRYnxL8YO0+sEq7CgmOSfAqFvvakkFBsv6at5Ao=;
 b=QjzQzhgN46s/kESurvy5S4WXixwl3Jm+2nFPnTlxnjoSrWHmBxRXLsMr3HMecO2Vnr
 lfVnS8JFp0oF1rJXEjgZEkvnIK3V1pb+p2LJLKQCKwpe1GJTL5x9JAVxRpf5ZZSmyFC8
 Qh91hc5xUPBJfy0S1PAulnlR8qZAEFmhM6vCI8l+iCJmD8MzC3lj2njzB1l0jgKRoVLj
 +J6d+GMrx8b4RUDTxxHQNafJTXpvnQGSbkhaqCIebWwJEFADOyWOQumc0WlnZasuDu85
 uC1xwpDV4Vg2XPBCEjsn4vm412qsUYFOKz9mZyIPWK5l3s30sdhQltu2bDmO8pbGa9PK
 kiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GijARRYnxL8YO0+sEq7CgmOSfAqFvvakkFBsv6at5Ao=;
 b=w4roO+VOsAjb3vA6+bWc+bMDa59F2GaCmu+kPBf9u2EzF7zGAFE8nIkz0wv4pwUf5K
 /iXJiCT5HT38c6I9R1GhsTvmRqkuCBeb2jJNm9mmHPFmNRiuXPnGToFAHew9m3C5vtkJ
 NGPdjeMnhHI3rUJrv7ZZo4Mry0Ne865hYTxR6mGNEbx6AcadB7UcVbIRjIHBYM965CEv
 6TZx4ojI1F6kW/J1/sEzAOYHjK8az5rkVH5Qr2GQCb8E6XR4yabSQ4pRekoF4XGYzS44
 y6xfBYTfvKS63zXVcT0iEnCmCkojZcKtjpxXt7ed8bVXAM1TOSUrGYNLWqSc1U5Cp39L
 9b+Q==
X-Gm-Message-State: AOAM531bk0YE070YjWdmr8bcDxZ9/t3Fj0hCpSkegjgD40KNVlhQcPqo
 mdYI/YMKEekXfCDo0pMXIF4=
X-Google-Smtp-Source: ABdhPJwCSCn5Byw+9714s59/vTRyhGwy+WF9gUTl/b+De7VI8bPEHCvQiZzq5tYWiT59Mdr5aE1XgA==
X-Received: by 2002:a63:f003:0:b0:3db:84d3:743d with SMTP id
 k3-20020a63f003000000b003db84d3743dmr25232916pgh.97.1654603930382; 
 Tue, 07 Jun 2022 05:12:10 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 jh13-20020a170903328d00b0015eab1b097dsm12335643plb.22.2022.06.07.05.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 05:12:09 -0700 (PDT)
Date: Tue, 7 Jun 2022 21:12:07 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Joel Stanley <joel@jms.id.au>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>,
 QEMU Development <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
Message-ID: <Yp9Al1UfqvIzStI7@antec>
References: <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
 <YpwNtowUTxRbh2Uq@antec> <Ypxb/VDfYLFg3n2s@antec>
 <CAMuHMdVwAzbAOBDcv4y1WmYgCaFOMdywxUZvwMtDccOgDMN+mw@mail.gmail.com>
 <CAK8P3a3Vpn02uDe3rdXSNXANY=u4ZM+wjm-qqszTXzjOKkAeEg@mail.gmail.com>
 <Yp8epZsizfKMEVZV@antec>
 <CAFEAcA97oraa5OSdqmubmJ2-ONTCTF4ZszwfTcZ9VhqKRFhogA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA97oraa5OSdqmubmJ2-ONTCTF4ZszwfTcZ9VhqKRFhogA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 07, 2022 at 11:43:08AM +0100, Peter Maydell wrote:
> So I don't have a strong view on whether these devices should
> be DEVICE_NATIVE_ENDIAN or DEVICE_LITTLE_ENDIAN (except that
> my impression is that a DEVICE_LITTLE_ENDIAN device on a
> big-endian system is a bit weird, because it means the guest
> has to byteswap everything. You see that with PCI devices because
> the PCI spec mandates LE, but not often elsewhere).
> 
> If there's an official-ish spec for how goldfish devices are
> supposed to behave (does anybody have a pointer to one?) and it says
> "always little-endian" then that would probably suggest that fixing
> m68k would be nice if we can.

I think there are some conflicting thoughts on this.

In Geert's he mentioned:

  Using Goldfish devices as little-endian devices should be fine.

In Arnd's mail he mentions:

  https://lore.kernel.org/lkml/CAK8P3a1oN8NrUjkh2X8jHQbyz42Xo6GSa=5n0gD6vQcXRjmq1Q@mail.gmail.com/#t

  ... the device was clearly defined as having little-endian
  registers,

Based on that I was thinking that switching to DEVICE_LITTLE_ENDIAN would make
sense.

However, in a followup mail from Laurent we see:

  https://lore.kernel.org/lkml/cb884368-0226-e913-80d2-62d2b7b2e761@vivier.eu/

  The reference document[1] doesn't define the endianness of goldfish.

  [1] https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT


The documentation does not clearly specify it.  So maybe maybe or1k should just
be updated on the linux side and add gf_ioread32/gf_iowrite32 big-endian
accessors.

-Stafford

