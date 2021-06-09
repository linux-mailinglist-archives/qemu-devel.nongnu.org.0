Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C823A1E27
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:33:20 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4t5-0000qJ-CO
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lr4sA-00009H-6p
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lr4s7-0003I3-5G
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623270738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhmfeUD54m1KM38ivMJX3IiQGfj8NRY3Oyh/I2EgGeE=;
 b=arXNnJ0B7s/uMBVU0ZuswzNxEQRqbRBfykAAc1E3d25Ke0mFpHMa34QB8vIuAnNhD9XTFq
 Z6r/RUmLCuwD1p0Ls0c6oK7Bi/m5YjvG1rLQKuvLguZKxgT5bClL5nQQWOzp37NRaoPEMn
 Gq3wti/N6zVksVeNrRfkhcQSoGCNUA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-hePqDufJNwyU6LT2fJD9_Q-1; Wed, 09 Jun 2021 16:32:15 -0400
X-MC-Unique: hePqDufJNwyU6LT2fJD9_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B47A11850605;
 Wed,  9 Jun 2021 20:32:14 +0000 (UTC)
Received: from [10.10.116.110] (ovpn-116-110.rdu2.redhat.com [10.10.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A998260853;
 Wed,  9 Jun 2021 20:32:13 +0000 (UTC)
Subject: Re: [PATCH v3 00/19] Python: move /scripts/qmp/qom* to
 /python/qemu/qmp/qom*
To: qemu-devel@nongnu.org
References: <20210603003719.1321369-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <4f803eee-554b-05d1-958f-98a7f824a588@redhat.com>
Date: Wed, 9 Jun 2021 16:32:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 8:37 PM, John Snow wrote:
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/202
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-qom
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/313932818
> 
> Hello!
> ------
> 
> This series applies the usual linting cleanups to modernize the qom
> tools and then integrates them into the python packaging hierarchy.
> 
> This will help prevent further bitrot of these tools.
> 
> I don't expect or need a detailed review of the QOM tools themselves --
> these tools are not used during build OR testing, and some are fairly
> bitrotted in places.
> 
> However, some details of how the python packaging system is being
> utilized here may attract your attention and could be worth a look.
> (Patches 5-6 and 16-19 are the interesting ones.)
> 
> Since these scripts aren't critical, I'm OK with sending a fairly hasty
> PR to merge these sooner rather than later.
> 
> Overview:
> ---------
> 
> Patch 1: Update Pipfile.lock (See the commit as for why ...)
> 
> Patches 2-3: Correct some existing typing issues in qemu.qmp
> 
> Patch 4: Combine qom-set, qom-get, (etc) into one, newly written script
> that makes all of the command invocations, help text, etc. consistent.
> (I ask that review for this patch should be limited to critical
> mistakes: I have no interest in developing the QOM tools further.)
> 
> Patches 5-6: Integrate the qom tools into the python package.
> 
> Patches 7-15: Delinting of the qom_fuse script. Similarly, I am not
> terribly interested in further improvements here, personally.
> 
> Patches 16-19: Integrating qom-fuse into the Python packaging directory;
> additional care is taken to ensure that "optional" dependencies like
> fusepy are handled well.
> 
> Changelog
> ---------
> 
> V3:
> - Technically, I sent two versions of this before, a long time ago.
>    This has been cleaned up and based on the latest origin/master.
> 
> John Snow (19):
>    python/pipenv: Update Pipfile.lock
>    python/qmp: Fix type of SocketAddrT
>    python/qmp: add parse_address classmethod
>    python/qmp: Add qom script rewrites
>    python/qmp: add qom script entry points
>    scripts/qmp: redirect qom-xxx scripts to python/qemu/qmp/
>    scripts/qom-fuse: apply isort rules
>    scripts/qom-fuse: apply flake8 rules
>    python: Add 'fh' to known-good variable names
>    scripts/qom-fuse: Apply pylint rules
>    scripts/qom-fuse: Add docstrings
>    scripts/qom-fuse: Convert to QOMCommand
>    scripts/qom-fuse: use QOMCommand.qom_list()
>    scripts/qom-fuse: ensure QOMFuse.read always returns bytes
>    scripts/qom-fuse: add static type hints
>    python: add optional FUSE dependencies
>    scripts/qom-fuse: move to python/qemu/qmp/qom_fuse.py
>    scripts/qom-fuse: add redirection shim to python/qemu/qmp/qom-fuse.py
>    python/qmp: add fuse command to 'qom' tools
> 
>   python/Pipfile.lock           |  97 +++++++++++-
>   python/qemu/qmp/__init__.py   |  28 +++-
>   python/qemu/qmp/qom.py        | 272 ++++++++++++++++++++++++++++++++++
>   python/qemu/qmp/qom_common.py | 178 ++++++++++++++++++++++
>   python/qemu/qmp/qom_fuse.py   | 206 +++++++++++++++++++++++++
>   python/setup.cfg              |  33 ++++-
>   scripts/qmp/qmp-shell         |  21 +--
>   scripts/qmp/qom-fuse          | 144 +-----------------
>   scripts/qmp/qom-get           |  66 +--------
>   scripts/qmp/qom-list          |  63 +-------
>   scripts/qmp/qom-set           |  63 +-------
>   scripts/qmp/qom-tree          |  74 +--------
>   12 files changed, 828 insertions(+), 417 deletions(-)
>   create mode 100644 python/qemu/qmp/qom.py
>   create mode 100644 python/qemu/qmp/qom_common.py
>   create mode 100644 python/qemu/qmp/qom_fuse.py
> 

Provisionally staged to my Python branch:
https://gitlab.com/jsnow/qemu/-/commits/python/

(Barring objections, I intend to send a PR for all the ./scripts/qmp/ 
cleanups at once, next Friday.)

--js


