Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19087535118
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 16:58:22 +0200 (CEST)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuEwO-0006P8-Eu
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 10:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEuM-0005DF-2b
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEuH-0007yj-IL
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653576968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2S9N1J/rCvSK+KUowqr5LFbfVCl8aAMCEEcX7nHjIYc=;
 b=BhsZVZB851/gGywffmuFLJaMp0d1ZfQtoW0KS9YrWuwbwUeWCoTZ5qSOp7YXCDDPDnFu7/
 4TUfkwFiYwgkd/7MRDfUlzm0kDQRv3hECk5qaekl1wDqd9G1Ihz7fUQJDWf8b3LAn8uGMM
 66CQn1PjabkRls0DUiQH+VzXgQqVErU=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-M7sQIPc2PGCcMxZWHk1GtA-1; Thu, 26 May 2022 10:56:06 -0400
X-MC-Unique: M7sQIPc2PGCcMxZWHk1GtA-1
Received: by mail-vk1-f197.google.com with SMTP id
 m71-20020a1fa34a000000b003572cab1489so172250vke.4
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 07:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2S9N1J/rCvSK+KUowqr5LFbfVCl8aAMCEEcX7nHjIYc=;
 b=YL32QAJ0dtdC1rMPOUr9AhJ1ipeYvQEM7eg8vf29LMcZ4VSUN1hslEbqMxiBF6WHt+
 WLRvc/jBjcbwB0NQ0uP6DOv9SJtJQJ0J28mJe8w+jqF6xA+dblol3gYNM1s+/TJkAq0+
 DXoH76pY2gXw46Rx57W2U5wELnQx9yBOHjHVIbUOC0822yXUMBH+QhctXGCjut2dBdMY
 WqgzwI9GhOWBCG7OlTzIUjcPi5uChLKLeNHjCmQzpVhtiXloqvBvh10rzzHUjTY6sLKX
 7roE6US8XYZ+sM8piuJGBuRE5YSO7LozuDCV0baEKh9oMAfCe6K096zr0W1hgbI3Y6sg
 ssHQ==
X-Gm-Message-State: AOAM532i9h0+Jk/DVp1MjPhwlra6DGhTE9a86CBsO2ZiwDwNTesEqvcc
 eiG8byiXDftUlHIVNmzmNTO0J105yHZJr+Nw1FnyW7aU9qR3SRGawOZegB5Qa6iSFQIaB8c35HO
 bgPON2MaNWwWR78VQg4vnkhqAsreubYk=
X-Received: by 2002:a05:6122:1687:b0:357:4e2d:53b9 with SMTP id
 7-20020a056122168700b003574e2d53b9mr12897467vkl.3.1653576965997; 
 Thu, 26 May 2022 07:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaB/whJEanMAR6Te+77vtdrZtkBTZxNZ4yYc1dX1CdAUEepS6v+E6k/SHniZGh5qUtDUrfONkWwxjWRRo2HFw=
X-Received: by 2002:a05:6122:1687:b0:357:4e2d:53b9 with SMTP id
 7-20020a056122168700b003574e2d53b9mr12897456vkl.3.1653576965727; Thu, 26 May
 2022 07:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220408170214.45585-1-vsementsov@openvz.org>
 <20220408170214.45585-2-vsementsov@openvz.org>
 <d14025a4-01ff-d1ff-deca-e3613a5955bc@yandex-team.ru>
In-Reply-To: <d14025a4-01ff-d1ff-deca-e3613a5955bc@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Thu, 26 May 2022 10:55:54 -0400
Message-ID: <CAFn=p-Zij3ZjhPyJZEeMLSJmahGtKi0R+ogk2c-aD37mFuuc-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] python/machine.py: upgrade vm.command() method
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a6c28505dfeb63db"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a6c28505dfeb63db
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022, 10:31 AM Vladimir Sementsov-Ogievskiy <
vsementsov@yandex-team.ru> wrote:

> On 4/8/22 20:02, Vladimir Sementsov-Ogievskiy wrote:
> > The method is not popular, we prefer use vm.qmp() and then check
>
> Suddenly I found, that I missed a lot of existing users: in scripts, in
> avocado tests.
>
> Do you prefer to rename the method to "cmd()", and change all the
> occurrences, or keep longer "command()" name and update the second patch?
>

I don't have a strong preference, I think.

