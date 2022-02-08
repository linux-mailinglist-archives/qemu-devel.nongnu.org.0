Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD94ADEBB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:56:12 +0100 (CET)
Received: from localhost ([::1]:36852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTml-00054h-5l
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:56:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHShR-0001JM-JY
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHShP-0004CT-IF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644335194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MK23dH1UJafeczcxsd0cQIt6rVkLvd+erCrmPWobRc=;
 b=YStYA9iBoJnhpJTCKrbZ2gm2FVm4fCxcWDdqbAlmpr35lnSz0OF+KhexAq/7aMEioS8ZKZ
 XpqKDLJHb+WRbqVGou1Laaoey/9XUaQQI7V05ohQ5aghzISa+Y2inAI4w1g3YoVWysUjBw
 0ruxfC9fFc5p+C5APXvbKCjDvS0xaFE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-W7stYAfROSaR1TEj_1rDcg-1; Tue, 08 Feb 2022 10:46:29 -0500
X-MC-Unique: W7stYAfROSaR1TEj_1rDcg-1
Received: by mail-wr1-f71.google.com with SMTP id
 t14-20020adfa2ce000000b001e1ad2deb3dso6229879wra.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8MK23dH1UJafeczcxsd0cQIt6rVkLvd+erCrmPWobRc=;
 b=Qp2t5eqKQcD9v+sxde36qEZyeo9W8BR3mGuPlD77fxBKnXZlxdoA4WShCg5m9YV8bN
 VG/rjFoHOaSy8rPbibKdlAPlvsMyxNsE8LL6UNfivNvlzQMkUOy0oFbKrq4oJAI3JYrz
 KJFtFHawVD5ttGrQt+vpOzNevoid7VxpLDaEN8bGcccvSD3WegoHY7wXCbmSG7e/i2Xb
 APr3jw6vvCH5/OX5ZHCSv1C0wVt2glVA+0K+zLR/8zBDxKjcU3/PBxrbGpOWox03eV3k
 huNY66MAqKfATQDbMirTn4MRsSyTqwW3Xr7unCDi9U7S2szokvhXBTvoggqHXdBEkVoU
 8suQ==
X-Gm-Message-State: AOAM530KfkHX6Ws20vyBj6IsYki0j9hxmY+eiq14uvu5vuRjPIm3f2Hc
 K60rNdiGr4VbQWL0Ygf/WDrL5qP5AdiyNYemQYu5ZN2erW14BXCl3Ay7Ie2viBpBdmfL3oQJB5M
 jHqCXf+X2NwidP0I=
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr3841168wry.504.1644335188454; 
 Tue, 08 Feb 2022 07:46:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLKqe/IUGw4bT53mSijno6qKVW/mYfbNruTd+Ua6tN0BWrla/cvz9oALjI0Q1q9xNtNjxVEA==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr3841151wry.504.1644335188190; 
 Tue, 08 Feb 2022 07:46:28 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id p3sm2794042wmq.40.2022.02.08.07.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 07:46:27 -0800 (PST)
Message-ID: <a97c3588-cf3d-4b1b-f936-b7e4019749f1@redhat.com>
Date: Tue, 8 Feb 2022 16:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] tests/qemu-iotests/meson.build: Call the 'check'
 script directly
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-5-thuth@redhat.com>
 <3d595111-f976-97ab-e198-a76f38052dc0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <3d595111-f976-97ab-e198-a76f38052dc0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 14.12, Hanna Reitz wrote:
> On 08.02.22 11:13, Thomas Huth wrote:
>> We can get a nicer progress indication if we add the iotests
>> individually via the 'check' script instead of going through
>> the check-block.sh wrapper.
>>
>> For this, we have to add some of the sanity checks that have
>> originally been done in the tests/check-block.sh script (whether
>> "bash" is available or whether CFLAGS contain -fsanitize switches)
>> to the meson.build file now, and add the environment variables
>> that have been set up by the tests/check-block.sh script before.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/qemu-iotests/meson.build | 45 ++++++++++++++++++++++++++++------
>>   1 file changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
>> index e1832c90e0..5a6ccd35d8 100644
>> --- a/tests/qemu-iotests/meson.build
>> +++ b/tests/qemu-iotests/meson.build
>> @@ -1,9 +1,29 @@
>> -if not have_tools or targetos == 'windows'
>> +if not have_tools or targetos == 'windows' or \
>> +   config_host.has_key('CONFIG_GPROF')
>>     subdir_done()
>>   endif
>> +bash = find_program('bash', required: false)
>> +if not bash.found() or \
>> +   run_command(bash, ['--version']).stdout().contains('GNU bash, version 3')
> 
> Instead of me asking about where the LANG=C is, or me lamenting that we 
> could test very simply for [123] before and can no longer now... Can we not 
> just do `find_program('bash', required: false, version: '>= 4.0')`?

Oh, cool, find_program() has a version parameter, didn't know that before! 
Thanks for the hint, I'll give it a try!

>> +  foreach tst: iotests
>> +    test('iotest-' + format + '-' + tst,
>> +         python, args: [check_script.full_path(), '-tap', '-' + format, 
>> tst],
>> +         depends: qemu_iotests_binaries,
>> +         env: qemu_iotests_env + \
>> +              { 'TEST_DIR':
>> +                meson.current_build_dir() / 'scratch' / format + '-' + 
>> tst },
>> +         protocol: 'tap',
>> +         suite: suites,
>> +         timeout: 0)
> 
> So as far I understand you’d like to have meson run the iotests in parallel 
> this way.  I don’t actually think that’s safely possible for multiple 
> formats at once, because a test’s output is always written into 
> `${build_dir}/tests/qemu-iotests/${seq}.out.bad`; so if you run e.g. test 
> 001 both with raw and qcow2 simultaneously, then they can get in each 
> other’s way.

Drat, I think you're right. I was testing with "make check SPEED=slow" and 
that was still working fine, but with "make check SPEED=thorough" I'm 
getting errors, indeed.

> (In my test branch, I have 
> https://gitlab.com/hreitz/qemu/-/commit/f3110b1eeb93d02aeadc5c8b807594cfa10a6aad 
> for this – maybe I should send something like this in a more refined form to 
> the list some time...)

Thanks a lot, that fixes the problems with SPEED=thorough indeed!

  Thomas


