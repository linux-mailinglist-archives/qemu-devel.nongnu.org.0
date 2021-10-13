Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A642C04B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:42:49 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madaq-0008Ri-4T
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1madXo-0006MO-S2
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1madXk-000558-LA
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634128775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QF+y/fDxPqS/AOzvc0b8v3SefDrXA3/3cyWRve1RPWw=;
 b=H0sv97CjTFYps4H3no3q25kODBmpUwKPKjyLHVca6egEs6cKRqvjbttfFdu03Ah4zh9SLx
 DLiTyZ9wH1cAXpgwt/t/k8TjzCu0Q9adQm9D9bZXMVtCQTHizJivbKL0ikpzFAuND6eHZO
 sCcQrFRE+Mjobv0rYl0xquHBPo18DnE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-YXSEzUPVNpuwUOGZMw7rGA-1; Wed, 13 Oct 2021 08:39:32 -0400
X-MC-Unique: YXSEzUPVNpuwUOGZMw7rGA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso1890329wrg.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QF+y/fDxPqS/AOzvc0b8v3SefDrXA3/3cyWRve1RPWw=;
 b=g6ZyUQXpnzmbMnd1pWtbTb60NdlTxgdpO94ZFbLExPWYZKyMyFOG4x6IAlKmpMqIvG
 e73hSL2dRO+YPquEKyCRlx3po7bmpWYLqgpev6pOzSybVOkI1UUWEL2MMf18kPbvgPzf
 S2XCC3GyG7GgCAtM7oKVKVBUaYXLNgKA7Z9OCpNenfoowyAOG9b5Mj552shcLLw82MEU
 RnP7lW8XV0FnLZKRYceqYMxRyFVLPwRgDmLHZY+Vk/VkN/jE6gFUsHiGO06SwsPUZaeF
 kMUDWBuQOnzIsxn728qSjx4Zkvc4EUBDG4yHDwA4YyPbQVc47cwp/wkXi9Mp5Ph6CKgg
 hmBQ==
X-Gm-Message-State: AOAM532DCnbpemgW5JnkNepl/q8DqKU1HwK9L6G8j9iEPRvhbzHVcGV6
 GQ5Ur2O6+XFZ8NbQGROl2sg6401YtNOMs1K8VmRxECZ6B+pi7DBiHEiS37wNhqzyN4xuojyb1Jw
 yRP3icPw2t5KCWs8=
X-Received: by 2002:a5d:43c3:: with SMTP id v3mr29875666wrr.22.1634128770864; 
 Wed, 13 Oct 2021 05:39:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3ZWW14NwZTsHWBQJx1ml5ww8tbyKWkeYQZZPpyMMeG+tt30Mp5aslYJCTMAwQJUMHpt/LZA==
X-Received: by 2002:a5d:43c3:: with SMTP id v3mr29875596wrr.22.1634128770598; 
 Wed, 13 Oct 2021 05:39:30 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id r205sm5380159wma.3.2021.10.13.05.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 05:39:29 -0700 (PDT)
Message-ID: <1c51724b-7789-f402-818f-1044053ee0fa@redhat.com>
Date: Wed, 13 Oct 2021 14:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Bin Meng <bmeng.cn@gmail.com>, Simon Glass <sjg@chromium.org>,
 qemu-arm <qemu-arm@nongnu.org>
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Neil Armstrong <narmstrong@baylibre.com>, Rick Chen <rick@andestech.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Green Wan <green.wan@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Niel Fourie <lusus@denx.de>, Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Peter Robinson <pbrobinson@gmail.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Wolfgang Denk <wd@denx.de>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Sinan Akman <sinan@writeme.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Simon,

On 10/13/21 03:29, Bin Meng wrote:
> On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wrote:
>>
>> With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
>> there are only three ways to obtain a devicetree:
>>
>>    - OF_SEPARATE - the normal way, where the devicetree is built and
>>       appended to U-Boot
>>    - OF_EMBED - for development purposes, the devicetree is embedded in
>>       the ELF file (also used for EFI)
>>    - OF_BOARD - the board figures it out on its own
>>
>> The last one is currently set up so that no devicetree is needed at all
>> in the U-Boot tree. Most boards do provide one, but some don't. Some
>> don't even provide instructions on how to boot on the board.
>>
>> The problems with this approach are documented at [1].
>>
>> In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any board
>> can obtain its devicetree at runtime, even it is has a devicetree built
>> in U-Boot. This is because U-Boot may be a second-stage bootloader and its
>> caller may have a better idea about the hardware available in the machine.
>> This is the case with a few QEMU boards, for example.
>>
>> So it makes no sense to have OF_BOARD as a 'choice'. It should be an
>> option, available with either OF_SEPARATE or OF_EMBED.
>>
>> This series makes this change, adding various missing devicetree files
>> (and placeholders) to make the build work.
> 
> Adding device trees that are never used sounds like a hack to me.
> 
> For QEMU, device tree is dynamically generated on the fly based on
> command line parameters, and the device tree you put in this series
> has various hardcoded <phandle> values which normally do not show up
> in hand-written dts files.

Besides, QEMU generates these dtb at runtime on purpose: it gives
emulated machines the freedom to evolve by adding new devices,
mapping/wiring peripherals differently.

By adding static dtb this gives QEMU users false expectations the
machine hardware is stable, or force QEMU to have this interface
become a stable API.

From QEMU perspective this seems counter-productive.

Digging a bit I see this has already been discussed on qemu-devel@
mailing list recently:

https://lore.kernel.org/qemu-devel/CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-zyh=N8rqm4vOcGZA@mail.gmail.com/

> I am not sure I understand the whole point of this.
> 
>>
>> It also provides a few qemu clean-ups discovered along the way.
>>
>> This series is based on Ilias' two series for OF_HOSTFILE and
>> OF_PRIOR_STAGE removal.
>>
>> It is available at u-boot-dm/ofb-working
>>
>> [1] https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/
>>
> 
> Regards,
> Bin
> 


