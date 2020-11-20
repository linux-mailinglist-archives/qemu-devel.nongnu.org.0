Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB8F2BB53C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:26:05 +0100 (CET)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgC2n-0002Cj-0m
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kgBcs-0002Ex-83
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kgBcq-0000YT-Cq
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBi1XlwNr44rgG5+AvkX2QJeDJaudPlV8C6y836SDoI=;
 b=B+5zqB2uK/C+RUkDx+Vpi3JlY6OUKfZmhac29hhbG9z09lnKySnm7eBXiQeB+ouptHXCfZ
 BZaZ2nG/uPA4pVZfC20Mix4Z9M1AEukyZHvylU+vFsVYYUyp0WAQJ9LpBEMvmNs5wpIf7/
 mANZ3ujhFnlK1hI80PNXKTQB4aNo+/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-YkRRutXxNUSSc6sIEF0k2Q-1; Fri, 20 Nov 2020 13:59:14 -0500
X-MC-Unique: YkRRutXxNUSSc6sIEF0k2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B2E1801B19;
 Fri, 20 Nov 2020 18:59:12 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-143.gru2.redhat.com
 [10.97.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8B55C230;
 Fri, 20 Nov 2020 18:59:09 +0000 (UTC)
Subject: Re: [PATCH v1 3/6] tests/avocado: clean-up socket directory after run
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-4-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <3bc76afb-e459-1324-d1ef-aba53faf6220@redhat.com>
Date: Fri, 20 Nov 2020 15:59:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117173635.29101-4-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/17/20 2:36 PM, Alex Bennée wrote:
> Previously we were leaving temporary directories behind. While the
> QEMUMachine does make efforts to clean up after itself the directory
> belongs to the calling function. We use TemporaryDirectory to wrap
> this although we explicitly clear the reference in tearDown() as it
> doesn't get cleaned up otherwise.

This patch fixes the problem introduced on patch 02 of this series.

>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 3033b2cabe..bf54e419da 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -171,8 +171,8 @@ class Test(avocado.Test):
>               self.cancel("No QEMU binary defined or found in the build tree")
>   
>       def _new_vm(self, *args):
> -        sd = tempfile.mkdtemp(prefix="avocado_qemu_sock_")
> -        vm = QEMUMachine(self.qemu_bin, sock_dir=sd)
> +        self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")

Double-checking that you really meant "avo" or if your fingers forgot to 
type the remaining letters. :)

- Wainer

> +        vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)
>           if args:
>               vm.add_args(*args)
>           return vm
> @@ -193,6 +193,7 @@ class Test(avocado.Test):
>       def tearDown(self):
>           for vm in self._vms.values():
>               vm.shutdown()
> +        self._sd = None
>   
>       def fetch_asset(self, name,
>                       asset_hash=None, algorithm=None,


