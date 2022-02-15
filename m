Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315A24B742B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:48:34 +0100 (CET)
Received: from localhost ([::1]:52510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1wG-0001Lp-Md
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:48:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK1tx-0000HV-TX
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:46:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK1tt-0006gh-PC
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644947163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXXldyx09nnkm5ZLlRKqq/rqqBPUgBz27Rf1GdYM0eI=;
 b=Egf59uNeyIkUf2zt1NAEFrVcY0ZGld8/3YowZWgj7dxXLt1B+cjkB2VrPG6y/5EzLBya7O
 tAMLVCTeDU4ixlPx6bDB8mEe20tolfiGGXcX8xEiODOPL1WxPv546ltoaQMgcXRexD99zg
 u97qXm2joe/2jhssp8aBRkjXWNxchho=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-nzdzQFW5NmuNppPpFv4mXg-1; Tue, 15 Feb 2022 12:46:02 -0500
X-MC-Unique: nzdzQFW5NmuNppPpFv4mXg-1
Received: by mail-vk1-f199.google.com with SMTP id
 b10-20020a05612202ea00b0032d73e46551so795560vko.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXXldyx09nnkm5ZLlRKqq/rqqBPUgBz27Rf1GdYM0eI=;
 b=BAfKdGxwKav5gVcZKYpEfcQn/elwgvqR4wKChkxpAq3SJHl42eeJvqz2i+UWdqh7gG
 mesVrDihw62xCJ44hy+0Rc5P+9t50X2zcCG4CkecZkOGcr1VRXhe6C9ERuTZ4xAcqRxQ
 /lNjzCWvlC7bqNlV1VSw8AHnf9ygTnsEVsdb7CTxdGzfmDJnT5Zewho63HqJWkm+baC+
 0L/F4NaXmgHe5ImATyh2Tu5w+jIrl1X8+3F5vcIDHYHTWDJoF9VdpTjv/Opn4HLDO7oI
 yGqhHC3wH7tHUM6aiO/ovtNTyPZthXoaFPN0JVPchQVPYWBfcPDGZZMF+ivdn2qT35xx
 N8MQ==
X-Gm-Message-State: AOAM5306ZVHX1eg0z2cAhFJuqo6+s04bgGZp+2KlD/8Y0cdqGydm+xGt
 l8VRMlKtKAJM+8ugl68mbj+KCxWqJs0mTvzhYcqu9xG5XgwsuR8qheNQ4qlp2ZcPUU6knxSt8mi
 KCjz+5I7hQ6Q1qcTRGFe7znoBfglrUuY=
X-Received: by 2002:a67:a449:: with SMTP id p9mr1634939vsh.61.1644947161943;
 Tue, 15 Feb 2022 09:46:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJzkGUorGh7aKilPGOE+y7t6RwJuRmZ1Hu+4gr3qzzXCC+IvqQoRNSSMBAt2wYYD8n11GrmcqZDL956j7+OKs=
X-Received: by 2002:a67:a449:: with SMTP id p9mr1634919vsh.61.1644947161647;
 Tue, 15 Feb 2022 09:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
 <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
 <CAFn=p-ZeG2XM_cP3hpKN-Cagk4T1Sr05YEDhtwmR4+_VOjVt7w@mail.gmail.com>
 <CAFEAcA9fJMQizPmd1rUh7wPgPoz4dAXQPP07DzDFQK1ieN72VA@mail.gmail.com>
 <CAFn=p-Zpvf4W1zZtnv5a9sn=38=dgsa7HUMnYM7dk7xW7gRB3g@mail.gmail.com>
 <CAFEAcA-XvLDYRsM0Yf0TCg=7MMDCe7cKz0qcMFcOx5KZfZTyQA@mail.gmail.com>
In-Reply-To: <CAFEAcA-XvLDYRsM0Yf0TCg=7MMDCe7cKz0qcMFcOx5KZfZTyQA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Feb 2022 12:45:50 -0500
Message-ID: <CAFn=p-YnPiexJLCNGikCvJMSZKvuyUoWhb6vmBz966cWcEkObg@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 8, 2022 at 9:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 3 Feb 2022 at 23:22, John Snow <jsnow@redhat.com> wrote:
> >
> > On Thu, Feb 3, 2022 at 11:52 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Thu, 3 Feb 2022 at 16:38, John Snow <jsnow@redhat.com> wrote:
> > >
> > > > On Thu, Feb 3, 2022, 11:20 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >> Summary of Failures:
> > > >>
> > > >> 1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit status 1
> >
> > I'm not too familiar with this new test runner, yet. (Is this error
> > even anything to do with the python lib? I guess I can't rule it
> > out...)
> > I just got a clean run of 'make vm-build-netbsd', so I'm using that
> > output as reference and making some guesses.
>
> Rerunning on the netbsd VM with Paolo's "revert the iotests
> conversion" patch, here's the output from a failing run, where
> iotest 041 failed:
>
> TEST   iotest-qcow2: 041 [fail]
> QEMU          --
> "/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-system-aarch64"
> -nodefaults -display none -accel qtest -machine virt
> QEMU_IMG      --
> "/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-io"
> --cache writeback --aio threads -f qcow2
> QEMU_NBD      --
> "/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- NetBSD/amd64 localhost 9.2
> TEST_DIR      -- /home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmp6fiu68sr
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
>
> --- /home/qemu/qemu-test.Kywnb7/src/tests/qemu-iotests/041.out
> +++ 041.out.bad
> @@ -1,5 +1,44 @@
> -...........................................................................................................
> +........................................ERROR:qemu.aqmp.qmp_client.qemu-14411:Failed
> to establish connection: concurrent.futures._base.CancelledError
> +E..................................................................
> +======================================================================
> +ERROR: test_mirror_to_self (__main__.TestSingleBlockdev)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/machine.py",
> line 428, in launch
> +    self._launch()
> +  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/machine.py",
> line 467, in _launch
> +    self._post_launch()
> +  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/qtest.py",
> line 147, in _post_launch
> +    super()._post_launch()
> +  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/machine.py",
> line 369, in _post_launch
> +    self._qmp.accept(self._qmp_timer)
> +  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/aqmp/legacy.py",
> line 95, in accept
> +    timeout
> +  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/aqmp/legacy.py",
> line 68, in _sync
> +    asyncio.wait_for(future, timeout=timeout)
> +  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
> run_until_complete
> +    return future.result()
> +  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
> +    raise futures.TimeoutError()
> +concurrent.futures._base.TimeoutError
> +
> +The above exception was the direct cause of the following exception:
> +
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.Kywnb7/src/tests/qemu-iotests/041", line
> 233, in setUp
> +    TestSingleDrive.setUp(self)
> +  File "/home/qemu/qemu-test.Kywnb7/src/tests/qemu-iotests/041", line
> 54, in setUp
> +    self.vm.launch()
> +  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/machine.py",
> line 445, in launch
> +    ) from exc
> +qemu.machine.machine.VMLaunchFailure: TimeoutError
> +       Exit code: 1
> +       Command:
> /home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-system-aarch64
> -display none -vga none -chardev
> socket,id=mon,path=/tmp/tmp6fiu68sr/qemu-14411-monitor.sock -mon
> chardev=mon,mode=control -qtest
> unix:path=/tmp/tmp6fiu68sr/qemu-14411-qtest.sock -accel qtest
> -nodefaults -display none -accel qtest -machine virt -drive
> if=virtio,id=drive0,file=/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/scratch/test.img,format=qcow2,cache=writeback,aio=threads,node-name=top,backing.node-name=base
> +       Output: qemu-system-aarch64: -chardev
> socket,id=mon,path=/tmp/tmp6fiu68sr/qemu-14411-monitor.sock: Failed to
> connect to '/tmp/tmp6fiu68sr/qemu-14411-monitor.sock': Connection
> refused
> +
> +
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

Just so I don't leave this thread hanging, I filed a GitLab issue and
I'm working on it, but this one isn't as quick to solve as the other.

https://gitlab.com/qemu-project/qemu/-/issues/874

--js


