Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA732F3945
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:57:00 +0100 (CET)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOqh-0003of-Cq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kzOly-0008TC-3r
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:52:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kzOlw-0004Al-DT
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610477523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCyjeaCNBVpDgSBpGaBpgVYcsAzDbpwjygAFEVw9Vr8=;
 b=emIu7rW3/eKKbZbqHUR6A8Z1FrAVMgfQ0Bf91v4mI/kXOlNzOHxV5wqLWJc2CEEngjDrXc
 416qaq9rOOuxGttFz/TCYD7MxJyBq7IuzpSujB6cw2X8WTO7pN9+F+uMN/xmLQOCD94rLb
 bTBOyn4DDSf7JVno2k5z+5WaiqSoXMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-qJ_N2iF7PrmWTSeu45lN4Q-1; Tue, 12 Jan 2021 13:51:50 -0500
X-MC-Unique: qJ_N2iF7PrmWTSeu45lN4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04D91AFA8C;
 Tue, 12 Jan 2021 18:51:49 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 000106A8EC;
 Tue, 12 Jan 2021 18:51:44 +0000 (UTC)
Subject: Re: [PATCH 3/3] tests/acceptance: Add a test for the virtex-ml507 ppc
 machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-4-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <8eea2bfa-8d77-9b23-d1db-6af8ec80a50a@redhat.com>
Date: Tue, 12 Jan 2021 15:51:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210112164045.98565-4-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/12/21 1:40 PM, Thomas Huth wrote:
> The "And a hippo new year" image from the QEMU advent calendar 2020
> can be used to test the virtex-ml507 ppc machine.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/acceptance/machine_ppc.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
> index 71025d296c..a836e2496f 100644
> --- a/tests/acceptance/machine_ppc.py
> +++ b/tests/acceptance/machine_ppc.py
> @@ -49,3 +49,21 @@ class PpcMachine(Test):
>           self.vm.launch()
>           wait_for_console_pattern(self, 'QEMU advent calendar 2020',
>                                    self.panic_message)
> +
> +    def test_ppc_virtex_ml507(self):
> +        """
> +        :avocado: tags=arch:ppc
> +        :avocado: tags=machine:virtex-ml507
> +        """
> +        tar_url = ('https://www.qemu-advent-calendar.org'
> +                   '/2020/download/hippo.tar.gz')
> +        tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
> +        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> +        archive.extract(file_path, self.workdir)
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', self.workdir + '/hippo/hippo.linux',
> +                         '-dtb', self.workdir + '/hippo/virtex440-ml507.dtb',
> +                         '-m', '512')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
> +                                 self.panic_message)


