Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC03F44A2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 07:31:06 +0200 (CEST)
Received: from localhost ([::1]:39810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI2Y5-0007xN-QE
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 01:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mI2Wm-0007HH-At
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 01:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mI2Wk-0007sR-72
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 01:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629696581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LzAyaRtjPF8dnVx68tpsYc2mvXLhSFFOiv0pZJbHgkM=;
 b=jPngHwr5o3WR+YAZJx7jEIcM703+c6KQ16JuIUw8dAtl5bixVS3Pmmzp37KxsKYtOAdKmu
 bu9gZ9DrVtZo0I0SXtW85dKr+NxBHU1vt/7cJLNJUUIkyUgvDS4zhCFsN/ccG9DVJ/G9wm
 P3OYiZKgsA5n/s04R9t63P6L8TKq3uY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-yZ1GI-5CPeCS-WLFfdtiZw-1; Mon, 23 Aug 2021 01:29:39 -0400
X-MC-Unique: yZ1GI-5CPeCS-WLFfdtiZw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r11-20020a05600c35cb00b002e706077614so3766939wmq.5
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 22:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LzAyaRtjPF8dnVx68tpsYc2mvXLhSFFOiv0pZJbHgkM=;
 b=giVN0VYJrlRV90UNFcQ8JiIH8rVRnEwOH+U6t3Sc8MYnM41n0viUd4SCF7hl5nRLVJ
 HeS2dqo+xRxssm0EoRWMZ53zJh55HGk61xS11YZOTQVoj0K3YxaYNUpn5bzsPp+yefKz
 BtP/Ic43nn2oKXV/aGRcRYhmwt+KKigRQYcAObjrqU1kJycGuFSXbzkpkhnn0C/6J1JR
 j3FbXh9r45HbtcOK4qowzveFnHyDD/08OPyMYcKWWnC/WUSF7AUx87MEVv4clMJ4Rbqb
 vUdhMATHuDAthMTMry3JX6p3VKr1BkMt1CKx0NKCPs87jf840Jr4PQVjrvdNYi5uEoTl
 +yDg==
X-Gm-Message-State: AOAM533FmVfnpW3e6IXjJkUnW9Kyekfy9M5MvqKJqpz92nUQrRHSJpKg
 XbdcjtVOaORHxOLllgiLLSroVqhLQ4W7xJquQtXCC5yCuIWWwrpKreo5nFxSzRcAndU+pF998Y9
 VrKUAZAoZi5QTuPQ=
X-Received: by 2002:adf:ec81:: with SMTP id z1mr11520499wrn.181.1629696578367; 
 Sun, 22 Aug 2021 22:29:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6tWwJLOGBv8mfsvUqlTMEYRD+2c2C5SPCsFF38QtUKHKYPcmeF01K8A2abm90UoiPhXW7rA==
X-Received: by 2002:adf:ec81:: with SMTP id z1mr11520484wrn.181.1629696578087; 
 Sun, 22 Aug 2021 22:29:38 -0700 (PDT)
Received: from thuth.remote.csb (p5791d4fd.dip0.t-ipconnect.de.
 [87.145.212.253])
 by smtp.gmail.com with ESMTPSA id v5sm13758580wru.37.2021.08.22.22.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 22:29:37 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] docs/about: Unify the subject format
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 libvir-list@redhat.com
References: <20210823030005.165668-1-wangyanan55@huawei.com>
 <20210823030005.165668-3-wangyanan55@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a16fb311-4d15-bb5f-1458-84547f34170d@redhat.com>
