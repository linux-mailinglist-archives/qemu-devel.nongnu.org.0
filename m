Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972F285A65
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 10:24:42 +0200 (CEST)
Received: from localhost ([::1]:49260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ4kb-0007Xk-GN
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 04:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kQ4jY-0006r7-AT
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kQ4jW-00006O-K3
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602059013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmxEQ/O9sVZQU7O/HDafiVx+Xo23nLqi/ux9vtDf59o=;
 b=RPeIvOO5JFpRmOK2pfEW6AbnaTjMbPSg3KGR9u3+k8I6M+vy8c6y9CFbVLEdphBg/vg7oM
 Jv6duUMvxyW+izee8ia/tHmWSTzVgd2FaYgaym3W7fG/5RvpfCQaCNrW77OvzXkPhgIJiW
 3TcNzOt5L4sQYZh/8EjU0BOzivZmYaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-ddWsDnXlNYma7NaA6TAp8g-1; Wed, 07 Oct 2020 04:23:31 -0400
X-MC-Unique: ddWsDnXlNYma7NaA6TAp8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1522018A0764;
 Wed,  7 Oct 2020 08:23:30 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A8255D9DD;
 Wed,  7 Oct 2020 08:23:24 +0000 (UTC)
Subject: Re: acceptance-system-fedora failures
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <f9e09f0b-3915-382c-d670-8d33d164ad7b@redhat.com>
 <4e191372-c332-8f69-85e2-1ff6ead0f40d@redhat.com>
 <59d2a787-bcd4-7283-693b-09ea04c16dc6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6068346f-b034-9321-0eea-29233c23a300@redhat.com>
Date: Wed, 7 Oct 2020 10:23:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <59d2a787-bcd4-7283-693b-09ea04c16dc6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/2020 09.13, Philippe Mathieu-Daudé wrote:
> On 10/7/20 7:20 AM, Philippe Mathieu-Daudé wrote:
>> On 10/7/20 1:07 AM, John Snow wrote:
>>> I'm seeing this gitlab test fail quite often in my Python work; I don't
>>> *think* this has anything to do with my patches, but maybe I need to try
>>> and bisect this more aggressively.
[...]
>> w.r.t. the error in your build, I told Thomas about the
>> test_ppc_mac99/day15/invaders.elf timeouting but he said this is
>> not his area. Richard has been looking yesterday to see if it is
>> a TCG regression, and said the test either finished/crashed raising
>> SIGCHLD, but Avocado parent is still waiting for a timeout, so the
>> children become zombie and the test hang.
> 
> Expected output:
> 
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x01000000 ...
> 
> But QEMU exits in replay_char_write_event_load():
> 
> Quiescing Open Firmware ...
> qemu-system-ppc: Missing character write event in the replay log
> $ echo $?
> 1
> 
> Latest events are CHECKPOINT CHECKPOINT INTERRUPT INTERRUPT INTERRUPT.
> 
> Replay file is ~22MiB. End of record using "system_powerdown + quit"
> in HMP.
> 
> I guess we have 2 bugs:
> - replay log
> - avocado doesn't catch children exit(1)
> 
> Quick reproducer:
> 
> $ make qemu-system-ppc check-venv
> $ tests/venv/bin/python -m \
>   avocado --show=app,console,replay \
>   run --job-timeout 300 -t machine:mac99 \
>   tests/acceptance/replay_kernel.py

Thanks, that was helpful. ... and the winner is:

    commit   55adb3c45620c31f29978f209e2a44a08d34e2da
    Author:  John Snow <jsnow@redhat.com>
    Date:    Fri Jul 24 01:23:00 2020 -0400
    Subject: ide: cancel pending callbacks on SRST

... starting with this commit, the tests starts failing. John, any idea what
might be causing this?

 Thomas


