Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D03157B9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:33:02 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Zh0-0004hj-0i
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamahata.qemudev@gmail.com>)
 id 1l9ZE7-0007kd-Jh
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:03:11 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamahata.qemudev@gmail.com>)
 id 1l9ZE5-00075Q-Nh
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:03:11 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e9so10393328plh.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pd+ivxvIsy1hnLJDLij4Ivo22AvxHfjyefiYBTHbVU8=;
 b=Fh/OWIwd1LeQxLFGY4eW50TxdnErSH99w6r75rsIrvjalvm0dxtBOaP+I6KN4Mi37C
 8yJReKnhAgg5A+nJo+VaWfzk0c3/98shB9ZaKxFpi0Vn+KHnXam1WBgfJOySjJGt0cUo
 m8juPIDep1NxO4SiB59aseFQLHJeFeCRmawXSCSEBTBEJ5qZOTwQ5XG743eOKUTWLzPl
 cwndxHpkwBwHgqY08rPE+vTO+Nxmbn3gDp70u00AbRgN+HH2R7TzTLDMCBYg43SmHeST
 VDp4MHR1ZUPsj5NEsbPo4FBBEI8exuZKlXsUgPi57XfBszmNggytCA0U/Y97bFiyHGSf
 8Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pd+ivxvIsy1hnLJDLij4Ivo22AvxHfjyefiYBTHbVU8=;
 b=p8umBucIIh74GnpAx36R/dIOggu0cScvzK4rKJIskv+WIRkaW7KBac/ofR4dffteMs
 lCDaETyFCA1Y8WEKuIXQgOMvaJ1iRkZPIOmaLAxZKhGcSFYeDgFussDwdIZdF6yl2GWk
 XEQhqtEY8mRijYQ3UQ1L2wwwjKKD8Qx41RW9M7cYoIeak9Gm6KZXaVvIiBC852ZZBgXx
 ZkWPBM0eYHbN44a787ERMxs7lN/RUnYkz8pQKiAH8YQ1e4HOSauWHie4qUlSX8PlGVl4
 lzzgqCeJm5ZFCOclkRLBnqFDv4owXaUJ5ZctPW/LHDZPcy1H6xT9ZB6R4SRPGwaqf/ZL
 V0zA==
X-Gm-Message-State: AOAM530CcoeBPuAHxYQeTKjuQvQSeCAmqxTJeBdtbBpyfh4hQZlW3fuu
 N65UXLU6wXawmW6wQbYcR/k=
X-Google-Smtp-Source: ABdhPJxM+YuQ2YGHDObwMR6R42+22uu1mgLOpF2fFLfs22sszJz9D+qr5XHMFbsiCe42GThkkQjHNQ==
X-Received: by 2002:a17:902:a614:b029:e1:5b43:956a with SMTP id
 u20-20020a170902a614b02900e15b43956amr23332808plq.38.1612900987382; 
 Tue, 09 Feb 2021 12:03:07 -0800 (PST)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id f28sm5241442pfk.182.2021.02.09.12.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:03:06 -0800 (PST)
From: Isaku Yamahata <yamahata.qemudev@gmail.com>
X-Google-Original-From: Isaku Yamahata <isaku.yamahata@gmail.com>
Date: Tue, 9 Feb 2021 12:02:58 -0800
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 6/9] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210209200258.GB28049@private.email.ne.jp>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <ff52a5969a6666235745d7e067f5fb500a8c70fb.1612821109.git.isaku.yamahata@intel.com>
 <20210209165241.5ba1a953@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209165241.5ba1a953@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=yamahata.qemudev@gmail.com; helo=mail-pl1-x62b.google.com
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, isaku.yamahata@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 04:52:41PM +0100,
Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon,  8 Feb 2021 13:57:25 -0800
> isaku.yamahata@gmail.com wrote:
> 
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > 
> > Declare PNP0C01 device to reserve MMCONFIG region to conform to the
> > spec better and play nice with guest BIOSes/OSes.
> > 
> > According to PCI Firmware Specification, MMCONFIG region must be
> > reserved by declaring a motherboard resource.
> could you point to concrete spec version/chapter where it stated.
> (should be part of commit message)

PCI Firmware specification Revision 3.2
4.1.2 MCFG Table Description
table 4-2 NOTE 2
  If the operating system does not natively comprehend reserving the MMCFG
  region, The MMCFG region must e reserved by firmware. ...
  For most systems, the mortheroard resource would appear at the root of
  the ACPI namespace (under \_SB)...
  The resource can optionally be returned in Int15 E820h or EFIGetMemoryMap
  as reserved memory but must always be reported through ACPI as a motherboard
  resource

Will include it in next respin.

> 
> > It's optional to reserve
> > the region in memory map by Int 15 E820h or EFIGetMemoryMap.
> 
> > If guest BIOS doesn't reserve the region in memory map without the
> > reservation by mother board resource, guest linux abandons to use
> > MMCFG.
> can parse this, can you rephrase and avoid double negation, please?

How about this?
Guest Linux checks if the MMCFG region is reserved by bios memory map or
ACPI resource. It failed, it falls back to legacy PCI configuraiton access.


> > +     * When the method of _CRS is called to determine MMCONFIG region,
> > +     * only port io is allowed to access PCI configuration space.
> > +     * It means qword access isn't allowed.
> > +     *
> > +     * Device(DRAC)
> > +     * {
> > +     *     Name(_HID, EisaId("PNP0C01"))
> > +     *     OperationRegion(DRR0, PCI_Config, 0x0000000000000060, 0x8)
> > +     *     Field(DRR0, DWordAcc, Lock, Preserve)
> > +     *     {
> > +     *         PEBL, 4,
> > +     *         PEBH, 4
> > +     *     }
> 
> why are you trying to fetch it dynamically?
> what prevents you from getting MMCONFIG address in QEMU when building
> ACPI tables and encode _CRS statically at that time?

My motivation is to prepare for TDX where ACPI tables will be part of
measurement. I wanted ACPI tables to remain same irrelevant of chipset
configuration which guest can change.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

