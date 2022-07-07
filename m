Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F9569DA3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:42:44 +0200 (CEST)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9N5v-0004OR-JR
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9Moi-0005a7-LE
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9Mof-0006z5-Ij
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657182293;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27Qjswi6Ol9M3gFUF20liseLsDDW9Mva1XjsB+YVJ3k=;
 b=CMHTPB9b/ttexFI6j7i6bT+SpCaFfx8XT8T+A683zNvHPFmB4+BP53d/5tUQmhtJgcCJ6F
 ntrOu00BEVN0IAPJ/9dTO1+tPUtYvJp54OVfloL20RJoWaufAeKvNGR6WAwEOr3832mE7+
 I7nyAHwhKt9OzdGG3gjavg/icKGZCdQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-ayHbjRYrPSivNksDrT_hhg-1; Thu, 07 Jul 2022 04:24:49 -0400
X-MC-Unique: ayHbjRYrPSivNksDrT_hhg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7161C811E75;
 Thu,  7 Jul 2022 08:24:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B647F492C3B;
 Thu,  7 Jul 2022 08:24:47 +0000 (UTC)
Date: Thu, 7 Jul 2022 09:24:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 07/13] tests/vm: remove duplicate 'centos' VM test
Message-ID: <YsaYTV8KUtKOSS4n@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-8-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707040310.4163682-8-jsnow@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 07, 2022 at 12:03:04AM -0400, John Snow wrote:
> This is listed twice by accident; we require genisoimage to run the
> test, so remove the unconditional entry.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/vm/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


