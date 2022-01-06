Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0C486711
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:51:24 +0100 (CET)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5V2x-0001pW-K9
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:51:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1n5Uxq-0004wE-Dn
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:46:07 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1n5Uxh-0006In-6t
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:46:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id D23521F45A11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641483948;
 bh=JL7VfCNIBpoFc4q6Wx+M2uasVHaY5d+lIyDD3UNfN68=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V/nTTekqdxoC6iWukHiAEJchWRF6+yjFV8JiHcCTtNJ/4KQdYARw3Ya2YwdhYY+Ao
 2JGPHVGF8MWa80Zw3EE3J3gKKGb3OmY6Cda3uDkRcqj5X68tEEt0VCTiOy9E1cbegX
 Aq9yn1hN7iJ61wsdirALr9l8y9buQDHH7YE4Q2DNCvNeD49F7OYHGQdXtHZUDaNEi/
 y4UA/oetj63B1PJkUnwATkUrHoOMvYvAGyFjdPO8+r289my38StUtUpvh5hFsoyzt/
 WlBH9RYYrVobLLNfe7ByjC+xvvhiUaj2Z8MISrgWwlX5KMiHW0K/xAKehGcOXjIEdK
 yJl8BE/usVVNA==
Message-ID: <7efae1b2-354b-e937-e478-1d757295dde0@collabora.com>
Date: Thu, 6 Jan 2022 16:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/2] virtio: Add shared memory capability
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211110164220.273641-1-antonio.caggiano@collabora.com>
 <20211110164220.273641-3-antonio.caggiano@collabora.com>
 <20220106044116-mutt-send-email-mst@kernel.org>
From: Antonio Caggiano <antonio.caggiano@collabora.com>
In-Reply-To: <20220106044116-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=46.235.227.227;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Where's that commit? I think we should drop this, right? 

Yes, I will submit another version without that line.

> You don't need & mask32 I think. cpu_to_le32 will truncate
> the value.

Makes sense, will be fixed in next version.

> So it's a new API, but where's the user?
> I guess just include this patch with where-ever it's actually used.

The user of virtio_pci_add_shm_cap is in the previous commits.



My original patch [0] was actually a squash of the current two commits, 
but Dr. David Alan Gilbert explicitly asked me [1] to split them in 
order to preserve his original virtio-pci patch [2]. I could squash 
these two commits together again, but we will be back to square one [1].



[0] https://www.mail-archive.com/qemu-devel@nongnu.org/msg826814.html

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg826890.html

[2] 
https://gitlab.freedesktop.org/virgl/qemu/-/commit/7fa847fde7143ca2ef5b0a2a13c5f669d3beb195