In (async) qmp I use .execute() as the form that raises exception, and
._raw() as the form that doesn't. I use execute_msg() as an
exception-raising form that takes a Mapping[str, obj].

Notably, I tried to hide any interface that didn't raise exception, and the
interfaces that remain always return the inner return field and not the
entire wire object.

command() IIRC has historically been the exception-raising version and
cmd() has been the C-like version. (cmd_obj works like my execute_msg,
except it doesn't raise, and returns the entire reply.)

command() is longer, but there's precedent and continuity for it working
this way. But shorter names are nicer for line length, so...

...Go with what you feel is subjectively nicest? (That's not helpful,
sorry.)

oh, also: IIRC, command() also does not return the entire response object.
This is how execute() works, but it might be a lot of churn to convert
users of cmd() over to this form. It's something I want to do eventually
anyway, but it's a lot for me to dump on your plate, so don't worry about
that aspect.

--js


>
> $ git grep '\.command('
> docs/devel/testing.rst:          res =
> self.vm.command('human-monitor-command',
> docs/devel/testing.rst:          first_res = first_machine.command(
> docs/devel/testing.rst:          second_res = second_machine.command(
> docs/devel/testing.rst:          third_res =
> self.get_vm(name='third_machine').command(
> python/qemu/machine/machine.py:        ret = self._qmp.command(cmd,
> **qmp_args)
> python/qemu/utils/qemu_ga_client.py:            return
> self.command('guest-' + name.replace('_', '-'), **kwds)
> python/qemu/utils/qom.py:        rsp = self.qmp.command(
> python/qemu/utils/qom.py:        rsp = self.qmp.command(
> python/qemu/utils/qom.py:                rsp = self.qmp.command('qom-get',
> path=path,
> python/qemu/utils/qom_common.py:        rsp = self.qmp.command('qom-list',
> path=path)
> python/qemu/utils/qom_fuse.py:            data =
> str(self.qmp.command('qom-get', path=path, property=prop))
> python/qemu/utils/qom_fuse.py:        return prefix +
> str(self.qmp.command('qom-get', path=path,
> scripts/device-crash-test:    types = vm.command('qom-list-types',
> **kwargs)
> scripts/device-crash-test:    devhelp =
> vm.command('human-monitor-command', **args)
> scripts/device-crash-test:            self.machines = list(m['name'] for m
> in vm.command('query-machines'))
> scripts/device-crash-test:            self.kvm_available =
> vm.command('query-kvm')['enabled']
> scripts/render_block_graph.py:    bds_nodes =
> qmp.command('query-named-block-nodes')
> scripts/render_block_graph.py:    job_nodes =
> qmp.command('query-block-jobs')
> scripts/render_block_graph.py:    block_graph =
> qmp.command('x-debug-query-block-graph')
> tests/avocado/avocado_qemu/__init__.py:        res =
> self.vm.command('human-monitor-command',
> tests/avocado/cpu_queries.py:        cpus =
> self.vm.command('query-cpu-definitions')
> tests/avocado/cpu_queries.py:            e =
> self.vm.command('query-cpu-model-expansion', model=model, type='full')
> tests/avocado/hotplug_cpu.py:        self.vm.command('device_add',
> tests/avocado/info_usernet.py:        res =
> self.vm.command('human-monitor-command',
> tests/avocado/machine_arm_integratorcp.py:
> self.vm.command('human-monitor-command', command_line='stop')
> tests/avocado/machine_arm_integratorcp.py:
> self.vm.command('human-monitor-command',
> tests/avocado/machine_m68k_nextcube.py:
> self.vm.command('human-monitor-command',
> tests/avocado/machine_mips_malta.py:
> self.vm.command('human-monitor-command', command_line='stop')
> tests/avocado/machine_mips_malta.py:
> self.vm.command('human-monitor-command',
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('device_del', id='rn1')
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('device_del', id='rn2')
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('device_add', driver='virtio-net-ccw',
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('device_del', id='net_4711')
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('human-monitor-command', command_line='balloon 96')
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('human-monitor-command', command_line='balloon 128')
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('screendump', filename=ppmfile.name)
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('object-add', qom_type='cryptodev-backend-builtin',
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('device_add', driver='virtio-crypto-ccw', id='crypdev0',
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('device_del', id='crypdev0')
> tests/avocado/machine_s390_ccw_virtio.py:
> self.vm.command('object-del', id='cbe0')
> tests/avocado/migration.py:        return
> vm.command('query-migrate')['status'] in ('completed', 'failed')
> tests/avocado/migration.py:
> self.assertEqual(src_vm.command('query-migrate')['status'], 'completed')
> tests/avocado/migration.py:
> self.assertEqual(dst_vm.command('query-migrate')['status'], 'completed')
> tests/avocado/migration.py:
> self.assertEqual(dst_vm.command('query-status')['status'], 'running')
> tests/avocado/migration.py:
> self.assertEqual(src_vm.command('query-status')['status'],'postmigrate')
> tests/avocado/pc_cpu_hotplug_props.py:
> self.assertEquals(len(self.vm.command('query-cpus-fast')), 2)
> tests/avocado/version.py:        res =
> self.vm.command('human-monitor-command',
> tests/avocado/virtio_check_params.py:        output =
> vm.command('human-monitor-command',
> tests/avocado/virtio_check_params.py:            machines = [m['name'] for
> m in vm.command('query-machines')]
> tests/avocado/virtio_version.py:    return devtype in [d['name'] for d in
> vm.command('qom-list-types', implements=implements)]
> tests/avocado/virtio_version.py:            pcibuses =
> vm.command('query-pci')
> tests/avocado/x86_cpu_model_versions.py:        cpus = dict((m['name'], m)
> for m in self.vm.command('query-cpu-definitions'))
> tests/avocado/x86_cpu_model_versions.py:        cpus = dict((m['name'], m)
> for m in self.vm.command('query-cpu-definitions'))
> tests/avocado/x86_cpu_model_versions.py:        cpus = dict((m['name'], m)
> for m in self.vm.command('query-cpu-definitions'))
> tests/avocado/x86_cpu_model_versions.py:        cpu_path =
> self.vm.command('query-cpus-fast')[0].get('qom-path')
> tests/avocado/x86_cpu_model_versions.py:        return
> self.vm.command('qom-get', path=cpu_path, property=prop)
> tests/docker/docker.py:        dkr.command(cmd="pull", quiet=args.quiet,
> tests/docker/docker.py:        dkr.command(cmd="tag", quiet=args.quiet,
> tests/docker/docker.py:        return Docker().command("images", argv,
> args.quiet)
> tests/migration/guestperf/engine.py:        info =
> vm.command("query-migrate")
> tests/migration/guestperf/engine.py:        vcpus =
> src.command("query-cpus-fast")
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-parameters",
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:            resp =
> dst.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:        resp =
> src.command("migrate-set-parameters",
> tests/migration/guestperf/engine.py:        resp =
> src.command("migrate-set-parameters",
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-parameters",
> tests/migration/guestperf/engine.py:            resp =
> dst.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:            resp =
> dst.command("migrate-set-parameters",
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:            resp =
> dst.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-parameters",
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:            resp =
> src.command("migrate-set-parameters",
> tests/migration/guestperf/engine.py:            resp =
> dst.command("migrate-set-capabilities",
> tests/migration/guestperf/engine.py:            resp =
> dst.command("migrate-set-parameters",
> tests/migration/guestperf/engine.py:        resp = src.command("migrate",
> uri=connect_uri)
> tests/migration/guestperf/engine.py:                    dst.command("cont")
> tests/migration/guestperf/engine.py:
> src.command("migrate_cancel")
> tests/migration/guestperf/engine.py:
> src.command("migrate_cancel")
> tests/migration/guestperf/engine.py:                resp =
> src.command("migrate-start-postcopy")
> tests/migration/guestperf/engine.py:                resp =
> src.command("stop")
>
>
>
>
> > success by hand.. But that's not optimal. To simplify movement to
> > vm.command() support same interface improvements like in vm.qmp() and
> > rename to shorter vm.cmd().
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> > ---
> >   python/qemu/machine/machine.py | 16 ++++++++++++---
> >   tests/qemu-iotests/256         | 34 ++++++++++++++++----------------
> >   tests/qemu-iotests/257         | 36 +++++++++++++++++-----------------
> >   3 files changed, 48 insertions(+), 38 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index 07ac5a710b..a3fb840b93 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -648,14 +648,24 @@ def qmp(self, cmd: str,
> >               self._quit_issued = True
> >           return ret
> >
> > -    def command(self, cmd: str,
> > -                conv_keys: bool = True,
> > -                **args: Any) -> QMPReturnValue:
> > +    def cmd(self, cmd: str,
> > +            args_dict: Optional[Dict[str, object]] = None,
> > +            conv_keys: Optional[bool] = None,
> > +            **args: Any) -> QMPReturnValue:
> >           """
> >           Invoke a QMP command.
> >           On success return the response dict.
> >           On failure raise an exception.
> >           """
> > +        if args_dict is not None:
> > +            assert not args
> > +            assert conv_keys is None
> > +            args = args_dict
> > +            conv_keys = False
> > +
> > +        if conv_keys is None:
> > +            conv_keys = True
> > +
> >           qmp_args = self._qmp_args(conv_keys, args)
> >           ret = self._qmp.command(cmd, **qmp_args)
> >           if cmd == 'quit':
> > diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
> > index 13666813bd..fffc8ef055 100755
> > --- a/tests/qemu-iotests/256
> > +++ b/tests/qemu-iotests/256
> > @@ -40,25 +40,25 @@ with iotests.FilePath('img0') as img0_path, \
> >       def create_target(filepath, name, size):
> >           basename = os.path.basename(filepath)
> >           nodename = "file_{}".format(basename)
> > -        log(vm.command('blockdev-create', job_id='job1',
> > -                       options={
> > -                           'driver': 'file',
> > -                           'filename': filepath,
> > -                           'size': 0,
> > -                       }))
> > +        log(vm.cmd('blockdev-create', job_id='job1',
> > +                   options={
> > +                       'driver': 'file',
> > +                       'filename': filepath,
> > +                       'size': 0,
> > +                   }))
> >           vm.run_job('job1')
> > -        log(vm.command('blockdev-add', driver='file',
> > -                       node_name=nodename, filename=filepath))
> > -        log(vm.command('blockdev-create', job_id='job2',
> > -                       options={
> > -                           'driver': iotests.imgfmt,
> > -                           'file': nodename,
> > -                           'size': size,
> > -                       }))
> > +        log(vm.cmd('blockdev-add', driver='file',
> > +                   node_name=nodename, filename=filepath))
> > +        log(vm.cmd('blockdev-create', job_id='job2',
> > +                   options={
> > +                       'driver': iotests.imgfmt,
> > +                       'file': nodename,
> > +                       'size': size,
> > +                   }))
> >           vm.run_job('job2')
> > -        log(vm.command('blockdev-add', driver=iotests.imgfmt,
> > -                       node_name=name,
> > -                       file=nodename))
> > +        log(vm.cmd('blockdev-add', driver=iotests.imgfmt,
> > +                   node_name=name,
> > +                   file=nodename))
> >
> >       log('--- Preparing images & VM ---\n')
> >       vm.add_object('iothread,id=iothread0')
> > diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
> > index e7e7a2317e..7d3720b8e5 100755
> > --- a/tests/qemu-iotests/257
> > +++ b/tests/qemu-iotests/257
> > @@ -160,26 +160,26 @@ class Drive:
> >           file_node_name = "file_{}".format(basename)
> >           vm = self.vm
> >
> > -        log(vm.command('blockdev-create', job_id='bdc-file-job',
> > -                       options={
> > -                           'driver': 'file',
> > -                           'filename': self.path,
> > -                           'size': 0,
> > -                       }))
> > +        log(vm.cmd('blockdev-create', job_id='bdc-file-job',
> > +                   options={
> > +                       'driver': 'file',
> > +                       'filename': self.path,
> > +                       'size': 0,
> > +                   }))
> >           vm.run_job('bdc-file-job')
> > -        log(vm.command('blockdev-add', driver='file',
> > -                       node_name=file_node_name, filename=self.path))
> > -
> > -        log(vm.command('blockdev-create', job_id='bdc-fmt-job',
> > -                       options={
> > -                           'driver': fmt,
> > -                           'file': file_node_name,
> > -                           'size': size,
> > -                       }))
> > +        log(vm.cmd('blockdev-add', driver='file',
> > +                   node_name=file_node_name, filename=self.path))
> > +
> > +        log(vm.cmd('blockdev-create', job_id='bdc-fmt-job',
> > +                   options={
> > +                       'driver': fmt,
> > +                       'file': file_node_name,
> > +                       'size': size,
> > +                   }))
> >           vm.run_job('bdc-fmt-job')
> > -        log(vm.command('blockdev-add', driver=fmt,
> > -                       node_name=name,
> > -                       file=file_node_name))
> > +        log(vm.cmd('blockdev-add', driver=fmt,
> > +                   node_name=name,
> > +                   file=file_node_name))
> >           self.fmt = fmt
> >           self.size = size
> >           self.node = name
>
>
> --
> Best regards,
> Vladimir
>

--000000000000a6c28505dfeb63db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 26, 2022, 10:31 AM Vladimir Sementsov-Ogie=
vskiy &lt;<a href=3D"mailto:vsementsov@yandex-team.ru">vsementsov@yandex-te=
am.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 4/8/22 20:0=
2, Vladimir Sementsov-Ogievskiy wrote:<br>
&gt; The method is not popular, we prefer use vm.qmp() and then check<br>
<br>
Suddenly I found, that I missed a lot of existing users: in scripts, in avo=
cado tests.<br>
<br>
Do you prefer to rename the method to &quot;cmd()&quot;, and change all the=
 occurrences, or keep longer &quot;command()&quot; name and update the seco=
nd patch?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div dir=3D"auto">I don&#39;t have a strong preference, I think.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">In (async) qmp I use .ex=
ecute() as the form that raises exception, and ._raw() as the form that doe=
sn&#39;t. I use execute_msg() as an exception-raising form that takes a Map=
ping[str, obj].</div><div dir=3D"auto"><br></div><div dir=3D"auto">Notably,=
 I tried to hide any interface that didn&#39;t raise exception, and the int=
erfaces that remain always return the inner return field and not the entire=
 wire object.</div><div dir=3D"auto"><br></div><div dir=3D"auto">command() =
IIRC has historically been the exception-raising version and cmd() has been=
 the C-like version. (cmd_obj works like my execute_msg, except it doesn&#3=
9;t raise, and returns the entire reply.)</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">command() is longer, but there&#39;s precedent and contin=
uity for it working this way. But shorter names are nicer for line length, =
so...</div><div dir=3D"auto"><br></div><div dir=3D"auto">...Go with what yo=
u feel is subjectively nicest? (That&#39;s not helpful, sorry.)</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">oh, also: IIRC, command() also does=
 not return the entire response object. This is how execute() works, but it=
 might be a lot of churn to convert users of cmd() over to this form. It&#3=
9;s something I want to do eventually anyway, but it&#39;s a lot for me to =
dump on your plate, so don&#39;t worry about that aspect.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">--js</div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
<br>
$ git grep &#39;\.command(&#39;<br>
docs/devel/testing.rst:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.vm.c=
ommand(&#39;human-monitor-command&#39;,<br>
docs/devel/testing.rst:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 first_res =3D fir=
st_machine.command(<br>
docs/devel/testing.rst:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 second_res =3D se=
cond_machine.command(<br>
docs/devel/testing.rst:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 third_res =3D sel=
f.get_vm(name=3D&#39;third_machine&#39;).command(<br>
python/qemu/machine/machine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D self._qm=
p.command(cmd, **qmp_args)<br>
python/qemu/utils/qemu_ga_client.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return self.command(&#39;guest-&#39; + name.replace(&#39;_&#39;, &#39;-=
&#39;), **kwds)<br>
python/qemu/utils/qom.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 rsp =3D self.qmp.comma=
nd(<br>
python/qemu/utils/qom.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 rsp =3D self.qmp.comma=
nd(<br>
python/qemu/utils/qom.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rsp =3D self.qmp.command(&#39;qom-get&#39;, path=3Dpath,<br>
python/qemu/utils/qom_common.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 rsp =3D self.qm=
p.command(&#39;qom-list&#39;, path=3Dpath)<br>
python/qemu/utils/qom_fuse.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dat=
a =3D str(self.qmp.command(&#39;qom-get&#39;, path=3Dpath, property=3Dprop)=
)<br>
python/qemu/utils/qom_fuse.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 return prefix + s=
tr(self.qmp.command(&#39;qom-get&#39;, path=3Dpath,<br>
scripts/device-crash-test:=C2=A0 =C2=A0 types =3D vm.command(&#39;qom-list-=
types&#39;, **kwargs)<br>
scripts/device-crash-test:=C2=A0 =C2=A0 devhelp =3D vm.command(&#39;human-m=
onitor-command&#39;, **args)<br>
scripts/device-crash-test:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ma=
chines =3D list(m[&#39;name&#39;] for m in vm.command(&#39;query-machines&#=
39;))<br>
scripts/device-crash-test:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kv=
m_available =3D vm.command(&#39;query-kvm&#39;)[&#39;enabled&#39;]<br>
scripts/render_block_graph.py:=C2=A0 =C2=A0 bds_nodes =3D qmp.command(&#39;=
query-named-block-nodes&#39;)<br>
scripts/render_block_graph.py:=C2=A0 =C2=A0 job_nodes =3D qmp.command(&#39;=
query-block-jobs&#39;)<br>
scripts/render_block_graph.py:=C2=A0 =C2=A0 block_graph =3D qmp.command(&#3=
9;x-debug-query-block-graph&#39;)<br>
tests/avocado/avocado_qemu/__init__.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D =
self.vm.command(&#39;human-monitor-command&#39;,<br>
tests/avocado/cpu_queries.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpus =3D self.vm.c=
ommand(&#39;query-cpu-definitions&#39;)<br>
tests/avocado/cpu_queries.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e =
=3D self.vm.command(&#39;query-cpu-model-expansion&#39;, model=3Dmodel, typ=
e=3D&#39;full&#39;)<br>
tests/avocado/hotplug_cpu.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.command(&#=
39;device_add&#39;,<br>
tests/avocado/info_usernet.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.vm.c=
ommand(&#39;human-monitor-command&#39;,<br>
tests/avocado/machine_arm_integratorcp.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.=
vm.command(&#39;human-monitor-command&#39;, command_line=3D&#39;stop&#39;)<=
br>
tests/avocado/machine_arm_integratorcp.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.=
vm.command(&#39;human-monitor-command&#39;,<br>
tests/avocado/machine_m68k_nextcube.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.=
command(&#39;human-monitor-command&#39;,<br>
tests/avocado/machine_mips_malta.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.com=
mand(&#39;human-monitor-command&#39;, command_line=3D&#39;stop&#39;)<br>
tests/avocado/machine_mips_malta.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.com=
mand(&#39;human-monitor-command&#39;,<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;device_del&#39;, id=3D&#39;rn1&#39;)<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;device_del&#39;, id=3D&#39;rn2&#39;)<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;device_add&#39;, driver=3D&#39;virtio-net-ccw&#39;,<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;device_del&#39;, id=3D&#39;net_4711&#39;)<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;human-monitor-command&#39;, command_line=3D&#39;balloon 96&#=
39;)<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;human-monitor-command&#39;, command_line=3D&#39;balloon 128&=
#39;)<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 self.vm.command(&#39;screendump&#39;, filename=3D<a href=3D"http://=
ppmfile.name" rel=3D"noreferrer noreferrer" target=3D"_blank">ppmfile.name<=
/a>)<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;object-add&#39;, qom_type=3D&#39;cryptodev-backend-builtin&#=
39;,<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;device_add&#39;, driver=3D&#39;virtio-crypto-ccw&#39;, id=3D=
&#39;crypdev0&#39;,<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;device_del&#39;, id=3D&#39;crypdev0&#39;)<br>
tests/avocado/machine_s390_ccw_virtio.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.v=
m.command(&#39;object-del&#39;, id=3D&#39;cbe0&#39;)<br>
tests/avocado/migration.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 return vm.command(&#=
39;query-migrate&#39;)[&#39;status&#39;] in (&#39;completed&#39;, &#39;fail=
ed&#39;)<br>
tests/avocado/migration.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(src=
_vm.command(&#39;query-migrate&#39;)[&#39;status&#39;], &#39;completed&#39;=
)<br>
tests/avocado/migration.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(dst=
_vm.command(&#39;query-migrate&#39;)[&#39;status&#39;], &#39;completed&#39;=
)<br>
tests/avocado/migration.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(dst=
_vm.command(&#39;query-status&#39;)[&#39;status&#39;], &#39;running&#39;)<b=
r>
tests/avocado/migration.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(src=
_vm.command(&#39;query-status&#39;)[&#39;status&#39;],&#39;postmigrate&#39;=
)<br>
tests/avocado/pc_cpu_hotplug_props.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.asse=
rtEquals(len(self.vm.command(&#39;query-cpus-fast&#39;)), 2)<br>
tests/avocado/version.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.vm.comman=
d(&#39;human-monitor-command&#39;,<br>
tests/avocado/virtio_check_params.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D=
 vm.command(&#39;human-monitor-command&#39;,<br>
tests/avocado/virtio_check_params.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 machines =3D [m[&#39;name&#39;] for m in vm.command(&#39;query-machines=
&#39;)]<br>
tests/avocado/virtio_version.py:=C2=A0 =C2=A0 return devtype in [d[&#39;nam=
e&#39;] for d in vm.command(&#39;qom-list-types&#39;, implements=3Dimplemen=
ts)]<br>
tests/avocado/virtio_version.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
cibuses =3D vm.command(&#39;query-pci&#39;)<br>
tests/avocado/x86_cpu_model_versions.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpus =
=3D dict((m[&#39;name&#39;], m) for m in self.vm.command(&#39;query-cpu-def=
initions&#39;))<br>
tests/avocado/x86_cpu_model_versions.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpus =
=3D dict((m[&#39;name&#39;], m) for m in self.vm.command(&#39;query-cpu-def=
initions&#39;))<br>
tests/avocado/x86_cpu_model_versions.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpus =
=3D dict((m[&#39;name&#39;], m) for m in self.vm.command(&#39;query-cpu-def=
initions&#39;))<br>
tests/avocado/x86_cpu_model_versions.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_pat=
h =3D self.vm.command(&#39;query-cpus-fast&#39;)[0].get(&#39;qom-path&#39;)=
<br>
tests/avocado/x86_cpu_model_versions.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
self.vm.command(&#39;qom-get&#39;, path=3Dcpu_path, property=3Dprop)<br>
tests/docker/docker.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 dkr.command(cmd=3D&quot;=
pull&quot;, quiet=3Dargs.quiet,<br>
tests/docker/docker.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 dkr.command(cmd=3D&quot;=
tag&quot;, quiet=3Dargs.quiet,<br>
tests/docker/docker.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 return Docker().command(=
&quot;images&quot;, argv, args.quiet)<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D vm=
.command(&quot;query-migrate&quot;)<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpus =3D s=
rc.command(&quot;query-cpus-fast&quot;)<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-parameters&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D dst.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 resp =3D sr=
c.command(&quot;migrate-set-parameters&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 resp =3D sr=
c.command(&quot;migrate-set-parameters&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-parameters&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D dst.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D dst.command(&quot;migrate-set-parameters&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D dst.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-parameters&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D src.command(&quot;migrate-set-parameters&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D dst.command(&quot;migrate-set-capabilities&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp =3D dst.command(&quot;migrate-set-parameters&quot;,<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 resp =3D sr=
c.command(&quot;migrate&quot;, uri=3Dconnect_uri)<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst.command(&quot;cont&quot;)<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 src.command(&quot;migrate_cancel&quot;)<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 src.command(&quot;migrate_cancel&quot;)<br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 resp =3D src.command(&quot;migrate-start-postcopy&quot;)<=
br>
tests/migration/guestperf/engine.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 resp =3D src.command(&quot;stop&quot;)<br>
<br>
<br>
<br>
<br>
&gt; success by hand.. But that&#39;s not optimal. To simplify movement to<=
br>
&gt; vm.command() support same interface improvements like in vm.qmp() and<=
br>
&gt; rename to shorter vm.cmd().<br>
&gt; <br>
&gt; Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsem=
entsov@openvz.org" target=3D"_blank" rel=3D"noreferrer">vsementsov@openvz.o=
rg</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py | 16 ++++++++++++---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/256=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
34 ++++++++++++++++----------------<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/257=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
36 +++++++++++++++++-----------------<br>
&gt;=C2=A0 =C2=A03 files changed, 48 insertions(+), 38 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index 07ac5a710b..a3fb840b93 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -648,14 +648,24 @@ def qmp(self, cmd: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._quit_issue=
d =3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 def command(self, cmd: str,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conv_keys: bo=
ol =3D True,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **args: Any) =
-&gt; QMPReturnValue:<br>
&gt; +=C2=A0 =C2=A0 def cmd(self, cmd: str,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args_dict: Optional[Dict[st=
r, object]] =3D None,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conv_keys: Optional[bool] =
=3D None,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **args: Any) -&gt; QMPRetur=
nValue:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Invoke a QMP command.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On success return the response=
 dict.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On failure raise an exception.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if args_dict is not None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not args<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert conv_keys is None<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D args_dict<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conv_keys =3D False<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conv_keys is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conv_keys =3D True<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_args =3D self._qmp_args(co=
nv_keys, args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D self._qmp.command(cmd,=
 **qmp_args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cmd =3D=3D &#39;quit&#39;:<=
br>
&gt; diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256<br>
&gt; index 13666813bd..fffc8ef055 100755<br>
&gt; --- a/tests/qemu-iotests/256<br>
&gt; +++ b/tests/qemu-iotests/256<br>
&gt; @@ -40,25 +40,25 @@ with iotests.FilePath(&#39;img0&#39;) as img0_path=
, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def create_target(filepath, name, size):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0basename =3D os.path.basename(=
filepath)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodename =3D &quot;file_{}&quo=
t;.format(basename)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.command(&#39;blockdev-create&#39;,=
 job_id=3D&#39;job1&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0options=3D{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;driver&#39;: &#39;file&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;filename&#39;: filepath,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;size&#39;: 0,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.cmd(&#39;blockdev-create&#39;, job=
_id=3D&#39;job1&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
options=3D{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;driver&#39;: &#39;file&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;filename&#39;: filepath,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;size&#39;: 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm.run_job(&#39;job1&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.command(&#39;blockdev-add&#39;, dr=
iver=3D&#39;file&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0node_name=3Dnodename, filename=3Dfilepath))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.command(&#39;blockdev-create&#39;,=
 job_id=3D&#39;job2&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0options=3D{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;driver&#39;: iotests.imgfmt,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;file&#39;: nodename,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;size&#39;: size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.cmd(&#39;blockdev-add&#39;, driver=
=3D&#39;file&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
node_name=3Dnodename, filename=3Dfilepath))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.cmd(&#39;blockdev-create&#39;, job=
_id=3D&#39;job2&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
options=3D{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;driver&#39;: iotests.imgfmt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;file&#39;: nodename,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;size&#39;: size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm.run_job(&#39;job2&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.command(&#39;blockdev-add&#39;, dr=
iver=3Diotests.imgfmt,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0node_name=3Dname,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0file=3Dnodename))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.cmd(&#39;blockdev-add&#39;, driver=
=3Diotests.imgfmt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
node_name=3Dname,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
file=3Dnodename))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0log(&#39;--- Preparing images &amp; VM ---\n=
&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vm.add_object(&#39;iothread,id=3Diothread0&#=
39;)<br>
&gt; diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257<br>
&gt; index e7e7a2317e..7d3720b8e5 100755<br>
&gt; --- a/tests/qemu-iotests/257<br>
&gt; +++ b/tests/qemu-iotests/257<br>
&gt; @@ -160,26 +160,26 @@ class Drive:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_node_name =3D &quot;file_=
{}&quot;.format(basename)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm =3D self.vm<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.command(&#39;blockdev-create&#39;,=
 job_id=3D&#39;bdc-file-job&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0options=3D{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;driver&#39;: &#39;file&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;filename&#39;: self.path,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;size&#39;: 0,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.cmd(&#39;blockdev-create&#39;, job=
_id=3D&#39;bdc-file-job&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
options=3D{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;driver&#39;: &#39;file&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;filename&#39;: self.path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;size&#39;: 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm.run_job(&#39;bdc-file-job&#=
39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.command(&#39;blockdev-add&#39;, dr=
iver=3D&#39;file&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0node_name=3Dfile_node_name, filename=3Dself.path))<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.command(&#39;blockdev-create&#39;,=
 job_id=3D&#39;bdc-fmt-job&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0options=3D{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;driver&#39;: fmt,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;file&#39;: file_node_name,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;size&#39;: size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.cmd(&#39;blockdev-add&#39;, driver=
=3D&#39;file&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
node_name=3Dfile_node_name, filename=3Dself.path))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.cmd(&#39;blockdev-create&#39;, job=
_id=3D&#39;bdc-fmt-job&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
options=3D{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;driver&#39;: fmt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;file&#39;: file_node_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;size&#39;: size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm.run_job(&#39;bdc-fmt-job&#3=
9;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.command(&#39;blockdev-add&#39;, dr=
iver=3Dfmt,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0node_name=3Dname,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0file=3Dfile_node_name))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log(vm.cmd(&#39;blockdev-add&#39;, driver=
=3Dfmt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
node_name=3Dname,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
file=3Dfile_node_name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fmt =3D fmt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.size =3D size<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.node =3D name<br>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></block=
quote></div></div></div>

--000000000000a6c28505dfeb63db--


