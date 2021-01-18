Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AE12F9C48
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:24:11 +0100 (CET)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Rhi-00029F-CL
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1Rge-0001Gh-24
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1Rgc-0000fb-Bz
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610965380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=witCwu7ifvDoAqmLiB6lhdS2QLBxr3oFfDNsXqgfxMg=;
 b=gVCalGRS6WLjw9H4rxxIbPhhdEFrbmuchvSCZSShM8JlGoSfdX4v1fl4R/nMvSv9wjqVTK
 ZJiEhMBUr72Ef/MvRnK2v61QBX1qPA+Wtf0GcKgUkPhYXXxc42mEeZAab6YKujPlp4q63U
 ZJfbatB8eEb28WpKdR0g51N5lO3RTOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-Uy-WnpdaO4S7I6TUorZ1Ng-1; Mon, 18 Jan 2021 05:22:58 -0500
X-MC-Unique: Uy-WnpdaO4S7I6TUorZ1Ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D278B800D62;
 Mon, 18 Jan 2021 10:22:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D38DF5D9CD;
 Mon, 18 Jan 2021 10:22:48 +0000 (UTC)
Subject: Re: [PATCH v2 9/9] gitlab-ci: Add alpine to pipeline
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-10-jiaxun.yang@flygoat.com>
 <20210118101159.GC1789637@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <94f9255b-59eb-3e1f-0691-c24751d04700@redhat.com>
Date: Mon, 18 Jan 2021 11:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118101159.GC1789637@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2021 11.11, Daniel P. Berrangé wrote:
> On Mon, Jan 18, 2021 at 02:38:08PM +0800, Jiaxun Yang wrote:
>> We only run build test and check-acceptance as their are too many
>> failures in checks due to minor string mismatch.
> 
> Can you give real examples of what's broken here, as that sounds
> rather suspicious, and I'm not convinced it should be ignored.

I haven't tried, but I guess it's the "check-block" iotests that are likely 
failing with a different libc, since they do string comparison on the 
textual output of the tests. If that's the case, it would maybe be still ok 
to run "check-qtest" and "check-union" on Alpine instead of the whole 
"check" test suite.

  Thomas


