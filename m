Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE53473EB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:49:18 +0100 (CET)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzCX-000358-DU
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOz9o-0001nl-SA
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOz9l-0006Vn-TZ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616575583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvAIhu1TWAmTldCKVYlwDjr9emhixoNIXabdfTB2p4s=;
 b=G3NlMR3u6WxdV4fhUsLB8Im8BUflyoqyfenROyPka2KzEYhTcL1OVGH0V+VSE76En/wl49
 km+b3kquyjSDn2hmd9Ar2vIVKGA9H78QxMA0Jqfrptc2y8NCTkfZmpuxHAL/uVHM9R21k0
 kn74LPlSSe/ms19SK3IGrwZA/BpfsK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-p9vfiev3PySjkqFcSRYXrg-1; Wed, 24 Mar 2021 04:46:21 -0400
X-MC-Unique: p9vfiev3PySjkqFcSRYXrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E93107ACCA;
 Wed, 24 Mar 2021 08:46:19 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB0AB5D9DE;
 Wed, 24 Mar 2021 08:45:53 +0000 (UTC)
Subject: Re: [PATCH v2 01/10] tests/acceptance/virtiofs_submounts.py: add
 missing accel tag
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-2-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <72cbbf36-1101-7efc-af14-51b8cf59e078@redhat.com>
Date: Wed, 24 Mar 2021 09:45:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-2-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 3/23/21 11:15 PM, Cleber Rosa wrote:
> The tag is useful to select tests that depend/use a particular
> feature.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index 46fa65392a..5b74ce2929 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -70,6 +70,7 @@ def test_something_that_needs_cmd1_and_cmd2(self):
>  class VirtiofsSubmountsTest(LinuxTest):
>      """
>      :avocado: tags=arch:x86_64
> +    :avocado: tags=accel:kvm
>      """
>  
>      def get_portfwd(self):
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


