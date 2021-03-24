Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1D34746B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:21:22 +0100 (CET)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzhZ-00013L-Tc
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOzf2-0007h2-4K
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lOzf0-0000mY-Fj
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616577521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBdDgxioCLvOn1KGb8iDIHXDZ/PCqSSwx7eZWrLjZaI=;
 b=f7W+O0bsjc9dXETlbCkgdUTC6pptF36+UoHGhnRg4R0h0DvFaEGsmmikpqNU1+HPF1waWN
 qKh2HwDgEYeSCjySr8HSoDzHl0EkZOcg/KCbk5y9KurxW9JwVFZ/OXaPJkVhnUHxFpnYJy
 IGW+kC/+fukKhCA/t2Ttcj1k8nTpU7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-Gtgs77YxO7S7LMszMXl9mA-1; Wed, 24 Mar 2021 05:18:39 -0400
X-MC-Unique: Gtgs77YxO7S7LMszMXl9mA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 972E11007474;
 Wed, 24 Mar 2021 09:18:37 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BA1B62A6F;
 Wed, 24 Mar 2021 09:18:23 +0000 (UTC)
Subject: Re: [PATCH v2 06/10] Acceptance Tests: make username/password
 configurable
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-7-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a039253e-7656-8f6e-6113-7c659cae6949@redhat.com>
Date: Wed, 24 Mar 2021 10:18:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-7-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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



On 3/23/21 11:15 PM, Cleber Rosa wrote:
> This makes the username/password used for authentication configurable,
> because some guest operating systems may have restrictions on accounts
> to be used for logins, and it just makes it better documented.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index e75b002c70..535f63a48d 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -308,6 +308,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>  
>      timeout = 900
>      chksum = None
> +    username = 'root'
> +    password = 'password'
>  
>      def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
>          super(LinuxTest, self).setUp()
> @@ -370,8 +372,8 @@ def prepare_cloudinit(self, ssh_pubkey=None):
>                  with open(ssh_pubkey) as pubkey:
>                      pubkey_content = pubkey.read()
>              cloudinit.iso(cloudinit_iso, self.name,
> -                          username='root',
> -                          password='password',
> +                          username=self.username,
> +                          password=self.password,
>                            # QEMU's hard coded usermode router address
>                            phone_home_host='10.0.2.2',
>                            phone_home_port=self.phone_home_port,
> 


