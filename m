Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684139354C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 20:15:13 +0200 (CEST)
Received: from localhost ([::1]:55080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmKXI-0000O0-L2
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 14:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lmKUf-0007NR-1I
 for qemu-devel@nongnu.org; Thu, 27 May 2021 14:12:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lmKUT-0004dJ-T4
 for qemu-devel@nongnu.org; Thu, 27 May 2021 14:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622139135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INLLS9U8hGqfPBA1qaEZXq0RqR3lIQeHqItHfd05R5Q=;
 b=g8/VijOReKK/cOofVtyk+kmEZAWRie/i58Cq6V7uwoAehjkvWkGevdRPACXR6n0634GIWh
 P7MQbCHQOhj4pYHYQkYiNoiu0xV2PHlKoOVIIcMRBGszIMrekomTFPVUzFNxlN27ERFqod
 YARqHo1hQZc/aHDg0CuG9zG4QNaW9yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-LRNvlPiqMCG1rZIMlECUsw-1; Thu, 27 May 2021 14:12:05 -0400
X-MC-Unique: LRNvlPiqMCG1rZIMlECUsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB29800C60
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 18:12:04 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-187.gru2.redhat.com
 [10.97.116.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5955F5B689;
 Thu, 27 May 2021 18:11:57 +0000 (UTC)
Subject: Re: [PATCH 1/1] tests/acceptance: change armbian archive to a faster
 host
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210526205601.263444-1-willianr@redhat.com>
 <20210526205601.263444-2-willianr@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <0162f7a0-e934-5f15-ecb0-8796bad67642@redhat.com>
Date: Thu, 27 May 2021 15:11:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526205601.263444-2-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 5/26/21 5:56 PM, Willian Rampazzo wrote:
> The current host for the image
> Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> (archive.armbian.com) is extremely slow in the last couple of weeks,
> making the job running the test
> tests/system/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
> for the first time when the image is not yet on GitLab cache, time out
> while the image is being downloaded.
>
> This changes the host to one faster, so new users with an empty cache
> are not impacted.

Here the old host performed slightly better: download time of 0:17:36 vs 
0:19:44. Maybe it was a temporary issue with the old host or maybe 
GitLab's runner network?

Anyway,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   tests/acceptance/boot_linux_console.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 276a53f146..51c23b822c 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -804,7 +804,8 @@ def test_arm_orangepi_bionic_20_08(self):
>           # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>           # As we expand it to 2 GiB we are safe.
>   
> -        image_url = ('https://archive.armbian.com/orangepipc/archive/'
> +        image_url = ('https://armbian.systemonachip.net/'
> +                     'archive/orangepipc/archive/'
>                        'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
>           image_hash = ('b4d6775f5673486329e45a0586bf06b6'
>                         'dbe792199fd182ac6b9c7bb6c7d3e6dd')


