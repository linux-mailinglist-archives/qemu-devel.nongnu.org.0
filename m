Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB12D0E23
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:38:38 +0100 (CET)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDuf-0001JI-R2
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmDpk-0006jp-SU
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:33:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmDpi-0006NB-27
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607337209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBOpJWU+NgQXJI1Pmo6+cAgOqxHfFZ8sskstH2Y6TmU=;
 b=Ti5a1BDP0RMLvvXnEAcz83940a5LyDjwrmhxSAnscOAO4MJqBLdX2QG9XOgYbilnPT0eqR
 bhcm/ByBvD62TJLvY+oKPRXxLEDp0AUdUcj/+n00wPt82EqZuO4FKDbGeOssiTF9V+th7+
 aLAkgSnWyvASKSgMyPEO5EOGwBRpKCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-C6u_WiEVOkC9GtpqMX5LSw-1; Mon, 07 Dec 2020 05:33:25 -0500
X-MC-Unique: C6u_WiEVOkC9GtpqMX5LSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 673C1858182;
 Mon,  7 Dec 2020 10:33:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 281EF60BD8;
 Mon,  7 Dec 2020 10:33:13 +0000 (UTC)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <2352c04c-829e-ea1d-0894-15fc1d06697a@redhat.com>
 <cd5d00b1-999a-fbb3-204e-a759a9e2c3ec@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0447129c-e6c9-71f6-1786-b4e8689b8214@redhat.com>
Date: Mon, 7 Dec 2020 11:33:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <cd5d00b1-999a-fbb3-204e-a759a9e2c3ec@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2020 11.26, Philippe Mathieu-Daudé wrote:
> On 12/7/20 11:00 AM, Philippe Mathieu-Daudé wrote:
>> On 12/7/20 6:46 AM, Thomas Huth wrote:
>>> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>>>> Cross-build s390x target with only KVM accelerator enabled.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>>>  .gitlab-ci.yml                         | 1 +
>>>>  MAINTAINERS                            | 1 +
>>>>  3 files changed, 8 insertions(+)
>>>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>
>>>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>> new file mode 100644
>>>> index 00000000000..1731af62056
>>>> --- /dev/null
>>>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>> @@ -0,0 +1,6 @@
>>>> +cross-s390x-kvm:
>>>> +  extends: .cross_accel_build_job
>>>> +  variables:
>>>> +    IMAGE: debian-s390x-cross
>>>> +    TARGETS: s390x-softmmu
>>>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>> index 573afceb3c7..a69619d7319 100644
>>>> --- a/.gitlab-ci.yml
>>>> +++ b/.gitlab-ci.yml
>>>> @@ -14,6 +14,7 @@ include:
>>>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>>>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
>>>
>>> KVM code is already covered by the "cross-s390x-system" job, but an
>>> additional compilation test with --disable-tcg makes sense here. I'd then
>>> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".
> 
> What other accelerators are available on 390?

It's only TCG and KVM.

 Thomas



