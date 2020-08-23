Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10824EBE0
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Aug 2020 08:55:49 +0200 (CEST)
Received: from localhost ([::1]:58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9jut-000700-Nu
	for lists+qemu-devel@lfdr.de; Sun, 23 Aug 2020 02:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k9jtx-0006Wv-I9
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 02:54:49 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49964
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k9jtt-0000qO-GT
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 02:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598165683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=oJRme1CLXlEZ2lIQ5UNq5zi+/3hjflO14NtXSoHH7Fc=;
 b=TItH5cwl4mmtwu1IZ6Blbs/e/24VAXx6n+ds5wJQc2L3CCaVviySmgCbYPrPIF6Dv2Lwk8
 RzP+3yPx70yYYnS714EsjbeTU6ywZOtO0X9k0UFAkJKxOeexOBIn5IN2kx1t/QTFr4K5zs
 o7pVzYGUxwMDZRhuj2WVt0/b9b65s88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-qCaPWNdtO5u7cbFS6Vvxaw-1; Sun, 23 Aug 2020 02:54:41 -0400
X-MC-Unique: qCaPWNdtO5u7cbFS6Vvxaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63F07801AC4;
 Sun, 23 Aug 2020 06:54:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B4F1A268;
 Sun, 23 Aug 2020 06:54:38 +0000 (UTC)
Subject: Re: [PATCH 2/2] travis.yml: Drop the Python 3.5 and 3.6 builds
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200805184926.15071-1-thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2be38eb3-483a-2539-a1e4-2d4e532328cd@redhat.com>
Date: Sun, 23 Aug 2020 08:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200805184926.15071-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/23 02:54:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.948, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2020 20.49, Thomas Huth wrote:
> Python 3.5 is already the default in Ubuntu Xenial (which we use for
> most jobs on Travis), and Python 3.6 is the default on Ubuntu Bionic
> (which we use for the s390x jobs on Travis for example already), so
> explicitely defining tests for Python 3.5 and 3.6 seems redundant.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .travis.yml | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 18290bc51d..b4c603f0ec 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -258,23 +258,6 @@ jobs:
>          - TEST_CMD=""
>  
>  
> -    # Python builds
> -    - name: "GCC Python 3.5 (x86_64-softmmu)"
> -      env:
> -        - CONFIG="--target-list=x86_64-softmmu"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -      language: python
> -      python: 3.5
> -
> -
> -    - name: "GCC Python 3.6 (x86_64-softmmu)"
> -      env:
> -        - CONFIG="--target-list=x86_64-softmmu"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -      language: python
> -      python: 3.6
> -
> -
>      # Using newer GCC with sanitizers
>      - name: "GCC9 with sanitizers (softmmu)"
>        addons:
> 

Ping?

 Thomas


