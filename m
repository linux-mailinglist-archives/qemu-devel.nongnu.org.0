Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17794E2B66
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:01:46 +0100 (CET)
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJXV-0002LM-C5
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:01:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWJUp-00006t-Kb
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWJUn-0006IQ-3t
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647874736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7qdPU828uMB6PEKfTd7lN8iFdm46yjy3ej5VAt1uVmE=;
 b=RO55Sa6FFnNI3iPJ/+PMvH/RItmCbVqL/1SnZzZor52nsgeXrNJOXv4ESVqSOunx+xE+SO
 qnAHmjEImMOqZk2P/Pnxtu7axs5dzGAkEEiPslIxLt/QjRV231CBgGL0mgvQGoxFgrHfZC
 fm4oQb+BY8EufXGZH/2v79d32Z5DYbg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-xCpO0RSMNWeW_hCQWjXz0Q-1; Mon, 21 Mar 2022 10:58:53 -0400
X-MC-Unique: xCpO0RSMNWeW_hCQWjXz0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0380B899EC2;
 Mon, 21 Mar 2022 14:58:52 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12CBC53C9;
 Mon, 21 Mar 2022 14:58:42 +0000 (UTC)
Date: Mon, 21 Mar 2022 09:58:40 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 04/15] iotests/040: Don't check image pattern on
 zero-length image
Message-ID: <20220321145840.k24oqamholmek7dk@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-5-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 04:36:44PM -0400, John Snow wrote:
> qemu-io fails on read/write with zero-length raw images, so skip these
> when running the zero-length image tests.

On my first read, I wondered what we accomplish by rejecting
zero-length reads on a zero-length image, and whether entering the
rabbit hole of trying to make that corner case "work" differently
makes more sense...

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/040 | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
> index adf5815781..c4a90937dc 100755
> --- a/tests/qemu-iotests/040
> +++ b/tests/qemu-iotests/040
> @@ -86,8 +86,10 @@ class TestSingleDrive(ImageCommitTestCase):
>          qemu_img('create', '-f', iotests.imgfmt,
>                   '-o', 'backing_file=%s' % mid_img,
>                   '-F', iotests.imgfmt, test_img)
> -        qemu_io('-f', 'raw', '-c', 'write -P 0xab 0 524288', backing_img)
> -        qemu_io('-f', iotests.imgfmt, '-c', 'write -P 0xef 524288 524288', mid_img)
> +        if self.image_len:
> +            qemu_io('-f', 'raw', '-c', 'write -P 0xab 0 524288', backing_img)
> +            qemu_io('-f', iotests.imgfmt, '-c', 'write -P 0xef 524288 524288',
> +                    mid_img)

...but now it is obvious - one of our test cases is attempting a
non-zero-length modification to a zero-length file, and it does make
sense for that modification attempt to fail, in which case, making the
test special case the zero-length file is the right thing to do.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


