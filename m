Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B9257521
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 10:15:18 +0200 (CEST)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCeyD-0004wV-DZ
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 04:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kCexU-0004XC-SS
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:14:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kCexT-00047c-1K
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598861668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wh/Opgl/qf+UYU2hz7A+5GnTMTC0yXbXz1du2Ay8Dc0=;
 b=Yu8gYUN4mCkTDn8mli2uhBJmer/dWB9UwjtHzk2WVHgc9Zk8f5CtbHGFaIQ7T388k21Jm3
 cAkmrRcNmO6RNajBc31quNDC2CIb4dWGarnt548LRUnOyzVzzxglTSs4iXqsVsvW0MX7Kl
 IJbP+Rh9Fy//ckPXJSLHJqk2SnxYq64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-opMCMtEnMP-bnen0ucfnrg-1; Mon, 31 Aug 2020 04:14:23 -0400
X-MC-Unique: opMCMtEnMP-bnen0ucfnrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB629640C5;
 Mon, 31 Aug 2020 08:14:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 073D97EB68;
 Mon, 31 Aug 2020 08:14:17 +0000 (UTC)
Subject: Re: [PATCH 2/2] gitlab: expand test coverage for crypto builds
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200828132716.279782-1-berrange@redhat.com>
 <20200828132716.279782-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5f70db9f-e482-d144-9f24-8f90ec4d1b86@redhat.com>
Date: Mon, 31 Aug 2020 10:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200828132716.279782-3-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:06:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.207, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/08/2020 15.27, Daniel P. Berrangé wrote:
> Most jobs test the latest nettle library. This adds explicit coverage
> for latest gcrypt using Fedora, and old gcrypt and nettle using
> CentOS-7. The latter does a minimal tools-only build, as we only need to
> validate that the crypto code builds and unit tests pass. Finally a job
> disabling both nettle and gcrypt is provided to validate that gnutls
> still works.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.yml                          | 66 +++++++++++++++++++++++++
>  tests/docker/dockerfiles/centos7.docker |  2 +
>  tests/docker/dockerfiles/centos8.docker |  1 +
>  3 files changed, 69 insertions(+)

Acked-by: Thomas Huth <thuth@redhat.com>


