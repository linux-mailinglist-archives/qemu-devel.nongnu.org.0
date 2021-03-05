Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5C32EF49
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:47:11 +0100 (CET)
Received: from localhost ([::1]:40356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICfW-0004ts-8L
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lICWI-0003IF-AI
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:37:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lICWG-0003km-O3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614958655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQJNznaK1+dESx3mHA28hAGS2ddtmsEDjr+6kpnW3ec=;
 b=AACEzbgrtoPJ5XTDUERHPWNsI33hK/shsBuOz4MOBLS0bUgM/g96uN08tFNwcbTuhrSOwG
 KpCBv3pGuDeWAkhhssFphu2YiaywufRxqcZSImysk0H06IelYkzeJCzrlDVdPnzNY4BPsj
 +xkE7ST+kRa0TIe2DXsEK8vXaZEPlgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-rCVxevAtPR-4AEicu9qxKw-1; Fri, 05 Mar 2021 10:37:34 -0500
X-MC-Unique: rCVxevAtPR-4AEicu9qxKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9412A19253C0;
 Fri,  5 Mar 2021 15:37:32 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C32282BFE7;
 Fri,  5 Mar 2021 15:37:23 +0000 (UTC)
Subject: Re: [PATCH v1 6/9] gitlab: add build-user-hexagon test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210305092328.31792-1-alex.bennee@linaro.org>
 <20210305092328.31792-7-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <4de51b55-bdda-61ff-33af-75a53f803c82@redhat.com>
Date: Fri, 5 Mar 2021 12:37:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305092328.31792-7-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/5/21 6:23 AM, Alex Bennée wrote:
> We special case this as the container with the cross compiler for the
> tests takes so long to build it is manually uploaded into the
> registry.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.yml | 11 +++++++++++
>   1 file changed, 11 insertions(+)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 8b6d495288..c2c5196b8b 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -417,6 +417,17 @@ build-user-static:
>       CONFIGURE_ARGS: --disable-tools --disable-system --static
>       MAKE_CHECK_ARGS: check-tcg
>   
> +# Because the hexagon cross-compiler takes so long to build we don't rely
> +# on the CI system to build it and hence this job has no dependency
> +# declared. The image is manually uploaded.
> +build-user-hexagon:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-hexagon-cross
> +    TARGETS: hexagon-linux-user
> +    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
> +    MAKE_CHECK_ARGS: check-tcg
> +
>   # Only build the softmmu targets we have check-tcg tests for
>   build-some-softmmu:
>     <<: *native_build_job_definition


