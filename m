Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA619219B94
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 10:58:52 +0200 (CEST)
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtSOJ-0001Ub-Rg
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 04:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1jtSMc-0000Ex-St
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 04:57:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26100
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1jtSMZ-000470-EN
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 04:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594285022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/w5wR71YgwwW4dH9RZH8Z6KS2DNSgxvn4Inq5j87hY8=;
 b=dsU2BdZN4iq/1uLUX7TVndqYpVcMgCLPl9Gm09rK+hUgkssFO+h0CPPGjbFRkx08BoSJWp
 RDD+Exfdz5AlziaMO7KD9yF2uI4y9rEkDMX1DynBcmPqv2FE2OQ/l3aa6QsN4/V4nmNkpX
 XcPmd6aPtm638DnkI3r1dwO/oWbg79I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-VKrhM3EHPrabluHr0wDevQ-1; Thu, 09 Jul 2020 04:55:31 -0400
X-MC-Unique: VKrhM3EHPrabluHr0wDevQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F61019253CE;
 Thu,  9 Jul 2020 08:55:30 +0000 (UTC)
Received: from nautilus.usersys.redhat.com (unknown [10.40.193.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 720875D9C9;
 Thu,  9 Jul 2020 08:55:22 +0000 (UTC)
Date: Thu, 9 Jul 2020 10:55:19 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 1/2] GitLab Gating CI: introduce pipeline-status
 contrib script
Message-ID: <20200709085519.GB536480@nautilus.usersys.redhat.com>
References: <20200709024657.2500558-1-crosa@redhat.com>
 <20200709024657.2500558-2-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200709024657.2500558-2-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eskultet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eskultet@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 08, 2020 at 10:46:56PM -0400, Cleber Rosa wrote:
> This script is intended to be used right after a push to a branch.
>
> By default, it will look for the pipeline associated with the commit
> that is the HEAD of the *local* staging branch.  It can be used as a
> one time check, or with the `--wait` option to wait until the pipeline
> completes.
>
> If the pipeline is successful, then a merge of the staging branch into
> the master branch should be the next step.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/ci/gitlab-pipeline-status | 156 ++++++++++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100755 scripts/ci/gitlab-pipeline-status
>
> diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
> new file mode 100755
> index 0000000000..4a9de39872
> --- /dev/null
> +++ b/scripts/ci/gitlab-pipeline-status
> @@ -0,0 +1,156 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) 2019-2020 Red Hat, Inc.
> +#
> +# Author:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +"""
> +Checks the GitLab pipeline status for a given commit commit

s/commit$/(hash|sha|ID|)

> +"""
> +
> +# pylint: disable=C0103
> +
> +import argparse
> +import http.client
> +import json
> +import os
> +import subprocess
> +import time
> +import sys
> +
> +
> +def get_local_staging_branch_commit():
> +    """
> +    Returns the commit sha1 for the *local* branch named "staging"
> +    """
> +    result = subprocess.run(['git', 'rev-parse', 'staging'],

If one day Peter decides that "staging" is not a cool name anymore and use a
different name for the branch :) we should account for that and make it a
variable, possibly even parametrize this function with it.

> +                            stdin=subprocess.DEVNULL,
> +                            stdout=subprocess.PIPE,
> +                            stderr=subprocess.DEVNULL,
> +                            cwd=os.path.dirname(__file__),
> +                            universal_newlines=True).stdout.strip()
> +    if result == 'staging':
> +        raise ValueError("There's no local staging branch")

"There's no local branch named 'staging'" would IMO be more descriptive, so as
not to confuse it with staging in git.

> +    if len(result) != 40:
> +        raise ValueError("Branch staging HEAD doesn't look like a sha1")
> +    return result
> +
> +
> +def get_pipeline_status(project_id, commit_sha1):
> +    """
> +    Returns the JSON content of the pipeline status API response
> +    """
> +    url = '/api/v4/projects/{}/pipelines?sha={}'.format(project_id,
> +                                                        commit_sha1)
> +    connection = http.client.HTTPSConnection('gitlab.com')
> +    connection.request('GET', url=url)
> +    response = connection.getresponse()
> +    if response.code != http.HTTPStatus.OK:
> +        raise ValueError("Failed to receive a successful response")
> +    json_response = json.loads(response.read())

a blank line separating the commentary block would slightly help readability

> +    # afaict, there should one one pipeline for the same project + commit

s/one one/be only one/

> +    # if this assumption is false, we can add further filters to the
> +    # url, such as username, and order_by.
> +    if not json_response:
> +        raise ValueError("No pipeline found")
> +    return json_response[0]
> +
> +
> +def wait_on_pipeline_success(timeout, interval,
> +                             project_id, commit_sha):
> +    """
> +    Waits for the pipeline to end up to the timeout given

"Waits for the pipeline to finish within the given timeout"

> +    """
> +    start = time.time()
> +    while True:
> +        if time.time() >= (start + timeout):
> +            print("Waiting on the pipeline success timed out")

s/success//
(the pipeline doesn't always have to finish with success)

> +            return False
> +
> +        status = get_pipeline_status(project_id, commit_sha)
> +        if status['status'] == 'running':
> +            time.sleep(interval)
> +            print('running...')
> +            continue
> +
> +        if status['status'] == 'success':
> +            return True
> +
> +        msg = "Pipeline ended unsuccessfully, check: %s" % status['web_url']

I think more common expression is "Pipeline failed"

> +        print(msg)
> +        return False
> +
...

Code-wise looks OK to me, but since I don't know what Peter's requirements
on/expectations of this script are, I can't do a more thorough review.

Regards,
Erik


