Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E582F366EE4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 17:15:22 +0200 (CEST)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZEZV-0001gQ-Bi
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 11:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZEYL-00013n-Ee
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:14:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZEYF-0000MI-G2
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619018042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7HI1LjQXVPkORwHMSK3M9GIb8IKCQKezQKemRd7C+Qo=;
 b=g6piB6EzxpzGXeiVD7BomlLyUsJ5XlZdcLcsySWwdp9pAWVd6JRLpwuGfzNR2iGO6CUedQ
 46XJiPYWbAhF/X76vbu1e+daCigYBNY0QuaLYDY1aLqyspOwSDByLqKJ3+6IIC7QkT3TDU
 baRCwuOQwfvjFNdK08JlFYbU5J5UtwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-esCCW9nxOwajzbAcim9uvw-1; Wed, 21 Apr 2021 11:07:43 -0400
X-MC-Unique: esCCW9nxOwajzbAcim9uvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E03BC73AA;
 Wed, 21 Apr 2021 15:07:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-207.ams2.redhat.com [10.36.112.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F63D5C1D5;
 Wed, 21 Apr 2021 15:07:37 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
References: <20210415094954.GA84874@paraplu.home>
 <5e885bb5-63a1-b109-e3bb-c731a4c387df@redhat.com>
 <CAFEAcA9d1-cN9=h5VAnz9J8U3UoHg+4WF5V=NegknEO99mD+9Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Transferring bugs from Launchpad to Gitlab (was: Re: Upstream bug
 comments on the mailing list and Launchpad)
Message-ID: <5dcd851d-b2a0-6c55-3fea-3fc0035c6386@redhat.com>
Date: Wed, 21 Apr 2021 17:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9d1-cN9=h5VAnz9J8U3UoHg+4WF5V=NegknEO99mD+9Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------D2D4F0611378EEADDB93A015"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------D2D4F0611378EEADDB93A015
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/04/2021 18.04, Peter Maydell wrote:
> On Mon, 19 Apr 2021 at 16:52, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 15/04/2021 11.49, Kashyap Chamarthy wrote:
>> ...
>>> PS: I recall there was discussion on the list of moving to a different
>>>       GitLab tracker.  As Thomas Huth mentioned on IRC, more people seem
>>>       to have account on GitLab than on Launchpad.
>>
>> I think we basically agreed that we want to migrate to gitlab, but e.g.
>> Peter suggested that we copy the open bugs on launchpad to the gitlab
>> tracker first, so that we don't have two active trackers at the same time...
>> thus this needs someone with enough spare time to work on such a convertion
>> script first...
> 
> In the meantime, can we disable bug reporting on gitlab? It's
> confusing to users to have two places, one of which is not
> checked by anybody. We already have two stray bugreports:
> https://gitlab.com/qemu-project/qemu/-/issues

I'd rather like to see us doing the move finally. I'm very much a Python 
ignorant, but since apparently nobody else has spare time to work on this at 
the moment, I've now done some copy-n-paste coding and came up with a script 
that can transfer bugs from Launchpad to Gitlab (see the attachment). You 
need a "private token" passed to the script via the GITLAB_PRIVATE_TOKEN 
environment variable so that it is able to access gitlab (such a token can 
be generated in your private setting pages on gitlab). Some transferred bugs 
can be seen here:

  https://gitlab.com/thuth/trackertest/-/issues

Notes:

- Not all information is transferred, e.g. no attachments yet.
   But considering that there is a link to the original launchpad
   bug, you can always look up the information there, so I think
   that should be fine.

- The script currently also adds the "tags" from the launchpad
   bug as "labels" in gitlab - do we want that, or do we rather
   want to restrict our labels in gitlab to a smaller set?

- Formatting of the bug description and comments is a little bit
   tricky, since the text is pre-formatted ASCII in launchpad and
   markdown on gitlab ... For now, I put the text from launchpad
   into "<pre>" HTML tags on gitlab, that should result in usable
   texts most of the time.

- Biggest problem so far: After transferring 50 bugs or so,
   gitlab refuses to take more bugs automatically with the
   message: 'Your issue has been recognized as spam. Please,
   change the content or solve the reCAPTCHA to proceed.'
   ... and solving captchas in a script is certainly way out
   of scope here. So if we want to copy over all bugs from
   launchpad, we might need to do that in junks.

- Do we want to auto-close the bugs in launchpad after we've
   transferred them? Or should they stay open until the bugs
   have been addressed? I tend to close them (with an appropriate
   comment added to the bug, too), but we could also mark the
   transferred bugs with a tag instead.

- Do we want to transfer also old "Wishlist" bug tickets from
   Launchpad? I think it's quite unlikely that we will ever
   address them... maybe we should close them on Launchpad with
   an appropriate comment?

  Thomas

--------------D2D4F0611378EEADDB93A015
Content-Type: text/x-python; charset=UTF-8;
 name="launchpad2gitlab.py"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="launchpad2gitlab.py"

#!/usr/bin/env python3

import argparse
import logging
import os
import re
import sys
import time
import gitlab

from launchpadlib.launchpad import Launchpad
import lazr.restfulclient.errors

LOG_FORMAT =3D "%(levelname)s - %(funcName)s - %(message)s"
logging.basicConfig(format=3DLOG_FORMAT)
LOG =3D logging.getLogger(__name__)

parser =3D argparse.ArgumentParser(description=3D"Close incomplete bug repo=
rts.")
parser.add_argument('-l',
                    '--lp-project-name',
                    dest=3D'lp_project_name',
                    default=3D'qemu',
                    help=3D'The Launchpad project name (qemu).')
parser.add_argument('-g',
                    '--gl-project-id',
                    dest=3D'gl_project_id',
                    help=3D'The Gitlab project ID.')
parser.add_argument('--verbose', '-v',
                    help=3D'Enable debug logging.',
                    action=3D"store_true")
parser.add_argument('--search-text', '-s',
                    dest=3D'search_text',
                    help=3D'Look up bugs by searching for text.')
args =3D parser.parse_args()
LOG.info(args)

LOG.setLevel(logging.DEBUG if args.verbose else logging.INFO)


def get_launchpad():
=09cache_dir =3D os.path.expanduser("~/.launchpadlib/cache/")
=09if not os.path.exists(cache_dir):
=09=09os.makedirs(cache_dir, 0o700)
=09launchpad =3D Launchpad.login_anonymously(args.lp_project_name + '-bugs'=
,
=09                                        'production', cache_dir)
=09return launchpad


def show_bug_task(bug_task):
=09print('Bug #%d - %s' % (bug_task.bug.id, str(bug_task.bug.title)))
=09if args.verbose:
=09=09print(' - Description: %s' % bug_task.bug.description)
=09=09print(' - Tags: %s' % bug_task.bug.tags)
=09=09print(' - Status: %s' % bug_task.status)
=09=09print(' - Assignee: %s' % bug_task.assignee)
=09=09for message in bug_task.bug.messages:
=09=09=09print('  - Message: %s' % message.content)


def transfer_to_gitlab(launchpad, project, bug_task):
=09bug =3D bug_task.bug
=09desc =3D "This bug has been copied automatically from: " + bug_task.web_=
link + \
=09=09"\n\n<pre>" + bug.description.replace("-", "&#45;") + "</pre>"
=09issue =3D project.issues.create({'title': bug.title, 'description': desc=
})
=09issue.labels =3D bug.tags
=09for msg in bug.messages:
=09=09if msg =3D=3D bug.messages[0] or not msg.content.strip():
=09=09=09continue
=09=09comment =3D msg.content.replace("-", "&#45;")
=09=09note =3D "Comment from '" + re.sub(r'^.*~', '', msg.owner_link) \
=09=09       + "' on Launchpad  (" \
=09=09       + msg.date_created.date().isoformat() + "):\n\n<pre>" \
=09=09       + comment + "</pre>"
=09=09issue.notes.create({'body': note})
=09=09time.sleep(0.2)  # To avoid "spamming"
=09issue.save()


def main():
=09LOG.info("args: %s", args)

=09LOG.info("getting reports...")
=09launchpad =3D get_launchpad()
=09lp_project =3D launchpad.projects[args.lp_project_name]
=09if args.search_text:
=09=09bug_tasks =3D lp_project.searchTasks(
=09=09=09search_text=3Dargs.search_text,
=09=09=09omit_duplicates=3DTrue,
=09=09=09order_by=3D"datecreated")
=09else:
=09=09bug_tasks =3D lp_project.searchTasks(
=09=09=09status=3D["New", "Confirmed", "Triaged", "In Progress"],
=09=09=09omit_duplicates=3DTrue,
=09=09=09order_by=3D"datecreated")

=09if args.gl_project_id:
=09=09try:
=09=09=09priv_token =3D os.environ['GITLAB_PRIVATE_TOKEN']
=09=09except Exception as e:
=09=09=09print("Please set the GITLAB_PRIVATE_TOKEN env variable!")
=09=09=09return

=09=09gl =3D gitlab.Gitlab('https://gitlab.com', private_token=3Dpriv_token=
)
=09=09gl.auth()
=09=09project =3D gl.projects.get(args.gl_project_id)
=09else:
=09=09LOG.info("Please provide a Gitlab project ID to transfer the bugs ('-=
g')")

=09for bug_task in bug_tasks:
=09=09show_bug_task(bug_task)
=09=09if args.gl_project_id:
=09=09=09transfer_to_gitlab(launchpad, project, bug_task)

=09LOG.info("All done.")

if __name__ =3D=3D '__main__':
=09main()

--------------D2D4F0611378EEADDB93A015--


