Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9D62A09B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 18:45:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouzzh-0001S7-3n; Tue, 15 Nov 2022 12:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ouzze-0001Ry-CQ
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:45:06 -0500
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ouzzc-0004KB-Jx
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:45:06 -0500
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 239594520
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iI6cVagkrGn+dKSu1oI4WBinX1613hIKZh0ujC45NGQN5FlHY01je
 htvDDiCPP/ZajanKdxyYd7n8h4E7MXQz99hTlQ/pXgxEXsW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVjPaojUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fb053PkwAFofz
 6BGFCFQREuSotOWw73uH4GAhux7RCXqFIYWu3Ul1DKASPh/EMCFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk6aJUQeaj/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuO8bYuJJ4bSLSlTtninl
 nrq+WXYOyETK+yA1ROO8mn338aayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVWoF5zzBkzo5nGDuREYVpxbFOhSBByx95c4Kj2xXgAsJgOtovR/3CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:vfnN2aBDJXwYpeDlHel655DYdb4zR+YMi2TDGXoBLiC9Vvbo6v
 xG/c5rryMc7Qx6ZJhOo6HjBEDtewK4yXcx2/hsAV7AZnichILLFvAa0WKK+VSJcFycygce79
 YZT0EXMr3N5DNB/KDHCWeDYrId6ejC2oyTwcnl81dRYTdDV5xAhj0JdTpz0XcbeOCFP/cE/V
 aniPavbgDOGEgqUg==
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 12:44:55 -0500
Received: by mail-qk1-f198.google.com with SMTP id
 bi42-20020a05620a31aa00b006faaa1664b9so14205680qkb.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 09:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dk5vvlh2SMOvtl5LOId9g0wNYxP73yEhHxqOTGVTNnA=;
 b=CH6arG9tOFFMuG8u5TGFlUgBYk7gyt9aM5nhEpZBEl/2s26G0WkO6ksDY9fA4WDiTq
 Gfu8CWAB7jXpHoMuEdQ5mEcZ1urxQgCa02RynOY5N8M4yA+aa6YGnm97BxZNn7dHZ2tM
 OVProGIzQu9ya1UTPTZj5qkV1LIGpFQsgR9jEMRnNQN0bZEqZpkfeZ8e6ksoCILceNOY
 zp1WZTLITr0oEN0Qk6hZzJ5qnfem+gMRe9fAMuhnph2nZs7j4reLZRDfaHY/7UFYoZtt
 Tluq1xPZcQupUdOeuXi14emS8/I/fU/eu8FO1eOguXnaiUTK5QY9Jof+/S8aZoI4kwqO
 7OFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dk5vvlh2SMOvtl5LOId9g0wNYxP73yEhHxqOTGVTNnA=;
 b=ifHpv4dQl3FzILuMKnfsokuwrn0WlwKmAsAZuurdVFonnl15Wb/U8no9A30CnXNwW8
 d+5PaZ6UGYZSrPiW0C6GGD+6I0AKrpUJnhUG+WthL91s8iaJs9+s1DVW9lPPZP1HEGdZ
 dNcZrDgwFMKLlq2hFKpQbgTf6yO0l8y5MzaSYuMMRKdZ36nqJMD2Iw2eGmhKDCpxMUYi
 nadXQ4wbjCSJkOYrQwiYwP0mDc1wSI1NaSa2A47cjGMTYmYrbrx5EHNldAvJ9+hUQ98c
 rV+K23R+lziHckaQqAQk06aoh12IEul0plG+iBtcbvzHvh7r6oCUgjxxXhWh9jSDcmfM
 FZVw==
X-Gm-Message-State: ANoB5plYpVozCjk/HgdZFby6tJJunfMOy+GLsloARV7KAHEHUVUPGWGI
 ipXKLN4jpyCsv0/isxSmpd116FiyAmwaFoY4e+cG/w3+oF4jDRuf/keL3OYrXzCbCMQcje+Y2Us
 DNKknKDo9T0Yig6YfYNv0ys944yq7Hg==
X-Received: by 2002:ac8:520b:0:b0:3a5:467b:c1ce with SMTP id
 r11-20020ac8520b000000b003a5467bc1cemr17754331qtn.451.1668534294725; 
 Tue, 15 Nov 2022 09:44:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4cyr9oidrbyyJht/M/WiD8swysVMiDuUCkv9ElJF8TEBqMZRacboyA00qvdv5iV4MzlLiAiQ==
X-Received: by 2002:ac8:520b:0:b0:3a5:467b:c1ce with SMTP id
 r11-20020ac8520b000000b003a5467bc1cemr17754301qtn.451.1668534294472; 
 Tue, 15 Nov 2022 09:44:54 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 h5-20020ac85685000000b003a4ec43f2b5sm7389434qta.72.2022.11.15.09.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 09:44:54 -0800 (PST)
Date: Tue, 15 Nov 2022 12:44:23 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v3 1/7] memory: associate DMA accesses with the initiator
 Device
Message-ID: <20221115174418.7quetzdp3s6sjqee@mozz.bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
 <20221028191648.964076-2-alxndr@bu.edu> <Y3O8GAw9kRfNBmFV@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3O8GAw9kRfNBmFV@x1n>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 221115 1119, Peter Xu wrote:
> On Fri, Oct 28, 2022 at 03:16:42PM -0400, Alexander Bulekov wrote:
> > +    /* Do not allow more than one simultanous access to a device's IO Regions */
> > +    if (mr->owner &&
> > +            !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> > +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> > +        if (dev->mem_reentrancy_guard.engaged_in_io) {
> 
> Do we need to check dev being non-NULL?  Fundamentally it's about whether
> the owner can be not a DeviceState, I believe it's normally true but I
> can't tell; at least from memory region API it can be any Object*.
> 

I'll add a NULL-check
Thanks

