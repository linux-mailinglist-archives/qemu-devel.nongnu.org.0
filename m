Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D213BF7DB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:57:56 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Qn5-0007WT-2r
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m1QkL-0002tu-6k
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:55:05 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:36319
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1m1QkI-0005YP-OQ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:55:04 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A9YU8Kalkg4d/jst7TfHXjTteOgHpDfIQ3DAb?=
 =?us-ascii?q?v31ZSRFFG/Fw9vre+MjzsCWYtN9/Yh8dcK+7UpVoLUm8yXcX2/h1AV7BZniEhI?=
 =?us-ascii?q?LAFugLgrcKqAeQeREWmNQ86Y5QN4B6CPDVSWNxlNvG5mCDeOoI8Z2q97+JiI7l?=
 =?us-ascii?q?o0tQcQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,222,1620662400"; 
 d="scan'208,217";a="110833223"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Jul 2021 17:54:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C56934D0C4D7;
 Thu,  8 Jul 2021 17:54:53 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Jul 2021 17:54:54 +0800
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Jul 2021 17:54:53 +0800
Received: from [192.168.122.212] (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 8 Jul 2021 17:54:52 +0800
Subject: Re: [PATCH] Fix libpmem configuration option
To: Miroslav Rezanina <mrezanin@redhat.com>, <qemu-devel@nongnu.org>
References: <20210707075144.82717-1-mrezanin@redhat.com>
From: =?UTF-8?B?TGksIFpoaWppYW4v5p2OIOaZuuWdmg==?= <lizhijian@cn.fujitsu.com>
Message-ID: <d51cb530-35e4-5653-4209-8c553a117c64@cn.fujitsu.com>
Date: Thu, 8 Jul 2021 17:54:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210707075144.82717-1-mrezanin@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------237AEA8E90ACD19218F1A43A"
Content-Language: en-US
X-yoursite-MailScanner-ID: C56934D0C4D7.A70FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------237AEA8E90ACD19218F1A43A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


i have to apply below extra changes

 From a8d027d3dfe70fb33363ad5934e163999fc29eec Mon Sep 17 00:00:00 2001
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Date: Thu, 8 Jul 2021 17:52:40 +0800
Subject: [PATCH] fix libpmem configuration

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
  configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index a172c83e150..0a3a4610f27 100755
--- a/configure
+++ b/configure
@@ -4818,7 +4818,7 @@ elif test "$pthread_setname_np_wo_tid" = "yes" ; then
    echo "CONFIG_PTHREAD_SETNAME_NP_WO_TID=y" >> $config_host_mak
  fi
  
-if test "$libpmem" = "yes" ; then
+if test "$libpmem" = "enabled" ; then
    echo "CONFIG_LIBPMEM=y" >> $config_host_mak
    echo "LIBPMEM_LIBS=$libpmem_libs" >> $config_host_mak
    echo "LIBPMEM_CFLAGS=$libpmem_cflags" >> $config_host_mak
-- 
2.31.1

On 2021/7/7 15:51, Miroslav Rezanina wrote:
> For some reason, libpmem option setting was set to work in an opposite
> way (--enable-libpmem disabled it and vice versa). Fixing this so
> configuration works properly.
>
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   configure | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 7994bdee92..ffa93cc5fd 100755
> --- a/configure
> +++ b/configure
> @@ -1501,9 +1501,9 @@ for opt do
>     ;;
>     --disable-debug-mutex) debug_mutex=no
>     ;;
> -  --enable-libpmem) libpmem=disabled
> +  --enable-libpmem) libpmem="enabled"
>     ;;
> -  --disable-libpmem) libpmem=enabled
> +  --disable-libpmem) libpmem="disabled"
>     ;;
>     --enable-xkbcommon) xkbcommon="enabled"
>     ;;



--------------237AEA8E90ACD19218F1A43A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <p>i have to apply below extra changes<br>
    </p>
    <pre>From a8d027d3dfe70fb33363ad5934e163999fc29eec Mon Sep 17 00:00:00 2001
From: Li Zhijian <a class="moz-txt-link-rfc2396E" href="mailto:lizhijian@cn.fujitsu.com">&lt;lizhijian@cn.fujitsu.com&gt;</a>
Date: Thu, 8 Jul 2021 17:52:40 +0800
Subject: [PATCH] fix libpmem configuration

Signed-off-by: Li Zhijian <a class="moz-txt-link-rfc2396E" href="mailto:lizhijian@cn.fujitsu.com">&lt;lizhijian@cn.fujitsu.com&gt;</a>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index a172c83e150..0a3a4610f27 100755
--- a/configure
+++ b/configure
@@ -4818,7 +4818,7 @@ elif test "$pthread_setname_np_wo_tid" = "yes" ; then
   echo "CONFIG_PTHREAD_SETNAME_NP_WO_TID=y" &gt;&gt; $config_host_mak
 fi
 
-if test "$libpmem" = "yes" ; then
+if test "$libpmem" = "enabled" ; then
   echo "CONFIG_LIBPMEM=y" &gt;&gt; $config_host_mak
   echo "LIBPMEM_LIBS=$libpmem_libs" &gt;&gt; $config_host_mak
   echo "LIBPMEM_CFLAGS=$libpmem_cflags" &gt;&gt; $config_host_mak
-- 
2.31.1

</pre>
    <div class="moz-cite-prefix">On 2021/7/7 15:51, Miroslav Rezanina
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210707075144.82717-1-mrezanin@redhat.com">
      <pre class="moz-quote-pre" wrap="">For some reason, libpmem option setting was set to work in an opposite
way (--enable-libpmem disabled it and vice versa). Fixing this so
configuration works properly.

Signed-off-by: Miroslav Rezanina <a class="moz-txt-link-rfc2396E" href="mailto:mrezanin@redhat.com">&lt;mrezanin@redhat.com&gt;</a>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 7994bdee92..ffa93cc5fd 100755
--- a/configure
+++ b/configure
@@ -1501,9 +1501,9 @@ for opt do
   ;;
   --disable-debug-mutex) debug_mutex=no
   ;;
-  --enable-libpmem) libpmem=disabled
+  --enable-libpmem) libpmem="enabled"
   ;;
-  --disable-libpmem) libpmem=enabled
+  --disable-libpmem) libpmem="disabled"
   ;;
   --enable-xkbcommon) xkbcommon="enabled"
   ;;
</pre>
    </blockquote>
  </body>
</html>

--------------237AEA8E90ACD19218F1A43A--

