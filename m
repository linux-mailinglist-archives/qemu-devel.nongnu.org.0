Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555BF31486F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 07:05:49 +0100 (CET)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9M9k-0004SU-6x
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 01:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9M7t-0003U1-UK
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 01:03:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9M7q-0001es-2t
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 01:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612850629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99t1bburf/lmH0ssRe86XTmX6L82j4OKuH3ubjub75Y=;
 b=S9VMrYBSI1DzaUvkZREK8YJLPdfgS7LVv2IEclVPRu7Mrp856iEoQ0UbvUj2VB2ydxXvQJ
 BTTjTHhU5p9GNSxbPq6yAWQ7xJBH045r0/yAW4mCuUPewkL4XmfoHcglqLagvlNJ9MTkVW
 3Py61fr9jLGYTHa0cgSI3Ox+SKFRzws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-bbMYC0zdPzqIATAFqF1WZg-1; Tue, 09 Feb 2021 01:03:45 -0500
X-MC-Unique: bbMYC0zdPzqIATAFqF1WZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092C818A0836;
 Tue,  9 Feb 2021 06:03:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-130.ams2.redhat.com [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FFFA60C04;
 Tue,  9 Feb 2021 06:03:29 +0000 (UTC)
Subject: Re: [PULL v3 00/27] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
 <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
 <CAFEAcA8sOgF9Czy+GUBti7W-C9ZtW9PB+1YxG7mqAXKr5mV18g@mail.gmail.com>
 <20210208092723.GA18298@stefanha-x1.localdomain>
 <f14383aa-8213-83af-1411-de965180ea8b@redhat.com>
 <20210208202126.GA12348@stefanha-x1.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dd37517e-abaf-2713-d78e-c6d1f64bac2e@redhat.com>
Date: Tue, 9 Feb 2021 07:03:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208202126.GA12348@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2021 21.21, Stefan Hajnoczi wrote:
> On Mon, Feb 08, 2021 at 11:02:57AM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/8/21 10:27 AM, Stefan Hajnoczi wrote:
>>> On Sat, Feb 06, 2021 at 05:03:20PM +0000, Peter Maydell wrote:
>>>> On Fri, 5 Feb 2021 at 22:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>>
>>>>> On Fri, 5 Feb 2021 at 16:45, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>>>
>>>>>> The following changes since commit e2c5093c993ef646e4e28f7aa78429853bcc06ac:
>>>>>>
>>>>>>    iotests: 30: drop from auto group (and effectively from make check) (2021-02-05 15:16:13 +0000)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>>>>>>
>>>>>> for you to fetch changes up to b07011f375bda3319cf72eee7cb18d310078387b:
>>>>>>
>>>>>>    docs: fix Parallels Image "dirty bitmap" section (2021-02-05 16:36:36 +0000)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Pull request
>>>>>>
>>>>>> v3:
>>>>>>   * Replace {0} array initialization with {} to make clang happy [Peter]
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>
>>>>>
>>>>> Fails 'make check' on s390x host:
>>>>
>>>> I gave this a rerun to check it was reproducible (it is) and realised
>>>> I missed what looks like an important line in the log. As usual,
>>>> trying to disentangle which lines of a parallel make check correspond
>>>> to the failure is pretty tricky, but the lines
>>>>   Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
>>>>
>>>> are probably the proximate causes of the assertion failures.
>>>>
>>>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>>>> QTEST_QEMU_IMG=./qemu-img
>>>> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
>>>> QTEST_QEMU_BINARY=./qemu-system-rx tests/qtest/qos-test --tap -k
>>>> PASS 45 qtest-rx/qmp-cmd-test /rx/qmp/query-memory-size-summary
>>>> SKIP
>>>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>>>> QTEST_QEMU_IMG=./qemu-img
>>>> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
>>>> QTEST_QEMU_BINARY=./qemu-system-s390x tests/qtest/pxe-test --tap -k
>>>> PASS 46 qtest-rx/qmp-cmd-test /rx/qmp/query-memory-devices
>>>> Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
>>>> PASS 47 qtest-rx/qmp-cmd-test /rx/qmp/query-replay
>>>> PASS 48 qtest-rx/qmp-cmd-test /rx/qmp/query-yank
>>>> PASS 49 qtest-rx/qmp-cmd-test /rx/qmp/query-name
>>>> PASS 50 qtest-rx/qmp-cmd-test /rx/qmp/query-iothreads
>>>> PASS 51 qtest-rx/qmp-cmd-test /rx/qmp/query-fdsets
>>>> PASS 52 qtest-rx/qmp-cmd-test /rx/qmp/query-command-line-options
>>>> PASS 53 qtest-rx/qmp-cmd-test /rx/qmp/query-acpi-ospm-status
>>>> PASS 54 qtest-rx/qmp-cmd-test /rx/qmp/object-add-failure-modes
>>>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>>>> QTEST_QEMU_IMG=./qemu-img
>>>> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
>>>> QTEST_QEMU_BINARY=./qemu-system-s390x tests/qtest/test-netfilter --tap
>>>> -k
>>>> Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
>>>> socket_accept failed: Resource temporarily unavailable
>>>> socket_accept failed: Resource temporarily unavailable
>>>> **
>>>> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
>>>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>>>> **
>>>> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
>>>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>>>> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
>>>> signal 6 (Aborted) (core dumped)
>>>> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
>>>> signal 6 (Aborted) (core dumped)
>>>> ERROR qtest-s390x/pxe-test - Bail out!
>>>> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
>>>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>>>> ERROR qtest-s390x/test-netfilter - Bail out!
>>>> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
>>>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>>>> Makefile.mtest:3113: recipe for target 'run-test-387' failed
>>>> make: *** [run-test-387] Error 1
>>>> make: *** Waiting for unfinished jobs....
>>>> Makefile.mtest:3121: recipe for target 'run-test-388' failed
>>>
>>> Hi Elena and Jag,
>>> Please take a look at this QOM failure. I guess remote-pcihost is being
>>> built but pcie-host-bridge is missing from the s390x-softmmu target.
>>
>> Fix suggested here:
>> https://www.mail-archive.com/qemu-block@nongnu.org/msg80536.html
>>
>> But beside the fix what would be better is to restrict this feature
>> where it makes sense (we are having hard time building/testing all
>> features, better enable new ones where they are used).
>>
>> Would it be enough to enable this feature on X86 hosts/targets for
>> mainstream CI?
> 
> Trying to check if I understand correctly:
> 
> Instead of writing configure/meson rules that enable the feature
> whenever the dependencies are satisfied (KVM and PCI), explicitly enable
> it on x86 targets only. The rationale is that it's not being used and
> hasn't been tested on non-x86 targets, so it's not really supported
> there yet.

I haven't looked very close at the patches, but if I got that right, the 
problem is that this features depends on the availability of a certain PCI-e 
device. So the easiest solution is maybe to add a "depends on PCI_EXPRESS" 
in the "config MULTIPROCESS", since that switch is not active on s390x.

  Thomas


