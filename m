Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C62B426E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:17:35 +0100 (CET)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecVq-0001zh-BY
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecSB-0006es-FM
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:13:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecS9-00039c-L5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e/DN5Vltc6QldNbBrOimTHhqJy0lrRL3Lv/CxZYc4x8=;
 b=gmxkKcROx4H+ln4z8j2clUeVbn9/yCdP8Zc9hSnlzsYDVhNJyU7JYMZKTufCaZIbqQfhv1
 YCq3DnDnsZWB24caoRimtYQxs7vNpqBaY0gzIiO5+vOjqn0nwm7OemcEasNyLhp1V6ZQKO
 xygucqeffcAAm6BYnMLX+ZiQRl885LM=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-31eduinCODmf9MZNGJ6n7g-1; Mon, 16 Nov 2020 06:13:41 -0500
X-MC-Unique: 31eduinCODmf9MZNGJ6n7g-1
Received: by mail-oi1-f200.google.com with SMTP id w67so8076960oia.13
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e/DN5Vltc6QldNbBrOimTHhqJy0lrRL3Lv/CxZYc4x8=;
 b=m+SaiW4369vJ6lvjVYUIvFCt0Is4ws1BCF4bnnPwoHIecMu5pnhqBmPXMTc0lAwr5S
 fnk0jgvV4sZjx5juFKhYW3qYaLgxKB2myxGkdpB9pSiRVAc6O0aJMVkT9y7n9iAkQA4A
 w5qcFP8nlS40EwRvaM6A5G8Ql6n9BGeLdxOoHZqlZ/HMjPaZUTyb38aobIdLvqBbxDuH
 rTlCYUQC+T/Ijbh+akji42neoMY5Wjxk7bAekzPVtyYH7oi9hxgOCsH9IFwQdm9/llkD
 2/XfsMHvsik7GXqVgPAU05zDbgGoF7rkyUVfCHqzMA35wDUYN3uujqYgyRA0ftc0mkd5
 tEIw==
X-Gm-Message-State: AOAM532GYuWp06uS7q1Y2AVlOmZzX8pfH61OrNtaiG7285Pq5S3uu8sI
 pnakPO1IpQI1i4Ievt8y6u2/wKmhtvuU3zBGQqvm/dfbX3lb7eoz7ipR+8M1HilgVT8FjKHJxg+
 ea7fvhGqlv0jvQRYDwaUz9Dq+xDA0xxQ=
X-Received: by 2002:aca:e007:: with SMTP id x7mr9327448oig.40.1605525221052;
 Mon, 16 Nov 2020 03:13:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj0ILuWOVERJQT8ig0Yar32K4tAL9MOU0LfmRJ8fGsJ45rjUGGiXIi3MNyIz0hMZ68UBOP+gUmE+cbLeQLcG8=
X-Received: by 2002:aca:e007:: with SMTP id x7mr9327438oig.40.1605525220797;
 Mon, 16 Nov 2020 03:13:40 -0800 (PST)
MIME-Version: 1.0
References: <160552129733.22861.2033930860605615947.stgit@pasha-ThinkPad-X280>
In-Reply-To: <160552129733.22861.2033930860605615947.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 16 Nov 2020 12:13:29 +0100
Message-ID: <CAP+75-W2ed_73xszEA08hqdnVRL9bGXshnGYqJGZvSjt4_D8bw@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: fix timeout for vm.wait
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing John.

On Mon, Nov 16, 2020 at 11:08 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> This patch adds timeout parameter to vm.wait() calls, because the default
> value is just 30 seconds, and tests may last for more time.
>
> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> ---
>  tests/acceptance/boot_linux_console.py |    8 ++++----
>  tests/acceptance/replay_kernel.py      |    2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index cb6086ca6f..1cb8cb7a2a 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -208,7 +208,7 @@ class BootLinuxConsole(LinuxKernelTest):
>          exec_command_and_wait_for_pattern(self, 'reboot',
>                                                  'reboot: Restarting system')
>          # Wait for VM to shut down gracefully
> -        self.vm.wait()
> +        self.vm.wait(None)
>
>      @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>      def test_mips64el_malta_5KEc_cpio(self):
> @@ -250,7 +250,7 @@ class BootLinuxConsole(LinuxKernelTest):
>          exec_command_and_wait_for_pattern(self, 'reboot',
>                                                  'reboot: Restarting system')
>          # Wait for VM to shut down gracefully
> -        self.vm.wait()
> +        self.vm.wait(None)
>
>      def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
>          kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> @@ -725,7 +725,7 @@ class BootLinuxConsole(LinuxKernelTest):
>          exec_command_and_wait_for_pattern(self, 'reboot',
>                                                  'reboot: Restarting system')
>          # Wait for VM to shut down gracefully
> -        self.vm.wait()
> +        self.vm.wait(None)
>
>      @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>                  'Test artifacts fetched from unreliable apt.armbian.com')
> @@ -778,7 +778,7 @@ class BootLinuxConsole(LinuxKernelTest):
>          exec_command_and_wait_for_pattern(self, 'reboot',
>                                                  'reboot: Restarting system')
>          # Wait for VM to shut down gracefully
> -        self.vm.wait()
> +        self.vm.wait(None)
>
>      @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>                  'Test artifacts fetched from unreliable dl.armbian.com')
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> index c8b043ac31..02a52b1d72 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -60,7 +60,7 @@ class ReplayKernelBase(LinuxKernelTest):
>              logger.info('finished the recording with log size %s bytes'
>                          % os.path.getsize(replay_path))
>          else:
> -            vm.wait()
> +            vm.wait(None)
>              logger.info('successfully finished the replay')
>          elapsed = time.time() - start_time
>          logger.info('elapsed time %.2f sec' % elapsed)
>


