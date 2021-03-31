Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F035534FAE1
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 09:56:02 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRVhp-0002MY-PD
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 03:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRVgo-0001rs-CX
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 03:54:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRVgl-00058O-AR
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 03:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617177294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRJvXInPRvgxD2PTm9FGe0WBxjImE3cEenpZ0qgwHuc=;
 b=aIpFgffDpW99yhwEWlAGSDNiqPSULrwA7Y/v4E1RM5NbHr7cUiENM+/EuDp56GA7XW2BRm
 bPva2KmNd9zXJGMQ9usYnXuqGWuzHkXAcbHwvmR1JSv68+iYNyBcIlSe/fSRZaIo60JWnt
 OflPrpkS4qGYtOyoqPGbLx5KCpKBCzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-k6DH5fbbNIe7Q-2ra-OKgQ-1; Wed, 31 Mar 2021 03:54:51 -0400
X-MC-Unique: k6DH5fbbNIe7Q-2ra-OKgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76D9883DD21;
 Wed, 31 Mar 2021 07:54:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-75.ams2.redhat.com [10.36.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2F0C19C44;
 Wed, 31 Mar 2021 07:54:40 +0000 (UTC)
Subject: Re: Serious doubts about Gitlab CI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <YGMlR9gXwPqLdhr0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9b643ebc-096d-076e-5d53-edceca79f0f0@redhat.com>
Date: Wed, 31 Mar 2021 09:54:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGMlR9gXwPqLdhr0@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/2021 15.19, Daniel P. Berrangé wrote:
> On Tue, Mar 30, 2021 at 01:55:48PM +0200, Thomas Huth wrote:
>> On 30/03/2021 13.19, Daniel P. Berrangé wrote:
[...]
>>> ccache is a no-brainer and assuming it isn't already working with
>>> our gitlab jobs, we must fix that asap.
>>
>> I've found some nice instructions here:
>>
>> https://gould.cx/ted/blog/2017/06/10/ccache-for-Gitlab-CI/
>>
>> ... and just kicked off a build with these modifications, let's see how it
>> goes...
> 
> Yep, that looks similar to what we do in libvirt, though we don't override
> the compiler at the job level. Instead we just ensure the dir containing
> ccache symlinks appears first in $PATH.

That's of course a nice idea, too, but it does not seem to work with the 
clang builds:

https://gitlab.com/thuth/libvirt/-/jobs/1142239591#L3780
https://gitlab.com/thuth/libvirt/-/jobs/1142239581#L3738

  Thomas


