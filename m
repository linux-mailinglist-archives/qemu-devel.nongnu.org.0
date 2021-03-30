Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ACF34ED44
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:12:47 +0200 (CEST)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGyz-0008R8-Ud
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRGxR-0007u5-MA
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRGxM-0002F1-SM
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617120662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KnTZtMmSXNiQAgWOfQuY6eGzwLbxn4zqqFlHXHv5U8=;
 b=EI+pZ/BOXsfZFHwjyHC6ycXAJT9cSaegxJEykcba1sxNGPzTMCn9MC6XGsti3KALmoEvpQ
 tln3ZPuFhGeCSCCH7+/X9DXTuwfMTqCBiQAlJrsV872wvH32pdnh3b7T7q7kx70ypziNa3
 qKm2XgAVp5rmyQLxkSPTUAzPjpmeJec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-BQcBHiLJMd6_ocq8Vp-9Hw-1; Tue, 30 Mar 2021 12:11:01 -0400
X-MC-Unique: BQcBHiLJMd6_ocq8Vp-9Hw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6EA41084D6B;
 Tue, 30 Mar 2021 16:10:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-225.ams2.redhat.com [10.36.112.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1B2C60CEC;
 Tue, 30 Mar 2021 16:10:41 +0000 (UTC)
Subject: Re: Serious doubts about Gitlab CI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
 <a5a40558-4f5a-223d-a7ea-c02f7fc14eef@amsat.org>
 <1bb868bb-d9d7-3a9a-cbd4-2e1780b46442@redhat.com>
 <YGMjypzf1hHk47bC@redhat.com>
 <23fcbe91-1b9c-559d-1a61-6cce839bb390@redhat.com>
 <YGMnVy4LDHu28wW4@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <74dd910a-d989-fe6a-2935-b2bd485b14c6@redhat.com>
Date: Tue, 30 Mar 2021 18:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGMnVy4LDHu28wW4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/2021 15.27, Daniel P. Berrangé wrote:
> On Tue, Mar 30, 2021 at 03:19:49PM +0200, Paolo Bonzini wrote:
>> On 30/03/21 15:12, Daniel P. Berrangé wrote:
>>>> Now, but that may change already in 6.1 in order to add CFI support.
>>> We can bundle a newer version, but we don't need to require a newer
>>> version. Simply conditional compile for the bits we need. If distro
>>> slirp is too old, then sorry, you can't enable CFI + slirp at the
>>> same time. If the distro really wants that combination we don't have
>>> to own the solution - the distro should update their slirp.
>>>
>>> Or to put it another way, QEMU doesn't need to go out of its way to
>>> enable new features on old distros. We merely need to not regress
>>> in the features we previously offered.  We bundled slirp as a submodule
>>> so that old distros didn't loose slirp entirely. We don't need to
>>> offer CFI on those distros.
>>
>> This is true, on the other hand only having to support one API version has
>> its benefits.  The complication in the build system is minimal once slirp is
>> made into a subproject; therefore it is appealing to keep the QEMU code
>> simple.
> 
> I don't think slirp is special in this regard. The benefit you're promoting
> here applies to any dependancy we have, but I think the benefit is not big
> enough to justify.
> 
> The use of submodules has imposed significant pain on QEMU developers over
> the years, and as such I think our general goal should be to have zero git
> submodules over the long term. Usage of submodules ought to be considered
> a short term workaround only, with a clear criteria for removal.
I agree with Daniel. Submodules keep being a pain. For all libs that are 
mature and widely available enough in the distros now, we should consider to 
drop the submodules rather sooner than later.

  Thomas


