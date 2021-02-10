Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F530315F24
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 06:45:26 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iJZ-0003im-8X
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 00:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9iIi-0003J4-Mt
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 00:44:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9iIg-0005yG-4x
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 00:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612935868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKwBCyfY6WVRYJB2o6DcSB86ki8xqmM+WI5H2uxQBVc=;
 b=QcUGWO2D5JgjN6rUeupZY9T/yOsCZMMswLNz5o5wG3qvb7J4r+hQtnq+gQDkwGJgvpesIh
 1yNOUK9K0hSi707I20zylIYu8lJCVPOEFOtEOw/3tSLCmP6NtgSE1zYTQEW3y9+d6qk9SR
 Zcw8+gwx50uj9RlFEyuYfl5P1SAJQgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-nsfjr-hFPum2bdG5upe3ng-1; Wed, 10 Feb 2021 00:44:26 -0500
X-MC-Unique: nsfjr-hFPum2bdG5upe3ng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 651D4C73A0;
 Wed, 10 Feb 2021 05:44:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-121.ams2.redhat.com [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E05CD5C3F8;
 Wed, 10 Feb 2021 05:44:20 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] Move remaining x86 Travis jobs to the gitlab-CI
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210205091857.845389-1-thuth@redhat.com>
 <875z319dv8.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b06ee27e-effa-d1c1-fdae-0a858e084482@redhat.com>
Date: Wed, 10 Feb 2021 06:44:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <875z319dv8.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/2021 21.37, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Since Travis changed their policies, travis-ci.org will soon become
>> completely useless for the QEMU project. We should now really make sure
>> that we move the remaining tests as good as possible to the gitlab-CI
>> instead.
> 
> Queued to testing/next, thanks.

Thanks, but please unqueue them again, I still want to send a v3 to address 
your comment on the -fsanitize=undefined patch... and I also noticed that 
the gprof/gcov job runs very long and sometimes hits the 1h time limit, so I 
need to revisit the set of target architectures there...

  Thomas


