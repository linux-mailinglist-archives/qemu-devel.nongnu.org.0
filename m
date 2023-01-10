Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C5066439C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:49:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFcU-0006lA-6E; Tue, 10 Jan 2023 09:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFFc1-0006kl-KX
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:28:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFFbz-0000bJ-NT
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673360902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Y9w3ZvoDY6aPOlMpwg9fhybCYJP+Z5D2CjexWDRGHhU=;
 b=Pc+JOhvjCKHSMSbXDMgHK2A5dXQQN2ph2x0GrlyG/q/b75QwsvYNRkFGNWdptEsstRaJp1
 EV0fIlXiPr5FXjf/zql+7HX3ReXwu2Ef6QLJmVRZLk0/tOkkJD/u1fw/+86wkDNW1LC6A7
 5sSjHTxNgbqpQgKzcNiCtpCklSHJcxk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-kW9T0SYNMIWdy3CVhOOxKA-1; Tue, 10 Jan 2023 09:28:20 -0500
X-MC-Unique: kW9T0SYNMIWdy3CVhOOxKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F2EC3828883
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:28:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BE922166B26
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:28:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 286AA21E675B; Tue, 10 Jan 2023 15:28:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: make vm-build-freebsd appears to require . in PATH
Date: Tue, 10 Jan 2023 15:28:19 +0100
Message-ID: <87tu0yo458.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Look at this:

    $ make vm-build-freebsd
    [...]
    ### Preparing iso and disk image ...
    /home/armbru/.cache/qemu-vm/images/freebsd.img.install.iso.xz (1/1)
      100 %       684.3 MiB / 959.4 MiB = 0.713   222 MiB/s       0:04             
    Failed to prepare guest environment
    Traceback (most recent call last):
      File "/work/armbru/qemu/tests/vm/basevm.py", line 640, in main
        return vm.build_image(args.image)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/work/armbru/qemu/tests/vm/freebsd", line 100, in build_image
        self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
      File "/work/armbru/qemu/tests/vm/basevm.py", line 270, in exec_qemu_img
        subprocess.check_call(cmd)
      File "/usr/lib64/python3.11/subprocess.py", line 408, in check_call
        retcode = call(*popenargs, **kwargs)
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/lib64/python3.11/subprocess.py", line 389, in call
        with Popen(*popenargs, **kwargs) as p:
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/lib64/python3.11/subprocess.py", line 1024, in __init__
        self._execute_child(args, executable, preexec_fn, close_fds,
      File "/usr/lib64/python3.11/subprocess.py", line 1901, in _execute_child
        raise child_exception_type(errno_num, err_msg, err_filename)
    FileNotFoundError: [Errno 2] No such file or directory: 'qemu-img'
    make: *** [/work/armbru/qemu/tests/vm/Makefile.include:97: /home/armbru/.cache/qemu-vm/images/freebsd.img] Error 2
    make: Target 'vm-build-freebsd' not remade because of errors.
    make: Leaving directory '/work/armbru/qemu/bld'

Or similar errors at a later stage when the "guest environment" doesn't
need preparing anymore (I guess).

If I add PATH="$PATH:.", I don't get such errors.


