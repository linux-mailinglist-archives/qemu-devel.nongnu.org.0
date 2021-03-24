Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD09347485
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:26:36 +0100 (CET)
Received: from localhost ([::1]:60074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzmd-00057W-6o
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOzkf-0003v4-B5
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOzkd-0004AS-Lj
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616577870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agZEtekhm/wzLAQgZ3lyydDdG2Bm1Mu5dHK1ZPiqPRU=;
 b=RKoLK8nlL2yDe0rWVWYu0vZOsOmnE/rLESw703aCXmZ1FF3ncRVHDoDf5IqiAfdsxl3j+M
 Ll7FQuYMNTLRxhRy7sIxERlk1g0+kcJ7Hc/0K+zrLSf53MbIZ2qJcb4+Oi3O1hu3ZKhffR
 Rs2o6qDp96Oycpz5HBbput1Lw7LjfVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-qyWC24hQP0u4NGVorRqwMA-1; Wed, 24 Mar 2021 05:24:26 -0400
X-MC-Unique: qyWC24hQP0u4NGVorRqwMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31577180FCA6;
 Wed, 24 Mar 2021 09:24:25 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 985B7610AF;
 Wed, 24 Mar 2021 09:24:11 +0000 (UTC)
Subject: Re: [PATCH v2 08/10] tests/acceptance/virtiofs_submounts.py: remove
 launch_vm()
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-9-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1ccc13c4-73e2-afc9-cabb-fd7ca0e411c1@redhat.com>
Date: Wed, 24 Mar 2021 10:24:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-9-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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

Hi,

On 3/23/21 11:15 PM, Cleber Rosa wrote:
> The LinuxTest class' launch_and_wait() method now behaves the same way
> as this test's custom launch_vm(), so let's just use the upper layer
> (common) method.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/acceptance/virtiofs_submounts.py | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index e019d3b896..d77ee35674 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -134,9 +134,6 @@ def set_up_virtiofs(self):
>                           '-numa',
>                           'node,memdev=mem')
>  
> -    def launch_vm(self):
> -        self.launch_and_wait()
> -
>      def set_up_nested_mounts(self):
>          scratch_dir = os.path.join(self.shared_dir, 'scratch')
>          try:
> @@ -225,7 +222,7 @@ def test_pre_virtiofsd_set_up(self):
>          self.set_up_nested_mounts()
>  
>          self.set_up_virtiofs()
> -        self.launch_vm()
> +        self.launch_and_wait()
>          self.mount_in_guest()
>          self.check_in_guest()
>  
> @@ -235,14 +232,14 @@ def test_pre_launch_set_up(self):
>  
>          self.set_up_nested_mounts()
>  
> -        self.launch_vm()
> +        self.launch_and_wait()
>          self.mount_in_guest()
>          self.check_in_guest()
>  
>      def test_post_launch_set_up(self):
>          self.set_up_shared_dir()
>          self.set_up_virtiofs()
> -        self.launch_vm()
> +        self.launch_and_wait()
>  
>          self.set_up_nested_mounts()
>  
> @@ -252,7 +249,7 @@ def test_post_launch_set_up(self):
>      def test_post_mount_set_up(self):
>          self.set_up_shared_dir()
>          self.set_up_virtiofs()
> -        self.launch_vm()
> +        self.launch_and_wait()
>          self.mount_in_guest()
>  
>          self.set_up_nested_mounts()
> @@ -265,7 +262,7 @@ def test_two_runs(self):
>          self.set_up_nested_mounts()
>  
>          self.set_up_virtiofs()
> -        self.launch_vm()
> +        self.launch_and_wait()
>          self.mount_in_guest()
>          self.check_in_guest()
>  
> 


