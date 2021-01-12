Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690822F3960
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:03:32 +0100 (CET)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOx1-0003Mm-9E
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kzOlK-0008GC-AA
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kzOlH-0003xF-DA
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610477481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MmFruoqEBMR2XwiJQkxZOFBXsuP9lWxIlkO8Uz7loc=;
 b=OMhZp+LwRVHZHu4j3EbDGMs7U29qVUcy1hV4VXpzqVc/oJxlaQxm4uRKgXRW7uyNqqFgpK
 jrmRy0b9lawIQIHotfmk9AKPqodZOGxsDl1LXFMxs6F2LthCaJUHTjijyLmXaUXwxoe0HM
 JtDCHs6rmBxLK8Tn8Ljq9Lvia9rU5BI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-uNTHs4LvN9KhBnIS0XI-1A-1; Tue, 12 Jan 2021 13:51:17 -0500
X-MC-Unique: uNTHs4LvN9KhBnIS0XI-1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 770B0AFA81;
 Tue, 12 Jan 2021 18:51:16 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AE981000232;
 Tue, 12 Jan 2021 18:51:10 +0000 (UTC)
Subject: Re: [PATCH 2/3] tests/acceptance: Test the mpc8544ds machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-3-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <87aaf798-6999-cca1-e11b-4a1912d400e4@redhat.com>
Date: Tue, 12 Jan 2021 15:51:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210112164045.98565-3-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/12/21 1:40 PM, Thomas Huth wrote:
> We can use the "Stupid creek" image to test the mpc8544ds ppc machine.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/acceptance/machine_ppc.py | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
> index 51bbfd411c..71025d296c 100644
> --- a/tests/acceptance/machine_ppc.py
> +++ b/tests/acceptance/machine_ppc.py
> @@ -5,6 +5,7 @@
>   # This work is licensed under the terms of the GNU GPL, version 2 or
>   # later.  See the COPYING file in the top-level directory.
>   
> +from avocado.utils import archive
>   from avocado_qemu import Test
>   from avocado_qemu import wait_for_console_pattern
>   
> @@ -32,3 +33,19 @@ class PpcMachine(Test):
>           self.vm.launch()
>           console_pattern = 'Kernel command line: %s' % kernel_command_line
>           wait_for_console_pattern(self, console_pattern, self.panic_message)
> +
> +    def test_ppc_mpc8544ds(self):
> +        """
> +        :avocado: tags=arch:ppc
> +        :avocado: tags=machine:mpc8544ds
> +        """
> +        tar_url = ('https://www.qemu-advent-calendar.org'
> +                   '/2020/download/day17.tar.gz')
> +        tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
> +        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> +        archive.extract(file_path, self.workdir)
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
> +                                 self.panic_message)


