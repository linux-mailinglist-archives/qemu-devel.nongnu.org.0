Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7827FD24
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 12:19:06 +0200 (CEST)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNvg1-0005IZ-Qb
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 06:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kNvec-0004pO-FY
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 06:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kNvea-0007o7-Rq
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 06:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601547455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLGIzBGZyn2frx1BEK3o49kM9/F72gHmTlxP8jPs/L4=;
 b=ggPR9pdC7nqKI8e62x2cRCAhldvDQhpws/02ZCgmnqXa3uop7rXxLvVBzd+hM0WJSa+c2a
 WVy7fAJIN10ccelXwN9fpZOBmHzl2CNscLxMbMNr8fLy5gdEFrSClUd1FwMX9tY8+y5Aop
 /ctwYXiCMlKhJtOIzMewF3Km+3LwBdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-ReHZNujvO8aabVRbH7glKw-1; Thu, 01 Oct 2020 06:17:34 -0400
X-MC-Unique: ReHZNujvO8aabVRbH7glKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B122884DD4
 for <qemu-devel@nongnu.org>; Thu,  1 Oct 2020 10:17:33 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2629C5C1CF;
 Thu,  1 Oct 2020 10:17:28 +0000 (UTC)
Subject: Re: [PATCH v2] build-sys: fix git version from -version
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20200929143654.518157-1-marcandre.lureau@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <961a7c0b-bbd3-e9ec-41a3-f117471cce5e@redhat.com>
Date: Thu, 1 Oct 2020 12:17:28 +0200
MIME-Version: 1.0
In-Reply-To: <20200929143654.518157-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/29/20 16:36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Typo introduced with the script.
> 
> Fixes: 2c273f32d3 ("meson: generate qemu-version.h")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qemu-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qemu-version.sh b/scripts/qemu-version.sh
> index 03128c56a2..3f6e7e6d41 100755
> --- a/scripts/qemu-version.sh
> +++ b/scripts/qemu-version.sh
> @@ -9,7 +9,7 @@ version="$3"
>  if [ -z "$pkgversion" ]; then
>      cd "$dir"
>      if [ -e .git ]; then
> -        pkgversion=$(git describe --match 'v*' --dirty | echo "")
> +        pkgversion=$(git describe --match 'v*' --dirty) || :
>      fi
>  fi
>  
> 

Reported-by: Laszlo Ersek <lersek@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>

Thanks!
Laszlo


