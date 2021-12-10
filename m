Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B047027A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:14:12 +0100 (CET)
Received: from localhost ([::1]:33530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgf5-0003yJ-GX
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvgdC-0002TH-LB
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvgd8-0006fD-HP
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639145529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wxXxKS8YwebKF6yFjBEcSxZGKVzyx3hD63tH8YLnUwo=;
 b=E4sk0ZhrMHtbQmXKZe8YtOEgS3RgEU2TYFKsxaD6EJbAn3+PheZyDTmJ4m7mJ79pFXPr+1
 WPE5c9yo9ndm/HWEyddp9zMRGwf/L1p5/6+WeL9kW+jGJ5TW8SBG5EqJ8pAN7k7rxAzjWj
 J+iUoVVZ/0SAqCfB8ENqD6DAIo0TAB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-2mPbeYYMPM2RRTrpAmTbRw-1; Fri, 10 Dec 2021 09:12:08 -0500
X-MC-Unique: 2mPbeYYMPM2RRTrpAmTbRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7A6B593A8;
 Fri, 10 Dec 2021 14:12:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2119D709AA;
 Fri, 10 Dec 2021 14:12:04 +0000 (UTC)
Date: Fri, 10 Dec 2021 15:12:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/3] iotests/testrunner.py: add doc string for run_test()
Message-ID: <YbNgMzD7qGYqoUjH@redhat.com>
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211203122223.2780098-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: den@openvz.org, hreitz@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.12.2021 um 13:22 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We are going to modify these methods and will add more documentation in
> further commit. As a preparation add basic documentation.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/testrunner.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 0e29c2fddd..fa842252d3 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -220,6 +220,12 @@ def find_reference(self, test: str) -> str:
>          return f'{test}.out'
>  
>      def do_run_test(self, test: str) -> TestResult:
> +        """
> +        Run one test
> +
> +        :param test: test file path
> +        """
> +
>          f_test = Path(test)
>          f_bad = Path(f_test.name + '.out.bad')
>          f_notrun = Path(f_test.name + '.notrun')
> @@ -287,6 +293,13 @@ def do_run_test(self, test: str) -> TestResult:
>  
>      def run_test(self, test: str,
>                   test_field_width: Optional[int] = None) -> TestResult:
> +        """
> +        Run one test and print short status
> +
> +        :param test: test file path
> +        :param test_field_width: width for first field of status format
> +        """
> +
>          last_el = self.last_elapsed.get(test)
>          start = datetime.datetime.now().strftime('%H:%M:%S')

test_field_width is Optional[int], so the documentation should specify
what happens when you pass None.

Seems it doesn't change the behaviour, but just picks a default value of
8. 'test_field_width: int = 8' might have been the more obvious solution
for this in the first place.

Kevin


