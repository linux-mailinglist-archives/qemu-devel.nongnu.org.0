Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5733EF006
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:14:13 +0200 (CEST)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1jA-0006C0-0x
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mG1hw-0005Vk-VZ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:12:57 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:59057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mG1ht-0003gG-AR
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=3Ekbjw/jq4XZEk8oM6GNLIzRAlil1TX84ts/8WTiAw4=; b=pX5/AL0HqPb4DboBZ6OYL2UDZd
 flrH4OvhTZ21unRinrgjw3+sRJuhSReSqHYS+ggAyXP7KCirHA1Wq02Z34/i72iX4y+hDGD/AS1I3
 hEvnUloTKPNCb0p7CkybN4hqJcOOknZPxgjwDEz9+NouK0XptoB8eemPokeWZOvEHZGaombdT9cYd
 i5cPVlTl0xQUPVhEC07SWbP6vamhDDl0+S6Kn3LIwtdtpbJuNtGwa5/SYZCko1/Aa+FHBhMv4QXS3
 lymu7CippnhKnAmyp+ckC3Gcp23pbpF6fWal74CdNhwqNb4S8T2DG9eYAo5bPcgFpt3NR0E61vI8H
 NLoN4vbXeUS8NEGFiwj3WfyowH9hARWsEHPZwjlmtjicmK9H+VZyaM4ve1sLmgwJ4ePHU1BEoenMm
 jia9QP1L/HaR/hz8TC17u+e4EPlinbUaDyvRxEVmpPCknbKdg5FWICxsUryPalH/FA/5T1Vey4ptW
 n9zQF9md6JLRz5ad3VYmYcMkSJHjRcVnSvneLmIz9AA9QdC0Uw0mmFWwS4O/+6eM2mFPHR6o56DGW
 kyKXVoMgstHVq73OFKuJHACZzkb4s2PG8WHUvaEyUKorSqhJhvPxXpmCo4H1tmVFOJcwsuEODw56K
 /BZpimgL/6cnzA1yNRVGcrw+5RaM6A2gdV7zQwM10=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>, clamky@hotmail.com,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?utf-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Split Audio backends VS frontends
Date: Tue, 17 Aug 2021 18:12:48 +0200
Message-ID: <2098132.JuaFiSchrr@silver>
In-Reply-To: <20210817124127.2ip6fq2ndlubqn5s@sirius.home.kraxel.org>
References: <20210816191014.2020783-1-philmd@redhat.com>
 <1790111.v9OTG8XKiZ@silver>
 <20210817124127.2ip6fq2ndlubqn5s@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 17. August 2021 14:41:27 CEST Gerd Hoffmann wrote:
>   Hi,
> 
> > > +Overall Audio frontends
> > 
> > I would call that "Audio Hardware Emulation" instead of "Overall Audio
> > frontends".
> > 
> > > +Overall Audio backends
> > 
> > Likewise I would call this section "Shared/common QEMU audio library/
> > subsystem" or something like that instead of "Overall Audio backends".
> 
> Well, frontend/backend is common qemu terminology, with "frontend" being
> the emulated/virtual device as seen by the guest and "backend" being the
> host-side wireup (i.e. -audiodev / -blockdev / -chardev / -netdev / ...)
> 
> take care,
>   Gerd

Yeah, I was seeing this (like usual) more from an external/new developer 
perspective where the semantic for "frontend"/"backend" is not that obvious 
here.

But okay ...

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



