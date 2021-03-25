Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E825349972
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:24:54 +0100 (CET)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUf7-0006yn-9c
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lPUWH-0001Nw-U2
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lPUW8-0000PS-00
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616696134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8ot5FEUyBUNr6px/Ivn8xLgr6mkeAIofjA4Oe/Duy4=;
 b=WcLfTNdRPJhXXe7vlOnlumvNnUHKuYYuIQd9oPH4d4KH7+WONqiTuVobKAumTMZrFKPq80
 gMfCxIqjuIJJhlXtFFX88WaODIefpX9D7EcwkPMbxExNqCWWBFfcHmF5Rbs3C9PhwurxJo
 Cq/2VYDDKwXuljRNqACuqKQ20e1Yv+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-GVS47pZRO-iPWuz6kqHDoQ-1; Thu, 25 Mar 2021 14:15:32 -0400
X-MC-Unique: GVS47pZRO-iPWuz6kqHDoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D3C3EC1A0;
 Thu, 25 Mar 2021 18:15:30 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-73.gru2.redhat.com
 [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5147C6267C;
 Thu, 25 Mar 2021 18:15:01 +0000 (UTC)
Subject: Re: [PATCH v2 09/10] Acceptance Tests: add basic documentation on
 LinuxTest base class
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-10-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <39066db3-7815-fb8e-eace-f31f74392e8a@redhat.com>
Date: Thu, 25 Mar 2021 15:14:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323221539.3532660-10-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/23/21 7:15 PM, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   docs/devel/testing.rst | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 1da4c4e4c4..ed2a06db28 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -810,6 +810,31 @@ and hypothetical example follows:
>   At test "tear down", ``avocado_qemu.Test`` handles all the QEMUMachines
>   shutdown.
>   
> +The ``avocado_qemu.LinuxTest`` base test class
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The ``avocado_qemu.LinuxTest`` is further specialization of the
> +``avocado_qemu.Test`` class, so it contains all the characteristics of
> +the later plus some extra features.
> +
> +First of all, this base class is intended for tests that need to
> +interact with a fully booted and operational Linux guest.  The most
> +basic example looks like this:

I think it is worth mentioning currently it will boot a Fedora 31 
cloud-init image.

Apart from that,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

> +
> +.. code::
> +
> +  from avocado_qemu import LinuxTest
> +
> +
> +  class SomeTest(LinuxTest):
> +
> +      def test(self):
> +          self.launch_and_wait()
> +          self.ssh_command('some_command_to_be_run_in_the_guest')
> +
> +Please refer to tests that use ``avocado_qemu.LinuxTest`` under
> +``tests/acceptance`` for more examples.
> +
>   QEMUMachine
>   ~~~~~~~~~~~
>   


