Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF03646F4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:19:09 +0200 (CEST)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVg4-0000Ee-Sc
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lYVRC-0005gi-5K
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lYVR9-0003Q0-Ew
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618844622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5ra24Z1ou6ohczmzqNUi85Z7+ax7Zhjo5IRfBjGZZo=;
 b=U2oc0xHQW3ty1mulEfgMStosUBvtqGvQKsYaYhWKZGjJdRdw69Nvl/HbRBU1mlc9SqJFO8
 lfSGD6CTXBHdIidBAUXtTB4MIrvPGZtlQQz1fqKMco5fKZJKbHJRbagMqFmxUzFiWVTi23
 WUqy4MpWYHEfeJ9zO9KWigVJO6Vry2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-tmNKTrCrOSezjEN35J6C7Q-1; Mon, 19 Apr 2021 11:03:40 -0400
X-MC-Unique: tmNKTrCrOSezjEN35J6C7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF4331922037;
 Mon, 19 Apr 2021 15:03:38 +0000 (UTC)
Received: from [10.36.113.132] (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5EFD5D74B;
 Mon, 19 Apr 2021 15:03:13 +0000 (UTC)
Subject: Re: [PATCH v3 11/11] tests/acceptance/virtiofs_submounts.py: fix
 setup of SSH pubkey
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210412044644.55083-1-crosa@redhat.com>
 <20210412044644.55083-12-crosa@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d0514f24-9f64-5acc-38c6-0c11a3589104@redhat.com>
Date: Mon, 19 Apr 2021 17:03:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210412044644.55083-12-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 4/12/21 6:46 AM, Cleber Rosa wrote:
> The public key argument should be a path to a file, and not the
> public key data.
> 
> Reported-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index d77ee356740..21ad7d792e7 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -195,7 +195,7 @@ def setUp(self):
>  
>          self.run(('ssh-keygen', '-N', '', '-t', 'ed25519', '-f', self.ssh_key))
>  
> -        pubkey = open(self.ssh_key + '.pub').read()
> +        pubkey = self.ssh_key + '.pub'
>  
>          super(VirtiofsSubmountsTest, self).setUp(pubkey)
>  
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


