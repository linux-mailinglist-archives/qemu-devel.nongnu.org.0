Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F96EE5F1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:42:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLkT-00036x-87; Tue, 25 Apr 2023 12:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prLkQ-00036X-FO
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:42:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prLkO-0001XL-SX
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682440951;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yvTOzs3abj0s1IkllBu63tdsDNqGn0Uwk81/3Fubyg=;
 b=MCfX2Xiq1E+CYp65iYScCMA4FiQAbfDEn/kbfjGWl3vXgyn+vC0MNuU9dXb3ZaNW+PiH8J
 R2ocA0Nw4X4DyIJMo6R+Du7MC8XQdgOINqk3X4gzVEuT0QHGebDn26tE1XygQSCRklzLZZ
 4bYwdtaLeMxKYy2xVnqQxfbnmE06YMg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-WjRwxRtoMWiu2cx2Fcg0Yg-1; Tue, 25 Apr 2023 12:42:28 -0400
X-MC-Unique: WjRwxRtoMWiu2cx2Fcg0Yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 106373C14875;
 Tue, 25 Apr 2023 16:42:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 931FC14171B8;
 Tue, 25 Apr 2023 16:42:22 +0000 (UTC)
Date: Tue, 25 Apr 2023 17:42:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v3 09/20] tests/docker: add python3-venv dependency
Message-ID: <ZEgC6/BnXv+C5ZXl@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <20230424200248.1183394-10-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424200248.1183394-10-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 24, 2023 at 04:02:37PM -0400, John Snow wrote:
> Several debian-based tests need the python3-venv dependency as a
> consequence of Debian debundling the "ensurepip" module normally
> included with Python.
> 
> As mkvenv.py stands as of this commit, Debian requires EITHER:
> 
> (A) setuptools and pip, or
> (B) ensurepip
> 
> mkvenv is a few seconds faster if you have setuptools and pip, so
> developers should prefer the first requirement. For the purposes of CI,
> the time-save is a wash; it's only a matter of who is responsible for
> installing pip and when; the timing is about the same.
> 
> Arbitrarily, I chose adding ensurepip to the test configuration because
> it is normally part of the Python stdlib, and always having it allows us
> a more consistent cross-platform environment.

python3-venv also matches the package that we already list in
the lcitool auto generated dockerfiles, so that consistency
is good.

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/dockerfiles/debian-all-test-cross.docker | 3 ++-
>  tests/docker/dockerfiles/debian-hexagon-cross.docker  | 3 ++-
>  tests/docker/dockerfiles/debian-riscv64-cross.docker  | 3 ++-
>  tests/docker/dockerfiles/debian-tricore-cross.docker  | 3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


