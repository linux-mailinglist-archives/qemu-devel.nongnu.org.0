Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4145D663EA0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFCDg-0003Xd-BE; Tue, 10 Jan 2023 05:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFCCf-0003Nz-3X
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:50:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFCCc-00046w-TG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673347797;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4TXJhVYkCSTG+45lneSgtOkZ0aR6BC3VOEVhhWHtOII=;
 b=eufZyZ/cErjc+RspuFjf2O3Iwv5JAI9cQKcvHEZh0VthzVuiR9NMQ9o6zJZEn4lAtaYHAb
 kKzqSvl3ICn+THzKum9UPCHuVxh5HaTbbJLSXWLDPfsz5MNGcvsS2nKNdkHmV3KfgMYJAP
 LnAl9kCoUUYZEjG/OngfHtY6us9aJs0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-GlvElAf1OpOJhiHxRHfhYw-1; Tue, 10 Jan 2023 05:49:54 -0500
X-MC-Unique: GlvElAf1OpOJhiHxRHfhYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 038173C1485A;
 Tue, 10 Jan 2023 10:49:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 022771121314;
 Tue, 10 Jan 2023 10:49:52 +0000 (UTC)
Date: Tue, 10 Jan 2023 10:49:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, jsnow@redhat.com, crosa@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 01/11] python: rename QEMUMonitorProtocol.cmd() to
 cmd_raw()
Message-ID: <Y71CzobOjJxxBAXu@redhat.com>
References: <20230110083758.161201-1-vsementsov@yandex-team.ru>
 <20230110083758.161201-2-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230110083758.161201-2-vsementsov@yandex-team.ru>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jan 10, 2023 at 11:37:48AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Having cmd() and command() methods in one class doesn't look good.
> Rename cmd() to cmd_raw(), to show its meaning better.
> 
> We also want to rename command() to cmd() in future, so this commit is a
> necessary first step.
> 
> Keep new cmd_raw() only in a few places where it's really needed and
> move to command() where possible.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  python/qemu/machine/machine.py |  2 +-
>  python/qemu/qmp/legacy.py      |  8 ++------
>  python/qemu/qmp/qmp_shell.py   | 13 +++++++------
>  scripts/cpu-x86-uarch-abi.py   | 12 ++++++------
>  tests/qemu-iotests/iotests.py  |  2 +-
>  5 files changed, 17 insertions(+), 20 deletions(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 748a0d807c..9059dc3948 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -674,7 +674,7 @@ def qmp(self, cmd: str,
>              conv_keys = True
>  
>          qmp_args = self._qmp_args(conv_keys, args)
> -        ret = self._qmp.cmd(cmd, args=qmp_args)
> +        ret = self._qmp.cmd_raw(cmd, args=qmp_args)
>          if cmd == 'quit' and 'error' not in ret and 'return' in ret:
>              self._quit_issued = True
>          return ret
> diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
> index 1951754455..8e1a504052 100644
> --- a/python/qemu/qmp/legacy.py
> +++ b/python/qemu/qmp/legacy.py
> @@ -186,21 +186,17 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
>              )
>          )
>  
> -    def cmd(self, name: str,
> -            args: Optional[Dict[str, object]] = None,
> -            cmd_id: Optional[object] = None) -> QMPMessage:
> +    def cmd_raw(self, name: str,
> +            args: Optional[Dict[str, object]] = None) -> QMPMessage:
>          """
>          Build a QMP command and send it to the QMP Monitor.
>  
>          :param name: command name (string)
>          :param args: command arguments (dict)
> -        :param cmd_id: command id (dict, list, string or int)
>          """
>          qmp_cmd: QMPMessage = {'execute': name}
>          if args:
>              qmp_cmd['arguments'] = args
> -        if cmd_id:
> -            qmp_cmd['id'] = cmd_id

The commit message didn't say anything about dropping the
cmd_id parameter. Presumably you've found that it is not
used in any caller that exists, but still it feels like
a valid parameter to want to support in this method ?


>          return self.cmd_obj(qmp_cmd)
>  
>      def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
> diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
> index 619ab42ced..5c0d87a0ec 100644
> --- a/python/qemu/qmp/qmp_shell.py
> +++ b/python/qemu/qmp/qmp_shell.py
> @@ -98,7 +98,7 @@
>      Sequence,
>  )
>  
> -from qemu.qmp import ConnectError, QMPError, SocketAddrT
> +from qemu.qmp import ConnectError, QMPError, SocketAddrT, ExecuteError
>  from qemu.qmp.legacy import (
>      QEMUMonitorProtocol,
>      QMPBadPortError,
> @@ -194,11 +194,12 @@ def close(self) -> None:
>          super().close()
>  
>      def _fill_completion(self) -> None:
> -        cmds = self.cmd('query-commands')
> -        if 'error' in cmds:
> -            return
> -        for cmd in cmds['return']:
> -            self._completer.append(cmd['name'])
> +        try:
> +            cmds = self.command('query-commands')
> +            for cmd in cmds:
> +                self._completer.append(cmd['name'])
> +        except ExecuteError:
> +            pass
>  
>      def _completer_setup(self) -> None:
>          self._completer = QMPCompleter()

I'd suggest that re-writing callers to use 'command' is better
done in a prior patch, so that this patch is purely a rename of
cmd -> cmd_raw with no functional changes intermixed.

> diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
> index 82ff07582f..893afd1b35 100644
> --- a/scripts/cpu-x86-uarch-abi.py
> +++ b/scripts/cpu-x86-uarch-abi.py
> @@ -69,7 +69,7 @@
>  shell = QEMUMonitorProtocol(sock)
>  shell.connect()
>  
> -models = shell.cmd("query-cpu-definitions")
> +models = shell.command("query-cpu-definitions")
>  
>  # These QMP props don't correspond to CPUID fatures
>  # so ignore them
> @@ -85,7 +85,7 @@
>  
>  names = []
>  
> -for model in models["return"]:
> +for model in models:
>      if "alias-of" in model:
>          continue
>      names.append(model["name"])
> @@ -93,12 +93,12 @@
>  models = {}
>  
>  for name in sorted(names):
> -    cpu = shell.cmd("query-cpu-model-expansion",
> -                     { "type": "static",
> -                       "model": { "name": name }})
> +    cpu = shell.command("query-cpu-model-expansion",
> +                        { "type": "static",
> +                          "model": { "name": name }})
>  
>      got = {}
> -    for (feature, present) in cpu["return"]["model"]["props"].items():
> +    for (feature, present) in cpu["model"]["props"].items():
>          if present and feature not in skip:
>              got[feature] = True
>  
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index da7d6637e1..c69b10ac82 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -460,7 +460,7 @@ def __init__(self, *args: str, instance_id: str = 'a', qmp: bool = False):
>      def qmp(self, cmd: str, args: Optional[Dict[str, object]] = None) \
>              -> QMPMessage:
>          assert self._qmp is not None
> -        return self._qmp.cmd(cmd, args)
> +        return self._qmp.cmd_raw(cmd, args)
>  
>      def stop(self, kill_signal=15):
>          self._p.send_signal(kill_signal)
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


