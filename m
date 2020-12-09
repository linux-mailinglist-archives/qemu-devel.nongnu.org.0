Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1D2D47C9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:25:20 +0100 (CET)
Received: from localhost ([::1]:43382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3DL-0004l2-1C
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kn301-0007ul-MF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:11:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kn300-0005JW-4F
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607533891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3F91DzN5F0kKEtYvqJ6fzYS6pCWzQz+4AjnxofhPjM=;
 b=abu/IPdPUQqeK+PzWOUPtJFczAYciPCrODrqZex1M6EIXlUTbWjpHZdKL7Kc9LKyJ4QVTS
 6hrdKCXJhikjLI3/Rr0ciR70eR4CrDM8GNoe3tp78tgnXMLIJbK1Rt8dfuvAIgAJivGcCU
 Ep27djecJTroDy6eHtxYAHElQMCM1ys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-XcBx9OwSPOazE8VNq1ebjw-1; Wed, 09 Dec 2020 12:11:29 -0500
X-MC-Unique: XcBx9OwSPOazE8VNq1ebjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7084A19251A0;
 Wed,  9 Dec 2020 17:11:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B35526EF48;
 Wed,  9 Dec 2020 17:10:59 +0000 (UTC)
Subject: Re: [PATCH v1 5/6] gitlab: move --without-default-devices build from
 Travis
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201209170059.20742-1-alex.bennee@linaro.org>
 <20201209170059.20742-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1cee701f-0c59-33bb-64d1-0d93b97e5c6e@redhat.com>
Date: Wed, 9 Dec 2020 18:10:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201209170059.20742-6-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/2020 18.00, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 7 +++++++
>  .travis.yml    | 8 --------
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 21b01c0547..878d114d40 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -434,6 +434,13 @@ build-trace-ust-system:
>      IMAGE: ubuntu2004
>      CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
>  
> +# Check our reduced build configurations
> +build-without-default-devices:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-amd64
> +    CONFIGURE_ARGS: --without-default-devices --disable-user

We're interested in --without-default-devices in downstream RHEL ... would
it be ok for you to test this with Fedora or CentOS instead?

 Thomas


