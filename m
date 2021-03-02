Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932C32A2B2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:57:27 +0100 (CET)
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6Sk-0004YQ-Kj
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lH6Rh-00048p-QP
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:56:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lH6Rg-0004xo-8l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614696979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIe4BEKtubSuPFSW/qHdMRd7fcHz2Y0FN/lH3yw2AHo=;
 b=XO8mVpvFd/rC7uqYtUh+8S7ofWcL8qis7L2DQ3ho54B+01QXTP/3flHPFds6AbBgWhRX/G
 KLiEx5WQCHcUQcK/kRhNX0Sx9jqIFMoSELNZqs/Nda12Yyd/z2HxnoWieWKdJoPaqJBNJP
 lQI4ds81q0bCm+rBOOJ2dAsQTmpHM4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-fcb3AAwCOiqTidaECDCqXw-1; Tue, 02 Mar 2021 09:56:17 -0500
X-MC-Unique: fcb3AAwCOiqTidaECDCqXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABAED107ACE4;
 Tue,  2 Mar 2021 14:56:15 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 498B85C626;
 Tue,  2 Mar 2021 14:56:03 +0000 (UTC)
Subject: Re: [PATCH 1/2] Acceptance Tests: restore downloading of VM images
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210225232122.1254879-1-crosa@redhat.com>
 <20210225232122.1254879-2-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a4a5afa4-6c15-3d52-34b4-85e223dfbd3d@redhat.com>
Date: Tue, 2 Mar 2021 11:56:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225232122.1254879-2-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/25/21 8:21 PM, Cleber Rosa wrote:
> The "get-vm-images" target defined in tests/Makefile.include is a
> prerequisite for "check-acceptance", so that those files get
> downloaded before the Avocado job even starts.
>
> It looks like on c401c058a1c a TARGETS variable was introduced with a
> different content than it was previously coming from the main
> Makefile.  From that point on, the "get-vm-images" succeed without
> doing anything because there was no matching architecture to download.
>
> This restores the download of images (that match targets to be built)
> before the job starts, eliminating downloads and their associated
> failures during the tests.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/Makefile.include | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index d34254fb29..dbd53a9de6 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -109,7 +109,8 @@ $(TESTS_RESULTS_DIR):
>   
>   check-venv: $(TESTS_VENV_DIR)
>   
> -FEDORA_31_ARCHES_CANDIDATES=$(patsubst ppc64,ppc64le,$(TARGETS))
> +FEDORA_31_ARCHES_TARGETS=$(patsubst %-softmmu,%, $(filter %-softmmu,$(TARGETS)))
> +FEDORA_31_ARCHES_CANDIDATES=$(patsubst ppc64,ppc64le,$(FEDORA_31_ARCHES_TARGETS))
>   FEDORA_31_ARCHES := x86_64 aarch64 ppc64le s390x
>   FEDORA_31_DOWNLOAD=$(filter $(FEDORA_31_ARCHES),$(FEDORA_31_ARCHES_CANDIDATES))
>   


