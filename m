Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9A39F432
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:51:07 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZK6-0008H8-Lv
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqZIe-0007NW-O8
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqZId-0003eH-4B
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623149374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4UnEbZoB48/Zk90/ghH7aPTObjTukiLHu2UBAiU6Fcs=;
 b=GJMa35qoKPbyFy+rC0NE+8LSptbOm7X536u4nVoRSmPonJ9SYJc2AONnt5AL0qnhnKKKJM
 Lg/mMaMh7V8RJoKcIRoSHm90/w/m7ybMAJn5QVrzYfc3ANI5ihnqYtEzIn0g20/oR50LxL
 vhdVqjBIfAwAGfao81NSoSFH0ZmXaBk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-ADkMf0wUPBeuDNsm45Yx1w-1; Tue, 08 Jun 2021 06:49:31 -0400
X-MC-Unique: ADkMf0wUPBeuDNsm45Yx1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c1c85b02901ac8b854c50so585310wms.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 03:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4UnEbZoB48/Zk90/ghH7aPTObjTukiLHu2UBAiU6Fcs=;
 b=gxVIniI8WGCZGhMYYjiG3tohPLi0aR08DQZWkeFt7fpt1ftbvRNxolhCZiSnCWbpMH
 I/FfvBuZyRsBw/x5wBn4LR+YRPfe/JzC3p8d9fa6pmZH8MIVAUI0HZ00Ex09ecNSZBgF
 qk0Wgt/2V6cPyjwSuQYq9Rv1POK29Tv58fImFcGpoig4RoZaCagjLfv8mGWLj5AL0eBN
 xWFYK7yxlWgIgbNJ+AiQyx1EGInNxWRFO1AkO3f7jzX+j0fz/q44RadUFw/oXRjGcGT4
 9obRoUsQWYA8oNNdEsR6hj2C3GNJlV1qnJ9sLE8FzcBXu52XoYsrsXlrU0t/UYA4Cj/L
 KJvw==
X-Gm-Message-State: AOAM531L0O7wG8Q33IvkUoqvgxGV4zS7SDw/CB1Ckb8FIAVaNB8R6YMl
 RbsABHL3YBDs3o75mTbSAHfzbpz6SgkClScPzKbTEGiFrcvfpw4hG1NzFuNEy+b37dhbwBZmUCT
 PFQS98ssk1UAElNA=
X-Received: by 2002:adf:9031:: with SMTP id h46mr22436170wrh.125.1623149369930; 
 Tue, 08 Jun 2021 03:49:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVMhYnont0+kZ/A3ljPrnio8X06qeMfTxNoavuFj+q8iTIBkBEZT8BKVM5CUKXxp1yu7u4oQ==
X-Received: by 2002:adf:9031:: with SMTP id h46mr22436151wrh.125.1623149369741; 
 Tue, 08 Jun 2021 03:49:29 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id x7sm21605130wre.8.2021.06.08.03.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 03:49:29 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
 <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
Message-ID: <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
Date: Tue, 8 Jun 2021 12:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 10:22 AM, Philippe Mathieu-Daudé wrote:
> On 6/7/21 3:22 PM, Thomas Huth wrote:
>> On 04/06/2021 17.51, Alex Bennée wrote:
>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>> Use the recently added generic qtest_has_accel() method to
>>> check if KVM is available.
>>>
>>> Suggested-by: Claudio Fontana <cfontana@suse.de>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
>>> ---
>>>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>>>   1 file changed, 1 insertion(+), 24 deletions(-)
>>>
>>> diff --git a/tests/qtest/arm-cpu-features.c
>>> b/tests/qtest/arm-cpu-features.c
>>> index 8252b85bb8..7f4b252127 100644
>>> --- a/tests/qtest/arm-cpu-features.c
>>> +++ b/tests/qtest/arm-cpu-features.c
>>> @@ -26,21 +26,6 @@
>>>                       "  'arguments': { 'type': 'full', "
>>>   #define QUERY_TAIL  "}}"
>>>   -static bool kvm_enabled(QTestState *qts)
>>> -{
>>> -    QDict *resp, *qdict;
>>> -    bool enabled;
>>> -
>>> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>>> -    g_assert(qdict_haskey(resp, "return"));
>>> -    qdict = qdict_get_qdict(resp, "return");
>>> -    g_assert(qdict_haskey(qdict, "enabled"));
>>> -    enabled = qdict_get_bool(qdict, "enabled");
>>> -    qobject_unref(resp);
>>> -
>>> -    return enabled;
>>> -}
>>> -
>>>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>>>   {
>>>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>>> @@ -493,14 +478,6 @@ static void
>>> test_query_cpu_model_expansion_kvm(const void *data)
>>>         qts = qtest_init(MACHINE_KVM "-cpu max");
>>>   -    /*
>>> -     * These tests target the 'host' CPU type, so KVM must be enabled.
>>> -     */
>>> -    if (!kvm_enabled(qts)) {
>>> -        qtest_quit(qts);
>>> -        return;
>>> -    }
>>> -
>>>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>>>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>>>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
>>> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>>>        * order avoid attempting to run an AArch32 QEMU with KVM on
>>>        * AArch64 hosts. That won't work and isn't easy to detect.
>>>        */
>>> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
>>> +    if (g_str_equal(qtest_get_arch(), "aarch64") &&
>>> qtest_has_accel("kvm")) {
>>>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>>>                               NULL, test_query_cpu_model_expansion_kvm);
>>
>> I think this is wrong: query-kvm checks whether kvm is *enabled*, while
>> your new function only checks whether kvm has been built into the
>> binary. There is still the possibility that kvm has been built into the
>> binary, but is not available on the host, so in that case the test will
>> fail now.

Not enough coffee earlier. I think this is a documentation problem,
query-kvm returns a list of *runtime* accelerators:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg811144.html

IIUC what Paolo said, if something asks for an accelerator that
is not present at build-time, then this is a configuration problem,
not relevant for the management interface.

>>
>> Thus please drop / rework this patch.
> 
> Indeed, this is unfortunate :(
>


