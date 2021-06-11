Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A887C3A4A6C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 22:59:34 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lroFZ-0002Kw-Al
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 16:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lroEg-0001dk-Cw
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 16:58:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lroEb-0007st-Lb
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 16:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623445111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dxFkg+yBtHYERjq772rfu/8lza5MzyPCx8O50Vrupk=;
 b=SxQp/LazBc+ArX4EgaaY89uWy+6nH/sfsKNoedxMpO2nOe4TVC2mnlEeCVkH4pydDTTKDR
 0aRKerNu80oS6rPPBIAZ+eTIyqlMC0OqBb7x00ilUGqOZrwYRROa1zcyX0NZ3qDzWx64os
 Gr2po6LBZW3UaqiAcOJqR9j+JGM1fIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-ZCy0la0vMdWzlaaH4nOt_g-1; Fri, 11 Jun 2021 16:58:30 -0400
X-MC-Unique: ZCy0la0vMdWzlaaH4nOt_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 393511084F47;
 Fri, 11 Jun 2021 20:58:29 +0000 (UTC)
Received: from [10.10.112.226] (ovpn-112-226.rdu2.redhat.com [10.10.112.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BE4419C59;
 Fri, 11 Jun 2021 20:58:28 +0000 (UTC)
Subject: Re: [PATCH 00/11] python: move /scripts/qmp/gemu-ga-client.py to
 qemu.qmp package
To: qemu-devel@nongnu.org
References: <20210604155532.1499282-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <99846123-9573-f038-2c91-29dbe9a9de27@redhat.com>
Date: Fri, 11 Jun 2021 16:58:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604155532.1499282-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 11:55 AM, John Snow wrote:
> Delint and type the qemu-ga-client and move it over into
> /python/qemu/qmp/qemu_ga_client.py.
> 
> Based-on: <20210603003719.1321369-1-jsnow@redhat.com>
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-qga
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/315122004
> 
> (Weakly based on "[PATCH v3 00/19] Python: move /scripts/qmp/qom* to
> /python/qemu/qmp/qom*", for the purposes of avoiding context conflicts
> in /python/setup.cfg, but is trivially rebased without it.)
> 
> Add a new console entrypoint to the package under "qemu-ga-client",
> keeping the old name. (This makes a script named "qemu-ga-client"
> available in your $PATH when you use pip to install the qemu.qmp
> package.)
> 
> Add a forwarder shim back to /scripts/qmp/qemu-ga-client.py that
> forwards to the new script, keeping functionality as it was in the old
> location, at least for a little while. I intend to eventually deprecate
> these forwarders, but not yet. (This allows you to use "qemu-ga-client"
> from the scripts directory without needing to install the qemu.qmp
> package.)
> 
> Now this script is protected against regressions against the qemu.qmp
> package because it's part of it, and validated regularly by GitLab CI.
> 
> John Snow (11):
>    scripts/qemu-ga-client: apply isort rules
>    scripts/qemu-ga-client: apply (most) flake8 rules
>    scripts/qemu-ga-client: Fix exception handling
>    scripts/qemu-ga-client: replace deprecated optparse with argparse
>    scripts/qemu-ga-client: add module docstring
>    scripts/qemu-ga-client: apply (most) pylint rules
>    python/qmp: Correct type of QMPReturnValue
>    scripts/qemu-ga-client: add mypy type hints
>    scripts/qemu-ga-client: move to python/qemu/qmp/qemu_ga_client.py
>    python/qemu-ga-client: add entry point
>    scripts/qemu-ga-client: Add forwarder shim
> 
>   python/qemu/qmp/__init__.py       |  25 ++-
>   python/qemu/qmp/qemu_ga_client.py | 323 ++++++++++++++++++++++++++++++
>   python/setup.cfg                  |   1 +
>   scripts/qmp/qemu-ga-client        | 297 +--------------------------
>   4 files changed, 341 insertions(+), 305 deletions(-)
>   create mode 100644 python/qemu/qmp/qemu_ga_client.py
> 

Thanks, preliminarily staged on my python branch:

https://gitlab.com/jsnow/qemu/-/commits/python

CI (covers this series and the scripts/qmp/qom* series):
https://gitlab.com/jsnow/qemu/-/pipelines/319584565

I intend to send a PR this coming Friday after staging the qmp-shell 
cleanup series.

--js


