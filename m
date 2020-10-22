Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79B295F3D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 15:02:14 +0200 (CEST)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVaEP-0003L1-Jj
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 09:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVaCs-0002jT-4Q
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 09:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVaCh-0000E6-8w
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 09:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603371624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmC3zdoigyALlNSczRucJILPm3iF3wo7HYx6XkYJ92s=;
 b=MJvnWI7qfSFb3RLVYP30BSxhP8uE3S4lYc2HWBQn7vUx5HNwytPz4UnYobbt9ZxXgbqKIb
 zYW7y+KVPgbefl6y992hG1maoja0rOjN8XoSRoCqabV6B/LAQR1YFgV9kOGjFSR83wKXRV
 QxJPb30rSoLo2sVcOA8Xr6i74R9HgBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-dGnkL0o9PK68vaibVuhCiw-1; Thu, 22 Oct 2020 09:00:21 -0400
X-MC-Unique: dGnkL0o9PK68vaibVuhCiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18DC68049EF;
 Thu, 22 Oct 2020 13:00:20 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-72.ams2.redhat.com [10.36.115.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02FDA5D9F1;
 Thu, 22 Oct 2020 13:00:11 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci: Clone from GitLab itself
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201022123302.2884788-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e79f57e6-d307-0d1f-027d-d2006c1c94b2@redhat.com>
Date: Thu, 22 Oct 2020 15:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201022123302.2884788-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:09:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/10/2020 14.33, Philippe Mathieu-Daudé wrote:
> Let GitLab runners use GitLab repository directly.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 66ad7aa5c22..ba77af51f2f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -24,6 +24,7 @@ include:
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>    before_script:
>      - JOBS=$(expr $(nproc) + 1)
> +    - sed -i s,git.qemu.org/git,gitlab.com/qemu-project, .gitmodules
>    script:
>      - mkdir build
>      - cd build
> 

Good idea!

Reviewed-by: Thomas Huth <thuth@redhat.com>


