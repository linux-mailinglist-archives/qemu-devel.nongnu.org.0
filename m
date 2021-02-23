Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC27322D72
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:26:11 +0100 (CET)
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZZi-0003w6-EG
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lEZX3-0001Ix-JD
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1lEZX1-00010f-GE
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614093802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuhyWa5bIC3RTP2C7gnxTzcVj5wGpRDvBOt7tpF5m3E=;
 b=U4VU5llYab5HRHLSga3rdP+lv/YkP8th3zOg2SHdBMXwILrOnKwcGXai/FE7xcaj/OoOjO
 ZakgAd4YOSo8kNW422yOfCDlQTOTG722NZt/t6acrCVxZ1FACTLkR4wqnoyGbXgYH2G3OE
 XuAo7aox9stwIdU7fo2erppLBfrpdbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-yZMWMFWCOfiUfZQrUNvBgQ-1; Tue, 23 Feb 2021 10:23:20 -0500
X-MC-Unique: yZMWMFWCOfiUfZQrUNvBgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38504922A07;
 Tue, 23 Feb 2021 15:20:01 +0000 (UTC)
Received: from nautilus.local (unknown [10.40.192.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0655D9D3;
 Tue, 23 Feb 2021 15:19:55 +0000 (UTC)
Date: Tue, 23 Feb 2021 16:19:53 +0100
From: Erik Skultety <eskultet@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 0/3] gitlab-pipeline-status script: provide more
 information on errors
Message-ID: <YDUdGUDcfcv4no8h@nautilus.local>
References: <20210222193240.921250-1-crosa@redhat.com>
 <c3b6aaa9-9914-fed6-aaa8-ef9e5258c714@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c3b6aaa9-9914-fed6-aaa8-ef9e5258c714@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eskultet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eskultet@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 11:52:17AM -0300, Wainer dos Santos Moschetta wrote:
> Hi Cleber,
> 
> In case you need to send a v2, mind to add the following patch together?
> 
> commit 3c4ed8a78e096e4d7df0398c29887a9d468ae120 (HEAD -> gitlab_runners)
> Author: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Date:   Tue Feb 23 11:26:08 2021 -0300
> 
>     scripts/ci/gitlab-pipeline-status: Handle ValueError exceptions nicely
> 
>     With this change, when getting the local branch, it will handle nicely
>     any threw ValueError exception instead of print the stack trace.
> 
>     Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> 
> diff --git a/scripts/ci/gitlab-pipeline-status
> b/scripts/ci/gitlab-pipeline-status
> index 924db327ff..6177df973a 100755
> --- a/scripts/ci/gitlab-pipeline-status
> +++ b/scripts/ci/gitlab-pipeline-status
> @@ -160,7 +160,11 @@ def main():
>      args = parser.parse_args()
> 
>      if not args.commit:
> -        args.commit = get_local_branch_commit(args.branch)
> +        try:
> +            args.commit = get_local_branch_commit(args.branch)
> +        except ValueError as error:
> +            print("ERROR: %s" % error)
> +            sys.exit(1)

1 is the default error code, so you should pass the error message to sys.exit
directly without the print. If you don't want that, at least redirect the
print to sys.stderr.

Erik


