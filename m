Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A992BB524
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:24:30 +0100 (CET)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgC1F-00088T-B1
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kgBZp-0007eE-I8
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:56:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kgBZm-0008C0-Vo
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1llFQ+vVWxk18UZxtOEg0w/UScUU0tvXjAfsASVNvw=;
 b=cxHNZRQyP4f6JRR45EhcUrsCmdB9RiFCGh3WCSKpZjPg68nCA/8RJ/mLcSnCdomnuSgTt8
 W6Iz+IRwvKMlYyUSn4qmUDILfNM7nTYM9DRIqpr43MwTH2a1L1/nK6tkxoBZ0nfYx0k/zC
 /pZIRypxWw8LCW0uYEbprL5rXWviBNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157--HFs80vHPZ2fZ6QmFl4Lbg-1; Fri, 20 Nov 2020 13:56:04 -0500
X-MC-Unique: -HFs80vHPZ2fZ6QmFl4Lbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BA8A1842142;
 Fri, 20 Nov 2020 18:56:03 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-143.gru2.redhat.com
 [10.97.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F20F26085D;
 Fri, 20 Nov 2020 18:55:58 +0000 (UTC)
Subject: Re: [PATCH v1 2/6] tests: add prefixes to the bare mkdtemp calls
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-3-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <59d21c71-8d29-6431-3091-37975a4eed22@redhat.com>
Date: Fri, 20 Nov 2020 15:55:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117173635.29101-3-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/17/20 2:36 PM, Alex Bennée wrote:
> The first step to debug a thing is to know what created the thing in
> the first place. Add some prefixes so random tmpdir's have something
> grep in the code.


Yeah, it indeed helps.


>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> ---
> v2
>    - fix long lines
> ---
>   python/qemu/machine.py                    | 3 ++-
>   tests/acceptance/avocado_qemu/__init__.py | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 6420f01bed..64d966aeeb 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -303,7 +303,8 @@ class QEMUMachine:
>           return args
>   
>       def _pre_launch(self) -> None:
> -        self._temp_dir = tempfile.mkdtemp(dir=self._test_dir)
> +        self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
> +                                          dir=self._test_dir)
>           self._qemu_log_path = os.path.join(self._temp_dir, self._name + ".log")
>           self._qemu_log_file = open(self._qemu_log_path, 'wb')
>   
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 4cda037187..3033b2cabe 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -171,7 +171,8 @@ class Test(avocado.Test):
>               self.cancel("No QEMU binary defined or found in the build tree")
>   
>       def _new_vm(self, *args):
> -        vm = QEMUMachine(self.qemu_bin, sock_dir=tempfile.mkdtemp())
> +        sd = tempfile.mkdtemp(prefix="avocado_qemu_sock_")
> +        vm = QEMUMachine(self.qemu_bin, sock_dir=sd)
>           if args:
>               vm.add_args(*args)
>           return vm


