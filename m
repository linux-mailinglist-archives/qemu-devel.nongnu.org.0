Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F449507F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:47:02 +0100 (CET)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYiL-00052m-25
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:47:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAVkN-0007bP-Nw
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:36:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAVkL-0003y4-Mp
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642678613;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLSdneywMnq/UNNDDg91ImZI6u+VxYyaqSzQcK5CeUc=;
 b=fqgVeyb2jRFKC8SzwT9ekX4cEROhrwtStrm/z1MKNJxfO5GG0hJbnfuIi8BdDz7Yhn1492
 a79za9UCHH55Vh3CwyVy3s6mPLC/CyOgm+AUC4sQPjxrPwcqApx4s4V2zIhDeT1E6tMu5Q
 OS9hhl+tnKSHCib1vz18bg9ZWkM+C6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-_NagTXm5Ptq2kfp2ObinLg-1; Thu, 20 Jan 2022 06:36:49 -0500
X-MC-Unique: _NagTXm5Ptq2kfp2ObinLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1086D101F7A1;
 Thu, 20 Jan 2022 11:36:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CDA17CD6B;
 Thu, 20 Jan 2022 11:36:45 +0000 (UTC)
Date: Thu, 20 Jan 2022 11:36:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 2/7] tests/lcitool: Include local qemu.yml when
 refreshing cirrus-ci files
Message-ID: <YelJSq6y878xRJ2O@redhat.com>
References: <20220120113016.268265-1-f4bug@amsat.org>
 <20220120113016.268265-3-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220120113016.268265-3-f4bug@amsat.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 12:30:11PM +0100, Philippe Mathieu-Daudé wrote:
> The script only include the local qemu.yml for Dockerfiles.
> Since we want to keep the Cirrus-CI generated files in sync,
> also use the --data-dir option in generate_cirrus().
> 
> Fixes: c45a540f4bd (".gitlab-ci.d/cirrus: auto-generate variables with lcitool")
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/lcitool/refresh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


