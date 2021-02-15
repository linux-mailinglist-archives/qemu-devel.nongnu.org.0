Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D0831C283
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:36:52 +0100 (CET)
Received: from localhost ([::1]:43746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjfv-00008Y-Kn
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBjbU-00051P-5S
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:32:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBjbQ-0008Cy-08
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613417530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlx4ORC06j5tahO+2gcfYG0706mtyvT30JB45W2Z0N0=;
 b=QBOTJWfIgVUmHcJzfnTW6FOKPXI77+flkgvnJ/wRMNa9OeWrwfE8WSMEGRF+36YUYQcDBt
 iM1ogOo5yVLodswgnCv8BIoVvuNr6c4odayV/tmDcFUe2Hwramehwnl1x3lYuGA0nqF1D6
 dHwgtxTNr63LnOXltIsDci+DDLGqBgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-opya3NJdMMajPb3xHWb1Fg-1; Mon, 15 Feb 2021 14:32:07 -0500
X-MC-Unique: opya3NJdMMajPb3xHWb1Fg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3BE8100CCC7;
 Mon, 15 Feb 2021 19:32:06 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33BCC10021AA;
 Mon, 15 Feb 2021 19:31:59 +0000 (UTC)
Subject: Re: [PATCH 6/6] tests/acceptance/virtio-gpu.py: preserve
 virtio-user-gpu log
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-7-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ba149e68-8cb7-e490-f56b-fe21e12754c2@redhat.com>
Date: Mon, 15 Feb 2021 16:31:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211220146.2525771-7-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/11/21 7:01 PM, Cleber Rosa wrote:
> At location already prepared for keeping the test's log files.
>
> While at it, log info about its location (in the main test log
> file), instead of printing it out.
>
> Reference: https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#avocado.Test.logdir
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/virtio-gpu.py | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
> index 8d689eb820..ab1a4c1a71 100644
> --- a/tests/acceptance/virtio-gpu.py
> +++ b/tests/acceptance/virtio-gpu.py
> @@ -119,10 +119,11 @@ class VirtioGPUx86(Test):
>           os.set_inheritable(vug_sock.fileno(), True)
>   
>           self._vug_log_path = os.path.join(
> -            self.vm.temp_dir, "vhost-user-gpu.log"
> +            self.logdir, "vhost-user-gpu.log"
>           )
>           self._vug_log_file = open(self._vug_log_path, "wb")
> -        print(self._vug_log_path)
> +        self.log.info('Complete vhost-user-gpu.log file can be '
> +                      'found at %s', self._vug_log_path)
>   
>           vugp = subprocess.Popen(
>               [vug, "--virgl", "--fd=%d" % vug_sock.fileno()],


