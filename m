Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A26683A47
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 00:16:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzq7-0006cb-JM; Tue, 31 Jan 2023 18:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pMzq5-0006c5-Co
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 18:14:57 -0500
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pMzq3-0008H8-BC
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 18:14:57 -0500
Received: from [192.168.2.186] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EB2606602E2E;
 Tue, 31 Jan 2023 23:14:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675206890;
 bh=kiFJvMplm4OmRQaPtj2fZILJ361h4sw7tfBANAu0NpU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=neFFvs05Xj8F3Hcvtge5gAVGwNt06MhV01G9sfo92sDrSwtxChF48bUlIj5qvHSJP
 fW90WclTS2Sw/Zv68/DmS1yNMliljEnl0b9qlEd+AvNtIOl2nALk/UPVPENCmQmFbO
 Crd7uTBUPjlAWyTn3cZo583rm/BM5peFy79qf7/GbwIldjm4vME2j8ZTAeNvzJC7ZG
 7xTezsYbJagRITJ9F6kO26oncheSGqXm2GTYfNJxLakb+wfE6Ic/OIIhxQd1dwxI6A
 xLfzPp3oGGarSHyIasklYcQHZxD62ZGb6ko0I7XI46/o3NeyaubdQhP1g2ereCzsWJ
 vHUUcydGNyCEQ==
Message-ID: <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
Date: Wed, 1 Feb 2023 02:14:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: gert.wollny@collabora.com, qemu-devel@nongnu.org
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <877cx46jjg.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=dmitry.osipenko@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello,

On 1/30/23 20:00, Alex Bennée wrote:
> 
> Antonio Caggiano <antonio.caggiano@collabora.com> writes:
> 
>> This series of patches enables support for the Venus VirtIO-GPU Vulkan
>> driver by adding some features required by the driver:
>>
>> - CONTEXT_INIT
>> - HOSTMEM
>> - RESOURCE_UUID
>> - BLOB_RESOURCES
>>
>> In addition to these features, Venus capset support was required
>> together with the implementation for Virgl blob resource commands.
> 
> I managed to apply to current master but I needed a bunch of patches to
> get it to compile with my old virgl:

Thank you for reviewing and testing the patches! Antonio isn't working
on Venus anymore, I'm going to continue this effort. Last year we
stabilized some of the virglrenderer Venus APIs, this year Venus may
transition to supporting per-context fences only and require to init a
renderserver, which will result in a more changes to Qemu. I'm going to
wait a bit for Venus to settle down and then make a v4.

In the end we will either need to add more #ifdefs if we will want to
keep supporting older virglrenderer versions in Qemu, or bump the min
required virglrenderer version.

-- 
Best regards,
Dmitry


