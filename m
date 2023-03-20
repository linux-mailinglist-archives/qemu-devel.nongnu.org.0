Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723AB6C1480
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:16:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGIS-0001q6-Bz; Mon, 20 Mar 2023 10:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peGIP-0001nu-MA
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:15:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peGIN-0006wV-CK
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679321728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjSKqhVnzj+HyAgwPCKU6RSR/7YeUfX1cxjrPaB/lAo=;
 b=A3v8TfWgV3wX0aOc665y4hMcyFng4S/IGkMz+lFh3eE5le1Hc2c9fJbXhhRrF6OoJ8C1Qv
 rXti4yNmiZyeFTvd+mUMuw3BUTTtA1pZOvBLj4b5FGjHn63fhJL1bAzA5w7LAP81wcfU6A
 n004Q26SZo9Nz9XqJMFYLjwTNbAhdBk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-zVAsjkAbP-WzbZCHYqjWCQ-1; Mon, 20 Mar 2023 10:15:27 -0400
X-MC-Unique: zVAsjkAbP-WzbZCHYqjWCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E736F855313;
 Mon, 20 Mar 2023 14:15:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 062451121315;
 Mon, 20 Mar 2023 14:15:25 +0000 (UTC)
Date: Mon, 20 Mar 2023 14:15:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PULL 00/31] various fixes (testing, plugins, gitdm)
Message-ID: <ZBhqd7uyT0X6tRK7@redhat.com>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
 <CAFEAcA-f=tDQqmisqaJQxwYjgYOv+1XbCUDcaZkH_Jikt1iYNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-f=tDQqmisqaJQxwYjgYOv+1XbCUDcaZkH_Jikt1iYNg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 20, 2023 at 01:42:46PM +0000, Peter Maydell wrote:
> On Sat, 18 Mar 2023 at 11:46, Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> > The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
> >
> >   Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-170323-4
> >
> > for you to fetch changes up to 4f2c431acd43d0aa505494229d05fa343762f272:
> >
> >   qtests: avoid printing comments before g_test_init() (2023-03-17
> >   17:50:19 +0000)
> >
> > You can see my CI run on the branch here:
> >
> >   https://gitlab.com/stsquad/qemu/-/pipelines/810271620
> >
> > The failures:
> >
> >   FreeBSD's time out on a migration test
> >   Centos8 Stream because my private runner needs more disk space
> >
> > ----------------------------------------------------------------
> > Misc fixes for 8.0 (testing, plugins, gitdm)
> >
> >   - update Alpine image used for testing images
> >   - include libslirp in custom runner build env
> >   - update gitlab-runner recipe for CentOS
> >   - update docker calls for better caching behaviour
> >   - document some plugin callbacks
> >   - don't use tags to define drives for lkft baseline tests
> >   - fix missing clear of plugin_mem_cbs
> >   - fix iotests to report individual results
> >   - update the gitdm metadata for contributors
> >   - avoid printing comments before g_test_init()
> >
> 
> This seems to consistently fail an avocado test on the
> centos-stream-8-x86_64 job:
> (21/51) tests/avocado/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
> ERROR: ConnectError: Failed to establish session: EOFError\n Exit
> code: 1\n Command: ./qemu-system-x86_64 -display none -vga none
> -chardev socket,id=mon,fd=17 -mon chardev=mon,mode=control -machine
> x-remote -nodefaults -device lsi53c895a,id=lsi1 -object x-remote-o...
> (0.10 s)
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3962028269
> https://gitlab.com/qemu-project/qemu/-/jobs/3965134190
> 
> 
> 
> The iotests also don't seem to pass on the OpenBSD VM after this;
> which test fails varies from run to run but the common factor
> is a complaint about running out of disk space:

This must be caused by the change in the way we register the
iotests with meson, as I don't see any other interesting changes
in this series.

At a high level we have four scenarios we're testing

 qcow2 + quick
 raw  + slow
 qed + thorough
 vmdk + thorough
 vpc + thorough

Previously each scenario was serialized wrt other scenarios, but
within a scenario things run in parallel. So we could have more
parallelization than we did in the past.

They were also serialized wrt any other tests QEMU runs.

IIUC, we skip any 'slow' and 'thorough' tests by default

  add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
  add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
  add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])


so in practice we should only be runing the qcow2 + quick
tests, not the raw/qed/vmdk/vpc tests.

So the change in parallelism is that we can potentially run the
block I/O tests in parallel with unit tests. Maybe parallel with
avocado tests too, I'm not sure ?


> 
> 
> 
> 719/774 qemu:block / io-qcow2-177
>            ERROR           4.21s   exit status 1
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> --- /home/qemu/qemu-test.8HLwgo/src/tests/qemu-iotests/177.out
> +++ /home/qemu/qemu-test.8HLwgo/build/scratch/qcow2-file-177/177.out.bad
> @@ -5,8 +5,7 @@
>  wrote 134217728/134217728 bytes at offset 0
>  128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
> backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
> -wrote 134217728/134217728 bytes at offset 0
> -128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +write failed: No space left on device
> 
>  == constrained alignment and max-transfer ==
>  wrote 131072/131072 bytes at offset 1000
> @@ -27,22 +26,27 @@
>  30 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> 
> 
> (etc)
> 
> and in another run
> 
> stderr:
> --- /home/qemu/qemu-test.ZfU510/src/tests/qemu-iotests/040.out
> +++ /home/qemu/qemu-test.ZfU510/build/scratch/qcow2-file-040/040.out.bad
> @@ -1,5 +1,54 @@
> -.................................................................
> +................................EE...............................
> +======================================================================
> +ERROR: testIntermediateReadErrorReport (__main__.TestErrorHandling)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
> line 433, in launch
> +    self._launch()
> +  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
> line 460, in _launch
> +    self._pre_launch()
> +  File "/home/qemu/qemu-test.ZfU510/src/tests/qemu-iotests/iotests.py",
> line 837, in _pre_launch
> +    super()._pre_launch()
> +  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/qtest.py",
> line 142, in _pre_launch
> +    super()._pre_launch()
> +  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
> line 358, in _pre_launch
> +    self._qemu_log_path = os.path.join(self.log_dir, self._name + ".log")
> +  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
> line 905, in log_dir
> +    return self.temp_dir
> +  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
> line 886, in temp_dir
> +    self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
> +  File "/usr/local/lib/python3.9/tempfile.py", line 363, in mkdtemp
> +    _os.mkdir(file, 0o700)
> +OSError: [Errno 28] No space left on device:
> '/home/qemu/qemu-test.ZfU510/build/scratch/qcow2-file-040/qemu-machine-g_v0pby3'
> +
> +The above exception was the direct cause of the following exception:
> +
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.ZfU510/src/tests/qemu-iotests/040", line
> 472, in setUp
> +    self.vm.launch()
> +  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
> line 446, in launch
> +    raise VMLaunchFailure(
> +qemu.machine.machine.VMLaunchFailure: OSError: [Errno 28] No space
> left on device:
> '/home/qemu/qemu-test.ZfU510/build/scratch/qcow2-file-040/qemu-machine-g_v0pby3'
> +       Command:
> +       Output: None
> +
> 
> The host machine (hackbox) doesn't seem to have disk space issues
> so presumably the iotests want to use too much disk space for
> whatever the image size is that the tests/vm infrastructure
> creates ?
> 
> thanks
> -- PMM
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


