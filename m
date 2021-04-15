Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB705360FEF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:13:49 +0200 (CEST)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4cm-0000ks-83
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4Qw-00007x-0K
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4Qs-0008Te-JF
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618502489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpZF+Y7ogSRWg8vOKWxNowPnzUaKyrkc4oaT6d4L2z0=;
 b=F+2Tn5PStnhFK6OVn6EcPR4UBxHg5fzmpyCM9qISxP6QOegyqxJBF230q9NTkDPVp9RSV4
 8AP3PCimnrsnEwxkp38a+m80radTZbA/BeE/GIfy3auw6mdTfdO4mIJRu33eF7zH5fvbhB
 8SBpLbJS2BLT4yKWZt3CtHuqZyubCUk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-L9Da7FwkPai6RUnx1e6Itw-1; Thu, 15 Apr 2021 12:01:27 -0400
X-MC-Unique: L9Da7FwkPai6RUnx1e6Itw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so2960505wro.8
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpZF+Y7ogSRWg8vOKWxNowPnzUaKyrkc4oaT6d4L2z0=;
 b=noVXdMpXmocRYNkJG+fHhPTSmP+4iMzlfgipGV/CIX+DjAoZBLt0SLAhds2Q1m7I2c
 +KRwsbu8rOKnuLrs+G9e7L1rZvb69FZQPSTs82cSyipTMnbMsWzyiriia9xla3Xdmcvr
 Lrf/Mo18s09pvcfbmw9+HM8YPXe5FDvrA7SGRWTMibU37AVNmVU8dX0bp018Lw6PKiI3
 Sr11oxXMsOXws7X6pWPsqbJW9LeAwKKDKHDvWL0K3+aDKAPgCMcPIJLpyLMsF0U+8IZP
 NRy+xu6hPbvrPmUP8yZPBtO/Zm6gAgiZJAJR/wUO5He2Nh9m5x12yjWn45Qk6I9z9ODE
 D4tA==
X-Gm-Message-State: AOAM5310oBEkR9if9PYVjE+A4UNBJBH0m+q9vhaDWJmA8key5yvcS77S
 E12O1INkgXERhJbZFVxkte3dNIezerwpYB2/RedxlTwQHv7/Kj+mximlXDrnZheCaMrSxd9wi3e
 sdHjFls5IKGwx7AE=
X-Received: by 2002:adf:b1d3:: with SMTP id r19mr4420166wra.97.1618502486467; 
 Thu, 15 Apr 2021 09:01:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUX6q7hB3k7+EYnTIKdlm78Btw2N2o0J9kuWNnrEDu2HUAqpCd/i2ODTQmrxcePJC2GPzemQ==
X-Received: by 2002:adf:b1d3:: with SMTP id r19mr4420127wra.97.1618502486165; 
 Thu, 15 Apr 2021 09:01:26 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f7sm469905wrp.48.2021.04.15.09.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 09:01:25 -0700 (PDT)
Subject: Re: [PATCH v3 7/6] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
To: Andrew Jones <drjones@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
 <20210415125737.4064646-1-philmd@redhat.com>
 <20210415132317.rcnlq2iptbryeivs@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ca279e1-e173-355c-76c7-cf066ac824d2@redhat.com>
Date: Thu, 15 Apr 2021 18:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415132317.rcnlq2iptbryeivs@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 4/15/21 3:23 PM, Andrew Jones wrote:
> On Thu, Apr 15, 2021 at 02:57:37PM +0200, Philippe Mathieu-Daudé wrote:
>> Use the recently added generic qtest_has_accel() method to
>> check if KVM is available.
>>
>> Suggested-by: Claudio Fontana <cfontana@suse.de>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  tests/qtest/arm-cpu-features.c | 25 +------------------------
>>  1 file changed, 1 insertion(+), 24 deletions(-)

>>  static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>>  {
>>      return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>> @@ -493,14 +478,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>  
>>      qts = qtest_init(MACHINE_KVM "-cpu max");
>>  
>> -    /*
>> -     * These tests target the 'host' CPU type, so KVM must be enabled.
>> -     */
>> -    if (!kvm_enabled(qts)) {
>> -        qtest_quit(qts);
>> -        return;
>> -    }
>> -
>>      /* Enabling and disabling kvm-no-adjvtime should always work. */
>>      assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>>      assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
>> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>>       * order avoid attempting to run an AArch32 QEMU with KVM on
>>       * AArch64 hosts. That won't work and isn't easy to detect.
>>       */
>> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
>> +    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
> 
> With this new guard in main(), we should be able to drop the tcg fallback
> in MACHINE_KVM. But, to do that, we also need to guard the call to
> sve_tests_sve_off_kvm().

OK, I'll have a look.

>>          qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>>                              NULL, test_query_cpu_model_expansion_kvm);
>>      }
>> -- 
>> 2.26.3
>>
> 
> And, shouldn't we also guard all the other tests, which require tcg, with
> qtest_has_accel("tcg")?

Now that we have this qtest_has_accel() method, there is certainly room
for improvements / simplifications. This doesn't have to block this
patch set and could be done on top. (Beside helping Claudio's effort,
my main selfish motivation was to stop compile pointless objects and
reduce minutes wasted on CI).

Thanks,

Phil.


