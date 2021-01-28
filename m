Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F6E307F72
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:21:56 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Dnf-0002Gl-Vc
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l5DlA-0000bP-BN
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l5Dl4-0004ER-FG
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611865152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZttXyL9JC4A6GOrcWAtQNVFfPTDJiTUN5mUaiyArqvo=;
 b=OsAdKhs1UCDo/Ce7rMPcRHa05wnDJQFFGh1CXH5nyFrajR3eV1IJDxB0bd7Styfpj0526T
 Q8iU3d3wAe4SicL2DYkMG9WDprTrBIHbuIpzZMpPBBooxY/w5L6eyai24JSWbz6/cOgTTP
 LTbk7mcyGzOIJzqQuxuzL+l3OlCzoBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-Hbiw7AALPs-Z5Lr-ypD78g-1; Thu, 28 Jan 2021 15:19:09 -0500
X-MC-Unique: Hbiw7AALPs-Z5Lr-ypD78g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DC7E1005504;
 Thu, 28 Jan 2021 20:19:08 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E19E5D9F4;
 Thu, 28 Jan 2021 20:19:04 +0000 (UTC)
Subject: Re: [PATCH 0/1] tests/acceptance/boot_linux: Switch to Fedora 32
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210127010946.17370-1-dbuono@linux.vnet.ibm.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <20c6fbf7-3000-0ef4-cdb1-31d748878206@redhat.com>
Date: Thu, 28 Jan 2021 17:19:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210127010946.17370-1-dbuono@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 1/26/21 10:09 PM, Daniele Buono wrote:
> Local acceptance tests run with "make check-acceptance" are now
> showing some cases canceled like the following:
>
> (01/39) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg: CANCEL: Failed to download/prepare boot image (0.25 s)
>
> Turns out, every full-vm test in boot_linux.py is trying to use a
> Fedora 31 cloud image and is failing, with Avocado refusing to download
> it, presumably because Fedora 31 is EOL.
>
> This patch moves to Fedora 32, which is still supported. And seem to
> work fine

While ago it was discussed about updating the Fedora version which, in 
my opinion, ended up without a conclusion. Please see the complete 
thread in:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg763986.html

I'm CC'ing Daniel Berrrangé so that, perhaps, we could resume the 
discussion.

Thanks!

- Wainer

>
> The script has the image checksums hardcoded. I downloaded and verified
> the checksums with the Fedora 32 GPG key, but I would feel more
> confident if someone else wants to verify it too.
>
> The checksum files are here:
> https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/32/Cloud/ppc64le/images/Fedora-Cloud-32-1.6-ppc64le-CHECKSUM
> https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/32/Cloud/s390x/images/Fedora-Cloud-32-1.6-s390x-CHECKSUM
> https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/aarch64/images/Fedora-Cloud-32-1.6-aarch64-CHECKSUM
> https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/x86_64/images/Fedora-Cloud-32-1.6-x86_64-CHECKSUM
> and the GPG keys are available here:
> https://getfedora.org/en/security/
>
> NOTE: I tried moving to Fedora 33, but the aarch64 VM cannot boot
> properly. May be worth investigating but I have no experience with ARM
> so I'll leave that to someone else, if interested.
>
> Daniele Buono (1):
>    tests/acceptance/boot_linux: Switch to Fedora 32
>
>   tests/acceptance/boot_linux.py | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>


