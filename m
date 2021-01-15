Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E55D2F7E09
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:22:26 +0100 (CET)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pzd-0000gG-9U
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0PY0-0002NB-FD
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0PXx-0008FS-3v
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610718826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyhkcwoh8eiMEDFzRgeDRy/JWk+TOE9QP0FabiMP4uY=;
 b=ZrzxSt+IcJ8VrToeeuSABildMlPBM3QXg9ivR6fih+5sHnqTaEw9Exn8q/5mhKLVDV4NMd
 hDqbLaEjSINS6PT3bsLm01S5fjes+YCSmXZep0HhMmG4agfPqbutRW6bddpQ2WYdrGoadG
 6rTfRySct8fiibT+1z5wSE0JPK1A7HU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-0jv9dXYLMDaIe5OKhmUpgQ-1; Fri, 15 Jan 2021 08:53:42 -0500
X-MC-Unique: 0jv9dXYLMDaIe5OKhmUpgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD8821DDE0;
 Fri, 15 Jan 2021 13:53:41 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 422D65D9E3;
 Fri, 15 Jan 2021 13:53:37 +0000 (UTC)
Subject: Re: [PATCH v2 02/25] tests/docker: don't use BUILDKIT in GitLab either
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-3-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <678eec1f-9cf6-ef96-8a11-e8ddaff4710e@redhat.com>
Date: Fri, 15 Jan 2021 10:53:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-3-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 1/14/21 10:02 AM, Daniel P. Berrangé wrote:
> Using BUILDKIT breaks with certain container registries such as CentOS,
> with docker build reporting an error such as
>
>    failed to solve with frontend dockerfile.v0:
>    failed to build LLB: failed to load cache key:
>    unexpected status code
>    https://registry.centos.org/v2/centos/manifests/7:
>    403 Forbidden
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/docker/docker.py | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index 36b7868406..d1d0da9419 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -222,7 +222,9 @@ class Docker(object):
>       def __init__(self):
>           self._command = _guess_engine_command()
>   
> -        if "docker" in self._command and "TRAVIS" not in os.environ:
> +        if ("docker" in self._command and
> +            "TRAVIS" not in os.environ and
> +            "CI" not in os.environ):


The variable CI is also exported in Travis. But if you want to keep this 
guard specific to gitlab then you can use GITLAB_CI.

- Wainer

>               os.environ["DOCKER_BUILDKIT"] = "1"
>               self._buildkit = True
>           else:


