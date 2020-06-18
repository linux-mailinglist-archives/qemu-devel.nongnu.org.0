Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5093D1FF0EB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 13:46:53 +0200 (CEST)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlt0N-0008Cc-RR
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 07:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jlszN-0007kn-JV
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 07:45:49 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57062
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jlszK-0004R8-RX
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 07:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592480745;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EOR+5JXaZ0x+GWm3abABy8VMf8K8C19ehQKj5j76YGA=;
 b=VnxLkXo4OIXL4XOQLw2Ha1pIrLfYgPHowA/Z8X/a8ycmNlAWkSxuwbx2P4OJPW+mVdCpQ+
 BVQR1tAscC2yU7S7nrjtjlEPzdr96lgg3w9+WzjO2CIeAKjsoWDgKc2kYZpbA1b2t2ER2N
 8xEZpG6punjoVi3FvIM0CWjMSgcuT6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-ehdvkHRwMbmGQh6SMDLU6g-1; Thu, 18 Jun 2020 07:45:34 -0400
X-MC-Unique: ehdvkHRwMbmGQh6SMDLU6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FCAE18A8220;
 Thu, 18 Jun 2020 11:45:33 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6450060BF3;
 Thu, 18 Jun 2020 11:45:27 +0000 (UTC)
Date: Thu, 18 Jun 2020 12:45:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 4/5] GitLab Gating CI: introduce pipeline-status contrib
 script
Message-ID: <20200618114524.GA677518@redhat.com>
References: <20200312193616.438922-1-crosa@redhat.com>
 <20200312193616.438922-5-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200312193616.438922-5-crosa@redhat.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 00:57:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer Moschetta <wmoschet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 12, 2020 at 03:36:15PM -0400, Cleber Rosa wrote:
> This script is intended to be used right after a push to a branch.
> 
> By default, it will look for the pipeline associated with the commit
> that is the HEAD of the *local* staging branch.  It can be used as a
> one time check, or with the `--wait` option to wait until the pipeline
> completes.
> 
> If the pipeline is successful, then a merge of the staging branch into
> the master branch should be the next step.

On IRC yesterday we were discussing the current .gitlab-ci.yml status,
and how frustrating it is that every time we get it green, more code is
soon merged that turns it red again.

It feels like it should be an easy win to declare that the current GitLab
CI jobs are to be used as a gating tests for merges to master.

As & when custom runners come online, their jobs can simply augment the
existing jobs. IOW, use of GitLab CI for gating master shouldn't be
dependant on setup of custom runners which we've been waiting on for a
long term.

Peter indicated that his main requirement is a way to automate the task
of kicking off the CI job & getting its status. It seems like the script
in this patch should fullfill that requirement.

Assuming Peter (or whomever is going todo the merge) has a fork of

   https://gitlab.com/qemu-project/qemu

then they need to find the "ID" number of their fork. This is
visible at the top for the page for their fork eg mine:

   https://gitlab.com/berrange/qemu

reports:

   "Project ID: 18588805 "

Assuming the fork is configured as a git remote called "gitlab", then
to use GitLab CI as gating test, all that appears to be needed is

   $ git push gitlab
   $ ./contrib/ci/scripts/gitlab-pipeline-status --wait -p 18588805

If this is an acceptable level of automation for Peter, then can we
get this specific patch merged right now and make current GitLab CI
be gating for master.


With GitLab as gating, then we have further incentive to move all
the jobs currently on Travis CI and Shippable, over to use GitLab
too, and also use cirrus-run  to make Cirrus CI jobs be proxied
from GitLab.  All this can be in parallel with adding custom GitLab
runners for expanding testing coverage still further.

> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  contrib/ci/scripts/gitlab-pipeline-status | 148 ++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100755 contrib/ci/scripts/gitlab-pipeline-status
> 
> diff --git a/contrib/ci/scripts/gitlab-pipeline-status b/contrib/ci/scripts/gitlab-pipeline-status
> new file mode 100755
> index 0000000000..83d412daec
> --- /dev/null
> +++ b/contrib/ci/scripts/gitlab-pipeline-status
> @@ -0,0 +1,148 @@
> +#!/usr/bin/env python3
> +
> +"""
> +Checks the GitLab pipeline status for a given commit commit
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
> +                            stdin=subprocess.DEVNULL,
> +                            stdout=subprocess.PIPE,
> +                            stderr=subprocess.DEVNULL,
> +                            cwd=os.path.dirname(__file__),
> +                            universal_newlines=True).stdout.strip()
> +    if result == 'staging':
> +        raise ValueError("There's no local staging branch")
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
> +    # afaict, there should one one pipeline for the same project + commit
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
> +    """
> +    start = time.time()
> +    while True:
> +        if time.time() >= (start + timeout):
> +            print("Waiting on the pipeline success timed out")
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
> +        print(msg)
> +        return False
> +
> +
> +def main():
> +    """
> +    Script entry point
> +    """
> +    parser = argparse.ArgumentParser(
> +        prog='pipeline-status',
> +        description='check or wait on a pipeline status')
> +
> +    parser.add_argument('-t', '--timeout', type=int, default=7200,
> +                        help=('Amount of time (in seconds) to wait for the '
> +                              'pipeline to complete.  Defaults to '
> +                              '%(default)s'))
> +    parser.add_argument('-i', '--interval', type=int, default=60,
> +                        help=('Amount of time (in seconds) to wait between '
> +                              'checks of the pipeline status.  Defaults '
> +                              'to %(default)s'))
> +    parser.add_argument('-w', '--wait', action='store_true', default=False,
> +                        help=('Wether to wait, instead of checking only once '
> +                              'the status of a pipeline'))
> +    parser.add_argument('-p', '--project-id', type=int, default=11167699,
> +                        help=('The GitLab project ID. Defaults to the project '
> +                              'for https://gitlab.com/qemu-project/qemu, that '
> +                              'is, "%(default)s"'))
> +    try:
> +        default_commit = get_local_staging_branch_commit()
> +        commit_required = False
> +    except ValueError:
> +        default_commit = ''
> +        commit_required = True
> +    parser.add_argument('-c', '--commit', required=commit_required,
> +                        default=default_commit,
> +                        help=('Look for a pipeline associated with the given '
> +                              'commit.  If one is not explicitly given, the '
> +                              'commit associated with the local branch named '
> +                              '"staging" is used.  Default: %(default)s'))
> +    parser.add_argument('--verbose', action='store_true', default=False,
> +                        help=('A minimal verbosity level that prints the '
> +                              'overall result of the check/wait'))
> +
> +    args = parser.parse_args()
> +
> +    try:
> +        if args.wait:
> +            success = wait_on_pipeline_success(
> +                args.timeout,
> +                args.interval,
> +                args.project_id,
> +                args.commit)
> +        else:
> +            status = get_pipeline_status(args.project_id,
> +                                         args.commit)
> +            success = status['status'] == 'success'
> +    except Exception as error:      # pylint: disable=W0703
> +        success = False
> +        if args.verbose:
> +            print("ERROR: %s" % error.args[0])
> +
> +    if success:
> +        if args.verbose:
> +            print('success')
> +        sys.exit(0)
> +    else:
> +        if args.verbose:
> +            print('failure')
> +        sys.exit(1)
> +
> +
> +if __name__ == '__main__':
> +    main()
> -- 
> 2.24.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


