Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9148635EF88
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:33:33 +0200 (CEST)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWaxo-0005Ux-Ny
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWavY-0004KU-Bw
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:31:12 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWavW-0003Qh-E5
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:31:12 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 82so21249697yby.7
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pqhg60qdoytdXLeGEgSonkWTkTlFARfJrbT1ixvNiyY=;
 b=ga3b4e+Nvd9dF16WRz2qoz+deBHkWugTtr+ENsy+F/FEvjm4vvNlKwx+Go9uopZwHJ
 GvrqsYH+39EylbmI/q9tlZ6/TbPvjKfaf3OOS218J7OEtxDGyouzC7dsa+OZzSLQLMAe
 9iOaAqIwN5zKs2B+th8p0LYe+U9pREAFWYxGw132sd60UsQ1E/zaWcq9ZFogcoTiBgp/
 b6sDcDfgFAmwV+SdshLNg/UaUfR2LtUgzR2+LXao1HZoTVhTejC0xvbw3PDRie1EtIID
 3FWdpr4PvHkYuZQIN8cnj1N7+xR457jUlpV8zzswIQu2PxOEsJVffa+xy0PncAhrM4gA
 XA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pqhg60qdoytdXLeGEgSonkWTkTlFARfJrbT1ixvNiyY=;
 b=Z62HBXxKUI965SVkAhMYf0b1nblvsiwJnT+pQPUkARIhbTAwWIh58bzPg5A6X2OeFp
 1Z/jiyxZAgw4jxzxXz1nLeb3NEpk+6a5zjnyD9W9ivUPCcMmYd1DvTL0q9EHQROFRpi9
 HWRDuzX11Z+1dVhCsVDNPB2vOPAA9GxSJYUQG3kjZnCRhxpfq50lShIkzQYzg3AfyOxC
 kyk3uCA7RVzdo1aQkwl6UW0fEDmTGtpYF0QxbtfgRMRiYC2171SbmWpobnn6ZiZxzCIA
 k1ob6hGtdHf82EBE4gjfryLxlb0XFQvViiQ2nmfm3y45s0gbBGnTRnc3dlCy+9y0ZQCr
 QN3Q==
X-Gm-Message-State: AOAM531pXtnZ4hYHSObiIBvziBKgaDdgk2GSzf1B78GuP92seTF+7L51
 VKIJQWWifdY7N1pINloRNr8OxO78riXnlthz/JI=
X-Google-Smtp-Source: ABdhPJwDRiZWXAtUJm2lSUr8K0VQLLzQLkqgVukLUU6NWwqicTslFPZvEZS5h5wxE8C86SXchzWGF8teU8JGTKsrfIM=
X-Received: by 2002:a25:d181:: with SMTP id
 i123mr28317703ybg.387.1618389069339; 
 Wed, 14 Apr 2021 01:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <CAEUhbmWsBfhub-+hMvucshCRH412fuvz5_=fAU_y7UmYJ4_=dQ@mail.gmail.com>
 <5445e140-94f1-dfcf-4652-0e47494e8c23@weilnetz.de>
In-Reply-To: <5445e140-94f1-dfcf-4652-0e47494e8c23@weilnetz.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 16:30:58 +0800
Message-ID: <CAEUhbmWJ3kGk4sVM3+TsHmZrDrekqSYcFebpztedU4jkw1DoWQ@mail.gmail.com>
Subject: Re: any remaining for-6.0 issues?
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On Tue, Apr 13, 2021 at 2:19 PM Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 13.04.21 um 07:56 schrieb Bin Meng:
>
> > On Mon, Apr 12, 2021 at 11:33 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >> Last call to note anything we need to fix for 6.0 on
> >> https://wiki.qemu.org/Planning/6.0#Known_issues please.
> >> The schedule is to tag rc3 tomorrow, which I would ideally like
> >> to be the last rc before release. After rc3 I will only be taking
> >> fixes for bugs which are absolutely critical...
> > This patch (affects Windows install)
> > http://patchwork.ozlabs.org/project/qemu-devel/patch/20210326062140.367861-1-bmeng.cn@gmail.com/
> >
> > is still not applied.
> >
> > Regards,
> > Bin
>
>
> That patch is based on an older version of my personal QEMU sources and
> not required for 6.0.

I am confused.

I see https://repo.or.cz/qemu/ar7.git/blob/HEAD:/qemu.nsi still does
not contain the fix.

Or is this qemu.nsi file not used in the latest 6.0 installer?

>
> The official QEMU sources install the whole share directory, so all
> required firmware files are included. My latest installer
> (https://qemu.weilnetz.de/w64/qemu-w64-setup-20210409.exe) installs
> those files, too.

Regards,
Bin

