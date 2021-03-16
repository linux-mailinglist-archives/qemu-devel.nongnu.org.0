Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4059233CB31
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 02:56:35 +0100 (CET)
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLywj-0006Fb-Q8
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 21:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lLyvP-0005fb-80
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 21:55:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lLyvL-00013Q-EH
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 21:55:10 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so608186pjb.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 18:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nEIvc0lBycYWDYaTSpKfrN5EU+wClnrA57OEsuVbR2w=;
 b=SuXQywGkeIimcjZEgtGdJMVyRbk4W/3ylWAo1YU6KTwzGgeiPottyZHdNddOzPt+cV
 CvOkVgf9SFS9plmoIplhd2Zj56VjPDgJK5ufgDUabj7fxYxriYZoIFVctVOcllrKgDUa
 4F9s6k6YbydWhzATecp4kH3IX2btzSL95e31UVhzDve44h57qKFoa7Y9bJEbdLDNNLdq
 s5NqSrxRU8WghdX8hLZEEH83MNICmSDUs/hyiLB75hEHdSMMfOerJuG72eZFmdx8OGDR
 q6tsh1lE32FahqGuYILugoOANjzomSSl84GqTd8DlkEjDtl83fwO6DDz4Sz/OOzbIyAB
 kpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nEIvc0lBycYWDYaTSpKfrN5EU+wClnrA57OEsuVbR2w=;
 b=Go/uDTrsFnVU2sSTVLAPUnXsWDklY96mEBmI8PwVbCBFD3Smk2fUpmWlUGLjo/FQeJ
 Shhb802Q20/iXkSbvxupOoIVsqMtg1WrDcaDgshQ6dT3Lb28BT6I6XPGdwN0qvj0YPj5
 HvnqO7+87EdXYvReag/zBBeG/vFM4p2ao4qDg0RdjCIiE/12RvX/2/oGNb19XC7VEiF2
 5zrYYxtezlQ9Z7UDDxF1Y1GiTSvcmL/alUrF+JqB76d9pfHw8mOP/eSjDUpwH6FJfSGD
 mE5s2FoGDj3BdD9uuxJPmOptQo97ux3UYf4LqjG46Y4T4QpC8kyaSy4mBQhuH/O+fVKz
 LOdQ==
X-Gm-Message-State: AOAM530Hw8oWc6G7AAwIeqiMf/1VbKcGZaJL5R+Fkx5HdGiXdTBYylec
 Nrt7a6SAkVZ72FTmkYnHwgg=
X-Google-Smtp-Source: ABdhPJzhpVLE+elRsUitK/pKXhkO5loOk9SB1ph/aobNVNXL1upg6OD+HveRLHnf1UZUYIhJht/upg==
X-Received: by 2002:a17:90b:1a89:: with SMTP id
 ng9mr2197602pjb.36.1615859705782; 
 Mon, 15 Mar 2021 18:55:05 -0700 (PDT)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id y9sm853173pja.50.2021.03.15.18.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 18:55:05 -0700 (PDT)
Date: Mon, 15 Mar 2021 18:55:03 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Reinoud Zandijk <reinoud@NetBSD.org>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210316015503.GA1008366@private.email.ne.jp>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 11:27:29PM +0100,
Reinoud Zandijk <reinoud@NetBSD.org> wrote:

> On Mon, Mar 15, 2021 at 06:53:02PM +0100, Igor Mammedov wrote:
> > Windows 10 1607x64 boots fine when I test it with default machine.
> > 
> > So
> >   1) can you provide full QEMU command line used
> >   2) What Windows build do you use
> >   3) is it existing guest image (i.e. installed in older QEMU version)
> 
> I've used:
> 
> qemu-system-x86_64 -m 4G -smp cores=2 -accel nvmm \
> 	-snapshot \
> 	-drive file=/home/reinoud/Downloads/Win10-demo.raw,format=raw \
> 	-rtc base=localtime,clock=host \
> 	-spice port=5924,disable-ticketing=on \
> 	-vga qxl \
> 	-usb -device usb-tablet \
> 	-net nic -net tap,ifname=tap0,script=no &
> 
> If I add in '-M pc-i440fx-5.2' it works again with the accelerator. If I add
> in '-M q35' it does work fine with or without the accelerator.

Anyhow, can you please try "-global PIIX4_PM.smm-compat=on"
(or "-global ICH9-LPC.smm-compat=on" if q35 is used) so that the old behavior
is presented.


> Surprisingly without accelerator ie with tcg the default machine does seem to
> get to the login prompt. Is the ACPI data tailored to indicate an
> accelerator/VM or is it static? Could it be that the CPU reported by my
> machine is causing the issue? With the NVMM accelerator it passes on the hosts

I think tcg case can be explained by x86_machine_is_smm_enabled()

  bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
  ...
      if (tcg_enabled() || qtest_enabled()) {
          smm_available = true;
      } else if (kvm_enabled()) {
          smm_available = kvm_has_smm();
      }
  ...

Although I don't know about nvmm case, this function also needs to be updated
if smi isn't supported.

Thanks,


> CPU:
> 
> cpu0: "Intel(R) Celeron(R) 2957U @ 1.40GHz"
> cpu0: Intel 4th gen Core, Xeon E3-12xx v3 (Haswell) (686-class), 1396.77 MHz
> cpu0: family 0x6 model 0x45 stepping 0x1 (id 0x40651)
> 
> Running with NVMM gives the following warnings that might be relevant though
> doesn't seem to bother the BSDs nor Linux last time I tried and Google tells
> me they are power saving related MSRs:
> 
> qemu-system-x86_64: NVMM: Unexpected RDMSR 0x611, ignored
> qemu-system-x86_64: NVMM: Unexpected RDMSR 0x641, ignored
> qemu-system-x86_64: NVMM: Unexpected RDMSR 0x606, ignored
> qemu-system-x86_64: NVMM: Unexpected RDMSR 0x606, ignored
> qemu-system-x86_64: NVMM: Unexpected RDMSR 0x641, ignored
> qemu-system-x86_64: NVMM: Unexpected RDMSR 0x611, ignored
> 
> I am not sure if that makes ACPI take a different route or not.
> 
> The Windows used is
> 	Windows 10 Enterprise Evaluation
> 	Build 17763.rs5_release.180914-1434
> 	version 1809
> 
> The image file was downloaded pre-installed from Microsoft for Edge browser
> evaluation. I used it first on Qemu 5.1 IIRC and it kept working in Qemu 5.2.
> 
> The NVMM accelerator was presented here before but is not yet committed. Its
> API/construction is similar to WHPX.
> 
> As for the cause, I don't know; q35-6.0 works so why isn't pc-i440fx-6.0 ?
> 
> With regards,
> Reinoud
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

