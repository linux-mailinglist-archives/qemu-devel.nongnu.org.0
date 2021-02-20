Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E737432043D
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 07:57:25 +0100 (CET)
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDMCi-0002uc-Ei
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 01:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDMBa-0002D2-Pc; Sat, 20 Feb 2021 01:56:15 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:36865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDMBW-0004TU-Ju; Sat, 20 Feb 2021 01:56:14 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id p193so7782174yba.4;
 Fri, 19 Feb 2021 22:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z/N96ttijeiYHVy4W3NYjRPVjLRmizzrpgnTFATmkE4=;
 b=gQoXtvKzy7qVGKm6xf8/1t0mlaL/zTD/5uUiVgICr7g8grwkodYgg26myB2abvZSfi
 XagkfbGM6QtYU9OK6xCNli8I6fKnL92VW+P9a1NNFsuuLDlaTonuwjhM7TWE+6fTOqf5
 soswovbPDjiENsCy72ag3S6X2npbbeogYB/MkLZI8DEbjIAf/R94x0tzBtO4QpaPiYon
 iFx9/xysOBHbp7XasPRhy+/eyFZLP0fl+5FzLwol6WqKz76j/NhV+PTixo0psjjyWmFs
 3ONsU8qWuuCBCDkG2KVEC8LsWhmglE3lL3Z/HLu7Y3DvFakNJXTt5Nt541DFRKqb7/VB
 cFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z/N96ttijeiYHVy4W3NYjRPVjLRmizzrpgnTFATmkE4=;
 b=ANNi7GsLS4cDPhMAyRHi8bI/5eP3atRCn7E3IXLKMM3WrhyQXjh5WuzO9nRdRTpkua
 GUbTUmHqAasCzsIJKxQh9MtCbxWG3vmTwqrhwg/coqGdE0minmIR+tfzi1AhzRLmftX5
 JB9DOOa2MoxNREnPuLtA3vGnfxyK5fpMKUMUDAmoj1y9xn1RKaFwFvEt45QMKejKOhZv
 G07YFaTDPnaMuhRN0kHqa7y/Lzk4PtID4wnEzt0fYuJUSbg02HwVmx2FtakJZvYtoTeh
 anqakRz6JBYbLeTDbF40jKKUNWsQrhsEbmtA5GnwnigcM5pEcTZOrMf+tU0zcwneQM7f
 ObaA==
X-Gm-Message-State: AOAM533TiY6t0WvtDhUWIXIeHNHyYNU5mpTP/pRJmlWhWq1446PAQpiK
 3PozoY0DCvXWpfefTGJdQbMGix0uAAZ5rHEjlhI=
X-Google-Smtp-Source: ABdhPJzmCQMuPc14KKuxfgB/pCLt0I2RrjxOai+Xa0pxNCHsDM28Zl4ynwOuREsrS9AMOoCY14ZGeQuOmFuwN/4/dq8=
X-Received: by 2002:a25:3387:: with SMTP id
 z129mr20407310ybz.239.1613804168567; 
 Fri, 19 Feb 2021 22:56:08 -0800 (PST)
MIME-Version: 1.0
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-6-git-send-email-bmeng.cn@gmail.com>
 <9d73ef0b-2d58-6c5b-8a14-590eaddd4a3c@amsat.org>
 <53f50f67-90c9-4c6c-c42a-d2eab7bccecb@amsat.org>
In-Reply-To: <53f50f67-90c9-4c6c-c42a-d2eab7bccecb@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 20 Feb 2021 14:55:57 +0800
Message-ID: <CAEUhbmXLTUNzHqHgvsmPKaWMVbRvJZk2-kgd0Ph0+C0o0Nf2zw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hw/sd: sdhci: Limit block size only when
 SDHC_BLKSIZE register is writable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@163.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Fri, Feb 19, 2021 at 2:03 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 2/18/21 6:09 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 2/16/21 4:46 AM, Bin Meng wrote:
> >> The codes to limit the maximum block size is only necessary when
> >> SDHC_BLKSIZE register is writable.
>
> Per "SD Command Generation":
>
>   The Host Driver should not read the SDMA System Address, Block Size
>   and Block Count registers during a data transaction unless the
>   transfer is stopped because the value is changing and not stable.
>   To prevent destruction of registers using data transfer when issuing
>   command, the 32-bit Block Count, Block Size, 16-bit Block Count and
>   Transfer Mode registers shall be write protected by the Host
>   Controller while Command Inhibit (DAT) is set to 1 in the Present
>   State register.
>
> Shouldn't we check for !(s->prnsts & SDHC_DATA_INHIBIT) instead?

Yes, for accurate emulation I think we should.

Current implementation uses !(s->prnsts & (SDHC_DOING_READ |
SDHC_DOING_WRITE)) which eventually is correct, because:

SDHC_DATA_INHIBIT bit is set if either SDHC_DAT_LINE_ACTIVE or
SDHC_DOING_READ is set (SD Host Controller Spec v7.00 chapter 2.2.9
Present State Register)

SDHC_DAT_LINE_ACTIVE bit is set after the end bit of read or write
command, and after end bit of read or write command will generate
SDHC_DOING_READ or SDHC_DOING_WRITE (SD Host Controller Spec v7.00
chapter 2.2.9 Present State Register)

Regards,
Bin

