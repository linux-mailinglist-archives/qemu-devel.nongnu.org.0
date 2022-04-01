Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EEA4EF829
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 18:41:54 +0200 (CEST)
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKLR-0006cQ-Je
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 12:41:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1naKJx-0005jI-An
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1naKJu-0004G5-I5
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648831216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isgVH5X2dQT4EWs9TMPA/VONv/VlJ5qdeCE2xETg95Y=;
 b=K2FUN85oA7855X430J+Nsxeqt2UM9H2rcNaSBZ6b3n5t4WzgxY8ggjh7wyiViFRQ7DWSs3
 gaSIaklxovntZ7ZuZxkf3azYPv5Gsb7CzHKiOhMJEzW/mw+veQ2rpi4N9fmhENoLlu+SIe
 SeqgeBi+tOuZEcT4+j6vuzkrK+NxRys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-J8eNpRehNq-PHFQ2LnFMDw-1; Fri, 01 Apr 2022 12:40:14 -0400
X-MC-Unique: J8eNpRehNq-PHFQ2LnFMDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF0A080159B
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 16:40:13 +0000 (UTC)
Received: from paraplu (unknown [10.39.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90E4D200BA60;
 Fri,  1 Apr 2022 16:40:06 +0000 (UTC)
Date: Fri, 1 Apr 2022 18:40:04 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 09/13] [FIXME] move PACKAGE.rst to README.rst
 and update
Message-ID: <Ykcq5LSltMThruoM@paraplu>
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-10-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220330182424.3438872-10-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 02:24:20PM -0400, John Snow wrote:
> The README here will reflect both what is shown on GitLab and on the
> PyPI landing page. Update it accordingly, and freshen it up.
> 
> FIXME: Update URLs when pushing to the production repo.
> 
> Suggested-by: Kashyap Chamarthy <kchamart@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Hi,

This version reads good to me. :)

[...]

> +
> +Who isn't this library for?
> +---------------------------
> +
> +It is not designed for anyone looking for a turn-key solution for VM
> +management. QEMU is a low-level component that resembles a particularly
> +impressive Swiss Army knife. This library does not manage that
> +complexity and is largely "VM-ignorant". It's not a replacement for
> +projects like `libvirt <https://libvirt.org/>`_, `virt-manager
> +<https://virt-manager.org/>`_, `GNOME Boxes
> +<https://wiki.gnome.org/Apps/Boxes>`_, etc.
> +
> +
> +Installing
> +----------
> +
> +This package can be installed from PyPI with pip: ``> pip3 install
> +qemu.qmp``.
> 
> +
> +Usage
> +-----
> +
> +Launch QEMU with a monitor, e.g.::
> +
> +  > qemu-system-x86_64 -qmp unix:qmp.sock,server=on,wait=off
> +
> +
> +Then, at its simplest, script-style usage looks like this::
> +
> +  import asyncio
> +  from qemu.qmp import QMPClient
> +
> +  async def main():
> +      qmp = QMPClient('my-vm-nickname')
> +      await qmp.connect('qmp.sock')
> +
> +      res = await qmp.execute('query-status')
> +      print(f"VM status: {res['status']}")
> +
> +      await qmp.disconnect()
> +
> +  asyncio.run(main())

Tested the exmaple; this works!

> +The above script will connect to the UNIX socket located at
> +``qmp.sock``, query the VM's runstate, then print it out
> +to the terminal::
> +
> +  > python3 example.py
> +  VM status: running
> +
> +
> +For more complex usages, especially those that make full advantage of
> +monitoring asynchronous events, refer to the `online documentation
> +<https://jsnow.gitlab.io/qemu.qmp/>`_ or type ``import qemu.qmp;
> +help(qemu.qmp)`` in your Python terminal of choice.
> +
> +
> +Contributing
> +------------
> +
> +Contributions are quite welcome! Please file bugs using the `GitLab
> +issue tracker <https://gitlab.com/jsnow/qemu.qmp/-/issues>`_. This
> +project will accept GitLab merge requests, but due to the close
> +association with the QEMU project, there are some additional guidelines:
> +
> +1. Please use the "Signed-off-by" tag in your commit messages. See
> +   https://wiki.linuxfoundation.org/dco for more information on this
> +   requirement.
> +
> +2. This repository won't squash merge requests into a single commit on
> +   pull; each commit should seek to be self-contained (within reason).
> +
> +3. Owing to the above, each commit sent as part of a merge request
> +   should not introduce any temporary regressions, even if fixed later
> +   in the same merge request. This is done to preserve bisectability.
> +
> +4. Please associate every merge request with at least one `GitLab issue
> +   <https://gitlab.com/jsnow/qemu.qmp/-/issues>`_. This helps with
> +   generating Changelog text and staying organized. Thank you 🙇

/me didn't miss the Japanese bow.

> +Developing
> +^^^^^^^^^^
> +
> +Optional packages necessary for running code quality analysis for this
> +package can be installed with the optional dependency group "devel":
> +``pip install qemu.qmp[devel]``.
> +
> +``make develop`` can be used to install this package in editable mode
> +(to the current environment) *and* bring in testing dependencies in one
> +command.
> +
> +``make check`` can be used to run the available tests. Consult ``make
> +help`` for other targets and tests that make sense for different
> +occasions.
> +
> +Before submitting a pull request, consider running ``make check-tox &&
> +make check-pipenv`` locally to spot any issues that will cause the CI to
> +fail. These checks use their own virtual environments and won't pollute
> +your working space.

Nit: Consider hyper-linking "virtual environments" to:
https://docs.python.org/3/library/venv.html#module-venv

(I realize, within context people will recognize the term "virtual
environment" is not a virtual guest environment, but a Python venv.  I
have a mild preference for being explicit here.)

FWIW:

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com> 

[...]
 

-- 
/kashyap


