Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A6D61503D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:12:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1optFl-00059Y-Hk; Tue, 01 Nov 2022 11:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1optFg-00058o-Nq
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:32:33 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1optFe-0001D7-6s
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=UjyXOvvh0THkWD/1Etsd9+jNP5G6EEHpqZkgiUj6wMY=; b=OqUyunIFJWgmNnVxHfA5ppAQRT
 mpJedRV2VFBFUwgTSWUqvwpfG0lYemZ2sandy4DHVssdTMxjdGs/jaJdPsPx0zfp7WQvLtdhv/laj
 3wCcH77kPvnkFXRB40PP2+9J5yJo5ITO8yaGqS7ehiBihXsL+Fv1ImAM4maqCEdkERxMqB4VdLeGy
 DBfobWz8h5T3fhJ7c9PYxto7N+5bo6AodzBEc32tbMXDTJ7PdlLMQW4zrTEx4ftVD5+uF5rxhx0YK
 qKJ6kmXtxo6zmxAWiIVuknAhdYV9fZcJf9m0XSjInnh0laKTmqjvZxC1fiLoDODNI917MXX0jQtRr
 +j9QpXPfMWcBs86GQffxF27fM2nHlH7wlNT2uN/sCIjXoxw6jUoSfCoq8PvhQ9YdvBJhb/ZcJ6M34
 /MKVWHXaXZd/1aTGWtVs1r+MuVfsnVfyVo024UU4vlWGXUqkVtT9obAVj0vlxNoDtp/Cilf2KBcWB
 HKYyANeA0b3y1GaWI9+j9iRtxHubah6xQ2tSGB6Y1AGhexUpr9ktSc90P/pohT30o23rOYNN8aze0
 xn/gdvQPrruCE11b1trbLB5BRLxOIu5Kh2ZQY51FcvlVcYdc+c0Xuz2kZTG1UcmcLKnP6DlWkYjnE
 XTYjiZ7spqb1HkHcF/5AdCdg6BUKwEbfqOg3oCNkI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH 15/16] tests/qtest: virtio-9p-test: Adapt the case for
 win32
Date: Tue, 01 Nov 2022 16:32:25 +0100
Message-ID: <5023535.bWWS6zZ1je@silver>
In-Reply-To: <20221024045759.448014-16-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <20221024045759.448014-16-bin.meng@windriver.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Monday, October 24, 2022 6:57:58 AM CET Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> Windows does not provide the getuid() API. Let's create a local
> one and return a fixed value 0 as the uid for testing.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  tests/qtest/virtio-9p-test.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 25305a4cf7..e81e3e3709 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -34,6 +34,13 @@ static uint32_t genfid(void)
>      return fid_generator++;
>  }
>  
> +#ifdef CONFIG_WIN32
> +static uint32_t getuid(void)
> +{
> +    return 0;
> +}
> +#endif
> +

Due to recent 9p tests restructuring changes, same would be needed for new
tests/qtest/libqos/virtio-9p-client.c source file, as it's also calling 
getuid().

>  /**
>   * Splits the @a in string by @a delim into individual (non empty) strings
>   * and outputs them to @a out. The output array @a out is NULL terminated.
> 




