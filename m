Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7F729236A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:10:25 +0200 (CEST)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQFM-0006SQ-V6
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUQCU-000469-Fs
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUQCR-0004eT-Sd
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603094843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kN0xspaqjBwX6XchDdNEgwp3MNGVmxaWj2pSHJ3XrFA=;
 b=XAy58tjFpEDG0vL0vQauN2IdAnokyMfjGLKaIMaM1/uSvjeOL5B6fyETsbLdTZcld6CBMw
 qICMQMV6RWnHxjrPwpDyBWkccypeZsc+n6Z4kbTzEy/DslhxcCbNFcRRUKJaTnp0XtHJrU
 c3b/1dXFPZZGxXpmRLy3+YU11DWBb/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-UV1mpARONM6QwIOlsqsQ7g-1; Mon, 19 Oct 2020 04:07:21 -0400
X-MC-Unique: UV1mpARONM6QwIOlsqsQ7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7FD7802B47;
 Mon, 19 Oct 2020 08:07:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-6.ams2.redhat.com [10.36.114.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F4505D9D2;
 Mon, 19 Oct 2020 08:07:18 +0000 (UTC)
Subject: Re: [PATCH v2 2/9] configure: cross-compiling without cross_prefix
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20201019013928.72770-1-j@getutm.app>
 <20201019013928.72770-3-j@getutm.app>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9a68e856-cb97-bf44-eef6-52d7cbca9884@redhat.com>
Date: Mon, 19 Oct 2020 10:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201019013928.72770-3-j@getutm.app>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/2020 03.39, Joelle van Dyne wrote:
> From: osy <osy86@users.noreply.github.com>
> 
> The iOS toolchain does not use the host prefix naming convention. We add a
> new option `--enable-cross-compile` that forces cross-compile even without
> a cross_prefix.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 3c63879750..46d5db63e8 100755
> --- a/configure
> +++ b/configure
> @@ -234,6 +234,7 @@ cpu=""
>  iasl="iasl"
>  interp_prefix="/usr/gnemul/qemu-%M"
>  static="no"
> +cross_compile="no"
>  cross_prefix=""
>  audio_drv_list=""
>  block_drv_rw_whitelist=""
> @@ -456,6 +457,11 @@ for opt do
>    optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
>    case "$opt" in
>    --cross-prefix=*) cross_prefix="$optarg"
> +                    cross_compile="yes"
> +  ;;
> +  --enable-cross-compile) cross_compile="yes"
> +  ;;
> +  --disable-cross-compile) cross_compile="no"

Can't you simply use --cros-prefix="" instead?

 Thomas


