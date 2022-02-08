Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6994ADF71
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:24:33 +0100 (CET)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUED-0005IT-2X
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:24:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHS8e-0003vl-Qy
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHS8V-0006YZ-Cn
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644333025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFN36Itmnsgy1cCquKi5EuedVCp3kh/6AkkSAkEG7XM=;
 b=APiXAni7bn5R2N9S61cceRfMcsLuLGBoXZ9dG/d2aQdVp34qHdhfCrEE9RXwK08MunzGBC
 2L0jkHaWdof4rFRB8zzGw8UG9mehu6FD79zodXqufk2L6GsmbmTb4WYVWDzzqJ2ny1LY1h
 aOkce+wWXJKf6VXFD3xCnrZBnPiCh/E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-oBQLOvkEMu-ac6-2t9UwCQ-1; Tue, 08 Feb 2022 10:10:22 -0500
X-MC-Unique: oBQLOvkEMu-ac6-2t9UwCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so6226022wrd.22
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IFN36Itmnsgy1cCquKi5EuedVCp3kh/6AkkSAkEG7XM=;
 b=OYqByiFAjwU9SNSWh9EpPp3KugqIZZzrY2XBqzNXsCaci56BhpfTk99BqmDBuPa/UK
 KvIHPI9RtNfTxaY4mpKeWZ2hscmnw8vj2DYpBey9OftYc9hCrT3qxdoKl++8grtT4z4P
 9FN8Cx6ZJc3/GSPOgiQHHa/kf6HxBLyX+BoKbQ77HHuOZruPW5SeJ9vZt6HuWdHcRX3p
 VYcpTY5VjNHr7kz0ELxhzSThm/kELsDHCtyWgGkz4Hx+/f7jppwaDmSQpxJHti/N9YPc
 Ga7JPraRILlJifpYLaGWRHG7arkP9eqbT/7Nl+dPRNDFBKmuqh3ljv3SMqAdOXiUW+5h
 52eg==
X-Gm-Message-State: AOAM532HxxCQdRsmFqhbOcbBuqxrpPxxq4eQjBiR+LQTws8Aqz0P0NDH
 NfSh584U/OKa/pwcsHJ9VdHguc5fQDy/8Af2P46jeLAcdMVX1+NqjcjB32iuILFgibG0EhaA3wM
 CVTrSC3QizsSC1I8=
X-Received: by 2002:a05:6000:15c5:: with SMTP id
 y5mr4144387wry.656.1644333020597; 
 Tue, 08 Feb 2022 07:10:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlb9lHLk4lj7JPCeblvIpQEV5IAVvNFw6xC4oXKrNNDKL2ScpbPk8SkkdV0gt/6/l4ZhCK7w==
X-Received: by 2002:a05:6000:15c5:: with SMTP id
 y5mr4144363wry.656.1644333020282; 
 Tue, 08 Feb 2022 07:10:20 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id r6sm1506025wrn.74.2022.02.08.07.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 07:10:19 -0800 (PST)
Message-ID: <bc83a39f-5efd-2bf6-214c-281b179c959b@redhat.com>
Date: Tue, 8 Feb 2022 16:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] tests/qemu-iotests/meson.build: Call the 'check'
 script directly
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-5-thuth@redhat.com>
 <8718490e-97be-cf09-3e19-36fb46d84a50@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <8718490e-97be-cf09-3e19-36fb46d84a50@redhat.com>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 13.36, Paolo Bonzini wrote:
> On 2/8/22 11:13, Thomas Huth wrote:
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
>> +  message('bash >= v4.0 not available ==> Disabled the qemu-iotests.')
>> +  subdir_done()
>> +endif
>> +
>> +foreach cflag: config_host['QEMU_CFLAGS'].split()
>> +  if cflag.startswith('-fsanitize') and \
>> +     not cflag.contains('safe-stack') and not cflag.contains('cfi-icall')
>> +    message('Sanitizers are enabled ==> Disabled the qemu-iotests.')
>> +    subdir_done()
>> +  endif
>> +endforeach
>> +
>>   qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
>> -qemu_iotests_env = {'PYTHON': python.full_path()}
>> +qemu_iotests_env = {
>> +  'PYTHON': python.full_path(),
>> +  'PYTHONUTF8': '1',
>> +  'QEMU_CHECK_BLOCK_AUTO': '1'
>> +}
>>   qemu_iotests_formats = {
>>     'qcow2': 'quick',
>>     'raw': 'slow',
>> @@ -18,16 +38,25 @@ foreach k, v : emulators
>>     endif
>>   endforeach
>> +check_script = find_program(meson.current_build_dir() / 'check')
>> +iotests = run_command(python, [check_script.full_path(), '-g', 'auto', 
>> '-n'],
>> +                      check: true).stdout().strip().replace('tests/', 
>> '').split('\n')
> 
> The main disadvantage here is that changes to the test directory will not 
> rebuild meson.build.  So when one creates a new test, meson has to be rerun 
> manually.
> 
> It is probably possible to do something like:
> 
> - run "check -g auto -n" with configure_file() and store the output in a file
> 
> - in the Makefile, always run "check -g auto -n", like
> 
> check-block-test-list: check-block-test-list.stamp
> check-block-test-list.stamp:
>      ./check -g auto -n > check-block-test-list.stamp; \
>      if cmp check-block-test-list.stamp check-block-test-list; then \
>          cp check-block-test-list.stamp check-block-test-list; \
>      fi
> .PHONY: check-block-test-list.stamp
> 
> check check-block: check-block-test-list.stamp
> 
> before giving control to "meson test"; but I'm not sure if that will also 
> cause a rebuild of Makefile.mtest and a meson rerun.
> 
> But I'm not sure it's worth it...

Before we go down that road, I think it would be better to get rid of the 
"auto" group and add the list of the iotests that should get run during 
"make check" to the meson.build file directly. That's easier to understand 
and less confusing.

> Regarding the issue that Peter pointed out, that's my fault for not being 
> aware of the "diff" being in the output of failing tests.  There are three 
> ways to fix it:
> 
> 1) reverting my patches
> 
> 2) Thomas's series, but only if the above issue is fixed
> 
> 3) shipping the tests/qemu-iotests/*.bad files as artifacts
> 
> 4) not using -tap (either reverting commit d316859f4e, "check-block: replace 
> -makecheck with TAP output", or just removing -tap from 
> tests/qemu-iotests/meson.build).
> 
> My preference is 4, then 1 or 2 (depending on the complexity), then 3.

What about simply printing the diff to stderr instead of stdout?
Something like this seems to work, at least for a quick glance:

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0eace147b8..d45a2688a0 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -404,7 +404,7 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> 
bool:
              if res.status == 'fail':
                  failed.append(name)
                  if res.diff:
-                    print('\n'.join(res.diff))
+                    print('\n'.join(res.diff), file=sys.stderr)
              elif res.status == 'not run':
                  notrun.append(name)
              elif res.status == 'pass':

  Thomas


