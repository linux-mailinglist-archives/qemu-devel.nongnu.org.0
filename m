Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40D260273B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 10:40:21 +0200 (CEST)
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oki94-00033v-Dn
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 04:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wagi@monom.org>)
 id 1okhtJ-00037j-Mm; Tue, 18 Oct 2022 04:24:03 -0400
Received: from mail.nearlyone.de ([46.163.114.145]:53418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wagi@monom.org>)
 id 1okht6-0001Xm-CY; Tue, 18 Oct 2022 04:24:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A68075E3B5; Tue, 18 Oct 2022 10:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monom.org; s=dkim;
 t=1666080949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=ZVlc5AW1glEV0mEIiNCglLHhGkJLapm7JFLEXMjJf/Y=;
 b=FkaXXccaUshyh2MinLqZKJhzwcyFvbCh2JOIJRFu7Q5pHv2xcQSdqGeGxIvwisWTyGgv+F
 9XqmFIPQjZk1p017OTac8SUrUYRawut5hz0Gg3pfYPBa3v4zSLS7n2y9wd2PvozgOv7X5f
 cUPbCAYQKjpLq+nRXYijUo+cXfShe5FZ8m1OWtsZc2cbfiMVqMswgrHNaHJz9DDZR7Whu5
 BcUYAMaXtAHlKFFZddPjrUfHLfbU1D5fsWDE/pYRHtW0HDsYhfZWgJOeD79KwicNL6r5B2
 MZq9d3tISVF1NXYBR0ffLjy1LvcUUo3tcyjbLOMFMJRuX1Ge9IwuF/p7ckk8fg==
Date: Tue, 18 Oct 2022 10:15:46 +0200
From: Daniel Wagner <wagi@monom.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Hannes Reinecke <hare@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <20221018081546.mzziix5ymjmpus56@carbon.lan>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
 <YJqImppDvOKSbgh2@apples.localdomain>
 <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
 <YJqq6rTRTL3mxMK6@apples.localdomain>
 <7f4c0a64-582b-edc7-7362-2da45c137702@suse.de>
 <20221010170100.o326gwco547y3qrz@carbon.lan>
 <Y0RTHArVOWN2Tg2K@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0RTHArVOWN2Tg2K@cormorant.local>
X-Last-TLS-Session-Version: TLSv1.3
Received-SPF: pass client-ip=46.163.114.145; envelope-from=wagi@monom.org;
 helo=mail.nearlyone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 10, 2022 at 07:15:08PM +0200, Klaus Jensen wrote:
> This is all upstream. Namespaces with 'shared=on' *should* all be
> automatically attached to any hotplugged controller devices.
> 
> With what setup is this not working for you?

Ah okay, I missed the 'shared=on' bit. Let me try again.


