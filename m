Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB15E209D63
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 13:18:46 +0200 (CEST)
Received: from localhost ([::1]:59186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joPu1-0000w0-OZ
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 07:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1joPrQ-0006Zd-4Z
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:16:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36517
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1joPrO-0002JJ-2C
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593083761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DrzI1IMuF4AtNbng8tPYbbFAhWtelJAGROYHFRugfo=;
 b=IGPxn1HqwgjoMDv7HuZMN3u3Pxt8vSosPV/Jf8pZ7qn0Tu+ePVfB8zae7p0KRHslMPXUS9
 OAli9nQlLwOrnaVG4yRYJhrMUfZ2PJ0FTiMN9O34DCvHYfPPc7aEVPJ0pMfaCb/MR67H+B
 ifHDgVJbAqy86AqWHO1LE1u77WpsZM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-kTA9YAE7MeWDLIHwNEseUQ-1; Thu, 25 Jun 2020 07:15:59 -0400
X-MC-Unique: kTA9YAE7MeWDLIHwNEseUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BF50107ACF3;
 Thu, 25 Jun 2020 11:15:58 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB64F7F49D;
 Thu, 25 Jun 2020 11:15:53 +0000 (UTC)
Subject: Re: [PATCH RFC 0/3] gitlab: build containers to use in build jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200622153318.751107-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a08ca3b1-ddde-693b-60e0-cca9b0094721@redhat.com>
Date: Thu, 25 Jun 2020 13:15:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200622153318.751107-1-berrange@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laszlo Ersek <lersek@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/06/2020 17.33, Daniel P. Berrangé wrote:
> The current gitlab CI jobs are quite inefficient because they
> use the generic distro images and then apt-get/dnf install
> extra packages every time.
> 
> The other downside is that the container environment used is
> only defined in thte .gitlab-ci.yml file, so it tedious to
> reproduce locally.
> 
> We already have containers defined in tests/docker for use by
> developers building locally. We can use these for CI systems
> too if we just had a way to build them....
> 
> ...GitLab CI offers such a way. We can use docker-in-docker
> to build the images at the start of the CI cycle, and use
> the built images in later jobs.
> 
> These later jobs are now faster because they're not having
> to install any software.

Did you see any speed-up? I had a look at some pipelines, and it seems 
to me that they rather got slower now? For example, this is the system1 
pipeline before your change:

  https://gitlab.com/huth/qemu/-/jobs/610924897

and after your change:

  https://gitlab.com/huth/qemu/-/jobs/611069374

Duration went up from 35 minutes to 42 minutes.

Seems also to happen in your builds, before the change:

  https://gitlab.com/berrange/qemu/-/jobs/582995084

and after the change:

  https://gitlab.com/berrange/qemu/-/jobs/606175927

... went from 36 minutes up to 42 minutes.

Could be a coincidence due to the load on the shared runners, but it 
looks at least a little bit suspicious...

  Thomas


