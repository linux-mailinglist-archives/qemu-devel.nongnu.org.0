Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DEA2CBB91
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:32:57 +0100 (CET)
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQNU-0004Sg-P4
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kkQK2-0002sP-RF
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:29:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kkQJz-0003yG-JH
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606908558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8SeNLxPEARXgs0nCYXwdUgQvfHA3PL5dIVPSoqXbX8=;
 b=J84I4uuf7DVkbPNa6fSKvM6VxHWY7SbWO2YfAW6Y2sG0QeBvDbJx0i9YC1Hq5H/zQ/WgJ8
 N+cwdzge2ncQKWyvqM/p7NZlblNq0AzXGhbE16Tw1B1CXSYUohIC7Jbxu77pxDnh6+DQrA
 EQ1MnrQ4A/ivY4xwHGLeAwswcibHNh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-TWSrYzx7PvW0TzgP9j8JRA-1; Wed, 02 Dec 2020 06:29:17 -0500
X-MC-Unique: TWSrYzx7PvW0TzgP9j8JRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B04AFA82;
 Wed,  2 Dec 2020 11:29:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9AF1A882;
 Wed,  2 Dec 2020 11:29:14 +0000 (UTC)
Subject: Re: [PATCH] accel/tcg: Remove deprecated '-tb-size' option
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201202112714.1223783-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b169c1b2-76d8-1742-d44e-2ee23048ad18@redhat.com>
Date: Wed, 2 Dec 2020 12:29:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201202112714.1223783-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/2020 12.27, Philippe Mathieu-Daudé wrote:
> The '-tb-size' option (replaced by '-accel tcg,tb-size') is
> deprecated since 5.0 (commit fe174132478). Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  docs/system/deprecated.rst | 12 +++++-------
>  accel/tcg/translate-all.c  |  2 +-
>  softmmu/vl.c               |  8 --------
>  qemu-options.hx            |  8 --------
>  4 files changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 565389697e8..70bdb62a6d6 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -100,13 +100,6 @@ QEMU 5.1 has three options:
>        to the user to load all the images they need.
>   3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
>  
> -``-tb-size`` option (since 5.0)
> -'''''''''''''''''''''''''''''''
> -
> -QEMU 5.0 introduced an alternative syntax to specify the size of the translation
> -block cache, ``-accel tcg,tb-size=``.  The new syntax deprecates the
> -previously available ``-tb-size`` option.
> -
>  ``-show-cursor`` option (since 5.0)
>  '''''''''''''''''''''''''''''''''''
>  
> @@ -523,6 +516,11 @@ for the ``id`` parameter, which should now be used instead.
>  
>  The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
>  
> +``-tb-size`` option (removed in 6.0)
> +'''''''''''''''''''''''''''''''
> +
> +QEMU 5.0 introduced an alternative syntax to specify the size of the translation
> +block cache, ``-accel tcg,tb-size=``.
>  
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 4572b4901fb..b7d50a73d44 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2379,7 +2379,7 @@ void dump_exec_info(void)
>      qemu_printf("Translation buffer state:\n");
>      /*
>       * Report total code size including the padding and TB structs;
> -     * otherwise users might think "-tb-size" is not honoured.
> +     * otherwise users might think "-accel tcg,tb-size" is not honoured.
>       * For avg host size we use the precise numbers from tb_tree_stats though.
>       */
>      qemu_printf("gen code size       %zu/%zu\n",
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index e6e0ad5a925..3f052849d8c 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3639,14 +3639,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                      exit(1);
>                  }
>                  break;
> -            case QEMU_OPTION_tb_size:
> -#ifndef CONFIG_TCG
> -                error_report("TCG is disabled");
> -                exit(1);
> -#endif
> -                warn_report("The -tb-size option is deprecated, use -accel tcg,tb-size instead");
> -                object_register_sugar_prop(ACCEL_CLASS_NAME("tcg"), "tb-size", optarg);
> -                break;
>              case QEMU_OPTION_icount:
>                  icount_opts = qemu_opts_parse_noisily(qemu_find_opts("icount"),
>                                                        optarg, true);
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 104632ea343..7ce06290b68 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4080,14 +4080,6 @@ SRST
>      Show cursor.
>  ERST
>  
> -DEF("tb-size", HAS_ARG, QEMU_OPTION_tb_size, \
> -    "-tb-size n      set TB size\n", QEMU_ARCH_ALL)
> -SRST
> -``-tb-size n``
> -    Set TCG translation block cache size. Deprecated, use
> -    '\ ``-accel tcg,tb-size=n``\ ' instead.
> -ERST
> -
>  DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
>      "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
>      "-incoming rdma:host:port[,ipv4][,ipv6]\n" \
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