Date: Mon, 23 Aug 2021 07:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210823030005.165668-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/08/2021 05.00, Yanan Wang wrote:
> There is a mixture of "since/removed in X.Y" vs "since/removed in X.Y.Z"
> in the subjects in deprecated.rst/removed-features.rst. It will be better
> to use an unified format. It seems unlikely that we will ever deprecate
> something in a stable release, and even more unlikely that we'll remove
> something in one, so the short versions look like the thing we want to
> standardize on.
> 
> So here we unify the subject format in deprecated.rst to "since X.Y", and
> unify the subject format in removed-features.rst to "removed in X.Y".
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   docs/about/deprecated.rst       | 56 ++++++++++++++++-----------------
>   docs/about/removed-features.rst | 28 ++++++++---------
>   2 files changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6d438f1c8d..8d4fd384a5 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -107,8 +107,8 @@ the process listing. This is replaced by the new ``password-secret``
>   option which lets the password be securely provided on the command
>   line using a ``secret`` object instance.
>   
> -``opened`` property of ``rng-*`` objects (since 6.0.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``opened`` property of ``rng-*`` objects (since 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   The only effect of specifying ``opened=on`` in the command line or QMP
>   ``object-add`` is that the device is opened immediately, possibly before all
> @@ -116,8 +116,8 @@ other options have been processed.  This will either have no effect (if
>   ``opened`` was the last option) or cause errors.  The property is therefore
>   useless and should not be specified.
>   
> -``loaded`` property of ``secret`` and ``secret_keyring`` objects (since 6.0.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``loaded`` property of ``secret`` and ``secret_keyring`` objects (since 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   The only effect of specifying ``loaded=on`` in the command line or QMP
>   ``object-add`` is that the secret is loaded immediately, possibly before all
> @@ -142,33 +142,33 @@ should be used instead.
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
>   
> -``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` (since 2.8.0)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` (since 2.8)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   Use argument ``id`` instead.
>   
> -``eject`` argument ``device`` (since 2.8.0)
> -'''''''''''''''''''''''''''''''''''''''''''
> +``eject`` argument ``device`` (since 2.8)
> +'''''''''''''''''''''''''''''''''''''''''
>   
>   Use argument ``id`` instead.
>   
> -``blockdev-change-medium`` argument ``device`` (since 2.8.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``blockdev-change-medium`` argument ``device`` (since 2.8)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   Use argument ``id`` instead.
>   
> -``block_set_io_throttle`` argument ``device`` (since 2.8.0)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``block_set_io_throttle`` argument ``device`` (since 2.8)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   Use argument ``id`` instead.
>   
> -``blockdev-add`` empty string argument ``backing`` (since 2.10.0)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``blockdev-add`` empty string argument ``backing`` (since 2.10)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   Use argument value ``null`` instead.
>   
> -``block-commit`` arguments ``base`` and ``top`` (since 3.1.0)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``block-commit`` arguments ``base`` and ``top`` (since 3.1)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   Use arguments ``base-node`` and ``top-node`` instead.
>   
> @@ -191,8 +191,8 @@ from Linux upstream kernel, declare it deprecated.
>   System emulator CPUS
>   --------------------
>   
> -``Icelake-Client`` CPU Model (since 5.2.0)
> -''''''''''''''''''''''''''''''''''''''''''
> +``Icelake-Client`` CPU Model (since 5.2)
> +''''''''''''''''''''''''''''''''''''''''
>   
>   ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
>   Models instead.
> @@ -245,8 +245,8 @@ Device options
>   Emulated device options
>   '''''''''''''''''''''''
>   
> -``-device virtio-blk,scsi=on|off`` (since 5.0.0)
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +``-device virtio-blk,scsi=on|off`` (since 5.0)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   
>   The virtio-blk SCSI passthrough feature is a legacy VIRTIO feature.  VIRTIO 1.0
>   and later do not support it because the virtio-scsi device was introduced for
> @@ -258,14 +258,14 @@ alias.
>   Block device options
>   ''''''''''''''''''''
>   
> -``"backing": ""`` (since 2.12.0)
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +``"backing": ""`` (since 2.12)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   
>   In order to prevent QEMU from automatically opening an image's backing
>   chain, use ``"backing": null`` instead.
>   
> -``rbd`` keyvalue pair encoded filenames: ``""`` (since 3.1.0)
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +``rbd`` keyvalue pair encoded filenames: ``""`` (since 3.1)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   
>   Options for ``rbd`` should be specified according to its runtime options,
>   like other block drivers.  Legacy parsing of keyvalue pair encoded
> @@ -283,8 +283,8 @@ The above, converted to the current supported format::
>   linux-user mode CPUs
>   --------------------
>   
> -``ppc64abi32`` CPUs (since 5.2.0)
> -'''''''''''''''''''''''''''''''''
> +``ppc64abi32`` CPUs (since 5.2)
> +'''''''''''''''''''''''''''''''
>   
>   The ``ppc64abi32`` architecture has a number of issues which regularly
>   trip up our CI testing and is suspected to be quite broken. For that
> @@ -303,8 +303,8 @@ Related binaries
>   Backwards compatibility
>   -----------------------
>   
> -Runnability guarantee of CPU models (since 4.1.0)
> -'''''''''''''''''''''''''''''''''''''''''''''''''
> +Runnability guarantee of CPU models (since 4.1)
> +'''''''''''''''''''''''''''''''''''''''''''''''
>   
>   Previous versions of QEMU never changed existing CPU models in
>   ways that introduced additional host software or hardware
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 6a9c5bb484..1c926a8bc1 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -194,8 +194,8 @@ by the ``tls-authz`` and ``sasl-authz`` options.
>   The ``pretty=on|off`` switch has no effect for HMP monitors and
>   its use is rejected.
>   
> -``-drive file=json:{...{'driver':'file'}}`` (removed 6.0)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``-drive file=json:{...{'driver':'file'}}`` (removed in 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   The 'file' driver for drives is no longer appropriate for character or host
>   devices and will only accept regular files (S_IFREG). The correct driver
> @@ -272,8 +272,8 @@ for the RISC-V ``virt`` machine and ``sifive_u`` machine.
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
>   
> -``block-dirty-bitmap-add`` "autoload" parameter (removed in 4.2.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``block-dirty-bitmap-add`` "autoload" parameter (removed in 4.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   The "autoload" parameter has been ignored since 2.12.0. All bitmaps
>   are automatically loaded from qcow2 images.
> @@ -456,15 +456,15 @@ Nobody was using this CPU emulation in QEMU, and there were no test images
>   available to make sure that the code is still working, so it has been removed
>   without replacement.
>   
> -``lm32`` CPUs (removed in 6.1.0)
> -''''''''''''''''''''''''''''''''
> +``lm32`` CPUs (removed in 6.1)
> +''''''''''''''''''''''''''''''
>   
>   The only public user of this architecture was the milkymist project,
>   which has been dead for years; there was never an upstream Linux
>   port.  Removed without replacement.
>   
> -``unicore32`` CPUs (since 6.1.0)
> -''''''''''''''''''''''''''''''''
> +``unicore32`` CPUs (removed in 6.1)
> +'''''''''''''''''''''''''''''''''''
>   
>   Support for this CPU was removed from the upstream Linux kernel, and
>   there is no available upstream toolchain to build binaries for it.
> @@ -593,8 +593,8 @@ error when ``-u`` is not used.
>   Command line options
>   --------------------
>   
> -``-smp`` (invalid topologies) (removed 5.2)
> -'''''''''''''''''''''''''''''''''''''''''''
> +``-smp`` (invalid topologies) (removed in 5.2)
> +''''''''''''''''''''''''''''''''''''''''''''''
>   
>   CPU topology properties should describe whole machine topology including
>   possible CPUs.
> @@ -606,8 +606,8 @@ Support for invalid topologies is removed, the user must ensure
>   topologies described with -smp include all possible cpus, i.e.
>   *sockets* * *cores* * *threads* = *maxcpus*.
>   
> -``-numa`` node (without memory specified) (removed 5.2)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``-numa`` node (without memory specified) (removed in 5.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   Splitting RAM by default between NUMA nodes had the same issues as ``mem``
>   parameter with the difference that the role of the user plays QEMU using
> @@ -647,8 +647,8 @@ as ignored. Currently, users are responsible for making sure the backing storage
>   specified with ``-mem-path`` can actually provide the guest RAM configured with
>   ``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
>   
> -``-machine enforce-config-section=on|off`` (removed 5.2)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``-machine enforce-config-section=on|off`` (removed in 5.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   The ``enforce-config-section`` property was replaced by the
>   ``-global migration.send-configuration={on|off}`` option.
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


