Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72969359BE9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:24:08 +0200 (CEST)
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoJ5-0003eG-H2
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUoHa-0002y7-Qq
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUoHY-0005Xv-W8
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617963751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdOM+D7rvoO7ZB5pcGXnwl6fptAiOsClGMkSVQmz/II=;
 b=bVkdseVglBKTb2AD+5H1W/2m2cBw1cNDPyiCt6TxE6MvJ4u+gyVHMZbJ1JYfn05VpABCfT
 dEUPUJ3FkGI69i6r2wYK9JyynVu0xjJ5clIKm5F05+AsR5tIjH0FgmEhX5fdsUmhFAtE4S
 2dByAsPOfHBYuQZhjVfbDhNrsP6EUVk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-Ao3Rrvf3Pr2CXfk5Tytonw-1; Fri, 09 Apr 2021 06:22:29 -0400
X-MC-Unique: Ao3Rrvf3Pr2CXfk5Tytonw-1
Received: by mail-ed1-f71.google.com with SMTP id g7so2443051edp.11
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 03:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kdOM+D7rvoO7ZB5pcGXnwl6fptAiOsClGMkSVQmz/II=;
 b=QPPI9LcrIL/9poRUAe2P+wWmVz/xr6pOUnArQlazRzdM1YPGXKHBNdTTmMexAunxcQ
 MkvxGG7/Rg5ENRxp3CW8QuD6GcJBuebMldO71jHt1XKcG3/6d26Pa7JG/V/qxXuUi6nN
 t8TA2XRyJE0wUeZEGdkpaf2a9AWNAAv2cq2exzZui4W6HqgClQVVb7tTHV8gcVsgIi8l
 y4CgnBHK08/DpXli1HmV5EOTZipGUSQIOXFyJIgurqmqniucMF3QdB2Mb11OtaxXnJcx
 vtPPPcounwADByOfXAKfQVLOU55yOnLrSyCk1I7bhZUdlA+BdGjSxSGRnkFn9yiJK7dP
 QpeA==
X-Gm-Message-State: AOAM532ZT0GlHLL0HXru8ejNRw7CD5ybHDWA6YFIqwcv3i+d/cDdT7Zu
 2gYiJwh8PP/mWuw4D72IN1ddw3vab/Kxh/6ldEWPUjOwAHDdEkQjDV3Q8eqJKIf7Yn19m0CORuT
 Pocripvyt/QEv0GE=
X-Received: by 2002:a17:906:7d58:: with SMTP id
 l24mr15298370ejp.261.1617963748245; 
 Fri, 09 Apr 2021 03:22:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaSmdtEw+FSgMtiqSFN5uTu+VmeSoB4uaPMf4BhdUtQlZx4KcxXk22v5aEHbgv/jfmcQCDwg==
X-Received: by 2002:a17:906:7d58:: with SMTP id
 l24mr15298355ejp.261.1617963748060; 
 Fri, 09 Apr 2021 03:22:28 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c89sm1210894edd.9.2021.04.09.03.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 03:22:27 -0700 (PDT)
Subject: Re: iotests 041 intermittent failure (netbsd)
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
References: <CAFEAcA_-ARyPM0gB2Y_FKdUp9DYRNbz1GFU1AzFE9UZgjWNazQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6cf410f9-6566-5921-fecc-6adaafbce068@redhat.com>
Date: Fri, 9 Apr 2021 12:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_-ARyPM0gB2Y_FKdUp9DYRNbz1GFU1AzFE9UZgjWNazQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 11:43 AM, Peter Maydell wrote:
> Just hit this (presumably intermittent) 041 failure running
> the build-and-test on the tests/vm netbsd setup. Does it look
> familiar to anybody?

This one is known as the mysterious failure:
https://www.mail-archive.com/qemu-block@nongnu.org/msg73321.html

> 
> 
>   TEST   iotest-qcow2: 041 [fail]
> QEMU          --
> "/home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/../../qemu-system-aarch64"
> -nodefaults -display none -accel qtest -machine virt
> QEMU_IMG      --
> "/home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/../../qemu-io"
> --cache writeback --aio threads -f qcow2
> QEMU_NBD      --
> "/home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- NetBSD/amd64 localhost 9.1
> TEST_DIR      -- /home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmp5wf5bgkm
> SOCKET_SCM_HELPER --
> --- /home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/041.out
> +++ 041.out.bad
> @@ -1,5 +1,29 @@
> -...........................................................................................................
> +..............................................................................E............................
> +======================================================================
> +ERROR: test_pause (__main__.TestSingleDrive)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/041", line
> 111, in test_pause
> +    self.pause_job('drive0')
> +  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/iotests.py",
> line 1064, in pause_job
> +    return self.pause_wait(job_id)
> +  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/iotests.py",
> line 1050, in pause_wait
> +    result = self.vm.qmp('query-block-jobs')
> +  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/../../python/qemu/machine.py",
> line 560, in qmp
> fcntl(): Invalid argument
> +    return self._qmp.cmd(cmd, args=qmp_args)
> +  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/../../python/qemu/qmp.py",
> line 278, in cmd
> +    return self.cmd_obj(qmp_cmd)
> +  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/../../python/qemu/qmp.py",
> line 257, in cmd_obj
> +    resp = self.__json_read()
> +  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/../../python/qemu/qmp.py",
> line 140, in __json_read
> +    data = self.__sockfile.readline()
> +  File "/usr/pkg/lib/python3.7/socket.py", line 589, in readinto
> +    return self._sock.recv_into(b)
> +  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/iotests.py",
> line 482, in timeout
> +    raise Exception(self.errmsg)
> +Exception: Timeout waiting for job to pause
> +
>  ----------------------------------------------------------------------
>  Ran 107 tests
> 
> -OK
> +FAILED (errors=1)
> 
> 
> thanks
> -- PMM
> 


