Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954AB363B17
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:44:41 +0200 (CEST)
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMi3-0005zK-93
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYMfy-0004ne-QT
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYMfv-0008MR-TY
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618810943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cl2492zONjg4h5F3S2einEnzdv5tgeQe+tJOHWyFVpQ=;
 b=KIhVfU/JpB8oD3/AaxAD9w5/SoJzJ6OTwbmpOKHxInCXO/I1Ie4RwTqCo25aKBmjlOq0H2
 fuXQXUR1bGco8KXgbksSSbcEzu3rPH3vc8h3d7izBoao5eAAPCnNjgaw2OlXxVoUy8m4nQ
 i+zVSTWO7XBCrQF+8EoJznaWTWqqHB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-B5QsZ2iPPHunWK78f7PLdQ-1; Mon, 19 Apr 2021 01:42:21 -0400
X-MC-Unique: B5QsZ2iPPHunWK78f7PLdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6099A6414C;
 Mon, 19 Apr 2021 05:42:20 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A25425C5FD;
 Mon, 19 Apr 2021 05:42:11 +0000 (UTC)
Subject: Re: [PATCH 11/15] gitlab-ci: Extract core container jobs to
 container-core.yml
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-12-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b141ee10-25d0-9574-bd28-2404ce0535c5@redhat.com>
Date: Mon, 19 Apr 2021 07:42:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210418233448.1267991-12-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 01.34, Philippe Mathieu-Daudé wrote:
> It is not possible to use the previously extracted templates
> without this set of core containers. Extract them into a new
> file (container-core.yml) to be able to build them without
> having to build all the other containers by default.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/container-core.yml | 17 +++++++++++++++++
>   .gitlab-ci.d/containers.yml     | 16 +---------------
>   2 files changed, 18 insertions(+), 15 deletions(-)
>   create mode 100644 .gitlab-ci.d/container-core.yml

Reviewed-by: Thomas Huth <thuth@redhat.com>


