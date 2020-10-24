Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ACA297AEA
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 07:27:57 +0200 (CEST)
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWC5s-0001do-40
	for lists+qemu-devel@lfdr.de; Sat, 24 Oct 2020 01:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kWC4T-00013y-Io
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 01:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kWC4R-0006Qd-Ob
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 01:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603517185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOGTFE09pGpLyr331BROyMAqUTZY/Wsr29mTAIe+dSA=;
 b=ep6HRBQCv67BMFzgULkD2xaW8yYv4P9/ILCjYTv6M2tp5VktHygazEqAwCyccIlO80J9mM
 ZedJCUE9JieeitEShAP2swAqJMXDV+ORPfYMgJth43uhetgDeAHgF8P24srISPSnZX8+kR
 qETxJpS8gmu4cNK4Di3LX/SMHFl/EkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-7IxUYwLRNp-qBPuPuJj-EA-1; Sat, 24 Oct 2020 01:26:19 -0400
X-MC-Unique: 7IxUYwLRNp-qBPuPuJj-EA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C12D964144;
 Sat, 24 Oct 2020 05:26:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 954CB5B4BC;
 Sat, 24 Oct 2020 05:26:14 +0000 (UTC)
Subject: Re: [PATCH v3 1/6] tests/qtest: Make npcm7xx_timer-test conditional
 on CONFIG_NPCM7XX
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20201023210637.351238-1-hskinnemoen@google.com>
 <20201023210637.351238-2-hskinnemoen@google.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <952a179b-0d80-4f4c-9a1a-7cbc5910f9ef@redhat.com>
Date: Sat, 24 Oct 2020 07:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023210637.351238-2-hskinnemoen@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 01:26:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.108, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: venture@google.com, qemu-devel@nongnu.org, wuhaotsh@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/2020 23.06, Havard Skinnemoen wrote:
> This test won't work if qemu was compiled without CONFIG_NPCM7XX, as
> pointed out by Thomas Huth on a different patch.
> 
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  tests/qtest/meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 28d4068718..7e0ecaa2c5 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -133,12 +133,13 @@ qtests_sparc64 = \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
>    ['prom-env-test', 'boot-serial-test']
>  
> +qtests_npcm7xx = ['npcm7xx_timer-test']
>  qtests_arm = \
>    (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
> +  (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>    ['arm-cpu-features',
>     'microbit-test',
>     'm25p80-test',
> -   'npcm7xx_timer-test',
>     'test-arm-mptimer',
>     'boot-serial-test',
>     'hexloader-test']
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


