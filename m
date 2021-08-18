Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B33EFCBC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 08:28:53 +0200 (CEST)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGF4G-0006wi-3l
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 02:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mGF34-0005xT-W6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 02:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mGF31-0005fN-Td
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 02:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629268054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ys2WnxGkTGh2iDiOqBs7S/56lunN3VormesFTYZuBao=;
 b=aL5ASdcJ3obYMf0rgls1N26GVulspMFExQhLLTBfrwZ1XIhkEm3YAURiS76chidJVetEVV
 9/+igSUBi7nTj6dZ3H7GJsxtwhC0CTLKVPyrkeJjIYJJNs/t7+376pVNQ6UyJibacIJw8w
 km/FyxG/x2jR+X0/UnStTenYIBkv2uk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-erL_26uKMd6vq1MYlurQ3A-1; Wed, 18 Aug 2021 02:27:31 -0400
X-MC-Unique: erL_26uKMd6vq1MYlurQ3A-1
Received: by mail-ed1-f70.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso509645edh.6
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 23:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ys2WnxGkTGh2iDiOqBs7S/56lunN3VormesFTYZuBao=;
 b=PtzdOsoaFusnjIWMVQiuYgMP4h1bP/mLKTot4WDoabbyA/Xwz+U+0kxWt1tpJVcncy
 abu6tZd4B6T0wr829Zh/imSZSGGs1IC+Y9Jf6qnQcMa0jkzcktG0w98e9ASQ7yPH75dL
 8yV/Kde89r4EhJN61vAce614G9EHRUqUGvAjjNKvlsfpl3KcNPSkb9xMklylW4bTl000
 itKdq+bvMEwVJlGg/RV4II9I/BBQhb3pDfbwPzFmX/q1n23eUmra1qlfGUWDbXPaQJNy
 s3yI/YrocRAh541YAsg57N3Dbdy212V/D25FAQJlFUOrE/WGGEgDVh+JYZTtP1C3t+7k
 kBSA==
X-Gm-Message-State: AOAM532FBR235YUEAy0+ZSEMfqnV40QQ9epB+ZMZhrHJA3csvY++AEVu
 kuVWPgluPdW89Yu8YqPYjioG8WHluWJfOWEVwVKV3VK9K1A+0V5fkYqMFIPMHxjPJLHsIhUUWUi
 cs1qO3clI6zidkTo=
X-Received: by 2002:a05:6402:4406:: with SMTP id
 y6mr8186315eda.242.1629268050562; 
 Tue, 17 Aug 2021 23:27:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7vOdtk16O3LJwDo+R69KVzhCCnu6IvBUeYjwnRjKDnatLrrCCfLoRa5mXhj34meUxynZcjA==
X-Received: by 2002:a05:6402:4406:: with SMTP id
 y6mr8186301eda.242.1629268050401; 
 Tue, 17 Aug 2021 23:27:30 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83070.dip0.t-ipconnect.de.
 [217.232.48.112])
 by smtp.gmail.com with ESMTPSA id d22sm1586801ejk.5.2021.08.17.23.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 23:27:29 -0700 (PDT)
Subject: Re: [PATCH v2] tests/acceptance: Test powernv machines
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210817093036.1288791-1-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3ad06368-59af-8782-d321-9c01675b88e8@redhat.com>
Date: Wed, 18 Aug 2021 08:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210817093036.1288791-1-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/2021 11.30, Cédric Le Goater wrote:
> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
> with a simple PCI layout.
> 
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>   Since v2:
> 
>   - Change the skiboot.lid file to use the one shipped with QEMU
>   
>   tests/acceptance/boot_linux_console.py | 35 ++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 5248c8097df9..59c9309c4d0b 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1176,6 +1176,41 @@ def test_ppc64_e500(self):
>           tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>           self.do_test_advcal_2018('19', tar_hash, 'uImage')
>   
> +    def do_test_ppc64_powernv(self, proc):
> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
> +
> +        kernel_url = images_url + 'zImage.epapr'
> +        kernel_hash = '0ab237df661727e5392cee97460e8674057a883c5f74381a128fa772588d45cd'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash,
> +                                       algorithm='sha256')
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', 'console=tty0 console=hvc0',
> +                         '-device', 'pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0',
> +                         '-device', 'nvme,bus=pcie.2,addr=0x0,serial=1234',
> +                         '-device', 'e1000e,bus=bridge1,addr=0x3',
> +                         '-device', 'nec-usb-xhci,bus=bridge1,addr=0x2')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern("CPU: " + proc + " generation processor")
> +        self.wait_for_console_pattern("zImage starting: loaded")
> +        self.wait_for_console_pattern("Run /init as init process")
> +        self.wait_for_console_pattern("Creating 1 MTD partitions")

IMHO it might be sufficient to wait for the last console entry and drop the 
"zImage starting" and "Run /init" lines (but I'd keep the "CPU:" line since 
it checks for the right processor type).

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


