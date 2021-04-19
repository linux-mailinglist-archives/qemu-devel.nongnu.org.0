Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D386B364A57
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:16:50 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZO5-00032r-T6
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYZFX-0007IW-N6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:07:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYZFS-0004vt-FO
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618859273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5jAdvpI7tM20GrBKHsQHZVY+yTBgzw+EhhKak76UTU=;
 b=Gb4ZFwoInKSWcOIu7V9LArLn5SDnu70Yrw7kopnIybp+N/rjSAISEJKRnAl5bXlY0RhKbn
 uqBo1WjlSc/Vt9JX8MlShCBko6O66xZcs14lBE00FQacosvpSQWMnieEM/vIQY/9Iu+8ux
 IBoU+dXA2yOQyqtfdeua67uMxeUorEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-SzlNaCsrPa2IMWwSetElbw-1; Mon, 19 Apr 2021 15:07:52 -0400
X-MC-Unique: SzlNaCsrPa2IMWwSetElbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0391E8710F4;
 Mon, 19 Apr 2021 19:07:51 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-102.gru2.redhat.com
 [10.97.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A54155D9CA;
 Mon, 19 Apr 2021 19:07:38 +0000 (UTC)
Subject: Re: [PATCH 6/8] Acceptance tests: prevent shutdown on non-specific
 target tests
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-7-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <5ab01b50-0d8a-78df-5c96-ba6ad91ee2fa@redhat.com>
Date: Mon, 19 Apr 2021 16:07:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-7-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/15/21 6:51 PM, Cleber Rosa wrote:
> When running tests that are not target specific with various target
> binaries, some specific behavior appears.  For s390x, when there's no
> guest code running, it will produce GUEST_PANICKED events as the
> firmware will shutdown the machine.
>
> With this change, no GUEST_PANICKED *event* will be generated.
>
> For some QMP commands, such as "query-migrate", a proper response
> ("guest-panicked" for the s390x target) will still be given.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/migration.py | 4 ++--
>   tests/acceptance/version.py   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
> index 25ee55f36a..b4d46becc6 100644
> --- a/tests/acceptance/migration.py
> +++ b/tests/acceptance/migration.py
> @@ -46,12 +46,12 @@ def assert_migration(self, src_vm, dst_vm):
>   
>       def do_migrate(self, dest_uri, src_uri=None):
>           dest_vm = self.get_vm('-incoming', dest_uri)
> -        dest_vm.add_args('-nodefaults')
> +        dest_vm.add_args('-nodefaults', '-no-shutdown')

On the other hand, can't that new argument introduce unwanted behavior 
on other targets? Maybe the argument should be set only for s390 because 
we know it prevents the test failure on that target only.

- Wainer

>           dest_vm.launch()
>           if src_uri is None:
>               src_uri = dest_uri
>           source_vm = self.get_vm()
> -        source_vm.add_args('-nodefaults')
> +        source_vm.add_args('-nodefaults', '-no-shutdown')
>           source_vm.launch()
>           response = source_vm.qmp('migrate', uri=src_uri)
>           if 'error' in response:
> diff --git a/tests/acceptance/version.py b/tests/acceptance/version.py
> index 79b923d4fc..3cf18c9878 100644
> --- a/tests/acceptance/version.py
> +++ b/tests/acceptance/version.py
> @@ -17,7 +17,7 @@ class Version(Test):
>       :avocado: tags=quick
>       """
>       def test_qmp_human_info_version(self):
> -        self.vm.add_args('-nodefaults')
> +        self.vm.add_args('-nodefaults', '-no-shutdown')
>           self.vm.launch()
>           res = self.vm.command('human-monitor-command',
>                                 command_line='info version')


