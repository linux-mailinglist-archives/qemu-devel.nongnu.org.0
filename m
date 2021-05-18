Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37138794F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:57:49 +0200 (CEST)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizIC-0004Br-JV
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lizGB-000224-Nz
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lizG9-0003pi-1N
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621342539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2X/3RjUzH+zh/kZCh5YGy6LnqG3BTEoaPnoPf3OC+o=;
 b=V6vRaHlkJvX1tiOvgciXpaov5qVbNp+vI7wEwkC0e0d5WDCZ7Tu96CDzDysZnGkuoPM5AX
 M8Nwj1CTsTPWf0kNJONCu1kqaUJScGBH7/p/K3e4O3xiCn053LKfeAvMC4dLmQ3ohdLepp
 1eHX/3z7kE5JyVzT6i9tj4b/L71TKOo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-lycoDwpHPeqmM0Pwf9K68g-1; Tue, 18 May 2021 08:55:37 -0400
X-MC-Unique: lycoDwpHPeqmM0Pwf9K68g-1
Received: by mail-wr1-f72.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so5550097wrp.15
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a2X/3RjUzH+zh/kZCh5YGy6LnqG3BTEoaPnoPf3OC+o=;
 b=o0O4mVD46QVT0CyfhfveEL/t2LzgtkLFfwvIDx/5ceS+hZWFdbsPu+Np6yvIW5Dm+i
 6xGJWVU4+W52PGP1V9lu+OcapFdHmipWxP8zsv+1rQfka7jcyDQ45gIVMeC/UZm9c78v
 W7Qdx8FKSRjHSMgSL4EkQQYEgikeiIA72d4u+7OEguGfR+J07tEX7ArPPa6NO+KouuEo
 dNNav4FsWN6vZrN3N5LgbAmvpnN1LX6odECIbjofzZN0UN4QE0uzn7efGaobX90Oy2Ts
 3/LgqP0EnRxtXT7WiivGLyVB/5HXaOQrNQE7MKsZKZCuV7SO5aIs3hRJWrHHEKH4dwmF
 sfJA==
X-Gm-Message-State: AOAM533TuESJxDhz7l+aYDZG7BuSdmi9KMk5ckiHBLa5ynnBbeWQNbj9
 VZdwoIVTGjh1TimB25d68Dm6j1FOUPTpfvgPdbhSx2uGfxUf41Rj5X4EbZigk6PtgZR+6zVJj8u
 SC8FjD/CMz/HumsHbmKpA07bKS/EeXGYfCu+63YF8sszlW29MPBLTCu23KUsFXhwZrGM=
X-Received: by 2002:a05:600c:b44:: with SMTP id
 k4mr4932204wmr.152.1621342536404; 
 Tue, 18 May 2021 05:55:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOWwfLNCW8ghBTX+pfWdVWC+8hmtxahJnxJST7DtrWyWqmfmXu05gYndmxtoWYuvUUfz8Qow==
X-Received: by 2002:a05:600c:b44:: with SMTP id
 k4mr4932180wmr.152.1621342536077; 
 Tue, 18 May 2021 05:55:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p6sm5996640wma.4.2021.05.18.05.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 05:55:35 -0700 (PDT)
Subject: Re: Fwd: Adding devices via QMP's device_add don't have their
 bootindex setting respected
To: Thomas Parrott <thomas.parrott@canonical.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <CADNu6esx69UdccUHsFfinqcN=dPj0mceKX7WT755qWcPfDrwGQ@mail.gmail.com>
 <CADNu6esNHqEPzpROiRu+PEFGZJhi3Sgs=duEqjAz53FJv-UMCQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <848d4c41-6c05-2877-fae1-83a9d3a5082d@redhat.com>
Date: Tue, 18 May 2021 14:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADNu6esNHqEPzpROiRu+PEFGZJhi3Sgs=duEqjAz53FJv-UMCQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 14:22, Thomas Parrott wrote:
> Due to QEMU moving towards a QMP configuration mechanism and away from 
> config file support, the LXD team are currently in the process of 
> migrating to using QMP to add devices to VMs (so that we can support the 
> use of QEMU 6.0).

If the only issue you have is with -spice, that's just a bug that we 
need to fix.  -readconfig is still supposed to work, even though 
-writeconfig is deprecated and I'd like to remove it as soon as 6.1.

In particular, the issue you reported below is not a bug.  Devices that 
are added after startup are considered hotplugged, and the boot index 
list is frozen until the next reset.  QMP-based configuration of 
coldplugged devices is in the works, but unfortunately it is not yet ready.

Paolo

> Currently we are using the `-S` flag to freeze CPU at startup, then 
> using QMP to add NIC devices via the `device_add` command, and then 
> using the `cont` command to start the VM guest.
> 
> This is working mostly fine, but there is one issue; the provided 
> "bootindex" property is not respected.
> 
> E.g.
> 
> device_add 
> {"addr":"00.0","bootindex":"0","bus":"qemu_pcie4","driver":"virtio-net-pci","id":"dev-lxd_eth0","mac":"00:16:3e:0c:69:e7","mq":"on","multifunction":"off","netdev":"lxd_eth0","vectors":"6"}
> 
> The device is seen within the VM guest and the VM BIOS, but its boot 
> order is last rather than first.
> 
> We've also tried using a non-zero bootindex of 1 and that has the same 
> effect.
> 
> After discussions on #qemu IRC channel, we found that running 
> `system_reset` after adding the devices allowed the `bootindex` property 
> to be respected.
> 
> So this looks like bug. Perhaps we can discuss it in one of the 
> forthcoming community calls?
> 
> Thanks
> Tom Parrott


