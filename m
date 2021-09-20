Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CAF412794
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:57:50 +0200 (CEST)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQMH-0006Lf-Uv
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mSQKs-0005TR-6Z
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mSQKp-0004Q9-Nr
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632171379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kgi4mKMCkLTrjsnme4IOZndKUodJfcpHW6k9i3ND7Mo=;
 b=A73zKS++jNWtN4NhvYtD7DZmM+APs9Lzc0vm8yEUkUARzQaQRTurhSe8VKr2RspHwEdBm9
 7F1ZzbT1ng7Yxo0pGGQSQx4zsbMd9kYC9l9GS/A2IS5rIzx1pk0MhMXqMNqMmj7zoAH890
 UAXNArCDrh2RtuMW7C1Pm6Ml9pukugE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-AFctDC0LODKGBkfpxjSuTA-1; Mon, 20 Sep 2021 16:56:18 -0400
X-MC-Unique: AFctDC0LODKGBkfpxjSuTA-1
Received: by mail-pg1-f200.google.com with SMTP id
 z7-20020a63c047000000b0026b13e40309so16240022pgi.19
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 13:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kgi4mKMCkLTrjsnme4IOZndKUodJfcpHW6k9i3ND7Mo=;
 b=pKE/7OZdeCyYrm6fddCM7si5N2Z2rvHWkS4xfWh7kSakvKn/yHQg8XAljnlFEkZLnu
 Bx/VZW3Tehk1bm0yqomSnpCpIZYWsBv4SIEJjGMc5aoggCd3hlGBNQlD1KMyDSVDpLE8
 /1w+DVIsdpI34Crifpwek2VoxioNmDKXFaTd72m64g4QCWtY1rC/9yfwW7rCJcV1qwD5
 0yCpv9drMw6H2ipBPuvdJDRELsp2AJVgXCoP/QAP1B/XAnIJcX6P5VmPdezX7niR8FB8
 2ubUDDanO4LtjSpTPdzs8RL8+3vSEFMmDW3aGKTYBopA26bJg8G/YB5HtlVsdTpmNIk0
 UZRA==
X-Gm-Message-State: AOAM532ZIRHgd1xj2EKHwwBhxpPtPkSkNKqzXX+2FA4xofhVNFeM75UN
 Flq3sVJxti2TtUNWtPZwAdafWPdrVKwZZv8J8Eqrw25esjOhdz4VegWHCX1KY5aLPe+QxCaWEVR
 0iujC85pnkojJMhhBkaE1CjF0/Ic82Eg=
X-Received: by 2002:a65:47cd:: with SMTP id f13mr25442544pgs.439.1632171376798; 
 Mon, 20 Sep 2021 13:56:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwao82yKwUAhdx7WK76luwlDmEDPtj7OczT+hXOOCUZpWfD3tSX77JizNHRC8IIF3Zm4m4xCvhR9D153DES8o=
X-Received: by 2002:a65:47cd:: with SMTP id f13mr25442520pgs.439.1632171376536; 
 Mon, 20 Sep 2021 13:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210920204932.94132-1-willianr@redhat.com>
 <20210920204932.94132-3-willianr@redhat.com>
In-Reply-To: <20210920204932.94132-3-willianr@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 20 Sep 2021 17:55:50 -0300
Message-ID: <CAKJDGDaMxKOMUkxQVmJFKxcbUVgRw3UHhXO9yqdRjsvohnU=zg@mail.gmail.com>
Subject: Re: [PATCH 2/6] avocado_qemu: standardize supper() call following
 PEP3135
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ouch, s/supper/super/ in the email title.

On Mon, Sep 20, 2021 at 5:52 PM Willian Rampazzo <willianr@redhat.com> wrote:
>
> PEP3135 states when calling super(), there is no need to use arguments.
> This changes the calls on avocado_qemu to standardize according to
> PEP3135 and avoid warnings from linters.
>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index d9e1b32aa1..d2077d63cd 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -282,7 +282,7 @@ def fetch_asset(self, name,
>                      asset_hash=None, algorithm=None,
>                      locations=None, expire=None,
>                      find_only=False, cancel_on_missing=True):
> -        return super(Test, self).fetch_asset(name,
> +        return super().fetch_asset(name,
>                          asset_hash=asset_hash,
>                          algorithm=algorithm,
>                          locations=locations,
> @@ -470,7 +470,7 @@ def _set_distro(self):
>              self.distro.checksum = distro_checksum
>
>      def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
> -        super(LinuxTest, self).setUp()
> +        super().setUp()
>          self._set_distro()
>          self.vm.add_args('-smp', '2')
>          self.vm.add_args('-m', '1024')
> --
> 2.31.1
>
>


