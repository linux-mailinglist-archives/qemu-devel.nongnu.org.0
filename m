Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5955931C255
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:18:14 +0100 (CET)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjNs-00044U-WF
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBjLV-00033c-U2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:15:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBjLT-0001X4-6k
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613416541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tKdah/4t+7HUPrJVZ+D0Irf19pf/+vyOwdFf6O1TG4=;
 b=AIZ4O0Lz+czHwzsfldxwM+LajaEOld2E7R5UAzURbXezATax69XbK/br3/mPNLSa3nncWr
 FdFFfz8y5EXUzpiBIkgCNQWwBYqqWsdc486F1uA16ISX2MhTytOaZIWLGFCHiFvXCUbQq4
 WuCxKqQjzDB3vwkErSBQwg9+37gSXSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-sC4PRocQP6etaTZscXZpEw-1; Mon, 15 Feb 2021 14:15:37 -0500
X-MC-Unique: sC4PRocQP6etaTZscXZpEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7E71107ACC7;
 Mon, 15 Feb 2021 19:15:36 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0129722E2;
 Mon, 15 Feb 2021 19:15:26 +0000 (UTC)
Subject: Re: [PATCH 4/6] Acceptance Tests: log information when creating
 QEMUMachine
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-5-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <0affd566-9511-f581-8925-8fb1c2551848@redhat.com>
Date: Mon, 15 Feb 2021 16:15:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211220146.2525771-5-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/11/21 7:01 PM, Cleber Rosa wrote:
> Including its base temporary directory, given that information useful
> for debugging can be put there.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index b7ab836455..94b78fd7c8 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -170,10 +170,12 @@ class Test(avocado.Test):
>           if self.qemu_bin is None:
>               self.cancel("No QEMU binary defined or found in the build tree")
>   
> -    def _new_vm(self, *args):
> +    def _new_vm(self, name, *args):
>           self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
>           vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
>                            sock_dir=self._sd.name)
> +        self.log.debug('QEMUMachine "%s" created', name)
> +        self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
>           if args:
>               vm.add_args(*args)
>           return vm
> @@ -186,7 +188,7 @@ class Test(avocado.Test):
>           if not name:
>               name = str(uuid.uuid4())
>           if self._vms.get(name) is None:
> -            self._vms[name] = self._new_vm(*args)
> +            self._vms[name] = self._new_vm(name, *args)
>               if self.machine is not None:
>                   self._vms[name].set_machine(self.machine)
>           return self._vms[name]


