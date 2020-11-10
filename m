Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB45F2ADD51
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:47:06 +0100 (CET)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXjU-0006d4-AC
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcXgu-00062b-Qe
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcXgr-0003kp-98
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605030259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8l2eS9TfgIhU2082KL5by7lD55Qo+iYIswvHFI/HJyU=;
 b=MCQyN51C62BwrL7kBk9lhlwOzln+6VChZTL62MKCL9li/CFTzWXCylfd3XsGzGHtLErnJU
 hYRtlSLTsy6XIM+xem3XawqqidnNFWpbUc72UG/58GJEyI0LiKMHpO3vZWaCe/YKb1uJC0
 I/itGBzz29LeK1VISYIKCLj3eGdW4Qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-9VuQyiW5MT6OPCsNN_BWww-1; Tue, 10 Nov 2020 12:44:16 -0500
X-MC-Unique: 9VuQyiW5MT6OPCsNN_BWww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3B635F9DB;
 Tue, 10 Nov 2020 17:44:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 041785B4A0;
 Tue, 10 Nov 2020 17:44:06 +0000 (UTC)
Subject: Re: [PATCH 3/3] configure: mark vhost-user Linux-only
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201110171121.1265142-1-stefanha@redhat.com>
 <20201110171121.1265142-4-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cee0ed66-d78f-4434-92d2-1c2737d266eb@redhat.com>
Date: Tue, 10 Nov 2020 18:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201110171121.1265142-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2020 18.11, Stefan Hajnoczi wrote:
> The vhost-user protocol uses the Linux eventfd feature and is typically
> connected to Linux kvm.ko ioeventfd and irqfd file descriptors. The
> protocol specification in docs/interop/vhost-user.rst does not describe
> how platforms without eventfd support work.
> 
> The QEMU vhost-user devices compile on other POSIX host operating
> systems because eventfd usage is abstracted in QEMU. The libvhost-user
> programs in contrib/ do not compile but we failed to notice since they
> are not built by default.
> 
> Make it clear that vhost-user is only supported on Linux for the time
> being. If someone wishes to support it on other platforms then the
> details can be added to vhost-user.rst and CI jobs can test the feature
> to prevent bitrot.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  configure | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/configure b/configure
> index 5ae73fa32c..ef431f86c0 100755
> --- a/configure
> +++ b/configure
> @@ -328,7 +328,7 @@ vhost_net=""
>  vhost_crypto=""
>  vhost_scsi=""
>  vhost_vsock=""
> -vhost_user=""
> +vhost_user="no"
>  vhost_user_blk_server="auto"
>  vhost_user_fs=""
>  kvm="auto"
> @@ -718,7 +718,6 @@ fi
>  case $targetos in
>  MINGW32*)
>    mingw32="yes"
> -  vhost_user="no"
>    audio_possible_drivers="dsound sdl"
>    if check_include dsound.h; then
>      audio_drv_list="dsound"
> @@ -797,6 +796,7 @@ Linux)
>    audio_possible_drivers="oss alsa sdl pa"
>    linux="yes"
>    linux_user="yes"
> +  vhost_user="yes"
>  ;;
>  esac
>  
> @@ -2339,9 +2339,8 @@ fi
>  # vhost interdependencies and host support
>  
>  # vhost backends
> -test "$vhost_user" = "" && vhost_user=yes
> -if test "$vhost_user" = "yes" && test "$mingw32" = "yes"; then
> -  error_exit "vhost-user isn't available on win32"
> +if test "$vhost_user" = "yes" && test "$linux" != "yes"; then
> +  error_exit "vhost-user is only available on Linux"
>  fi
>  test "$vhost_vdpa" = "" && vhost_vdpa=$linux
>  if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


