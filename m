Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFAF43CDE7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:48:24 +0200 (CEST)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflA6-00007u-JW
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1mfkS2-0001VC-FK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:02:51 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1mfkRx-0005uc-FM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:02:50 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3FC2B3F1A1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635346963;
 bh=gtGoWrsAJ0AztuvvfB7h/9nPJ8J+pOSK0y5s/O4kiMU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=S707+cffnPPoxF0tyKfAjGHUZMg2TXV7g8Wlbo1JxQS6CS4PiHLOekVrFV3xCIoEY
 hsOeYit0pDdaSX39p8XwW0IxoNsjEvTKweRRW2MECs5QKz31ZwyUi8tMMNNXuE5JuB
 iRw+wZ3NgLRkbMhwUxMqZCSQFvBMCmjiCKgrsIiHwSvwT9LO3zJJImBfqjMmvHgDhu
 jNO2ZRsgFDfYR3JxoIQUx0wFHH6HfwTPnMfbKwa4XaCWuSVJOBx+RA8ftxZjDm6RsX
 MdjqU27VXKdKF75S/yspVEmelbiTZ37oCn0wKDFm2lXtBJ4HHCcfUoEij+N+a2U1dU
 Ch8zG/2BZ799A==
Received: by mail-wr1-f72.google.com with SMTP id
 b8-20020adff248000000b00171bceb5139so731318wrp.18
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gtGoWrsAJ0AztuvvfB7h/9nPJ8J+pOSK0y5s/O4kiMU=;
 b=tbC6pnOlmAs6qnpE4/7CnpEYG3VJtpORcBsrVbyAQPIwtY62WeYfuEqrctm8U15077
 obR3YPkM3y54wghDvY0H07JDR97ITUJYy+D9pq2ruiKIj2Y201hf2qryh4qqloEK6YC6
 UBCVi//JZcOTs4TGQxCv3E4i5hWUtFbSkbmQFB1ymmW8saIDRafQBoENoWKRb27ffYRU
 zkGfyXSWgN+UAoHHzART4GRgcJwMUzsLWea//KjQgDi1nwtXaTesyKgyjLowJmEG8jrC
 wfwNmS4arRqyDgeHGsfltZaqpybOgUjhZM2V7jpzljX/c8ZRX7dlG0L30+wlBFPf/3Cx
 CuDw==
X-Gm-Message-State: AOAM532hqDXzRiw0kiJWgC1DWhLR/t8JiKWkMZfWyBLkOXl2J8kYFNMM
 vIySiC7V4TZUa6tKLVdlFZcVQSDPcZWxvflh7NDv7C6oAkLkitw15r44yF8GWhku1R7fQAUU7nz
 V5VTWqj0IApLGZNNS3XBf6bjTnhGBiirI
X-Received: by 2002:a1c:540c:: with SMTP id i12mr6156588wmb.6.1635346962618;
 Wed, 27 Oct 2021 08:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxng2xYS0AxE9aNGOeOYtjmv+8olh0+08wthcXcBm/gkBHYELO2DVSgiZsgFrhWDa/btEaItA==
X-Received: by 2002:a1c:540c:: with SMTP id i12mr6156509wmb.6.1635346962189;
 Wed, 27 Oct 2021 08:02:42 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id v3sm141306wrg.23.2021.10.27.08.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:02:41 -0700 (PDT)
Message-ID: <51292fc6-e9a9-015a-34ac-f7cbcf18f203@canonical.com>
Date: Wed, 27 Oct 2021 17:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>
References: <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <e210136c-65c1-72f1-485f-e54a5e8248b3@canonical.com>
 <20211027145552.GA8284@bill-the-cat>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20211027145552.GA8284@bill-the-cat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 =?UTF-8?Q?Fran=c3=a7ois_Ozog?= <francois.ozog@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 16:55, Tom Rini wrote:
> On Wed, Oct 27, 2021 at 03:23:01PM +0200, Heinrich Schuchardt wrote:
> 
> [snip]
>> One passed to U-Boot for fixups and further passed to the OS. This
>> devicetree may originate from a prior boot stage, from a file loaded by
>> U-Boot, or from a later bootstage, e.g systemd-boot's devicetree command.
> 
> I assume systemd-boot is implementing the same logic that extlinux.conf
> has used for forever, yes?

It is loading the file and then calls U-Boot's implementation of the EFI 
Device Tree Fixup Protocol for fixups before passing the device-tree to 
the OS.

> 
>> This devicetree will not contain any U-Boot specific information.
> 
> To repeat, it must only have official bindings, yes, regardless of what
> project they come from.
> 

Don't expect prior firmware stages to provide any U-Boot specific stuff 
whatever official or non-official U-Boot specific bindings exist.

Best regards

Heinrich

