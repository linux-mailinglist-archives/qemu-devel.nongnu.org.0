Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134364BFD7D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:50:55 +0100 (CET)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXRC-0004KP-L3
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:50:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMWP1-0001ik-9d
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:44:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMWOt-0006C5-Ug
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645541062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XU7jD/KsOrS8ZPn8r7lOHaeTG1Zq/jzqhevHAK/FZXw=;
 b=Ctti2a34FNwPZiWJMLtxW+F/3r8Cb7P1A1BFi7i7o+Tqdahf5InxObiozaqoLmg6mBMIcV
 XiRNrBhpzpKoTdqTR0KJDyOP4KJWDI/YIZYYMwlrvDIZIAMH3yxn0+XyA+zk0OrdPIHuci
 NxEd3fmdZHsL2jhzmXvqprhQqqfrHfM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-Ga0Vh1w1P2W_xCfKUl7rJQ-1; Tue, 22 Feb 2022 09:44:20 -0500
X-MC-Unique: Ga0Vh1w1P2W_xCfKUl7rJQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sa22-20020a1709076d1600b006ce78cacb85so5877756ejc.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 06:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XU7jD/KsOrS8ZPn8r7lOHaeTG1Zq/jzqhevHAK/FZXw=;
 b=voxkIeZIuBIOD0RDKdNReb0L/TC/njtuP6NwRyVi6/GadhsmoEhvmUzciJUvMjHfpx
 wfHDtvD1gCAAi+XVjKvAqtIXeyhTFnjAP3kDy37xz2pzcqNRF4zrVJdkiIfXhJVY7tBf
 Fc6oQNjrqT3HfKpp2iNDbLi5CAW/ZRtP7mB/cmHLfVXkHwYjYjQj7L6L1FADj/JuCin0
 nY1SninlYGTmgWqPEhPaC5KZhQaiFmSsvEtqpNTPwAdbOzljX5swiqvlZXuQPJP1Dkeq
 lTs2kVgEzljlEOd+LAG0774bQsXN0PXzgsQJraF6hqxPVZKtaUMat8umAkMLKuT/yaW1
 ezPg==
X-Gm-Message-State: AOAM530F1mV6MCGIS+F3nFShu9z+EgnNzSqy36UPCo57aGkV3xtnfYvY
 deFPHv36JWDEqHLnRODe7aaY7dVHJ0+5UEzE5qbHZ98ysDk/iI5K4FD/X/BtKbJCaMWimja7XFn
 +KNhKv1LSwSUDQlI=
X-Received: by 2002:a17:906:cc12:b0:6b5:ec8f:fdf2 with SMTP id
 ml18-20020a170906cc1200b006b5ec8ffdf2mr19265100ejb.579.1645541059611; 
 Tue, 22 Feb 2022 06:44:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt7vV2g2I1ajmNykwfS6E+6F5cbeOhpEIcFy95eR28MKfGExlh33o6lHTx/GdJWRV90Cg4GQ==
X-Received: by 2002:a17:906:cc12:b0:6b5:ec8f:fdf2 with SMTP id
 ml18-20020a170906cc1200b006b5ec8ffdf2mr19265081ejb.579.1645541059317; 
 Tue, 22 Feb 2022 06:44:19 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id fn5sm6324944ejc.179.2022.02.22.06.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 06:44:18 -0800 (PST)
Message-ID: <0467c1a2-222c-0382-88da-3872a99231bb@redhat.com>
Date: Tue, 22 Feb 2022 15:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] iotests: Write test output to TEST_DIR
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220221172909.762858-1-hreitz@redhat.com>
 <4be7a117-3928-5366-52ef-58eaefad528e@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <4be7a117-3928-5366-52ef-58eaefad528e@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.22 15:39, Vladimir Sementsov-Ogievskiy wrote:
