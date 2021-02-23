Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C451322D12
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:04:03 +0100 (CET)
Received: from localhost ([::1]:33336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZEI-0004sU-AS
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEZ8m-00016H-Lj
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEZ8i-0006xZ-1G
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614092295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=utmtKv14Vqy39DCRbfyMVxcI940V6V2LzrVBitcta10=;
 b=EbvFsnbNByoqoCd3U4GL84SqsXKJ7BchEu3j9LjPsXdPizjE+yoeP+v1DfHxmL16NuZp3Z
 SbPp6pzpFm82y0UXCcZAK1rSTb0+IQrm8YDesdhvI9axPmvIiBATuAkCNdFIuXavrR9mMp
 bvL3Ol2M1yK7czjq534kbZlVUPNX/SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-t9VaScdHOvCgsKw67IRnTA-1; Tue, 23 Feb 2021 09:58:13 -0500
X-MC-Unique: t9VaScdHOvCgsKw67IRnTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1791AC291;
 Tue, 23 Feb 2021 14:52:30 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 650375D9D7;
 Tue, 23 Feb 2021 14:52:19 +0000 (UTC)
Subject: Re: [PATCH 0/3] gitlab-pipeline-status script: provide more
 information on errors
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210222193240.921250-1-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <c3b6aaa9-9914-fed6-aaa8-ef9e5258c714@redhat.com>
Date: Tue, 23 Feb 2021 11:52:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222193240.921250-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

In case you need to send a v2, mind to add the following patch together?

commit 3c4ed8a78e096e4d7df0398c29887a9d468ae120 (HEAD -> gitlab_runners)
Author: Wainer dos Santos Moschetta <wainersm@redhat.com>
Date:   Tue Feb 23 11:26:08 2021 -0300

     scripts/ci/gitlab-pipeline-status: Handle ValueError exceptions nicely

     With this change, when getting the local branch, it will handle nicely
     any threw ValueError exception instead of print the stack trace.

     Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

diff --git a/scripts/ci/gitlab-pipeline-status 
b/scripts/ci/gitlab-pipeline-status
index 924db327ff..6177df973a 100755
--- a/scripts/ci/gitlab-pipeline-status
+++ b/scripts/ci/gitlab-pipeline-status
@@ -160,7 +160,11 @@ def main():
      args = parser.parse_args()

      if not args.commit:
-        args.commit = get_local_branch_commit(args.branch)
+        try:
+            args.commit = get_local_branch_commit(args.branch)
+        except ValueError as error:
+            print("ERROR: %s" % error)
+            sys.exit(1)

      success = False
      try:

On 2/22/21 4:32 PM, Cleber Rosa wrote:
> When things go wrong with the GitLab API requests, it's useful to give
> users more information about the possible causes.
>
> Cleber Rosa (3):
>    scripts/ci/gitlab-pipeline-status: split utlity function for HTTP GET
>    scripts/ci/gitlab-pipeline-status: give more information on failures
>    scripts/ci/gitlab-pipeline-status: give more info when pipeline not
>      found
>
>   scripts/ci/gitlab-pipeline-status | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
>


