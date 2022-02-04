Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9BF4A975C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:02:35 +0100 (CET)
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvQF-0003oj-Ex
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFvN5-0001SI-Dh
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:59:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFvMm-0006sQ-OU
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643968721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuz/2VcOCsbAXl+Xh3oDfcmBS3iqvyNFM3lsgvDgOzA=;
 b=WSb3r9hdBrNUM5+u8bBMoMRf8bmnn9XSdh7xT8h2u5t0yIfYcKL+ETpanpSGlkMtZOvLj7
 b/bq89xD8c+ffeJ8TrtxTLO66uHA+2f7erlVZHjTdv4Cyx6DeMarCHRxVcxR9IiTi7UoAA
 SP7/sABW5PB7KpP/LclfkVR+hkJ5JUw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-IowOlCGOMhuG2Z-H-YewmA-1; Fri, 04 Feb 2022 04:58:37 -0500
X-MC-Unique: IowOlCGOMhuG2Z-H-YewmA-1
Received: by mail-ej1-f72.google.com with SMTP id
 q19-20020a1709064c9300b006b39291ff3eso2331336eju.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 01:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iuz/2VcOCsbAXl+Xh3oDfcmBS3iqvyNFM3lsgvDgOzA=;
 b=uOMV3ohybmx1d4gxBPx9et9EFopNSwmJRUMoWpaE6NqskaA+HEQuOypqZpw/nPnQeV
 iNkHi69fTaa97oqAMarsxYkZXMhnlOIcugzZ4M8BBC/c6feg9bhm74Qc3kvvftQpchKn
 xeYLWPu6e7VfgVxtkcNAIeaIP4XLkfopJWdKEwepc1qQzKE3mqVQCBcBFhpN4XxSJs7X
 vzDOsQ/uU0EJ9eHo6Uov2jqnA8EWdgUEtkjpvHZY1R4zInsBVVodb7gJOxozoElBZd8W
 f2VEwdKdXLgOCBCAus5ed6xDPS7RohxQIgif2/YxG+sUMbqfrGYIXwlCXTlM4Ve46oT+
 ZR5w==
X-Gm-Message-State: AOAM530AEoRNiHpj/YbUXpdq1mIYsb/0ESmVmgCPncYk4zwt90DY90YR
 CzU1/0bGheDEXBFnTiEm6QIov0Z/jOo9tV2oNyk7qvYzcV3lMc4QA7pf0aQWjx7o+3+zDATkjC9
 /kv4xMz1Xqs8KBPQ=
X-Received: by 2002:a17:906:c154:: with SMTP id
 dp20mr1710120ejc.184.1643968715951; 
 Fri, 04 Feb 2022 01:58:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGfiVPoPOP2TlVTXgvZ5xBqYLVjtWBkc/5Yh6Mhi4JuaG1jdF0yhsCxjOtpFa30cYwFDCX2Q==
X-Received: by 2002:a17:906:c154:: with SMTP id
 dp20mr1710109ejc.184.1643968715724; 
 Fri, 04 Feb 2022 01:58:35 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id p13sm473851ejx.191.2022.02.04.01.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 01:58:35 -0800 (PST)
Message-ID: <6b1cb214-74b8-0985-3c3a-7e1f62351ce9@redhat.com>
Date: Fri, 4 Feb 2022 10:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/7] iotests.py: Add QemuStorageDaemon class
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220203163024.38913-1-hreitz@redhat.com>
 <20220203163024.38913-5-hreitz@redhat.com>
 <89ec5283-4f71-8d25-1eed-e3b2cab10049@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <89ec5283-4f71-8d25-1eed-e3b2cab10049@virtuozzo.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.02.22 10:04, Vladimir Sementsov-Ogievskiy wrote:
> 03.02.2022 19:30, Hanna Reitz wrote:
>> This is a rather simple class that allows creating a QSD instance
>> running in the background and stopping it when no longer needed.
>>
>> The __del__ handler is a safety net for when something goes so wrong in
>> a test that e.g. the tearDown() method is not called (e.g. setUp()
>> launches the QSD, but then launching a VM fails).  We do not want the
>> QSD to continue running after the test has failed, so __del__() will
>> take care to kill it.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/iotests.py | 42 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/iotests.py 
>> b/tests/qemu-iotests/iotests.py
>> index 8cdb381f2a..c75e402b87 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -73,6 +73,8 @@
>>   qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
>>   qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
>>   +qsd_prog = os.environ.get('QSD_PROG', 'qemu-storage-daemon')
>> +
>>   gdb_qemu_env = os.environ.get('GDB_OPTIONS')
>>   qemu_gdb = []
>>   if gdb_qemu_env:
>> @@ -345,6 +347,46 @@ def cmd(self, cmd):
>>           return self._read_output()
>>     +class QemuStorageDaemon:
>> +    def __init__(self, *args: str, instance_id: Optional[str] = None):
>> +        if not instance_id:
>> +            instance_id = 'a'
>
> this is equivalent to simply
>
>   instance_id: str = 'a'

Oh.  Right. :)

>> +
>
> I'd add
>
>    assert '--pidfile' not in args
>
> to prove following logic

Sounds good!

>> +        self.pidfile = os.path.join(test_dir, f'qsd-{instance_id}-pid')
>> +        all_args = [qsd_prog] + list(args) + ['--pidfile', 
>> self.pidfile]
>> +
>> +        # Cannot use with here, we want the subprocess to stay around
>> +        # pylint: disable=consider-using-with
>> +        self._p = subprocess.Popen(all_args)
>> +        while not os.path.exists(self.pidfile):
>> +            if self._p.poll() is not None:
>> +                cmd = ' '.join(all_args)
>> +                raise RuntimeError(
>> +                    'qemu-storage-daemon terminated with exit code ' +
>> +                    f'{self._p.returncode}: {cmd}')
>> +
>> +            time.sleep(0.01)
>> +
>> +        with open(self.pidfile, encoding='utf-8') as f:
>> +            self._pid = int(f.read().strip())
>> +
>> +        assert self._pid == self._p.pid
>> +
>> +    def stop(self, kill_signal=15):
>> +        self._p.send_signal(kill_signal)
>> +        self._p.wait()
>> +        self._p = None
>> +
>> +        try:
>> +            os.remove(self.pidfile)
>> +        except OSError:
>> +            pass
>> +
>> +    def __del__(self):
>> +        if self._p is not None:
>> +            self.stop(kill_signal=9)
>> +
>> +
>>   def qemu_nbd(*args):
>>       '''Run qemu-nbd in daemon mode and return the parent's exit 
>> code'''
>>       return subprocess.call(qemu_nbd_args + ['--fork'] + list(args))
>>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks a lot for reviewing!