> 21.02.2022 20:29, Hanna Reitz wrote:
>> Drop the use of OUTPUT_DIR (test/qemu-iotests under the build
>> directory), and instead write test output files (.out.bad, .notrun, and
>> .casenotrun) to TEST_DIR.
>>
>> With this, the same test can be run concurrently without the separate
>> instances interfering, because they will need separate TEST_DIRs anyway.
>> Running the same test separately is useful when running the iotests with
>> various format/protocol combinations in parallel, or when you just want
>> to aggressively exercise a single test (e.g. when it fails only
>> sporadically).
>>
>> Putting this output into TEST_DIR means that it will stick around for
>> inspection after the test run is done (though running the same test in
>> the same TEST_DIR will overwrite it, just as it used to be); but given
>> that TEST_DIR is a scratch directory, it should be clear that users can
>> delete all of its content at any point.  (And if TEST_DIR is on tmpfs,
>> it will just disappear on shutdown.)  Contrarily, alternative approaches
>> that would put these output files into OUTPUT_DIR with some prefix to
>> differentiate between separate test runs might easily lead to cluttering
>> OUTPUT_DIR.
>>
>> (This change means OUTPUT_DIR is no longer written to by the iotests, so
>> we can drop its usage altogether.)
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> v1: 
>> https://lists.nongnu.org/archive/html/qemu-block/2022-02/msg00675.html
>>
>> v2:
>> - Delete .casenotrun before running a test: Writes to this file only
>>    append data, so if we do not delete it before a test run, it may 
>> still
>>    contain stale data from a previous run
>> - While at it, we might as well delete .notrun, because before this
>>    patch, all of .out.bad, .notrun, and .casenotrun are deleted.  
>> (Really
>>    no need to delete .out.bad, though, given it is immediately
>>    overwritten after where we delete .notrun and .casenotrun.)
>> ---
>>   tests/qemu-iotests/common.rc     |  6 +++---
>>   tests/qemu-iotests/iotests.py    |  5 ++---
>>   tests/qemu-iotests/testenv.py    |  5 +----
>>   tests/qemu-iotests/testrunner.py | 15 +++++++++------
>>   4 files changed, 15 insertions(+), 16 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
>> index 9885030b43..5bde2415dc 100644
>> --- a/tests/qemu-iotests/common.rc
>> +++ b/tests/qemu-iotests/common.rc
>> @@ -726,7 +726,7 @@ _img_info()
>>   #
>>   _notrun()
>>   {
>> -    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
>> +    echo "$*" >"$TEST_DIR/$seq.notrun"
>>       echo "$seq not run: $*"
>>       status=0
>>       exit
>> @@ -738,14 +738,14 @@ _notrun()
>>   #
>>   _casenotrun()
>>   {
>> -    echo "    [case not run] $*" >>"$OUTPUT_DIR/$seq.casenotrun"
>> +    echo "    [case not run] $*" >>"$TEST_DIR/$seq.casenotrun"
>>   }
>>     # just plain bail out
>>   #
>>   _fail()
>>   {
>> -    echo "$*" | tee -a "$OUTPUT_DIR/$seq.full"
>> +    echo "$*" | tee -a "$TEST_DIR/$seq.full"
>>       echo "(see $seq.full for details)"
>>       status=1
>>       exit 1
>> diff --git a/tests/qemu-iotests/iotests.py 
>> b/tests/qemu-iotests/iotests.py
>> index 6ba65eb1ff..1d157d1325 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -84,7 +84,6 @@
>>     imgfmt = os.environ.get('IMGFMT', 'raw')
>>   imgproto = os.environ.get('IMGPROTO', 'file')
>> -output_dir = os.environ.get('OUTPUT_DIR', '.')
>>     try:
>>       test_dir = os.environ['TEST_DIR']
>> @@ -1209,7 +1208,7 @@ def notrun(reason):
>>       # Each test in qemu-iotests has a number ("seq")
>>       seq = os.path.basename(sys.argv[0])
>>   -    with open('%s/%s.notrun' % (output_dir, seq), 'w', 
>> encoding='utf-8') \
>> +    with open('%s/%s.notrun' % (test_dir, seq), 'w', 
>> encoding='utf-8') \
>>               as outfile:
>>           outfile.write(reason + '\n')
>>       logger.warning("%s not run: %s", seq, reason)
>> @@ -1224,7 +1223,7 @@ def case_notrun(reason):
>>       # Each test in qemu-iotests has a number ("seq")
>>       seq = os.path.basename(sys.argv[0])
>>   -    with open('%s/%s.casenotrun' % (output_dir, seq), 'a', 
>> encoding='utf-8') \
>> +    with open('%s/%s.casenotrun' % (test_dir, seq), 'a', 
>> encoding='utf-8') \
>>               as outfile:
>>           outfile.write('    [case not run] ' + reason + '\n')
>>   diff --git a/tests/qemu-iotests/testenv.py 
>> b/tests/qemu-iotests/testenv.py
>> index 0f32897fe8..b11e943c8a 100644
>> --- a/tests/qemu-iotests/testenv.py
>> +++ b/tests/qemu-iotests/testenv.py
>> @@ -66,7 +66,7 @@ class TestEnv(ContextManager['TestEnv']):
>>       # pylint: disable=too-many-instance-attributes
>>         env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 
>> 'SAMPLE_IMG_DIR',
>> -                     'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 
>> 'QEMU_IMG_PROG',
>> +                     'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
>>                        'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
>>                        'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
>>                        'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
>> @@ -106,7 +106,6 @@ def init_directories(self) -> None:
>>                TEST_DIR
>>                SOCK_DIR
>>                SAMPLE_IMG_DIR
>> -             OUTPUT_DIR
>>           """
>>             # Path where qemu goodies live in this source tree.
>> @@ -134,8 +133,6 @@ def init_directories(self) -> None:
>> os.path.join(self.source_iotests,
>> 'sample_images'))
>>   -        self.output_dir = os.getcwd()  # OUTPUT_DIR
>> -
>>       def init_binaries(self) -> None:
>>           """Init binary path variables:
>>                PYTHON (for bash tests)
>> diff --git a/tests/qemu-iotests/testrunner.py 
>> b/tests/qemu-iotests/testrunner.py
>> index 0eace147b8..262b13004d 100644
>> --- a/tests/qemu-iotests/testrunner.py
>> +++ b/tests/qemu-iotests/testrunner.py
>> @@ -259,9 +259,6 @@ def do_run_test(self, test: str, mp: bool) -> 
>> TestResult:
>>           """
>>             f_test = Path(test)
>> -        f_bad = Path(f_test.name + '.out.bad')
>> -        f_notrun = Path(f_test.name + '.notrun')
>> -        f_casenotrun = Path(f_test.name + '.casenotrun')
>>           f_reference = Path(self.find_reference(test))
>>             if not f_test.exists():
>> @@ -276,9 +273,6 @@ def do_run_test(self, test: str, mp: bool) -> 
>> TestResult:
>>                                 description='No qualified output '
>>                                             f'(expected {f_reference})')
>>   -        for p in (f_bad, f_notrun, f_casenotrun):
>> -            silent_unlink(p)
>> -
>>           args = [str(f_test.resolve())]
>>           env = self.env.prepare_subprocess(args)
>>           if mp:
>> @@ -288,6 +282,15 @@ def do_run_test(self, test: str, mp: bool) -> 
>> TestResult:
>>                   env[d] = os.path.join(env[d], f_test.name)
>>                   Path(env[d]).mkdir(parents=True, exist_ok=True)
>>   +        test_dir = env['TEST_DIR']
>> +        f_bad = Path(os.path.join(test_dir, f_test.name + '.out.bad'))
>> +        f_notrun = Path(os.path.join(test_dir, f_test.name + 
>> '.notrun'))
>> +        f_casenotrun = Path(os.path.join(test_dir,
>> +                                         f_test.name + '.casenotrun'))
>
> You don't need os.path.join inside Path(), simple
>
>  Path(test_dir, f_test.name + '...')
>
> should work.

Oh, good!

>> +
>> +        for p in (f_notrun, f_casenotrun):
>> +            silent_unlink(p)
>
> Why don't you want to remove old f_bad too, like pre-patch?

Mainly because...

>> +
>>           t0 = time.time()
>>           with f_bad.open('w', encoding="utf-8") as f:

I found it’d look just a bit silly when we immediately overwrite it here 
anyway.  But if you prefer to keep the pre-patch list for completeness’ 
sake, I won’t mind.

>>               with subprocess.Popen(args, cwd=str(f_test.parent), 
>> env=env,
>
>


